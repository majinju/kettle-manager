/**
* Project Name:kettle-manager
* Date:2017年6月13日
* Copyright (c) 2017, jingma All Rights Reserved.
*/

package com.oss.service;

import java.util.Map;

import net.oschina.kettleutil.jobentry.JobEntryKettleUtil;
import net.oschina.mytuils.KettleUtils;

import org.pentaho.di.core.database.DatabaseMeta;
import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.core.exception.KettleXMLException;
import org.pentaho.di.job.JobMeta;
import org.pentaho.di.job.entries.eval.JobEntryEval;
import org.pentaho.di.job.entries.shell.JobEntryShell;
import org.pentaho.di.job.entries.sql.JobEntrySQL;
import org.pentaho.di.repository.RepositoryDirectoryInterface;

import cn.benma666.myutils.StringUtil;

import com.alibaba.fastjson.JSONObject;
import com.eova.common.Easy;
import com.eova.config.EovaConfig;
import com.jfinal.kit.PathKit;
import com.jfinal.log.Log;
import com.oss.model.MetlDatabase;

/**
 * 作业管理服务类 <br/>
 * date: 2017年6月13日 <br/>
 * @author jingma
 * @version 
 */
public class JobManagerService {
    //作业类型
    public static final String JOB_TYPE_SHELL = "shell";
    public static final String JOB_TYPE_JAVASCRIPT = "javascript";
    public static final String JOB_TYPE_SQL = "sql";
    public static final String JOB_TYPE_KM = "km";

    /**
    * 目录-km自动生成的作业根目录
    */
    public static final String DIR_KM_AUTO_GEN = "/km_auto_gen/";
    
    //模板信息
    public static final String templateRoot = PathKit.getRootClassPath()+"/template/";
    public static final String templateHz = "Template.kjb";

    /**
    * 日志
    */
    public static Log log = Log.getLog(JobManagerService.class);

    /**
    * 编辑作业基本信息 <br/>
    * @author jingma
    * @param paraMap
    * @param result
    * @param jobType 作业类型
    * @return
    * @throws KettleException
    * @throws KettleXMLException
    */
    public static JobMeta editJobInfo(Map<String, String[]> paraMap, Easy result,String jobType)
            throws KettleException, KettleXMLException {
        JobMeta jm = null;
        if(StringUtil.isNotBlank(paraMap.get("id_job")[0])){
            result.setMsg("修改成功");
            jm = KettleUtils.loadJob(paraMap.get("id_job")[0]);
        }else{
            //创建作业元对象
            jm = new JobMeta(templateRoot+jobType+templateHz, KettleUtils.getInstanceRep());
            jm.setName(paraMap.get("name")[0]);
            //设置目录
            String directory = paraMap.get("directory")[0];
            RepositoryDirectoryInterface dir = KettleUtils.makeDirs(DIR_KM_AUTO_GEN+directory);
            jm.setRepositoryDirectory(dir);
        }
        //设置作业描述
        jm.setDescription(paraMap.get("description")[0]);
        return jm;
    }

    /**
    * 设置作业的相对路径 <br/>
    * @author jingma
    * @param jobJson
    * @throws KettleException
    */
    public static void setDir(JSONObject jobJson) throws KettleException {
        String dir = KettleUtils.getDirectory(jobJson.getLong("id_directory"));
        if(dir.length()>DIR_KM_AUTO_GEN.length()){
            dir = dir.substring(DIR_KM_AUTO_GEN.length());
        }else{
            dir = "";
        }
        jobJson.put("dir",dir);
    }
    
    /**
    * 编辑作业 <br/>
    * @author jingma
    * @param paraMap
    * @return
    * @throws KettleException 
    * @throws KettleXMLException 
    */
    public static Easy editJobShell(Map<String, String[]> paraMap) throws Exception {
        //默认成功
        Easy result = new Easy("创建成功",true);
        JobMeta jm = editJobInfo(paraMap, result,JOB_TYPE_SHELL);
        
        JobEntryShell shell = (JobEntryShell) jm.findJobEntry(JOB_TYPE_SHELL).getEntry();
        String workPath = paraMap.get("work_path")[0];
        if(StringUtil.isBlank(workPath)){
            workPath = "/tmp";
        }
        shell.setWorkDirectory(workPath);
        shell.setScript(paraMap.get("shell_content")[0]);
        KettleUtils.saveJob(jm);
        return result;
    }
    
    /**
    * 作业获取 <br/>
    * @author jingma
    * @param jobJson
    * @return
    * @throws KettleException
    */
    public static JSONObject getJobShell(JSONObject jobJson) throws KettleException{
        setDir(jobJson);
        JobMeta jm = KettleUtils.loadJob(jobJson.getString("name"),jobJson.getLongValue("id_directory"));
        JobEntryShell shell = (JobEntryShell) jm.findJobEntry(JOB_TYPE_SHELL).getEntry();
        jobJson.put("work_path", shell.getWorkDirectory());
        jobJson.put("shell_content", shell.getScript());
        return jobJson;
    }

