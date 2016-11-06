package com.oss.controller;

import net.oschina.kettlemanager.JobManager;
import net.oschina.kettleutil.common.KuConst;
import net.oschina.mytuils.Dict;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.eova.common.Easy;
import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Db;

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
	        try {
	            runStatus = JobManager.startJob(job);
            } catch (Exception e) {
                flag = true;
                log.error("启动job失败:"+job, e);
            }
	        Db.use(KuConst.DATASOURCE_KETTLE).update(JobManager.SQL_UPDATE_JOB_STATUS, runStatus,
	                Dict.getDbCurrentDateLL(),job.getString("id_job"));
	    }
	    if(!flag){
	        renderJson(new Easy());
	    }else{
            renderJson(new Easy("部分作业启动失败",false));
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
            try {
                runStatus = JobManager.stopJob(job.getString("id_job"));
            } catch (Exception e) {
                flag = true;
                log.error("停止job失败:"+job, e);
            }
            Db.use(KuConst.DATASOURCE_KETTLE).update(JobManager.SQL_UPDATE_JOB_STATUS, runStatus,
                    Dict.getDbCurrentDateLL(),job.getString("id_job"));
        }
        if(!flag){
            renderJson(new Easy());
        }else{
            renderJson(new Easy("部分作业停止失败",false));
        }
    }
    /**
    * 获取作业运行日志 <br/>
    * @author jingma
    */
    public void getLog(){
        String idJob = getPara(0);
        try {
            String msg = JobManager.getLog(idJob);
            renderText(msg);
        } catch (Exception e) {
            log.error("获取作业运行日志失败:"+idJob, e);
            renderText("获取作业运行日志失败:"+e.getMessage());
        }
    }
}