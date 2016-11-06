/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.oss;

import net.oschina.kettlemanager.JobManager;
import net.oschina.kettleutil.common.CommonUtil;
import net.oschina.kettleutil.common.KuConst;
import net.oschina.mytuils.KettleUtils;

import com.alibaba.fastjson.JSONObject;
import com.eova.config.EovaConfig;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.oss.controller.JobManagerController;
import com.oss.model.MetlTaskTiming;

public class OSSConfig extends EovaConfig {
    /**
    * 
    * @see com.eova.config.EovaConfig#route(com.jfinal.config.Routes)
    */
    @Override
    protected void route(Routes me) {
        super.route(me);
        me.add("/oss/job_manager", JobManagerController.class);
    }
    /**
    * 
    * @see com.eova.config.EovaConfig#disposeDs(java.lang.String, java.lang.String, com.jfinal.plugin.activerecord.ActiveRecordPlugin, com.jfinal.plugin.activerecord.Record)
    */
    @Override
    public void disposeDs(String ds, String url, ActiveRecordPlugin arp,
            Record db) {
        super.disposeDs(ds, url, arp, db);
        if(KuConst.DATASOURCE_KETTLE.equals(ds)){
            try {
                JSONObject json = new JSONObject();
                json.put("type", props.get("kettle_dbtype"));
                JSONObject expand = new JSONObject();
                JSONObject kettleUser = new JSONObject();
                kettleUser.put("username", props.get("kettle_username"));
                kettleUser.put("password", props.get("kettle_password"));
                expand.put("kettleUser", kettleUser);
                json.put(KuConst.FIELD_EXPAND, expand);
                CommonUtil.connectKettle(ds, json.toJSONString());
                JobManager.init(props.get("job_view_name"));
            } catch (Exception e) {
                log.error("连接kettle资源库失败", e);
            }
        }
    }
    /**
    * 
    * @see com.eova.config.EovaConfig#mappingMetl(com.jfinal.plugin.activerecord.ActiveRecordPlugin)
    */
    @Override
    public void mappingMetl(ActiveRecordPlugin arp) {
        super.mappingMetl(arp);
    }
    /**
    * 
    * @see com.eova.config.EovaConfig#afterJFinalStart()
    */
    @Override
    public void afterJFinalStart() {
        //设置开始控件类型id
        MetlTaskTiming.startTypeId = Db.use(KuConst.DATASOURCE_KETTLE).queryBigDecimal(
                "select jt.id_jobentry_type from r_jobentry_type jt "
        + "where jt.code='SPECIAL'").intValue();
        super.afterJFinalStart();
    }
    /**
    * 
    * @see com.eova.config.EovaConfig#beforeJFinalStop()
    */
    @Override
    public void beforeJFinalStop() {
        KettleUtils.destroy();
        super.beforeJFinalStop();
    }
	/**
	 * Run Server
	 * 
	 * @param args
	 */
	public static void main(String[] args) {
	    String webApp = "webapp";
	    int port = 82;
	    if(args.length==2){
	        webApp = args[0];
	        port = Integer.parseInt(args[1]);
	    }
		JFinal.start(webApp, port, "/", 0);
	}

}
