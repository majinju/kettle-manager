/**
* Project Name:KettleUtil
* Date:2016年8月18日
* Copyright (c) 2016, jingma All Rights Reserved.
*/

package net.oschina.kettleutil.jobentry;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * kettleUtil作业组件开发基础类 <br/>
 * date: 2016年8月18日 <br/>
 * @author jingma
 * @version 
 */
public abstract class JobEntryKettleUtilRunBase {
    protected Log log = LogFactory.getLog(getClass());
    /**
    * 配置信息
    */
    protected JSONObject configInfo;
    protected JobEntryKettleUtil jeku;
    protected abstract boolean run() throws Exception;
    /**
    * 获取格式化后的默认JSON配置参数，供使用者方便快捷的修改配置 <br/>
    * @author jingma
    */
    public String getDefaultConfigInfo() throws Exception{
        return "{}";
    }
    /**
     * @return configInfo 
     */
    public JSONObject getConfigInfo() {
        return configInfo;
    }
    /**
     * @param configInfo the configInfo to set
     */
    public void setConfigInfo(JSONObject configInfo) {
        this.configInfo = configInfo;
    }
    /**
     * @return jeku 
     */
    public JobEntryKettleUtil getJeku() {
        return jeku;
    }
    /**
     * @param jeku the jeku to set
     */
    public void setJeku(JobEntryKettleUtil jeku) {
        this.jeku = jeku;
        try {
            configInfo = JSON.parseObject(jeku.
                    environmentSubstitute(jeku.getConfigInfo()));
        } catch (Exception e) {
            log.debug("配置信息不能转换为JSON对象", e);
        }
    }
    
}
