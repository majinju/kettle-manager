package com.iflytek.qb.yxjk;

import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import cn.benma666.kettle.jobentry.easyexpand.JobEntryEasyExpandRunBase;
import cn.benma666.kettle.mytuils.Db;

/**
 * 生成作业的任务批次号等初始化工作
 * @date 2019年1月10日下午3:58:31
 */
public class YxjkInit extends JobEntryEasyExpandRunBase{
	public static final String JKRW_DBCODE = "查询监控任务所用数据源";
	public static final String QUERY_JKRW_SQL = "查询所有的监控任务SQL语句";
	/**
	 * 更新数据载体状态SQL语句
	 */
	public static final String UPDATE_SJZT_ZT_SQL = "update SYS_SJGL_SJZT t set t.zt = ? where t.id = ? and t.yxx = '1' ";
	/**
	 * 更新应用状态SQL语句
	 */
	public static final String UPDATE_APP_ZT_SQL = "update SYS_QX_APP t set t.zt = ? where t.id = ? and t.yxx = '1' ";
	/**
	 * 根据id查询监控任务sql语句
	 */
	public static final String QUERY_JKRW_BYID_SQL = "select * from SYS_YXJK_JKRW t where t.id = ? ";
	/**
	 * 任务批次号：格式RWPC-uuid
	 */
	public static String rwpch;
	/**
	 * 所有的监控任务缓存
	 */
	public static Map<String,JSONObject> jkrwMap;
	/**
	 * 监控数据库操作对象
	 */
	public static Db jkdb = null;
	
	@Override
	protected boolean run() throws Exception {
		init();
		return true;
	}
	
	private void init(){
		jkdb = Db.use(configInfo.getString(JKRW_DBCODE));
		jeku.logBasic("------------缓存监控任务操作数据源" + configInfo.getString(JKRW_DBCODE));
		
		rwpch = jkdb.getCurrentDateStr14();
		jeku.logBasic("------------本次作业任务批次号：" + rwpch);
		
		jkrwMap = jkdb.findMap("id", configInfo.getString(QUERY_JKRW_SQL));
		jeku.logBasic("------------监控任务数为：" + jkrwMap.size());
	}
	
	@Override
	public String getDefaultConfigInfo() throws Exception {
		JSONObject params = new JSONObject();
		params.put(JKRW_DBCODE, "yxjk");
		params.put(QUERY_JKRW_SQL, "select * from SYS_YXJK_JKRW t order by px");
		return JSON.toJSONString(params, true);
    }
	
	/**
	 * 根据id查询监控任务，可在后面流程中调用
	 * @param id
	 * @return
	 */
	public static JSONObject queryJkrwById(String id){
		return jkdb.findFirst(QUERY_JKRW_BYID_SQL,id);
	}
	
	/**
	 * 根据id查询应用配置信息
	 * @param id 主键
	 * @param zt 状态
	 * @return
	 */
	public static int updateAppById(String id,String zt){
		return jkdb.update(UPDATE_APP_ZT_SQL, zt, id);
	}
	
	/**
	 * 根据id查询数据载体配置信息
	 * @param id 主键
	 * @param zt 状态
	 * @return
	 */
	public static int updateSjztById(String id,String zt){
		return jkdb.update(UPDATE_SJZT_ZT_SQL, zt, id);
	}
}
