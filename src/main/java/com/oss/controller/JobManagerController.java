package com.oss.controller;

import java.net.URLEncoder;

import net.oschina.kettleutil.common.KuConst;
import net.oschina.mytuils.KettleUtils;

import org.beetl.sql.core.db.Db;
import org.pentaho.di.repository.LongObjectId;

import cn.benma666.myutils.HttpUtl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.eova.common.Easy;
import com.eova.config.EovaConfig;
import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.oss.job.AbsJob;
import com.oss.job.JobManager;
import com.oss.service.CommonService;
import com.oss.service.JobManagerService;

/**
* 作业管理控制器 <br/>
* date: 2016年6月6日 <br/>
* @author jingma
* @version 
*/
public class JobManagerController extends Controller {

	/**
	* 日志
	*/
	private Log log = Log.getLog(getClass());
    /**
    * 启动作业 <br/>
    * @author jingma
    */
    public void startJob(){
        String rows = getPara("rows");
        JSONArray jobs = JSON.parseArray(rows);
        //是否有启动失败的作业
        boolean flag = false;
        for(int i=0;i<jobs.size();i++){
            String runStatus = JobManager.START_FAILED;
            JSONObject job = jobs.getJSONObject(i);
            //如果该作业就指定运行在本项目
            if(JobManager.getProjectCode().equals(job.getString("project_code_val"))){
                try {
                    runStatus = JobManager.startJob(job);
                } catch (Exception e) {
                    flag = true;
                    log.error("启动job失败:"+job, e);
                }
            }else{
                try {
                    String url = job.getString("project_code_val")
                            +"@/oss/job_manager/remoteStartJob?job="
                            +URLEncoder.encode(job.toJSONString(),"utf8");
                    url = CommonService.doDesEncryptUrl(url, this);
                    JSONObject result = HttpUtl.doUrl(url);
                    if(result.getBooleanValue("success")){
                        runStatus = result.getString("msg");
                    }else{
                        flag = true;
                        log.error("远程启动job失败:"+job);
                    }
                } catch (Exception e) {
                    flag = true;
                    log.error("远程启动job失败:"+job,e);
                }
            }
            Db.use(KuConst.DATASOURCE_KETTLE).update(JobManager.SQL_UPDATE_JOB_STATUS, runStatus,
                    Db.use(KuConst.DATASOURCE_KETTLE).getCurrentDateStr14(),job.getString("id_job"));
        }
        if(!flag){
            renderJson(new Easy());
        }else{
            renderJson(new Easy("部分作业启动失败",false));
        }
    }
	/**
	* 远程启动作业 <br/>
	* @author jingma
	*/
	public void remoteStartJob(){
	    String jobJson = getPara("job");
	    JSONObject job = JSON.parseObject(jobJson);
        String runStatus = JobManager.START_FAILED;
        try {
            runStatus = JobManager.startJob(job);
            renderJson(new Easy(runStatus,true));
        } catch (Exception e) {
            log.error("启动job失败:"+job, e);
            renderJson(new Easy("作业启动失败",false));
        }
	}
    /**
    * 停止作业 <br/>
    * @author jingma
    */
    public void stopJob(){
        String rows = getPara("rows");
        JSONArray jobs = JSON.parseArray(rows);
        //是否有停止失败的作业
        boolean flag = false;
        for(int i=0;i<jobs.size();i++){
            String runStatus = JobManager.STOP_FAILED;
            JSONObject job = jobs.getJSONObject(i);
            //如果该作业就指定运行在本项目
            if(EovaConfig.props.get("project_code").equals(job.getString("project_code_val"))){
                try {
                    runStatus = JobManager.stopJob(job.getString("id_job"));
                } catch (Exception e) {
                    flag = true;
                    log.error("启动job失败:"+job, e);
                }
            }else{
                try {
                    String url = job.getString("project_code_val")
                            +"@/oss/job_manager/remoteStopJob?job="
                            +URLEncoder.encode(job.toJSONString(),"utf8");
                    url = CommonService.doDesEncryptUrl(url, this);
                    JSONObject result = HttpUtl.doUrl(url);
                    if(result.getBooleanValue("success")){
                        runStatus = result.getString("msg");
                    }else{
                        flag = true;
                        log.error("远程停止job失败:"+job);
                    }
                } catch (Exception e) {
                    flag = true;
                    log.error("远程停止job失败:"+job,e);
                }
            }
            Db.use(KuConst.DATASOURCE_KETTLE).update(JobManager.SQL_UPDATE_JOB_STATUS, runStatus,
                    Db.use(KuConst.DATASOURCE_KETTLE).getCurrentDateStr14(),job.getString("id_job"));
        }
        if(!flag){
            renderJson(new Easy());
        }else{
            renderJson(new Easy("部分作业停止失败",false));
        }
    }
    /**
    * 远程停止作业 <br/>
    * @author jingma
    */
    public void remoteStopJob(){
        String jobJson = getPara("job");
        JSONObject job = JSON.parseObject(jobJson);
        String runStatus = JobManager.START_FAILED;
        try {
            runStatus = JobManager.stopJob(job.getString("id_job"));
            renderJson(new Easy(runStatus,true));
        } catch (Exception e) {
            log.error("停止job失败:"+job, e);
            renderJson(new Easy("作业停止失败",false));
        }
    }
    /**
    * 删除作业 <br/>
    * @author jingma
    */
    public void delJob(){
        String rows = getPara("rows");
        JSONArray jobs = JSON.parseArray(rows);
        //是否有删除失败的作业
        boolean flag = false;
        for(int i=0;i<jobs.size();i++){
            JSONObject job = jobs.getJSONObject(i);
            //如果该作业就指定运行在本项目
            try {
                JobManagerService.delJob(job);
            } catch (Exception e) {
                flag = true;
                log.error("作业删除失败:"+job, e);
            }
        }
        if(!flag){
            renderJson(new Easy());
        }else{
            renderJson(new Easy("部分作业停止失败",false));
        }
    }
    /**
    * 结束作业 <br/>
    * @author jingma
    */
    public void killJob(){
        String rows = getPara("rows");
        JSONArray jobs = JSON.parseArray(rows);
        //是否有结束失败的作业
        boolean flag = false;
        for(int i=0;i<jobs.size();i++){
            String runStatus = JobManager.STOP_FAILED;
            JSONObject job = jobs.getJSONObject(i);
            //如果该作业就指定运行在本项目
            if(EovaConfig.props.get("project_code").equals(job.getString("project_code_val"))){
                try {
                    runStatus = JobManager.killJob(job.getString("id_job"));
                } catch (Exception e) {
                    flag = true;
                    log.error("结束job失败:"+job, e);
                }
            }else{
                try {
                    String url = job.getString("project_code_val")
                            +"@/oss/job_manager/remoteKillJob?job="
                            +URLEncoder.encode(job.toJSONString(),"utf8");
                    url = CommonService.doDesEncryptUrl(url, this);
                    JSONObject result = HttpUtl.doUrl(url);
                    if(result.getBooleanValue("success")){
                        runStatus = result.getString("msg");
                    }else{
                        flag = true;
                        log.error("远程结束job失败:"+job);
                    }
                } catch (Exception e) {
                    flag = true;
                    log.error("远程结束job失败:"+job,e);
                }
            }
            Db.use(KuConst.DATASOURCE_KETTLE).update(JobManager.SQL_UPDATE_JOB_STATUS, runStatus,
                    Db.use(KuConst.DATASOURCE_KETTLE).getCurrentDateStr14(),job.getString("id_job"));
        }
        if(!flag){
            renderJson(new Easy());
        }else{
            renderJson(new Easy("部分作业停止失败",false));
        }
    }
    /**
    * 远程结束作业 <br/>
    * @author jingma
    */
    public void remoteKillJob(){
        String jobJson = getPara("job");
        JSONObject job = JSON.parseObject(jobJson);
        String runStatus = JobManager.START_FAILED;
        try {
            runStatus = JobManager.killJob(job.getString("id_job"));
            renderJson(new Easy(runStatus,true));
        } catch (Exception e) {
            log.error("停止job失败:"+job, e);
            renderJson(new Easy("作业停止失败",false));
        }
    }
    /**
    * 获取作业运行日志 <br/>
    * @author jingma
    */
    public void getLog(){
        String jobJson = getPara("job");
        JSONObject job = JSON.parseObject(jobJson);
        String msg = null;
        try {
            //如果该作业就指定运行在本项目
            if(EovaConfig.props.get("project_code").equals(job.getString("project_code_val"))){
                msg = JobManager.getLog(job.getString("id_job"));
                renderText(msg);
            }else{
                String url = job.getString("project_code_val")
                        +"@/oss/job_manager/getLog?job="
                        +URLEncoder.encode(job.toJSONString(),"utf8");
                url = CommonService.doDesEncryptUrl(url, this);
                redirect(url);
            }
        } catch (Exception e) {
            log.error("获取作业运行日志失败:"+job, e);
            renderText("获取作业运行日志失败:"+e.getMessage());
        }
    }
    /**
    * 获取作业运行日志 <br/>
    * @author jingma
    */
    public void getDir(){
        String jobJson = getPara("job");
        JSONObject job = JSON.parseObject(jobJson);
        try {
            renderText(KettleUtils.getDirectory(job.getLong("id_directory")));
        } catch (Exception e) {
            log.error("获取作业目录失败:"+job, e);
            renderText("获取作业目录失败:"+e.getMessage());
        }
    }
    /**
    * 将作业更新到文件资源库 <br/>
    * @author jingma
    */
    public void updateTofile(){
        String rows = getPara("rows");
        JSONArray jobs = JSON.parseArray(rows);
        //是否有更新失败的作业
        boolean flag = false;
        for(int i=0;i<jobs.size();i++){
            JSONObject job = jobs.getJSONObject(i);
            try {
                KettleUtils.jobCopy(job.getString("name"), 
                        KettleUtils.getDirectory(new LongObjectId(job.getLongValue("id_directory"))), 
                        KettleUtils.getInstanceRep(), 
                        KettleUtils.use(KuConst.CACHE_FILE_REP));
            } catch (Exception e) {
                flag = true;
                log.error("更新job失败:"+job, e);
            }
        }
        if(!flag){
            renderJson(new Easy());
        }else{
            renderJson(new Easy("部分作业更新失败",false));
        }
    }
    /**
    * 进入新建作业的页面 <br/>
    * @author jingma
    * @throws Exception
    */
    public void toAddJob(){
        setAttr("job", new JSONObject());
        render("/oss/job_manager/form_edit_job.html");
    }
    /**
    * 进入修改作业的页面-shell <br/>
    * @author jingma
    * @throws Exception
    */
    public void toUpdateJobShell(){
        JSONObject jobJson = JSON.parseObject(getPara("job"));
        try {
            JobManagerService.getJobShell(jobJson);
        } catch (Exception e) {
            log.error("获取作业失败:"+jobJson, e);
            renderText("获取作业失败:"+e.getMessage());
            return;
        }
        setAttr("job", jobJson);
        render("/oss/job_manager/form_edit_job.html");
    }
    /**
    * 进入修改作业的页面-Javascript <br/>
    * @author jingma
    * @throws Exception
    */
    public void toUpdateJobJavascript(){
        JSONObject jobJson = JSON.parseObject(getPara("job"));
        try {
            JobManagerService.getJobJavascript(jobJson);
        } catch (Exception e) {
            log.error("获取作业失败:"+jobJson, e);
            renderText("获取作业失败:"+e.getMessage());
            return;
        }
        setAttr("job", jobJson);
        render("/oss/job_manager/form_edit_job.html");
    }
    /**
    * 进入修改作业的页面-sql <br/>
    * @author jingma
    * @throws Exception
    */
    public void toUpdateJobSql(){
        JSONObject jobJson = JSON.parseObject(getPara("job"));
        try {
            JobManagerService.getJobSql(jobJson);
        } catch (Exception e) {
            log.error("获取作业失败:"+jobJson, e);
            renderText("获取作业失败:"+e.getMessage());
            return;
        }
        setAttr("job", jobJson);
        render("/oss/job_manager/form_edit_job.html");
    }
    /**
    * 进入修改作业的页面-km <br/>
    * @author jingma
    * @throws Exception
    */
    public void toUpdateJobKm(){
        JSONObject jobJson = JSON.parseObject(getPara("job"));
        try {
            JobManagerService.getJobKm(jobJson);
        } catch (Exception e) {
            log.error("获取作业失败:"+jobJson, e);
            renderText("获取作业失败:"+e.getMessage());
            return;
        }
        setAttr("job", jobJson);
        render("/oss/job_manager/form_edit_job.html");
    }
    /**
    * 执行新建作业操作-shell <br/>
    * @author jingma
    * @throws Exception
    */
    public void editJobShell() throws Exception{
        Easy result = JobManagerService.editJobShell(getParaMap());
        renderJson(result);
    }
    /**
    * 执行新建作业操作-javascript <br/>
    * @author jingma
    * @throws Exception
    */
    public void editJobJavascript() throws Exception{
        Easy result = JobManagerService.editJobJavascript(getParaMap());
        renderJson(result);
        
    }
    /**
    * 执行新建作业操作-sql <br/>
    * @author jingma
    * @throws Exception
    */
    public void editJobSql() throws Exception{
        Easy result = JobManagerService.editJobSql(getParaMap());
        renderJson(result);
    }
    /**
    * 执行新建作业操作-km <br/>
    * @author jingma
    * @throws Exception
    */
    public void editJobKm() throws Exception{
        Easy result = JobManagerService.editJobKm(getParaMap());
        renderJson(result);
    }
    /**
    * 获取km的默认配置信息 <br/>
    * @author jingma
    * @throws Exception
    */
    public void getKmDefaultConfig() throws Exception{
        String className = getPara("class_name");
        //实例化配置的类，获取输出字段
        try {
            AbsJob aj = (AbsJob) Class.forName(className).newInstance();
            renderJson(new Easy(aj.getDefaultConfigInfo(),true));
        } catch (ClassNotFoundException e) {
            renderJson(new Easy("你输入的类不存在"));
        } catch (Exception e) {
            log.info("获取默认配置失败:"+className, e);
            renderJson(new Easy("获取默认配置失败："+e.getMessage()));
        }
    }
}