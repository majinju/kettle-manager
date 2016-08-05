/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.service;

/**
 * 服务管理中心
 * 
 * @author Jieven
 *
 */
public class ServiceManager {
	/** 用户服务 **/
	public static UserService user;
	/** 权限服务 **/
	public static AuthService auth;
	/** 元服务 **/
	public static MetaService meta;

	public static void init() {
		user = new UserService();
		auth = new AuthService();
		meta = new MetaService();
	}
}