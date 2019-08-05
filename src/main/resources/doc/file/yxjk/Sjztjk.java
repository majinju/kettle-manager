package com.iflytek.qb.yxjk;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.pentaho.di.trans.TransMeta;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.iflytek.qb.util.DateUtil;
import com.iflytek.qb.util.JsonResult;
import com.iflytek.qb.util.StringUtil;

import cn.benma666.kettle.mytuils.Db;
import cn.benma666.myutils.DesUtil;

public class Sjztjk extends YxjkRunBase{
	private final static String QUERYSJK_BYID_SQL = "根据id查询数据载体配置信息sql";
	private final static String QUERYSJKBKJ_SQL = "监测表空间空闲率sql";
	private final static String PARAM_FREESIZE = "空闲表空间大小";
	private final static String PARAM_FREEPERCENT = "空闲表空间百分比";
	private final static String PARAM_SFJCBKJ = "是否监测表空间";
	private final static String PARAM_DECRYPT = "数据库连接密码解密密钥";
	/**
	 * 表空间异常缓存<具体任务id，上次监测时间>：用于保存表空间异常的具体任务id，防止表空间重复监测。一天监测一次
	 */
	public static Map<String,String> tablespaceMap = new HashMap<String,String>();
    
    @Override
	public JsonResult test(Object[] outputRow) {
    	String jtrwid = outputRow[getFieldIndex(JKRW_JTRW)].toString();//具体任务id
    	//数据载体信息对象
    	JSONObject sjztObj = null;
    	try {
    		//数据载体信息对象
        	sjztObj = YxjkInit.jkdb.findFirst(configInfo.getString(QUERYSJK_BYID_SQL), jtrwid);
		} catch (Exception e) {
			ku.logBasic("数据载体监控任务中的具体任务未找到："+jtrwid, e);
			return JsonResult.error("数据载体监控任务中的具体任务未找到："+jtrwid);
		}
    	String lx = sjztObj.getString("lx");
    	switch (lx) {
		case "oracle":
			return testSjk(outputRow,sjztObj,true);
		case "greenplum":
			return testSjk(outputRow,sjztObj,false);
		case "ftp":
			return testFtp(outputRow, sjztObj);
		default:
			break;
		}
    	return JsonResult.success("",sjztObj);
	}
    
