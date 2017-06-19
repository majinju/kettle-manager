package com.oss.job;

import net.oschina.kettleutil.common.KuConst;
import net.oschina.kettleutil.jobentry.JobEntryKettleUtilRunBase;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.eova.model.Task;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Record;


/**
 * 抽象JOB父类,这里存在一个日志的问题,这种任务不能很好的在页面监控
 * 
 * @author Jieven
 * @date 2014-7-10
 */
public abstract class AbsJob extends JobEntryKettleUtilRunBase implements Job {
    /**
    * 日志
    */
    private static Log log = Log.getLog(AbsJob.class);

    /**
    * 配置信息的key
    */
    public static final String CONFIG_INFO_KEY = "config_info";
    /**
    * 任务对象的key
    */
    public static final String TASK_KEY = "task";
	/**
	* 任务对象
	*/
    protected Record task;

    protected JobExecutionContext context;

    /*
	 * SimpleDateFormat dimple = new SimpleDateFormat("yyyy-MM-dd "); String time = dimple.format(new Date()) ;
	 */
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
	    this.context = context;
		String name = this.getClass().getName();
		debug("Job Start:" + name);

		try {
		    initConfigInfo();
			// 业务处理
			process();
		} catch (Throwable t) {
		    info("业务执行异常：", t);
	        task = (Record)context.getJobDetail().getJobDataMap().get(TASK_KEY);
	        Task.dao.updateState(task.getInt(KuConst.FIELD_ID), Task.STATE_EXCEPTION);
		}

		debug("Job End:" + name);
	}
	
	/**
	* 
	* @see net.oschina.kettleutil.jobentry.JobEntryKettleUtilRunBase#run()
	*/
	@Override
	protected boolean run() throws Exception {
        String name = this.getClass().getName();
        debug("Job Start:" + name);
        // 业务处理
        process();
        debug("Job End:" + name);
        return true;
	}

	/**
    * 初始化配置信息 <br/>
    * @author jingma
    */
    private void initConfigInfo() {
        task = (Record)context.getJobDetail().getJobDataMap().get(TASK_KEY);
        try {
            if(task.get(CONFIG_INFO_KEY)!=null){
                configInfo = JSON.parseObject(task.getStr(CONFIG_INFO_KEY));
            }else{
                configInfo = new JSONObject();
            }
        } catch (Exception e) {
            configInfo = new JSONObject();
            error(task+"参数解析失败",e);
        }
    }

    /**
	 * 业务处理
	 * 
	 * @param context JOB上下文
	 */
	protected abstract void process() throws Exception;
	

    /**
    * 获取默认配置信息 <br/>
    * @author jingma
    * @return
    * @throws Exception
    */
    public String getDefaultConfigInfo() throws Exception {
        JSONObject params = new JSONObject();
        return JSON.toJSONString(params, true);
    }

    //日志封装
    protected void debug(String msg){
        if(jeku!=null){
            jeku.logDebug(msg);
        }else{
            log.debug(msg);
        }
    }
    protected void info(String msg){
        if(jeku!=null){
            jeku.logBasic(msg);
        }else{
            log.info(msg);
        }
    }
    protected void error(String msg){
        if(jeku!=null){
            jeku.logError(msg);
        }else{
            log.error(msg);
        }
    }
    
    protected void debug(String msg,Throwable t){
        if(jeku!=null){
            jeku.logDebug(msg, t);
        }else{
            log.debug(msg, t);
        }
    }
    protected void info(String msg,Throwable t){
        if(jeku!=null){
            jeku.logBasic(msg, t);
        }else{
            log.info(msg, t);
        }
    }
    protected void error(String msg,Throwable t){
        if(jeku!=null){
            jeku.logError(msg, t);
        }else{
            log.error(msg, t);
        }
    }
}
