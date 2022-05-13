package cn.benma666.sjsj.job;

import cn.benma666.constants.UtilConstInstance;
import cn.benma666.iframe.BasicObject;
import cn.benma666.job.JobInterface;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;


/**
 * 抽象JOB父类-基于xxl
 */
public abstract class BasicJob extends BasicObject implements JobInterface, UtilConstInstance {
    /**
     * 是否停止，默认false
     */
    protected boolean stoped = false;
    /**
     * 配置信息对象
     */
    private JSONObject configInfo;

    @Override
	public void execute() {
        //采用quartz时暂时不考虑参数配置
        this.configInfo = new JSONObject();

		String name = this.getClass().getName();
		debug("作业开始:" + name);
		try {
			// 业务处理
			process();
		} catch (Throwable t) {
		    info("业务执行异常：", t);
		}
		debug("作业结束:" + name);
	}
    /**
	 * 业务处理
	 */
	protected abstract void process();
	

    /**
    * 获取默认配置信息 <br/>
    * @author jingma
    */
    public String getDefaultConfigInfo(){
        JSONObject params = new JSONObject();
        return JSON.toJSONString(params, true);
    }

    //日志封装
    public void debug(String msg){
        log.debug(msg);
    }
    public void info(String msg){
        log.info(msg);
    }
    public void error(String msg){
        log.error(msg);
    }
    
    public void debug(String msg,Throwable t){
        log.debug(msg, t);
    }
    public void info(String msg,Throwable t){
        log.info(msg, t);
    }
    public void error(String msg,Throwable t){
        log.error(msg, t);
    }
    
    /**
     * @param stoped the stoped to set
     */
    public void setStoped(boolean stoped) {
        this.stoped = stoped;
    }

    /**
    * 
    * @see JobInterface#isStopped()
    */
    @Override
    public boolean isStopped() {
        return stoped;
    }
}
