/**
* Project Name:KettleUtil
* Date:2016年6月28日上午11:49:02
* Copyright (c) 2016, jingma All Rights Reserved.
*/

package net.oschina.kettleutil.jobrun;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.oschina.mytuils.DateUtil;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.pentaho.di.core.logging.KettleLogStore;
import org.pentaho.di.job.Job;
import org.pentaho.di.job.entries.eval.JobEntryEval;

import net.oschina.kettleutil.db.Db;

/**
 * 运行作业，与前端页面配合 <br/>
 * date: 2016年6月28日 <br/>
 * @author jingma
 * @version 
 */
public class runJob {
    /**
    * 日志
    */
    private static Log log = LogFactory.getLog(runJob.class);
    /**
    * 是否将job运行日志写入文件
    */
    private static Boolean isWriteLogFile = false;
    /**
    * 日志文件的根路径
    */
    private static String logFileRoot = "/metl/logs/kettle";
    /**
    * 项目基础数据库操作对象
    */
    private static Db metldb;
    /**
    * job日志已处理行数记录：<作业，已处理行数>
    */
    private static Map<Job,Integer> jobLogLine = new HashMap<Job, Integer>();
    /**
    * job日志已处理行数记录：<作业，作业对应的日志输出流>
    */
    private static Map<Job,FileOutputStream> jobLogStream = new HashMap<Job, FileOutputStream>();
    /**
    * javascript控件
    */
    private JobEntryEval jee;
    
    static{
        
    }
    
    /**
     * Creates a new instance of GenerateDataBill.
     */
    public runJob() {
    }
    
    public runJob(JobEntryEval jobEntryEval) {
        super();
        this.jee = jobEntryEval;
    }

    /**
    * 开始获取并执行数据账单中的任务 <br/>
    * @author jingma
    */
    public void run(){
        log.info("");
    }

    /**
    * 写job日志 <br/>
    * @author jingma
    * @param job 要写日志的job
    */
    public void writeJobLog(Job job) {
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
        //还有对应的输出流
        if(outStream==null){
            logFile = new File(logFileRoot+net.oschina.mytuils.constants.UtilConst.FXG
                    +DateUtil.doFormatDate(new Date(), DateUtil.DATE_FORMATTER8));
            if(!logFile.exists()){
                logFile.mkdirs();
            }
            try {
                logFile = new File(logFile.getAbsolutePath()+net.oschina.mytuils.constants.UtilConst.FXG
                        +job.getJobname()+"_"+".txt");
                if(!logFile.exists()){
                        logFile.createNewFile();
                        outStream = new FileOutputStream(logFile);
                        jobLogStream.put(job, outStream);
                }
            } catch (Exception e) {
                jee.logError("创建日志文件失败："+logFile.getAbsolutePath(), e);
            }
        }
        try {
            outStream.write(joblogStr.getBytes());
        } catch (Exception e) {
            jee.logError("写日志文件失败", e);
        }
    }

    /**
     * @return jee 
     */
    public JobEntryEval getJee() {
        return jee;
    }

    /**
     * @param jee the jee to set
     */
    public void setJee(JobEntryEval jee) {
        this.jee = jee;
    }

    /**
     * @return metldb 
     */
    public Db getMetldb() {
        return metldb;
    }

    /**
     * @param metldb the metldb to set
     */
    public void setMetldb(Db metldb) {
        runJob.metldb = metldb;
    }
    
}
