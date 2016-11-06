package net.oschina.mytuils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.pentaho.di.core.KettleEnvironment;
import org.pentaho.di.core.database.DatabaseMeta;
import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.core.exception.KettleSecurityException;
import org.pentaho.di.core.parameters.NamedParams;
import org.pentaho.di.core.variables.VariableSpace;
import org.pentaho.di.job.Job;
import org.pentaho.di.job.JobHopMeta;
import org.pentaho.di.job.JobMeta;
import org.pentaho.di.job.entries.job.JobEntryJob;
import org.pentaho.di.job.entries.special.JobEntrySpecial;
import org.pentaho.di.job.entries.trans.JobEntryTrans;
import org.pentaho.di.job.entry.JobEntryBase;
import org.pentaho.di.job.entry.JobEntryCopy;
import org.pentaho.di.job.entry.JobEntryInterface;
import org.pentaho.di.repository.BaseRepositoryMeta;
import org.pentaho.di.repository.LongObjectId;
import org.pentaho.di.repository.ObjectId;
import org.pentaho.di.repository.Repository;
import org.pentaho.di.repository.RepositoryDirectoryInterface;
import org.pentaho.di.repository.StringObjectId;
import org.pentaho.di.repository.filerep.KettleFileRepository;
import org.pentaho.di.repository.filerep.KettleFileRepositoryMeta;
import org.pentaho.di.repository.kdr.KettleDatabaseRepository;
import org.pentaho.di.repository.kdr.KettleDatabaseRepositoryMeta;
import org.pentaho.di.trans.TransHopMeta;
import org.pentaho.di.trans.TransMeta;
import org.pentaho.di.trans.TransPreviewFactory;
import org.pentaho.di.trans.step.StepInterface;
import org.pentaho.di.trans.step.StepMeta;
import org.pentaho.di.trans.step.StepMetaInterface;
import org.pentaho.di.trans.steps.jobexecutor.JobExecutorMeta;
import org.pentaho.di.trans.steps.transexecutor.TransExecutorMeta;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

 /**
 * ClassName: KettleUtils <br/>
 * Function: kettle定制化开发工具集. <br/>
 * date: 2015年4月29日 <br/>
 * @author jingma
 * @version 0.0.1
 * @since JDK 1.6
 */
public class KettleUtils {
	/**
	 * LOG:日志
	 */
	public static Logger log = LoggerFactory.getLogger(KettleUtils.class);
	/**
	 * repository:kettle资源库
	 */
	private static Repository repository;
	/**
	* 转换模板
	*/
	private static TransMeta transMetaTemplate;
	/**
	* 作业模板
	*/
	private static JobMeta jobMetaTemplate;
	/**
	* 资源库Map
	*/
	private static Map<String,Repository> repMap = new HashMap<String, Repository>();
	
	/**
	 * getInstance:获取的单例资源库. <br/>
	 * @author jingma
	 * @return 已经初始化的资源库
	 * @throws KettleException 若没有初始化则抛出异常
	 * @since JDK 1.6
	 */
	public static Repository getInstanceRep() throws KettleException{
		if(repository!=null){
			return repository;
		}else{
			throw new KettleException("没有初始化资源库");
		}
	}
	/**
	* 获取指定资源库 <br/>
	* @author jingma
	* @param repId 资源id
	* @return
	*/
	public static Repository use(String repId){
	    return repMap.get(repId);
	}
	
	/**
	 * createFileRep:创建文件资源库. <br/>
	 * @author jingma
	 * @param id 资源库id
	 * @param repName 资源库名称
	 * @param description 资源库描述
	 * @param baseDirectory 资源库目录
	 * @return 已经初始化的资源库
	 * @throws KettleException 
	 * @since JDK 1.6
	 */
	public static Repository createFileRep(String id, String repName, 
	        String description, String baseDirectory) throws KettleException{
        destroy();
        //初始化kettle环境
        if(!KettleEnvironment.isInitialized()){
            KettleEnvironment.init();
        }
		KettleFileRepositoryMeta fileRepMeta = new KettleFileRepositoryMeta( id, repName, description, baseDirectory);
        return createRep(fileRepMeta, id, repName, description);
	}

