/**
* Project Name:KettleUtil
* Date:2016年6月28日上午11:49:02
* Copyright (c) 2016, jingma All Rights Reserved.
*/

package net.oschina.kettlemanager;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import net.oschina.kettleutil.common.KuConst;
import net.oschina.kettleutil.db.Db;
import net.oschina.kettleutil.jobentry.JobEntryKettleUtilRunBase;
import net.oschina.mytuils.DateUtil;
import net.oschina.mytuils.KettleUtils;
import net.oschina.mytuils.constants.UtilConst;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.pentaho.di.core.logging.KettleLogStore;
import org.pentaho.di.job.Job;
import org.pentaho.di.job.JobMeta;
import org.pentaho.di.trans.Trans;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * 作业具体操作管理 <br/>
 * date: 2016年6月28日 <br/>
 * @author jingma
 * @version 
 */
public class JobManager extends JobEntryKettleUtilRunBase{
    private static final String LOG_FILE_ROOT = "日志文件路径";
    private static final String IS_WRITE_LOG_FILE = "是否写日志文件";
    private static final String LOG_FILE_SIZE = "日志文件大小(M)";
    private static final String RUN_LOG_LINE = "获取运行日志行数";
    /**
    * 启动失败
    */
    public static final String START_FAILED = "StartFailed";
    /**
    * 停止失败
    */
    public static final String STOP_FAILED = "StopFailed";
    /**
    * 
    */
    public static final String SQL_UPDATE_JOB_STATUS = "update r_job j set j.run_status=? where j.id_job=?";
    /**
    * 日志
    */
    private static Log log = LogFactory.getLog(JobManager.class);
    /**
    * 前端获取运行日志最大行数
    */
    private static int runLogLine = 10000;
    /**
    * 日志文件最大M
    */
    private static double logFileSize = 20;
    /**
    * 是否将job运行日志写入文件
    */
    private static Boolean isWriteLogFile = false;
    /**
    * 日志文件的根路径
    */
    private static String logFileRoot = "/temp/km/logs/kettle";
    /**
    * 资源库所在数据库操作对象
    */
    private static Db kettledb;
    /**
    * jobMap：<作业id,作业>
    */
    private static Map<String,Job> jobMap = new HashMap<String,Job>();
    /**
    * job日志已处理行数记录：<作业，已处理行数>
    */
    private static Map<Job,Integer> jobLogLine = new HashMap<Job, Integer>();
    /**
    * job日志已处理行数记录：<作业，作业对应的日志文件>
    */
    private static Map<Job,File> jobLogFile = new HashMap<Job, File>();
    /**
    * job日志已处理行数记录：<作业，作业对应的日志输出流>
    */
    private static Map<Job,FileOutputStream> jobLogStream = new HashMap<Job, FileOutputStream>();

    static{
        kettledb = Db.use(KuConst.DATASOURCE_KETTLE);
    }
    
    /**
     * Creates a new instance of GenerateDataBill.
     */
    public JobManager() {
    }

