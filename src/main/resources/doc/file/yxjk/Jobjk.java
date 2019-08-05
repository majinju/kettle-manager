package com.iflytek.qb.yxjk;

import org.pentaho.di.trans.TransMeta;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.iflytek.qb.util.DateUtil;
import com.iflytek.qb.util.JsonResult;
import com.iflytek.qb.util.StringUtil;

import cn.benma666.kettle.mytuils.Db;
import cn.benma666.myutils.DesUtil;

public class Jobjk extends YxjkRunBase{
	private final static String SQL_QUERYSJK_BYDM = "根据dm查询数据库配置信息sql";
	private final static String SQL_QUERYZYK = "根据作业监控任务id的#前面对象代码来查询job所在资源库的数据对象sql";
	private final static String PARAM_BZSX = "标志时限对应异常信息";
	private final static String PARAM_GXSX = "更新时限对应异常信息";
	private final static String PARAM_RZSX = "日志时限对应异常信息";
	private final static String PARAM_ZT = "作业状态对应异常信息";
	private final static String PARAM_DECRYPT = "数据库连接密码解密密钥";
	/**
	 * 此次监控job的调度资源库数据库操作对象
	 */
	private static cn.benma666.db.Db dddb = null;
	

	@Override
	public JsonResult test(Object[] outputRow) {
		String jtrwid = outputRow[getFieldIndex(JKRW_JTRW)].toString();//具体任务id：特定格式：dxdm#作业id
		String code = outputRow[getFieldIndex(JKRW_RWDJ)].toString();//任务等级，对应消息级别
		//JSONObject zykjk = YxjkInit.jkdb.findFirst(configInfo.getString(SQL_QUERYZYK), jkrwid);
		String dxdm = jtrwid.split("#")[0];	//调度数据对象的对象代码
		String jobId = jtrwid.split("#")[1];//作业job具体任务id
		JSONObject zykdx = YxjkInit.jkdb.findFirst(configInfo.getString(SQL_QUERYZYK),dxdm);
		if(zykdx==null){
			return new JsonResult(false,"数据对象：" + dxdm + "不存在，请检查！");
		}
		//根据对象载体查询数据库配置信息
    	JSONObject sjkObj = YxjkInit.jkdb.findFirst(configInfo.getString(SQL_QUERYSJK_BYDM), zykdx.getString("dxzt"));
    	String jndi = sjkObj.getString("jndi");
    	//调度应用数据库
    	if(StringUtil.isNotBlank(jndi)){
			dddb = Db.use(jndi);
    	}else{
        	try {
        		String url = sjkObj.getString("ljc");
            	String user = sjkObj.getString("yhm");
            	String password = DesUtil.decrypt(sjkObj.getString("mm"), configInfo.getString(PARAM_DECRYPT));
            	//String password = sjkObj.getString("mm");
				dddb = new cn.benma666.db.Db("dddb", url, user, password);
			} catch (Exception e) {
				e.printStackTrace();
				ku.logBasic("监测到数据库："+sjkObj.getString("mc")+"连接异常！",e);
				return new JsonResult(false,"监测到调度数据库异常：" + e.getMessage());
			}
    	}
    	JSONObject jobObj = null;
    	try {
    	    jobObj = dddb.findFirst(getQueryJobSql(zykdx), jobId);
        	if(jobObj==null){
        		return new JsonResult(false,"监控任务"+outputRow[getFieldIndex(JKRW_RWMC)].toString()
        				+ "监控的作业："+jobId+"不存在",code);
        	}
        	//ku.logBasic("作业对象  "+jobId + ": "+jobObj.toJSONString());
		} catch (Exception e) {
			ku.logBasic("监控任务"+outputRow[getFieldIndex(JKRW_RWMC)].toString()+"，查询其具体任务时出错！",e);
			return new JsonResult(false,"监控任务"+outputRow[getFieldIndex(JKRW_RWMC)].toString()+"，查询其具体任务时出错！"+e.getMessage(),code);
		}
    	String zlsjc = jobObj.getString("zlsjc");			//增量时间戳
    	String bzsx = jobObj.getString("bzsx");				//标志时限：抽取标志位时限
    	String last_update = jobObj.getString("last_update");//最后更新时间
    	String gxsx = jobObj.getString("gxsx");				//更新时限
    	String scwcsj = jobObj.getString("scwcsj");			//上次完成时间
    	String rzsx = jobObj.getString("rzsx");				//日志时限
    	String zt = jobObj.getString("sczxzt");				//kettle manager作业上次执行状态
    	String jcpl = jobObj.getString("jcpl");				//检测频率
    	/**
    	  	业务描述：此处有三组时限超时监控和作业的运行状态。其中：
	    		a.根据增量时间戳和抽取标志位时限来判断抽取的源头实时数据是否超时，即是否有源头数据；
	    		b.根据最后更新时间和更新时限来判断作业是否超时未运行；
	    		c.根据上次完成时间和日志时限来判断作业运行日志是否正常输出，个人认为也是用来监测作业是否超时未运行；
	    		d.根据作业运行输出的运行状态判断作业是否异常。
    		以上凡是有一种情况异常，即可认为此次job监测异常，三种时限可以为空，为空不进行超时判断
    	**/
    	if(StringUtil.isBlank(jcpl)){
    		//此次job不监测
        	return new JsonResult(true,"",jobObj);
    	}
		String[] jcsjfwArr = jcpl.split(";"); 	//格式：12-14;20-09
		String[] bzsxArr = bzsx.split(";");		//标志时限数组
		String[] gxsxArr = gxsx.split(";");		//更新时限数组
		String[] rzsxArr = rzsx.split(";");     //日志时限数组
		String time = YxjkInit.jkdb.getCurrentDateStr14().substring(8,10);//当前时间（时）
		for(int i = 0;i<=jcsjfwArr.length-1;i++){
			String[] jcsjfws = jcsjfwArr[i].split("-");//此次检测时间范围段
			//符合当前时间段规则一：一天内
			if(Integer.valueOf(jcsjfws[0])<=Integer.valueOf(jcsjfws[1])){
				//不在监测时间段范围内
				if(Integer.valueOf(time)<Integer.valueOf(jcsjfws[0])
						||Integer.valueOf(time)>Integer.valueOf(jcsjfws[1])){
					continue;
				}
			}
			//符合当前时间段规则二：跨天，单独处理，判断jcsjfws[0]-23、0-jcsjfws[1]
			if(Integer.valueOf(jcsjfws[0])>Integer.valueOf(jcsjfws[1])){
				//不在监测时间段范围内
				if(!((Integer.valueOf(time)>=Integer.valueOf(jcsjfws[0])&&Integer.valueOf(time)<=23)
						||(0<=Integer.valueOf(time)&&Integer.valueOf(time)<=Integer.valueOf(jcsjfws[1])))){ 
					continue;
				}
			}
			//上次状态为依赖异常时，只单独判断更新时限是否正常，如果正常do nothing
			if(RWZT_YLYC.equals(outputRow[getFieldIndex(JKRW_RWZT)].toString())){
				if((StringUtil.isNotBlank(gxsxArr[i])&&"0".equals(gxsxArr[i])&&StringUtil.isBlank(last_update))
		    			||!judgeSfcs(last_update,gxsxArr[i])){
		    		return new JsonResult(false,configInfo.getString(PARAM_GXSX)+"("+last_update+")",jobObj,code);
		    	}else{
		    		//上次完成时间与监测时间差值
		    		long cz = DateUtil.compareSecond(DateUtil.parseDate(outputRow[getFieldIndex(JKRW_JCSJ)].toString()),DateUtil.parseDate(scwcsj));
		    		//上次完成时间>=监测时间
		    		if(cz >= 0){
		    			//do nothing 进行后续流程监测
		    		}else{
		    			//此次判断结束，且：不更新此次监测任务
    		    		return new JsonResult(true,"no update",jobObj);
		    		}
		    	}
			}
			if(StringUtil.isNotBlank(zt)&&RWZT_BSYC.equals(zt)){
	    		return new JsonResult(false,configInfo.getString(PARAM_ZT),jobObj,code);
	    		//后面可以通过查询相应的异常日志表，把异常信息取出
	    		
	    	}else if((StringUtil.isNotBlank(gxsxArr[i])&&StringUtil.isBlank(last_update))
	    			||!judgeSfcs(last_update,gxsxArr[i])){
	    		return new JsonResult(false,configInfo.getString(PARAM_GXSX)
	    				+"("+DateUtil.DateToStr(DateUtil.strToDate(last_update,"yyyyMMddHHmmss"),"yyyy-MM-dd HH:mm:ss")
	    				+")",jobObj,code);
	    	}else if((StringUtil.isNotBlank(rzsxArr[i])&&StringUtil.isBlank(scwcsj))
	    			||!judgeSfcs(scwcsj,rzsxArr[i])){
	    		return new JsonResult(false,configInfo.getString(PARAM_RZSX)
	    				+"("+DateUtil.DateToStr(DateUtil.strToDate(scwcsj,"yyyyMMddHHmmss"),"yyyy-MM-dd HH:mm:ss")
	    				+")",jobObj,code);
	    	}else if((StringUtil.isNotBlank(bzsxArr[i])&&StringUtil.isBlank(zlsjc))
	    			||!judgeSfcs(zlsjc,bzsxArr[i])){
	    		return new JsonResult(false,configInfo.getString(PARAM_BZSX)
	    				+"("+DateUtil.DateToStr(DateUtil.strToDate(zlsjc,"yyyyMMddHHmmss"),"yyyy-MM-dd HH:mm:ss")
	    				+")",jobObj,code);
	    	}else{
	    		//全部正常
	    		return new JsonResult(true,"",jobObj);
	    	}
		}
		return new JsonResult(true,"",jobObj);
	}
	