    /**
    * 创建JNDI数据库资源库 <br/>
    * @author jingma
    * @param name 数据库连接名称
    * @param type 数据库类型
    * @param db jndi名称
    * @return
    * @throws KettleException
    */
    public static Repository createDBRepByJndi(String name, String type,
            String db) throws KettleException{
        return createDBRep( name, type, "JNDI", null, 
             db, null, null, null);
    }
    
	/**
	 * createDBRep:创建数据库资源库. <br/>
	 * @author jingma
	 * @param name 数据库连接名称
	 * @param type 数据库类型
	 * @param access 访问类型
	 * @param host ip地址
	 * @param db 数据库名称
	 * @param port 端口
	 * @param user 数据库用户名
	 * @param pass 数据库密码
	 * @return 初始化的资源库
	 * @throws KettleException 
	 * @since JDK 1.6
	 */
	public static Repository createDBRep(String name, String type, String access, String host, 
			String db, String port, String user, String pass) throws KettleException{
		return createDBRep( name, type, access, host, 
			 db, port, user, pass, name, name, name+"数据库资源库");
	}
	
	/**
	 * createDBRep:创建数据库资源库. <br/>
	 * @author jingma
	 * @param name 数据库连接名称
	 * @param type 数据库类型
	 * @param access 访问类型
	 * @param host ip地址
	 * @param db 数据库名称
	 * @param port 端口
	 * @param user 数据库用户名
	 * @param pass 数据库密码
	 * @param id 资源库id
	 * @param repName 资源库名称
	 * @param description 资源库描述
	 * @return 已经初始化的资源库
	 * @throws KettleException 
	 * @since JDK 1.6
	 */
	public static Repository createDBRep(String name, String type, String access, String host, 
			String db, String port, String user, String pass,String id, String repName, String description) throws KettleException{
        destroy();
        //初始化kettle环境
        if(!KettleEnvironment.isInitialized()){
            KettleEnvironment.init();
        }
		//创建资源库数据库对象，类似我们在spoon里面创建资源库
		DatabaseMeta dataMeta = new DatabaseMeta(name, type, access, host, db, port, user, pass);
		//资源库元对象
		KettleDatabaseRepositoryMeta kettleDatabaseMeta = 
				new KettleDatabaseRepositoryMeta(id, repName, description, dataMeta);
		return createRep(kettleDatabaseMeta, id, repName, description);
	}
    public static Repository createRep(BaseRepositoryMeta baseRepositoryMeta,
            String id, String repName, String description) throws KettleException{
        Repository repository = null;
        if(System.getenv("KETTLE_JNDI_ROOT")!=null){
            System.setProperty("org.osjava.sj.root", System.getenv("KETTLE_JNDI_ROOT"));
            log.info("Simple-jndi配置根路径："+System.getenv("KETTLE_JNDI_ROOT"));
        }
        if(baseRepositoryMeta instanceof KettleDatabaseRepositoryMeta){
            //创建资源库对象
            repository = new KettleDatabaseRepository();
            //给资源库赋值
            repository.init((KettleDatabaseRepositoryMeta) baseRepositoryMeta);
        }else{
            //创建资源库对象
            repository = new KettleFileRepository();
            //给资源库赋值
            repository.init((KettleFileRepositoryMeta) baseRepositoryMeta);
        }
        //第一个创建的资源库是默认操作的资源库
        if(KettleUtils.repository==null){
            KettleUtils.repository = repository;
        }
        repMap.put(id, repository);
        log.info(repository.getName()+"资源库初始化成功");
        return repository;
    }
	
	/**
	 * connect:连接资源库. <br/>
	 * @author jingma
	 * @return 连接后的资源库
	 * @throws KettleSecurityException
	 * @throws KettleException
	 * @since JDK 1.6
	 */
	public static Repository connect() throws KettleSecurityException, KettleException{
		return connect(null,null);
	}
	