    /**
    * 编辑作业 <br/>
    * @author jingma
    * @param paraMap
    * @return
    * @throws KettleException 
    * @throws KettleXMLException 
    */
    public static Easy editJobJavascript(Map<String, String[]> paraMap) throws Exception {
        //默认成功
        Easy result = new Easy("创建成功",true);
        JobMeta jm = editJobInfo(paraMap, result,JOB_TYPE_JAVASCRIPT);
        
        JobEntryEval js = (JobEntryEval) jm.findJobEntry(JOB_TYPE_JAVASCRIPT).getEntry();
        js.setScript(paraMap.get("javascript_content")[0]);
        KettleUtils.saveJob(jm);
        return result;
    }
    
    /**
    * 作业获取 <br/>
    * @author jingma
    * @param jobJson
    * @return
    * @throws KettleException
    */
    public static JSONObject getJobJavascript(JSONObject jobJson) throws KettleException{
        setDir(jobJson);
        JobMeta jm = KettleUtils.loadJob(jobJson.getString("name"),jobJson.getLongValue("id_directory"));
        JobEntryEval js = (JobEntryEval) jm.findJobEntry(JOB_TYPE_JAVASCRIPT).getEntry();
        jobJson.put("javascript_content", js.getScript());
        return jobJson;
    }

    /**
    * 编辑作业 <br/>
    * @author jingma
    * @param paraMap
    * @return
    * @throws KettleException 
    * @throws KettleXMLException 
    */
    public static Easy editJobSql(Map<String, String[]> paraMap) throws Exception {
        //默认成功
        Easy result = new Easy("创建成功",true);
        JobMeta jm = editJobInfo(paraMap, result,JOB_TYPE_SQL);
        String dbCode = paraMap.get("database")[0];
        MetlDatabase db = MetlDatabase.dao.queryFast("ocode",dbCode);
        //自动修正为配置文件中的数据库信息
        if(EovaConfig.props.get("config_db_codes").indexOf(dbCode)>-1){
            db.set("url", EovaConfig.props.get(dbCode+"_url"));
            db.set("password", EovaConfig.props.get(dbCode+"_pwd"));
            db.set("username", EovaConfig.props.get(dbCode+"_user"));
        }
        DatabaseMeta dm = KettleUtils.createDatabaseMeta(db.getStr("ocode"),db.getStr("url"),
                db.getStr("username"),db.getStr("password"),false,KettleUtils.getInstanceRep());
        JobEntrySQL sql = (JobEntrySQL) jm.findJobEntry(JOB_TYPE_SQL).getEntry();
        sql.setSQL(paraMap.get("sql_content")[0]);
        sql.setDatabase(dm);
        KettleUtils.saveJob(jm);
        return result;
    }
    
    /**
    * 作业获取 <br/>
    * @author jingma
    * @param jobJson
    * @return
    * @throws KettleException
    */
    public static JSONObject getJobSql(JSONObject jobJson) throws KettleException{
        setDir(jobJson);
        JobMeta jm = KettleUtils.loadJob(jobJson.getString("name"),jobJson.getLongValue("id_directory"));
        JobEntrySQL sql = (JobEntrySQL) jm.findJobEntry(JOB_TYPE_SQL).getEntry();
        jobJson.put("sql_content", sql.getSQL());
        jobJson.put("database", sql.getDatabase().getName());
        return jobJson;
    }

    /**
    * 编辑作业 <br/>
    * @author jingma
    * @param paraMap
    * @return
    * @throws KettleException 
    * @throws KettleXMLException 
    */
    public static Easy editJobKm(Map<String, String[]> paraMap) throws Exception {
        //默认成功
        Easy result = new Easy("创建成功",true);
        JobMeta jm = editJobInfo(paraMap, result,JOB_TYPE_KM);
        
        JobEntryKettleUtil km = (JobEntryKettleUtil) jm.findJobEntry(JOB_TYPE_KM).getEntry();
        km.setClassName(paraMap.get("class_name")[0]);
        km.setConfigInfo(paraMap.get("config_info")[0]);
        KettleUtils.saveJob(jm);
        return result;
    }
    
    /**
    * 作业获取 <br/>
    * @author jingma
    * @param jobJson
    * @return
    * @throws KettleException
    */
    public static JSONObject getJobKm(JSONObject jobJson) throws KettleException{
        setDir(jobJson);
        JobMeta jm = KettleUtils.loadJob(jobJson.getString("name"),jobJson.getLongValue("id_directory"));
        JobEntryKettleUtil km = (JobEntryKettleUtil) jm.findJobEntry(JOB_TYPE_KM).getEntry();
        jobJson.put("class_name", km.getClassName());
        jobJson.put("config_info", km.getConfigInfo());
        return jobJson;
    }

    /**
    * 删除作业 <br/>
    * @author jingma
    * @param jobJson
     * @throws KettleException 
    */
    public static void delJob(JSONObject jobJson) throws KettleException {
        log.info("删除作业："+jobJson);
        KettleUtils.delJob(jobJson.getLongValue("id_job"));
    } 

}
