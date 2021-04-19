package com.iflytek.qb.yxjk;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.pentaho.di.trans.TransMeta;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.iflytek.qb.util.HttpUtil;
import com.iflytek.qb.util.JsonResult;
import com.iflytek.qb.util.StringUtil;

/**
 * 应用监控
 * @date 2019年1月14日上午10:25:23
 */
public class Appjk extends YxjkRunBase{
	private static final String QUERYYY_BYID_SQL = "通过id查询应用配置信息";
	private static final String PARAMS_CODE = "访问成功返回码";
    
    @Override
	public JsonResult test(Object[] outputRow) {
    	String jtrwid = outputRow[getFieldIndex(JKRW_JTRW)].toString();//具体任务id
    	String code = outputRow[getFieldIndex(JKRW_RWDJ)].toString();//任务等级，对应消息级别
    	//应用配置信息对象
    	JSONObject appObj = YxjkInit.jkdb.findFirst(configInfo.getString(QUERYYY_BYID_SQL), jtrwid);
    	if(appObj == null){
			return JsonResult.error("监控任务【"+outputRow[getFieldIndex(JKRW_RWMC)]+"】的具体任务不存在！请重新配置此监控", appObj,code);
    	}
    	String url = appObj.getString("dz");
    	String param = "";
    	JsonResult result = null;
    	try {
    		result = HttpUtil.get(url, param);
		} catch (Exception e) {
			ku.logBasic("检测到应用："+url+"访问异常",e);
			return JsonResult.error("监测到应用异常：" + e.getMessage(), appObj,code);
		}
    	String regEx = appObj.getString("jcgjz");//此处使用正则表达式匹配
    	if(StringUtil.isNotBlank(regEx)){
    		if(!regExMatcher(regEx,result.getMsg())){
        		//应用访问异常
        		return JsonResult.error("监测到应用异常:[" + result.getCode() + "]" + result.getMsg(), appObj,code);
        	}
    	}else{
    		if(!configInfo.getString(PARAMS_CODE).contains(result.getCode())){
    			//应用访问异常
        		return JsonResult.error("监测到应用异常:[" + result.getCode() + "]" + result.getMsg(), appObj,code);
    		}
    	}
		return JsonResult.success("",result,code);
	}
	
	/**
     * 正则表达式匹配
     * @param regEx 正则
     * @param str 匹配的字符串
     * @return boolean
     */
    private boolean regExMatcher(String regEx,String str){
    	boolean flag = true;
    	try {
    		Pattern pattern = Pattern.compile(regEx);
        	// 忽略大小写的写法
            // Pattern pattern = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
        	Matcher matcher = pattern.matcher(str);
            // 查找字符串中是否有匹配正则表达式的字符/字符串
            flag = matcher.find();
		} catch (Exception e) {
			flag = false;
			ku.logBasic("--->应用监控中配置的正则表达式：" + regEx + "有误，请重新配置此正则！", e);
		}
        return flag;
    }
    
    @Override
	public String getDefaultConfigInfo(TransMeta transMeta, String stepName) throws Exception {
		//创建一个JSON对象，用于构建配置对象，避免直接拼字符串构建JSON字符串
        JSONObject params = new JSONObject();
        params.put(QUERYYY_BYID_SQL, "select * from SYS_QX_APP where id = ?");
        params.put(PARAMS_CODE, "200、302");
		return JSON.toJSONString(params, true);
	}

	

}