	/**
	 * connect:连接资源库. <br/>
	 * @author jingma
	 * @param username 资源库用户名
	 * @param password 资源库密码
	 * @return 连接后的资源库
	 * @throws KettleSecurityException
	 * @throws KettleException
	 * @since JDK 1.6
	 */
	public static Repository connect(String username,String password) throws KettleSecurityException, KettleException{
		repository.connect(username, password);
		log.info(repository.getName()+"资源库连接成功");
		return repository;
	}
	
	/**
	 * setRepository:设置资源库. <br/>
	 * @author jingma
	 * @param repository 外部注入资源库
	 * @since JDK 1.6
	 */
	public static void setRepository(Repository repository){
		KettleUtils.repository = repository;
	}
	
	/**
	 * destroy:释放资源库. <br/>
	 * @author jingma
	 * @since JDK 1.6
	 */
	public static void destroy(){
		if(repository!=null){
			repository.disconnect();
			log.info(repository.getName()+"资源库释放成功");
            repository = null;
		}
	}

	/**
	 * loadJob:通过id加载job. <br/>
	 * @author jingma
	 * @param jobId 数字型job的id，数据库资源库时用此方法
	 * @return job元数据
	 * @throws KettleException
	 * @since JDK 1.6
	 */
	public static JobMeta loadJob(long jobId) throws KettleException {
		return repository.loadJob(new LongObjectId(jobId), null);
	}

	/**
	 * loadJob:通过id加载job. <br/>
	 * @author jingma
	 * @param jobId 字符串job的id，文件资源库时用此方法
	 * @return job元数据
	 * @throws KettleException
	 * @since JDK 1.6
	 */
	public static JobMeta loadJob(String jobId) throws KettleException {
		return repository.loadJob(new StringObjectId(jobId), null);
	}

	/**
	 * loadTrans:加载作业. <br/>
	 * @author jingma
	 * @param jobname 作业名称
	 * @param directory 作业路径
	 * @return 作业元数据
	 * @since JDK 1.6
	 */
	public static JobMeta loadJob(String jobname, String directory) {
		return loadJob(jobname, directory, repository);
	}
	/**
	 * loadTrans:加载作业. <br/>
	 * @author jingma
	 * @param jobname 作业名称
	 * @param directory 作业路径
	 * @param repository 资源库
	 * @return 作业元数据
	 * @since JDK 1.6
	 */
	public static JobMeta loadJob(String jobname, String directory,Repository repository) {
		try {
			RepositoryDirectoryInterface dir = repository.findDirectory(directory);
			return repository.loadJob(jobname,dir,null, null);
		} catch (KettleException e) {
			log.error("获取作业失败,jobname:"+jobname+",directory:"+directory, e);
		}
		return null;
	}

    /**
     * loadTrans:加载作业. <br/>
     * @author jingma
     * @param jobname 作业名称
     * @param directory 作业路径
     * @return 作业元数据
     * @since JDK 1.6
     */
    public static JobMeta loadJob(String jobname, long directory) {
        return loadJob(jobname, directory, repository);
    }
    /**
     * loadTrans:加载作业. <br/>
     * @author jingma
     * @param jobname 作业名称
     * @param directory 作业路径
     * @param repository 资源库
     * @return 作业元数据
     * @since JDK 1.6
     */
    public static JobMeta loadJob(String jobname, long directory,Repository repository) {
        try {
            RepositoryDirectoryInterface dir = repository.
                    findDirectory(new LongObjectId(directory));
            return repository.loadJob(jobname,dir,null, null);
        } catch (KettleException e) {
            log.error("获取作业失败,jobname:"+jobname+",directory:"+directory, e);
        }
        return null;
    }
	
	/**
	 * loadTrans:加载转换. <br/>
	 * @author jingma
	 * @param transname 转换名称
	 * @param directory 转换路径
	 * @return 转换元数据
	 * @since JDK 1.6
	 */
	public static TransMeta loadTrans(String transname, String directory) {
		return loadTrans(transname, directory, repository);
	}
	
	/**
	 * loadTrans:加载转换. <br/>
	 * @author jingma
	 * @param transname 转换名称
	 * @param directory 转换路径
	 * @param repository 资源库
	 * @return 转换元数据
	 * @since JDK 1.6
	 */
	public static TransMeta loadTrans(String transname, String directory,Repository repository) {
		try {
			RepositoryDirectoryInterface dir = repository.findDirectory(directory);
			return repository.loadTransformation( transname, dir, null, true, null);
		} catch (KettleException e) {
			log.error("获取转换失败,transname:"+transname+",directory:"+directory, e);
		}
		return null;
	}

