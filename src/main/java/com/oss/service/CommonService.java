/**
* Project Name:kettle-manager
* Date:2017年2月26日
* Copyright (c) 2017, jingma All Rights Reserved.
*/

package com.oss.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.beetl.sql.core.db.Db;

import cn.benma666.myutils.DesUtil;

import com.eova.config.EovaConst;
import com.eova.model.User;
import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.oss.model.MetlProject;

/**
 * 公用服务 <br/>
 * date: 2017年2月26日 <br/>
 * @author jingma
 * @version 
 */
public class CommonService {
    /**
    * 日志
    */
    public static Log log = Log.getLog(CommonService.class); 

    /**
    * 将用户信息加密，然后重定向到指定url <br/>
    * @author jingma
    * @param url
    * @param controller
    * @return 新构建的url
    * @throws UnsupportedEncodingException 
    */
    public static String doDesEncryptUrl(String url,
            Controller controller) throws UnsupportedEncodingException {
        String[] urlArr = url.split("@");
        User user = (User)controller.getSessionAttr(EovaConst.USER);
        String userInfo = Db.db.getCurrentDateStr14()+"@"+user.getStr("id");
        if(urlArr.length==2){
            MetlProject project = MetlProject.dao.findFirst(
                    "select * from metl_project t where t.ocode=?", urlArr[0]);
            url = project.getStr("url")+urlArr[1];
            userInfo = DesUtil.encrypt(userInfo, project.getStr("password"))
                    .replace("\n", "").replace("\r", "");
        }
        url += "&userInfo="+URLEncoder.encode(userInfo,"utf8");
        return url;
    }

}