    /**
     * 数据库监控
     * @param outputRow
     * @param sjztObj
     * @param flag 是否监测表空间
     * @return
     */
    private JsonResult testSjk(Object[] outputRow,JSONObject sjztObj,boolean flag){
    	String jtrwid = outputRow[getFieldIndex(JKRW_JTRW)].toString();//具体任务id
    	String code = outputRow[getFieldIndex(JKRW_RWDJ)].toString();//任务等级，对应消息级别
    	//监测的数据库
    	cn.benma666.db.Db testdb = null;
    	String jndi = sjztObj.getString("jndi");
    	try {
    		if(StringUtil.isNotBlank(jndi)){
    			testdb = Db.use(jndi);
        	}else{
        		String url = sjztObj.getString("ljc");
            	String user = sjztObj.getString("yhm");
            	String password = DesUtil.decrypt(sjztObj.getString("mm"), configInfo.getString(PARAM_DECRYPT));
            	testdb = new cn.benma666.db.Db("testdb", url, user, password);
        	}
		} catch (Exception e) {
			e.printStackTrace();
			ku.logBasic("监测到数据库："+sjztObj.getString("mc")+"连接异常！",e);
			//数据库监测到异常
			return JsonResult.error("监测到数据库异常：" + e.getMessage(),sjztObj,code);
		}
    	if(flag){
    		String now = DateUtil.doFormatDate(new Date(), DateUtil.DATE_FORMATTER8);
			//不在map中 || map中的上次执行时间和当前时间不一致，进行表空间监测
        	if(!tablespaceMap.containsKey(jtrwid)||!now.equals(tablespaceMap.get(jtrwid))){
        		ku.logBasic("-----------开始监测"+outputRow[getFieldIndex(JKRW_RWMC)].toString()+"的表空间");
        		JsonResult result = testTablespace(testdb,sjztObj);
        		tablespaceMap.put(jtrwid, now);
				ku.logBasic("-----------数据库表空间监测结果：" + result.getMsg());
        		//表空间监控产生的消息
        		if(StringUtil.isNotBlank(result.getMsg())){
        			return JsonResult.success(result.getMsg(),result.getData(),result.getCode());
        		}
        	}
    	}
    	return JsonResult.success("",sjztObj);
    }
    
    
    /**
     * ftp监控
     * @param outputRow
     * @param sjztObj
     * @return
     */
    private JsonResult testFtp(Object[] outputRow,JSONObject sjztObj){
    	String code = outputRow[getFieldIndex(JKRW_RWDJ)].toString();//任务等级，对应消息级别
    	FTPClient ftpClient = new FTPClient();
        ftpClient.setControlEncoding("utf-8");
        try {
        	String hostname = sjztObj.getString("ljc").split(":")[0];
        	int port = Integer.valueOf(sjztObj.getString("ljc").split(":")[1]);
        	String username = sjztObj.getString("yhm");
        	String password = DesUtil.decrypt(sjztObj.getString("mm"), configInfo.getString(PARAM_DECRYPT));
        	
            ftpClient.connect(hostname, port); //连接ftp服务器
            ftpClient.login(username, password);//登录ftp服务器
            int reply=ftpClient.getReplyCode(); //是否成功登录服务器
            if(!FTPReply.isPositiveCompletion(reply)){
            	ftpClient.disconnect();
                //System.err.println("FTP sever refused connectd");
                JsonResult.error("FTP "+sjztObj.getString("ljc")+" refused connectd",sjztObj,code);
            }
        } catch (Exception e) {
            e.printStackTrace();
            JsonResult.error("FTP "+sjztObj.getString("ljc")+" refused connectd",sjztObj,code);
        } finally {
        	try {
                if (ftpClient != null && ftpClient.isConnected()) {
                    ftpClient.abort();
                    ftpClient.disconnect();
                }
            } catch (IOException e) {
                e.printStackTrace();
                JsonResult.error("FTP "+sjztObj.getString("ljc")+" close failed",sjztObj,code);
            }
		}
        return JsonResult.success("",sjztObj); 
    }
    
    
    /**
     * 表空间监测:空闲率不足2%且不足20G的表空间
     * @param testdb
     * @return
     */
    public JsonResult testTablespace(cn.benma666.db.Db testdb,JSONObject sjztObj){
    	//消息级别严重
    	String code = "2";
    	//空闲率不足2%的表空间，消息级别严重
    	String msg = "";
    	//空闲表空间大小
    	double freeSize = configInfo.getDouble(PARAM_FREESIZE);
    	//空闲表空间百分比
    	double freePercent = configInfo.getDouble(PARAM_FREEPERCENT);
    	//是否监测表空间
    	String sfjcbkj = configInfo.getString(PARAM_SFJCBKJ).toUpperCase();
    	JSONObject kzxx = null;
		if(!"{}".equals(sjztObj.getString("kzxx"))){
    		try {
        		//当前数据库监测表空间的配置信息
    			kzxx = JSONObject.parseObject(sjztObj.getString("kzxx")).getJSONObject("表空间监控");
            	if(StringUtil.isBlank(kzxx.getString(PARAM_FREESIZE))
            			|| StringUtil.isBlank(kzxx.getString(PARAM_FREEPERCENT))
            				||StringUtil.isBlank(kzxx.getString(PARAM_SFJCBKJ))){
            		return JsonResult.success("数据库："+sjztObj.getString("dm")+"中扩展信息配置有误！",code);
            	}else{
            		freeSize = kzxx.getDoubleValue(PARAM_FREESIZE);
            		freePercent = kzxx.getDoubleValue(PARAM_FREEPERCENT);
            		sfjcbkj = kzxx.getString(PARAM_SFJCBKJ).toUpperCase();
            	}
    		} catch (Exception e) {
    			ku.logBasic("数据库："+sjztObj.getString("dm")+"中扩展信息配置有误:"+sjztObj.getString("kzxx"), e);
    			return JsonResult.success("数据库："+sjztObj.getString("dm")+"中扩展信息配置有误！",code);
    		}
    	}
    	List<JSONObject> bkjlist = testdb.find(configInfo.getString(QUERYSJKBKJ_SQL));
		for(JSONObject obj : bkjlist){
			String mc = obj.getString("表空间名");
			//针对此表空间的配置信息不为空
			if(kzxx!=null&&kzxx.getJSONObject(mc)!=null){
				JSONObject pzxxobj = kzxx.getJSONObject(mc);
				freeSize = pzxxobj.getDoubleValue(PARAM_FREESIZE);
        		freePercent = pzxxobj.getDoubleValue(PARAM_FREEPERCENT);
        		sfjcbkj = pzxxobj.getString(PARAM_SFJCBKJ).toUpperCase();
			}
			if(!"Y".equals(sfjcbkj)){
				continue;
			}
			//空闲表空间比小于2%，表空间小于20G 推送消息
			if(Double.valueOf(obj.getString(PARAM_FREESIZE)) <= (freeSize*1024)
					&&Double.valueOf(obj.getString(PARAM_FREEPERCENT)) <= freePercent){
				msg = msg + obj.getString("表空间名") + "、";
			}
		}
		if(StringUtil.isNotBlank(msg)){
			msg = msg.substring(0, msg.length()-1);
			//不影响监控状态，仅仅发送消息
			return JsonResult.success("空闲表空间百分比不足"+freePercent+"%且空闲表空间大小不足"+freeSize+"G:"+msg,bkjlist,code);
		}else{
			//表空间监测正常
		}
		return new JsonResult(true);
    }
    
