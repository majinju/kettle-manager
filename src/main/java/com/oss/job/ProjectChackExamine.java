/**
* Project Name:KmSustain
* Date:2017年3月1日
* Copyright (c) 2017, jingma All Rights Reserved.
*/

package com.oss.job;

import java.util.List;

import net.oschina.kettleutil.common.KuConst;

import org.beetl.sql.core.db.Db;

import cn.benma666.constants.UtilConst;
import cn.benma666.myutils.HttpUtl;

import com.alibaba.fastjson.JSONObject;

/**
 * 项目状态监测 <br/>
 * date: 2017年3月1日 <br/>
 * @author jingma
 * @version 
 */
public class ProjectChackExamine extends AbsJob {
    /**
    * 更新项目状态SQL语句
    */
    private static final String SQL_UPDATE_PROJECT = "update metl_project t set t.status=? where t.oid=?";

    /**
     * 
     * @see net.oschina.kettleutil.jobentry.JobEntryKettleUtilRunBase#run()
     */
    @Override
    protected void process() throws Exception {
        Db db = Db.use(UtilConst.DATASOURCE_METL);
        List<JSONObject> projects = db.find("select * from metl_project t where t.is_disable=?", 
                UtilConst.WHETHER_FALSE);
        for(JSONObject project:projects){
            try {
                HttpUtl.doUrlStr(project.getString("url"));
                if(!UtilConst.LINK_STATUS_SUCCESS.equals(project.getString("status"))){
                    db.update(SQL_UPDATE_PROJECT, UtilConst.LINK_STATUS_SUCCESS,
                            project.getString(KuConst.FIELD_OID));
                }
            } catch (Exception e) {
                if(!UtilConst.LINK_STATUS_FAILED.equals(project.getString("status"))){
                    db.update(SQL_UPDATE_PROJECT, UtilConst.LINK_STATUS_FAILED,
                            project.getString(KuConst.FIELD_OID));
                }
            }
        }
    }

}