	/**
	 * 根据调度数据对象配置来组拼查询作业job的sql
	 * @param zykdx 调度所在数据对象
	 * @return
	 */
	public String getQueryJobSql(JSONObject zykdx){
		StringBuffer queryJobSql = new StringBuffer("select * from "); 
    	if(StringUtil.isNotBlank(zykdx.getString("dxgs"))){
    		//此处为用户名
    		queryJobSql.append(zykdx.getString("dxgs") + ".");
    	}
    	queryJobSql.append(zykdx.getString("jtdx"));
    	queryJobSql.append(" where " + zykdx.getString("zjzd") + " = ? ");
    	//ku.logBasic("查询作业对象SQL语句："+queryJobSql.toString());
    	return queryJobSql.toString();
	}
    
    /**
     * 处理具体每一行数据 <br/>
     * @author jingma
     * @param outputRow
     */
     protected void disposeRow(Object[] outputRow) throws Exception{
     	outputRow[getFieldIndex(XX_JKRW)] = outputRow[getFieldIndex("id")];
     	//监控默认不生成预警消息
     	outputRow[getFieldIndex(QT_SFSCYJ)] = "0";
     	//默认更新监控
     	outputRow[getFieldIndex(QT_SFGXJK)] = "1";
     	
     	//String jtrwid = outputRow[getFieldIndex(JKRW_JTRW)].toString();
     	String ylrwzt = outputRow[getFieldIndex(JKRW_YLRWZT)].toString();
     	//依赖监控任务正常
     	if(RWZT_ZC.equals(ylrwzt)){
     		JsonResult result = test(outputRow);
     		if("no update".equals(result.getMsg())){
     			ku.putRow(data.outputRowMeta, outputRow);
     			return;
     		}
     		//监测时间
         	outputRow[getFieldIndex(JKRW_JCSJ)] = YxjkInit.jkdb.getCurrentDateStr14();
     		judgeYjzt(outputRow,result);
     	}else if(RWZT_YLYC.equals(ylrwzt)){//依赖任务状态为依赖异常
     		//监测时间
         	outputRow[getFieldIndex(JKRW_JCSJ)] = YxjkInit.jkdb.getCurrentDateStr14();
 			//依赖任务异常，直接修改此次监测任务的状态。依赖任务有问题，本次主监测作业不再推送预警信息，只修改监控状态及异常原因
 			outputRow[getFieldIndex(JKRW_RWZT)] = RWZT_YLYC;
 			outputRow[getFieldIndex(JKRW_YCYY)] = "监测到依赖任务异常："+outputRow[getFieldIndex(JKRW_YCYLRW)].toString();
 			ku.putRow(data.outputRowMeta, outputRow);
     	}else{
     		//未知状态，待定
     	}
     }
	
	
	/**
	 * 根据具体时间 与 当前时间 差值来判断是否超过此时限
	 * @param date 时间
	 * @param sx 时限 ：分钟
	 * @return
	 */
	public boolean judgeSfcs(String date,String sx){
		//如果时限配置为空或为0，则默认认为此项超时无异常
		if(StringUtil.isBlank(sx)||"0".equals(sx)){
			return true;
		}
		Long sxlong = Long.valueOf(sx);
		//时间与数据库的当前时间差值
		long cz = DateUtil.compareSecond(DateUtil.parseDate(date), DateUtil.parseDate(dddb.getCurrentDateStr14()));
		if(cz >= sxlong*60){//超时
			return false;
		}
		return true;
	}
	
	@Override
	public String getDefaultConfigInfo(TransMeta transMeta, String stepName) throws Exception {
		//创建一个JSON对象，用于构建配置对象，避免直接拼字符串构建JSON字符串
        JSONObject params = new JSONObject();
        params.put(PARAM_BZSX, "源头数据超时");
        params.put(PARAM_GXSX, "作业超时未运行");
        params.put(PARAM_RZSX, "作业日志更新超时");
        params.put(PARAM_ZT, "作业运行异常");
        //params.put(SQL_QUERYZYK, "select ttt.* from SYS_YXJK_JKRW ttt where ttt.id = (select substr(tt.ylrw, 34, 32) from SYS_YXJK_JKRW tt where tt.id = (select substr(t.ylrw, 1, 32) from SYS_YXJK_JKRW t where t.id = ?))  ");
        params.put(SQL_QUERYZYK, "select * from SYS_SJGL_SJDX t where t.dxdm = ? ");
        params.put(SQL_QUERYSJK_BYDM, "select * from SYS_SJGL_SJZT t where t.dm = ? ");
        params.put(PARAM_DECRYPT, "5zIcmw5qVZs=");
        
		return JSON.toJSONString(params, true);
	}
}
