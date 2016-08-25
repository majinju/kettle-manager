/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.interceptor;

import java.util.ArrayList;
import java.util.Date;

import net.oschina.kettleutil.common.KuConst;
import net.oschina.mytuils.DateUtil;
import net.oschina.mytuils.DesUtil;
import net.oschina.mytuils.Dict;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.eova.config.EovaConst;
import com.eova.model.User;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

/**
 * 常量加载拦截器
 * 
 * @author Jieven
 * 
 */
public class LoginInterceptor implements Interceptor {
    private Log log = LogFactory.getLog(getClass());
	
	public static ArrayList<String> excludes = new ArrayList<String>();
	static{
		excludes.add("/toLogin");
		excludes.add("/vcodeImg");
		excludes.add("/doLogin");
		excludes.add("/doInit");
		excludes.add("/toTest");
		excludes.add("/form");
		excludes.add("/doForm");
		excludes.add("/upgrade");
		excludes.add("/why");
	}

	@Override
	public void intercept(Invocation inv) {
		if (excludes.contains(inv.getActionKey())) {
			inv.invoke();
			return;
		}

		// 获取登录用户的角色
		User user = inv.getController().getSessionAttr(EovaConst.USER);
		if (user == null) {
		    //处理带用户信息的url
		    if(inv.getController().isParaExists("userInfo")){
		        String userInfo = inv.getController().getPara("userInfo");
	            JSONObject expand = JSON.parseObject(
	                    Dict.dictObj(KuConst.DICT_CATEGORY_GENERAL_CONFIG, 
	                    "user_info_crypt_pwd").getStr(KuConst.FIELD_EXPAND));
		        try {
		            userInfo = DesUtil.decrypt(userInfo, expand.getString("pwd"));
		            int idx = userInfo.indexOf("@");
		            Date urlDate = DateUtil.parseDate(userInfo.substring(0, idx));
		            if(Math.abs(urlDate.getTime()-new Date().getTime())<1000*300){
		                JSONObject urlUser = JSON.parseObject(userInfo.substring(idx+1));
		                user = new User();
		                user.set(urlUser);
		                inv.getController().setSessionAttr(EovaConst.USER, user);
		                inv.invoke();
		                return;
		            }else{
		                log.info("用户信息过期："+userInfo);
		            }
                } catch (Exception e) {
                    log.error("解密用户信息失败："+userInfo, e);
                }
		    }
            inv.getController().redirect("/toLogin");
			return;
		}

		inv.invoke();
	}

}