    /**
    * 开始获取并执行数据账单中的任务 <br/>
    * @author jingma
    */
    public boolean run() throws Exception{
        if(configInfo!=null){
            setIsWriteLogFile(configInfo.getBoolean(IS_WRITE_LOG_FILE));
            setLogFileRoot(configInfo.getString(LOG_FILE_ROOT));
            setLogFileSize(configInfo.getDoubleValue(LOG_FILE_SIZE));
            setRunLogLine(configInfo.getIntValue(RUN_LOG_LINE));
        }
        //记录日志
        Iterator<Entry<String, Job>> jobIter = jobMap.entrySet().iterator();
        while(jobIter.hasNext()){
            Job job = jobIter.next().getValue();
            if (!job.isActive()) {
                // 运行结束
                writeJobLog(job);
                try {
                    jobLogStream.get(job).close();
                } catch (Exception e) {
                    jeku.logBasic("关闭日志输出流失败", e);
                }
                jobIter.remove();
                jobLogLine.remove(job);
                jobLogStream.remove(job);
                //修改作业状态
            } else {
                // 正在运行
                writeJobLog(job);
            }
            String status = getJobStatus(job);
            //更新作业状态
            kettledb.update(SQL_UPDATE_JOB_STATUS,status,Integer.parseInt(job.getObjectId().getId()));
        }
        return true;
    }
    /**
    * 启动时初始化，运行之前在运行的作业 <br/>
    * @author jingma
    */
    public static void init(){
        String sql = "select * from r_job j where run_status=?";
        List<JSONObject> list = kettledb.find(sql, Trans.STRING_RUNNING);
        for(JSONObject job:list){
            String status = START_FAILED;
            try {
                status = startJob(job.getString("id_job"));
            } catch (Exception e) {
                log.error("启动job失败:"+job, e);
            }
            kettledb.update(SQL_UPDATE_JOB_STATUS, status,
                    job.getString("id_job"));
        }
    }

    /**
    * 启动作业 <br/>
    * @author jingma
    * @param idJob 作业id
    * @return
    * @throws Exception
    */
    public static String startJob(String idJob) throws Exception {
        if(jobMap.containsKey(idJob)){
            return jobMap.get(idJob).getStatus();
        }
        JobMeta jm = KettleUtils.loadJob(idJob);
        Map<String, JSONObject> paramMap = kettledb.
                findMap("ocode","select * from job_params jp where jp.id_job=?", idJob);
        for(JSONObject param:paramMap.values()){
            //设置参数
            jm.setParameterValue(param.getString(KuConst.FIELD_OCODE),
                    param.getString("value"));
        }
        Job job = new Job(KettleUtils.getInstanceRep(), jm);
        return startJob(job);
    }
    /**
    * 启动作业 <br/>
    * @author jingma
    * @param job 作业
    * @return
    * @throws Exception
    */
    public static String startJob(Job job){
        job.start();
        jobMap.put(job.getObjectId().getId(), job);
        jobLogLine.put(job, 0);
        jobLogStream.put(job, null);
        log.info("作业启动完成："+job.getJobname());
        String status = getJobStatus(job);
        return status;
    }

    /**
    * 停止作业 <br/>
    * @author jingma
    * @param idJob 作业id
    * @return
    * @throws Exception
    */
    public static String stopJob(String idJob) throws Exception {
        Job job = jobMap.get(idJob);
        if(job == null){
            return Trans.STRING_STOPPED;
        }
        job.stopAll();
        log.info("作业停止完成："+job.getJobname());
        String status = getJobStatus(job);
        return status;
    }

    /**
    * 获取作业运行状态 <br/>
    * @author jingma
    * @param job
    * @return
    */
    public static String getJobStatus(Job job) {
        String status = job.getStatus();
        if(status.indexOf("errors")>-1){
            status = STOP_FAILED;
        }
        return status;
    }
    /**
    * 获取作业运行日志 <br/>
    * @author jingma
    * @param idJob 作业id
    * @return
    * @throws Exception
    */
    public static String getLog(String idJob) throws Exception {
        Job job = jobMap.get(idJob);
        if(job == null){
            return "该作业未运行";
        }
        int lastLineNr = KettleLogStore.getLastBufferLineNr();
        int startLineNr = 0;
        if(lastLineNr>runLogLine){
            startLineNr = lastLineNr - runLogLine;
        }
        String msg = KettleLogStore.getAppender().getBuffer(
                job.getLogChannel().getLogChannelId(), false, 
                startLineNr , lastLineNr ).toString();
        return msg;
    }