	/**
	 * loadTrans:根据job元数据获取指定转换元数据. <br/>
	 * @author jingma
	 * @param jobMeta job元数据
	 * @param teansName 转换名称
	 * @return 转换元数据
	 * @since JDK 1.6
	 */
	public static TransMeta loadTrans(JobMeta jobMeta, String teansName) {
		JobEntryTrans trans = (JobEntryTrans)(jobMeta.findJobEntry(teansName).getEntry());
		TransMeta transMeta = KettleUtils.loadTrans(trans.getTransname(), trans.getDirectory());
		return transMeta;
	}

	/**
	* 加载作业中的作业实体 <br/>
	* @author jingma
	* @param jobMeta 父作业
	* @param jobEntryName 作业名称
	* @param jobEntryMeta 用于承载将要加载的作业
	* @return
	*/
	public static <T extends JobEntryBase> T loadJobEntry(JobMeta jobMeta, String jobEntryName,
			T jobEntryMeta) {
		return loadJobEntry(jobMeta.findJobEntry(jobEntryName).getEntry().getObjectId(), jobEntryMeta);
	}

    /**
    * 加载作业中的作业实体 <br/>
    * @author jingma
    * @param entryId job实体id
    * @param jobEntryMeta 用于承载将要加载的作业
    * @return
    */
    public static <T extends JobEntryBase> T loadJobEntry(ObjectId entryId,
            T jobEntryMeta) {
        try {
            jobEntryMeta.loadRep(repository, null, 
                    entryId, null,null);
            jobEntryMeta.setObjectId(entryId);
        } catch (KettleException e) {
            log.error("获取作业控件失败", e);
        }
        return jobEntryMeta;
    }

    /**
    * 查找JOB的开始控件 <br/>
    * @author jingma
    * @param jobMeta JOB元数据
    * @return 开始控件
    */
    public static JobEntrySpecial findStart(JobMeta jobMeta) {
        for (int i = 0; i < jobMeta.nrJobEntries(); i++) {
            JobEntryCopy jec = jobMeta.getJobEntry(i);
            JobEntryInterface je = jec.getEntry();
            if (je.getPluginId().equals("SPECIAL")) {
                return (JobEntrySpecial) je;
            }
        }
        return null;
    }

	/**
	 * saveTrans:保存转换. <br/>
	 * @author jingma
	 * @param transMeta 转换元数据
	 * @throws KettleException
	 * @since JDK 1.6
	 */
	public static void saveTrans(TransMeta transMeta) throws KettleException {
//		repository.save(transMeta, null, new RepositoryImporter(repository), true );
		repository.save(transMeta, null, null, true );
	}

	/**
	 * saveJob:保存job. <br/>
	 * @author jingma
	 * @param jobMeta job元数据
	 * @throws KettleException
	 * @since JDK 1.6
	 */
	public static void saveJob(JobMeta jobMeta) throws KettleException {
//		repository.save(jobMeta, null, new RepositoryImporter(repository), true );
		repository.save(jobMeta, null, null, true );
	}

	/**
	 * isDirectoryExist:判断指定的job目录是否存在. <br/>
	 * @author jingma
	 * @param repository 
	 * @param directoryName
	 * @return
	 * @since JDK 1.6
	 */
	public static boolean isDirectoryExist(Repository repository, String directoryName) {
		try {
			RepositoryDirectoryInterface dir = repository.findDirectory(directoryName);
			if(dir==null){
				return false;
			}else{
				return true;
			}
		} catch (KettleException e) {
			log.error("判断job目录是否存在失败！",e);
		}
		return false;
	}
    /**
     * 获取或创建目录 <br/>
     * @author jingma
     * @param parentDirectory 父级目录
     * @param directoryName 要创建的目录
     * @return
     * @since JDK 1.6
     */
    public static RepositoryDirectoryInterface getOrMakeDirectory(String parentDirectory,String directoryName) {
        try {
            RepositoryDirectoryInterface dir = repository.findDirectory(parentDirectory+"/"+directoryName);
            if(dir==null){
                return repository.createRepositoryDirectory(repository.findDirectory(parentDirectory), directoryName);
            }else{
                return dir;
            }
        } catch (KettleException e) {
            log.error("判断job目录是否存在失败！",e);
        }
        return null;
    }
	
