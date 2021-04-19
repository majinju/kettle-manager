package com.iflytek.qb.yxjk;

import org.pentaho.di.trans.TransMeta;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.iflytek.qb.util.JsonResult;
import com.iflytek.qb.util.StringUtil;

import cn.benma666.kettle.mytuils.Db;
import cn.benma666.myutils.DesUtil;


/**
 * 自定义sql：自定义sql监控必须依赖数据库，且必须是第一位
 * @author hjli9@iflytek.com
 * @date 2019年1月29日下午3:45:37
 */
public class Zdysqljk extends YxjkRunBase{
	private static final String SQL_QUERYZDYSQL = "根据id查询自定义监控配置信息sql";
	private final static String SQL_QUERYSJK_BYDM = "根据数据库代码查询数据库配置信息sql";
	private final static String PARAM_DECRYPT = "数据库连接密码解密密钥";
	
	@Override
	public JsonResult test(Object[] outputRow) {
		String jtrwid = outputRow[getFieldIndex(JKRW_JTRW)].toString();//具体任务id
		String code = outputRow[getFieldIndex(JKRW_RWDJ)].toString();//任务等级对应相应的报警消息等级
		//自定义监控配置信息
		JSONObject zdysqlObj = YxjkInit.jkdb.findFirst(configInfo.getString(SQL_QUERYZDYSQL), jtrwid);
		if(zdysqlObj==null){
			return JsonResult.error("自定义sql监控-" + outputRow[getFieldIndex(JKRW_RWMC)].toString() + "未找到其具体任务");
		}
		String zdysql = zdysqlObj.getString("sql");
    	if(StringUtil.isBlank(zdysql)){
    		return JsonResult.error("自定义sql监控-" + outputRow[getFieldIndex(JKRW_RWMC)].toString() + "未配置自定义sql");
    	}
    	//数据库信息
		JSONObject sjkObj = YxjkInit.jkdb.findFirst(configInfo.getString(SQL_QUERYSJK_BYDM),zdysqlObj.getString("sjk"));
		String jndi = sjkObj.getString("jndi");
		cn.benma666.db.Db zdyjkdb = null;
		//调度应用数据库
    	if(StringUtil.isNotBlank(jndi)){
    		zdyjkdb = Db.use(jndi);
    	}else{
        	try {
        		String url = sjkObj.getString("ljc");
            	String user = sjkObj.getString("yhm");
        		String password = DesUtil.decrypt(sjkObj.getString("mm"), configInfo.getString(PARAM_DECRYPT));
        		zdyjkdb = new cn.benma666.db.Db("dddb", url, user, password);
			} catch (Exception e) {
				e.printStackTrace();
				ku.logBasic("监测到数据库："+sjkObj.getString("mc")+"连接异常！",e);
				return JsonResult.error("监测到调度数据库" + sjkObj.getString("mc") + "连接异常：" + e.getMessage());
			}
    	}
    	
    	//执行自定义sql监控查询结果:1.返回的code字段：1-本次监测正常，2-本次监测异常 ; 2.返回的msg字段：异常原因信息
    	JSONObject result = zdyjkdb.findFirst(zdysql);
    	if(result==null){
    		return JsonResult.error("自定义sql监控-" + outputRow[getFieldIndex(JKRW_RWMC)].toString() + "配置有误：执行sql无结果返回。请检查！");
    	}else{
    		if("1".equals(result.getString("code"))){//监测正常
    			return JsonResult.success("",result);
    		}else if("2".equals(result.getString("code"))){//监测异常
    			return JsonResult.error(result.getString("msg"),result,code);
    		}
    	}
		return JsonResult.success("",result);
	}
	
	@Override
	public String getDefaultConfigInfo(TransMeta transMeta, String stepName) throws Exception {
		//创建一个JSON对象，用于构建配置对象，避免直接拼字符串构建JSON字符串
        JSONObject params = new JSONObject();
        params.put(SQL_QUERYZDYSQL, "select * from SYS_YXJK_ZDYSQL where id = ?");
        params.put(SQL_QUERYSJK_BYDM, "select * from SYS_SJGL_SJZT where dm = ? ");
        params.put(PARAM_DECRYPT, "5zIcmw5qVZs=");
		return JSON.toJSONString(params, true);
	}

}
