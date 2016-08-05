/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.service;

import java.util.List;

import com.eova.model.User;

public class UserService {

	public List<User> queryUser(String nickname){
		List<User> list = User.dao.find("select * from eova_user where nickname = ?", nickname);
		return list;
	}
	
}