	/**
	 * 获取指定的job目录. <br/>
	 * @author jingma
	 * @param directoryName
	 * @return
	 * @since JDK 1.6
	 */
	public static String getDirectory(ObjectId dirId) {
		try {
			RepositoryDirectoryInterface dir = repository.findDirectory(dirId);
			if(dir==null){
				return null;
			}else{
				return dir.getPath();
			}
		} catch (KettleException e) {
			log.error("判断job目录是否存在失败！",e);
		}
		return null;
	}

	/**
	* 将步骤smi设置到转换trans中<br/>
	* @author jingma
	* @param teans 转换元数据
	* @param stepName 步骤名称
	* @param smi 步骤
	*/
	public static void setStepToTrans(TransMeta teans, String stepName, StepMetaInterface smi) {
		try {
			StepMeta step = teans.findStep(stepName);
			step.setStepMetaInterface(smi);
		} catch (Exception e) {
			log.error("将步骤smi设置到转换trans中-失败",e);
		}
	}

	/**
	* 将步骤smi设置到转换trans中并保存到资源库 <br/>
	* @author jingma
	* @param teans 转换元数据
	* @param stepName 步骤名称
	* @param smi 步骤
	*/
	public static void setStepToTransAndSave(TransMeta teans, String stepName, StepMetaInterface smi) {
		setStepToTrans( teans, stepName, smi);
		try {
			KettleUtils.saveTrans(teans);
		} catch (KettleException e) {
			log.error("将步骤smi设置到转换trans中并保存到资源库-失败",e);
		}
	}

	/**
	* 步骤数据预览 <br/>
	* @author jingma
	* @param teans 转换
	* @param testStep 步骤名称
	* @param smi 步骤实体
	* @param previewSize 预览的条数
	* @return 预览结果
	*/
	public static List<List<Object>> stepPreview(TransMeta teans,
			String testStep, StepMetaInterface smi, int previewSize) {
		TransMeta previewMeta = TransPreviewFactory.generatePreviewTransformation(
				teans,
				smi,
				testStep);
		TransPreviewUtil tpu = new TransPreviewUtil(
				previewMeta,
		        new String[] { testStep },
		        new int[] { previewSize } );
		tpu.doPreview();
		return TransPreviewUtil.getData(tpu.getPreviewRowsMeta(testStep),tpu.getPreviewRows(testStep));
	}

	/**
	* 将指定job复制到KettleUtils中的资源库 <br/>
	* @author jingma
	* @param jobName job名称
	* @param jobPath job路径
	* @param fromRepository 来源资源库
    * @param toRepository 目标资源库
	* @throws KettleException
	*/
	public static void jobCopy(String jobName,String jobPath,Repository fromRepository,
	        Repository toRepository) throws KettleException {
		JobMeta jobMeta = KettleUtils.loadJob(jobName,jobPath,fromRepository);
		for(JobEntryCopy jec:jobMeta.getJobCopies()){
			if(jec.isTransformation()){
				JobEntryTrans jet = (JobEntryTrans)jec.getEntry();
				transCopy(jet.getObjectName(), jet.getDirectory(),fromRepository,toRepository);
			}else if(jec.isJob()){
				JobEntryJob jej = (JobEntryJob)jec.getEntry();
				jobCopy(jej.getObjectName(),jej.getDirectory(),fromRepository,toRepository);
			}
		}
		jobMeta.setRepository(toRepository);
		jobMeta.setMetaStore(toRepository.getMetaStore());
		if(!isDirectoryExist(toRepository,jobPath)){
			//所在目录不存在则创建
		    toRepository.createRepositoryDirectory(toRepository.findDirectory("/"), jobPath);
		}
		KettleUtils.saveJob(jobMeta);
	}

