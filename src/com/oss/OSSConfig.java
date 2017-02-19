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
import net.oschina.mytuils.StringUtil;

import com.alibaba.druid.util.JdbcUtils;
import com.alibaba.fastjson.JSONObject;
import com.eova.config.EovaConfig;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.Db;
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
        MetlTaskTiming.startTypeId = Db.use(KuConst.DATASOURCE_KETTLE).queryInt(
                "select jt.id_jobentry_type from r_jobentry_type jt "
        + "where jt.code='SPECIAL'");
        //初始化资源库
        try {
            //得到本应用操作的资源库代码
            KuConst.DATASOURCE_KETTLE = props.get("rep_jndi_code");
            JSONObject json = new JSONObject();
            //获取资源库数据库类型
            json.put("type", JdbcUtils.getDbType(props.get(KuConst.DATASOURCE_KETTLE+"_url"), null));
            JSONObject expand = new JSONObject();
            JSONObject kettleUser = new JSONObject();
            kettleUser.put("username", props.get("kettle_username"));
            kettleUser.put("password", props.get("kettle_password"));
            expand.put("kettleUser", kettleUser);
            json.put(KuConst.FIELD_EXPAND, expand);
            CommonUtil.connectKettle(KuConst.DATASOURCE_KETTLE, json.toJSONString());
            JobManager.initKettledb(KuConst.DATASOURCE_KETTLE);
            JobManager.init(props.get("job_view_name"));
            if(StringUtil.isNotBlank(props.get("cache_file_dir"))){
                KettleUtils.createFileRep(KuConst.CACHE_FILE_REP, 
                        KuConst.CACHE_FILE_REP, 
                        "缓存作业的文件资源库", 
                        props.get("cache_file_dir"));
            }
        } catch (Exception e) {
            log.error("连接kettle资源库失败", e);
        }
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