    @Override
	public String getDefaultConfigInfo(TransMeta transMeta, String stepName) throws Exception {
		//创建一个JSON对象，用于构建配置对象，避免直接拼字符串构建JSON字符串
        JSONObject params = new JSONObject();
        params.put(QUERYSJK_BYID_SQL, "select * from SYS_SJGL_SJZT where id = ?");
        params.put(QUERYSJKBKJ_SQL, "SELECT UPPER(F.TABLESPACE_NAME) \"表空间名\",TO_CHAR(ROUND((F.TOTAL_BYTES) / D.TOT_GROOTTE_MB * 100，2),'999.99')\"使用比\",D.TOT_GROOTTE_MB-F.TOTAL_BYTES \"空闲表空间大小\",TO_CHAR(ROUND((D.TOT_GROOTTE_MB-F.TOTAL_BYTES) / D.TOT_GROOTTE_MB * 100,2),'999.99') \"空闲表空间百分比\" FROM (SELECT TABLESPACE_NAME,ROUND(SUM(BYTES)/(1024*1024),2)TOTAL_BYTES,ROUND(MAX(BYTES)/(1024 * 1024),2) MAX_BYTES FROM SYS.DBA_SEGMENTS GROUP BY TABLESPACE_NAME)F,(SELECT DD.TABLESPACE_NAME,ROUND(SUM(CASE WHEN AUTOEXTENSIBLE='YES' THEN DD.MAXBYTES ELSE DD.BYTES END)/(1024*1024),2) TOT_GROOTTE_MB FROM SYS.DBA_DATA_FILES DD GROUP BY DD.TABLESPACE_NAME)D WHERE D.TABLESPACE_NAME = F.TABLESPACE_NAME ORDER BY 4 DESC ");
        params.put(PARAM_FREESIZE, "20");
        params.put(PARAM_FREEPERCENT, "2");
        params.put(PARAM_SFJCBKJ, "Y");
        params.put(PARAM_DECRYPT, "5zIcmw5qVZs=");
        
		return JSON.toJSONString(params, true);
	}

}