    /**
    * 写job日志 <br/>
    * @author jingma
    * @param job 要写日志的job
    */
    public static void writeJobLog(Job job) {
        //如果不写日志到文件
        if(!isWriteLogFile){
            return;
        }
        int lastLineNr = KettleLogStore.getLastBufferLineNr();
        int startLineNr = jobLogLine.get(job)==null?0:jobLogLine.get(job);
        jobLogLine.put(job, lastLineNr);
        //新增的日志
        String joblogStr = KettleLogStore.getAppender().getBuffer(
                job.getLogChannel().getLogChannelId(), false, 
                startLineNr, lastLineNr ).toString();
        FileOutputStream outStream = jobLogStream.get(job);
        File logFile = null;
        //若日志文件大于20M，则关闭输出流，下一次重新生成一个文件
        if(outStream!=null){
            if(jobLogFile.get(job).length()>logFileSize*1024*1024){
                try {
                    outStream.close();
                } catch (IOException e) {
                    log.error("关闭日志输出流失败", e);
                }
                outStream = null;
                jobLogStream.put(job, null);
                jobLogFile.put(job, null);
            }
        }
        //还有对应的输出流
        if(outStream==null){
            logFile = new File(logFileRoot+UtilConst.FXG
                    +DateUtil.doFormatDate(new Date(), DateUtil.DATE_FORMATTER8));
            if(!logFile.exists()){
                logFile.mkdirs();
            }
            try {
                logFile = new File(logFile.getAbsolutePath()+UtilConst.FXG
                        +job.getJobname()+"_"+DateUtil.doFormatDate(new Date(), 
                                "HHmmss")+".txt");
                jobLogFile.put(job, logFile);
                if(!logFile.exists()){
                        logFile.createNewFile();
                }
                outStream = new FileOutputStream(logFile);
                jobLogStream.put(job, outStream);
            } catch (Exception e) {
                log.error("创建日志文件失败："+logFile.getAbsolutePath(), e);
            }
        }
        try {
            outStream.write(joblogStr.getBytes());
        } catch (Exception e) {
            log.error("写日志文件失败", e);
        }
    }
    /**
    * 
    * @see net.oschina.kettleutil.jobentry.JobEntryKettleUtilRunBase#getDefaultConfigInfo()
    */
    @Override
    public String getDefaultConfigInfo() throws Exception {
        JSONObject params = new JSONObject();
        params.put(RUN_LOG_LINE, runLogLine);
        params.put(LOG_FILE_SIZE, logFileSize);
        params.put(IS_WRITE_LOG_FILE, isWriteLogFile);
        params.put(LOG_FILE_ROOT, logFileRoot);
        return JSON.toJSONString(params, true);
    }
    /**
     * @return runLogLine 
     */
    public static int getRunLogLine() {
        return runLogLine;
    }

    /**
     * @param runLogLine the runLogLine to set
     */
    public static void setRunLogLine(int runLogLine) {
        if(runLogLine>0){
            JobManager.runLogLine = runLogLine;
        }
    }

    /**
     * @return isWriteLogFile 
     */
    public static Boolean getIsWriteLogFile() {
        return isWriteLogFile;
    }

    /**
     * @param isWriteLogFile the isWriteLogFile to set
     */
    public static void setIsWriteLogFile(Boolean isWriteLogFile) {
        if(isWriteLogFile!=null){
            JobManager.isWriteLogFile = isWriteLogFile;
        }
    }

    /**
     * @return logFileRoot 
     */
    public static String getLogFileRoot() {
        return logFileRoot;
    }

    /**
     * @param logFileRoot the logFileRoot to set
     */
    public static void setLogFileRoot(String logFileRoot) {
        if(logFileRoot!=null){
            JobManager.logFileRoot = logFileRoot;
        }
    }

    /**
     * @return logFileSize 
     */
    public static double getLogFileSize() {
        return logFileSize;
    }

    /**
     * @param logFileSize the logFileSize to set
     */
    public static void setLogFileSize(double logFileSize) {
        if(logFileSize>0){
            JobManager.logFileSize = logFileSize;
        }
    }
    
}