	/**
	* 将指定转换复制到KettleUtils中的资源库 <br/>
	* @author jingma
	* @param jobName 转换名称
	* @param jobPath 转换路径
    * @param fromRepository 来源资源库
    * @param toRepository 目标资源库
	* @throws KettleException
	*/
	public static void transCopy(String transName,String transPath,Repository fromRepository,
            Repository toRepository) throws KettleException {
		TransMeta tm = KettleUtils.loadTrans(transName, transPath, fromRepository);
		for(StepMeta sm:tm.getSteps()){
			if(sm.isJobExecutor()){
				JobExecutorMeta jem = (JobExecutorMeta)sm.getStepMetaInterface();
				jobCopy(jem.getJobName(),jem.getDirectoryPath(),fromRepository,toRepository);
			}
			else if(sm.getStepMetaInterface() instanceof TransExecutorMeta){
				TransExecutorMeta te = (TransExecutorMeta)sm.getStepMetaInterface();
				transCopy(te.getTransName(), te.getDirectoryPath(),fromRepository,toRepository);
			}
		}
		if(!isDirectoryExist(toRepository,transPath)){
			//所在目录不存在则创建
		    toRepository.createRepositoryDirectory(toRepository.findDirectory("/"), transPath);
		}
		tm.setRepository(toRepository);
		tm.setMetaStore(toRepository.getMetaStore());
		KettleUtils.saveTrans(tm);
	}

    /**
    * 获取作业id <br/>
    * 获取当前作业所在目录是否有相同的作业
    * @author jingma
    * @param jm 当前作业
    * @return 存在则返回id，不存在则返回null
    */
    public static ObjectId getJobId(JobMeta jm){
        return getJobId(jm.getName(), jm.getRepositoryDirectory());
    }
    /**
    * 作业转换id <br/>
    * @author jingma
    * @param name 作业名称
    * @param repositoryDirectory 作业目录
    * @return 存在则返回id，不存在则返回null
    */
    public static ObjectId getJobId(String name,
            RepositoryDirectoryInterface repositoryDirectory) {
        try {
            return repository.getJobId(name, repositoryDirectory);
        } catch (KettleException e) {
            log.debug("获取作业id失败", e);
        }
        return null;
    }

    /**
    * 获取转换id <br/>
    * 获取当前转换所在目录是否有相同的转换
    * @author jingma
    * @param tm 当前转换
    * @return 存在则返回id，不存在则返回null
    */
    public static ObjectId getTransformationID(TransMeta tm){
        return getTransformationID(tm.getName(), tm.getRepositoryDirectory());
    }
    /**
    * 获取转换id <br/>
    * @author jingma
    * @param name 转换名称
    * @param repositoryDirectory 转换目录
    * @return 存在则返回id，不存在则返回null
    */
    public static ObjectId getTransformationID(String name,
            RepositoryDirectoryInterface repositoryDirectory) {
        try {
            return repository.getTransformationID(name, repositoryDirectory);
        } catch (KettleException e) {
            log.debug("获取转换id失败", e);
        }
        return null;
    }

    /**
    * 修复转换连接线 <br/>
    * @author jingma
    * @param tm 转换元数据
    */
    public static void repairTransHop(TransMeta tm) {
        for(int i=0;i<tm.nrTransHops();i++){
            TransHopMeta hop = tm.getTransHop(i);
            hop.setFromStep(tm.findStep(hop.getFromStep().getName()));
            hop.setToStep(tm.findStep(hop.getToStep().getName()));
        }
    }

    /**
    * 将来源对象的参数拷贝到目标对象，并根据要求修改 <br/>
    * @author jingma
    * @param target 要设置的目标对象
    * @param source 来源对象
    * @param params 要修改的参数
    */
    public static void setParams(NamedParams target,
            NamedParams source,Map<String, String> params) {
        //修改参数
        target.eraseParameters();
        try {
            for ( String key : source.listParameters() ) {
                String defaultVal = source.getParameterDefault( key );
                if(params.containsKey(key)){
                    defaultVal = params.get(key);
                }
                target.addParameterDefinition( key, defaultVal, 
                        source.getParameterDescription( key ) );
            }
        } catch (Exception e) {
            log.error("保存JOB失败", e);
        }
    }

