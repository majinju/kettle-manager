/**
 * Copyright (c) 2013-2015, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.oss.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import net.oschina.kettleutil.common.KuConst;
import cn.benma666.myutils.StringUtil;

import com.alibaba.fastjson.JSONObject;
import com.eova.common.utils.xx;
import com.eova.config.EovaConfig;
import com.eova.engine.EovaExp;
import com.eova.model.User;
import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.oss.common.Dict;
import com.oss.service.CommonService;

/**
* 公用控制器<br/>
* date: 2016年5月29日 <br/>
* @author jingma
* @version 
*/
public class CommonController extends Controller {

	/**
	* 日志
	*/
	Log log = Log.getLog(getClass()); 
	/**
	* 下载文件 <br/>
	* @author jingma
	* @throws Exception
	*/
	public void download() throws Exception {
		String fileDir = getPara("fileDir");
		User user = (User)getSessionAttr("user");
		log.info(user.getStr("nickname")+"获取："+fileDir);
		renderFile(fileDir);
	}
    /**
    * 下载文件-绝对路径 <br/>
    * @author jingma
    * @throws Exception
    */
    public void downloadJdlj() throws Exception {
        String fileDir = getPara("fileDir");
        User user = (User)getSessionAttr("user");
        log.info(user.getStr("nickname")+"获取："+fileDir);
        File f = new File(fileDir);
        if(f.getAbsolutePath().replace("\\", "/").matches(EovaConfig.props.get("download_jdlj_pattern"))){
            //"R:/tmp/kettle-manager/logs/kettle/fsdfsd".matches("([A-Z]:)?/tmp/kettle-manager/logs/kettle.*")
            renderFile(f);
        }else{
            renderText("该文件不再允许下载范围内");
        }
    }
    /**
    * 验证值在表中是否不存在 <br/>
    * @author jingma
    */
    public void notExistValueByTable(){
        String table = getPara("p_table");
        String ds = getPara("p_ds");
        if(StringUtil.isBlank(ds)){
            ds = xx.DS_MAIN;
        }
        String name = getPara("p_name");
        String value = getPara(name);
        String oid = getPara("p_"+KuConst.FIELD_OID);
        String sql = "select 1 from "+table+" t where t."+name+"=?";
        JSONObject result = new JSONObject();
        if(StringUtil.isBlank(value)){
            result.put("ok", "");
            renderJson(result);
            return;
        }
        List<Object> param = new ArrayList<Object>();
        param.add(value);
        if(StringUtil.isNotBlank(oid)){
            sql += " and t.oid<>?";
            param.add(oid);
        }
        List<Record> recordList = Db.use(ds).find(sql,param.toArray());
        if(recordList.size()==0){
            result.put("ok", "");
        }else{
            result.put("error", "已经存在");
        }
        renderJson(result);
    }
	/**
	* 验证值是否不存在 <br/>
	* @author jingma
	*/
	public void notExistValue(){
	    String expStr = getPara("p_exp");
	    expStr = Dict.dictCategoryToSql(expStr);
        String value = getPara(getPara("p_name"));
        String oid = getPara("p_"+KuConst.FIELD_OID);
        List<Object> param = new ArrayList<Object>();
        param.add(value);
        param.add(oid);
        param.remove(null);
	    EovaExp exp = new EovaExp(expStr);
	    List<Record> recordList = Db.use(exp.ds).find(exp.sql,param.toArray());
	    JSONObject result = new JSONObject();
	    if(recordList.size()==0){
	        result.put("ok", "");
	    }else{
            result.put("error", "已经存在");
	    }
        renderJson(result);
	}
	/**
	* 将用户信息加密，然后重定向到指定url <br/>
	* @author jingma
	*/
	public void doDesEncryptUrl(){
	    String url = getPara("url");
        try {
            url = CommonService.doDesEncryptUrl(url,this);
        } catch (UnsupportedEncodingException e) {
            log.error("用户信息编码失败", e);
            renderText("用户信息编码失败");
            return;
        }
        redirect("http://"+url);
	}
}