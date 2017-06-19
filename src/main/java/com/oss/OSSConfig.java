/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.oss;

import net.oschina.kettleutil.common.KuConst;
import net.oschina.mytuils.KettleUtils;

import com.eova.config.EovaConfig;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.Db;
import com.oss.controller.JobManagerController;
import com.oss.job.JobManager;
import com.oss.model.MetlProject;
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
        arp.addMapping("metl_project",KuConst.FIELD_OID, MetlProject.class);
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
                "select jt.id_jobentry_type from r_jobentry_type jt where jt.code='SPECIAL'");
        //初始化资源库
        try {
            //得到本应用操作的资源库代码
            KuConst.DATASOURCE_KETTLE = props.get("rep_jndi_code");
            KettleUtils.connectKettle(KuConst.DATASOURCE_KETTLE, props.get(KuConst.DATASOURCE_KETTLE+"_url"),
                    props.get(KuConst.DATASOURCE_KETTLE+"_user"),
                    props.get(KuConst.DATASOURCE_KETTLE+"_pwd"),
                    props.get("kettle_username"),
                    props.get("kettle_password"));
            JobManager.init(props.get("job_view_name"),props.get("project_code"));
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
}