    /**
    * 修复JOB的连接线，克隆的job连接线不能显示 <br/>
    * @author jingma
    * @param jm job元数据
    */
    public static void repairHop(JobMeta jm) {
        for(JobHopMeta hop:jm.getJobhops()){
            hop.setFromEntry(jm.findJobEntry(hop.getFromEntry().getName()));
            hop.setToEntry(jm.findJobEntry(hop.getToEntry().getName()));
        }
    }

	/**
	 * @return transMetaTemplate 
	 */
	public static TransMeta getTransMetaTemplate() {
//		if(transMetaTemplate==null){
//			setTransMetaTemplate(KettleUtils.loadTrans(SysCode.TRANS_TEMPLATE_NAME, SysCode.TEMPLATE_DIR));
//		}
		return transMetaTemplate;
	}

	/**
	 * @param transMetaTemplate the transMetaTemplate to set
	 */
	public static void setTransMetaTemplate(TransMeta transMetaTemplate) {
		KettleUtils.transMetaTemplate = transMetaTemplate;
	}

	/**
	 * @return jobMetaTemplate 
	 */
	public static JobMeta getJobMetaTemplate() {
//		if(jobMetaTemplate==null){
//			setJobMetaTemplate(KettleUtils.loadJob(SysCode.JOB_TEMPLATE_NAME, SysCode.TEMPLATE_DIR));
//		}
		return jobMetaTemplate;
	}

	/**
	 * @param jobMetaTemplate the jobMetaTemplate to set
	 */
	public static void setJobMetaTemplate(JobMeta jobMetaTemplate) {
		KettleUtils.jobMetaTemplate = jobMetaTemplate;
	}
	
    /**
    * 获取参数 <br/>
    * @author jingma
    * @param vs 
    * @param key 参数名称
    * @return 值
    */
    public static String getProp(VariableSpace vs, String key){
        String value = vs.environmentSubstitute("${"+key+"}");
        if(value.startsWith("${")){
            return "";
        }else{
            return value;
        }
    }
    /**
    * 获取参数并解析为JSON对象 <br/>
    * @author jingma
    * @param vs 
    * @param key 参数名称
    * @return 值
    */
    public static JSONObject getPropJSONObject(VariableSpace vs, String key){
        String value = getProp(vs, key);
        if(StringUtil.isNotBlank(value)){
            return JSON.parseObject(value);
        }else{
            return null;
        }
    }
    /**
    * 获取根job <br/>
    * @author jingma
    * @param rootjob 
    * @return
    */
    public static Job getRootJob(Job rootjob) {
        while(rootjob!=null&&rootjob.getParentJob()!=null){
            rootjob = rootjob.getParentJob();
        }
        return rootjob;
    }
    /**
    * 获取根job <br/>
    * @author jingma
    * @param jee 
    * @return
    */
    public static Job getRootJob(JobEntryBase jee) {
        Job rootjob = jee.getParentJob();
        return getRootJob(rootjob);
    }
    /**
    * 获取根job <br/>
    * @author jingma
    * @param si 
    * @return
    */
    public static Job getRootJob(StepInterface si) {
        Job rootjob = si.getTrans().getParentJob();
        return getRootJob(rootjob);
    }
    /**
    * 获取根job的id <br/>
    * @author jingma
    * @param jee 
    * @return
    */
    public static String getRootJobId(JobEntryBase jee) {
        return getRootJob(jee).getObjectId().getId();
    }
    /**
    * 获取根job的id <br/>
    * @author jingma
    * @param si 
    * @return
    */
    public static String getRootJobId(StepInterface si) {
        Job rootjob = getRootJob(si);
        if(rootjob!=null){
            return rootjob.getObjectId().getId();
        }else{
            return null;
        }
    }
    /**
    * 获取根job的名称 <br/>
    * @author jingma
    * @param si 
    * @return
    */
    public static String getRootJobName(StepInterface si) {
        Job rootjob = getRootJob(si);
        if(rootjob!=null){
            return rootjob.getObjectName();
        }else{
            return null;
        }
    }
}

