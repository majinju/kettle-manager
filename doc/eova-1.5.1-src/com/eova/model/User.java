/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.model;

import com.eova.common.base.BaseModel;

public class User extends BaseModel<User> {

	private static final long serialVersionUID = 1064291771401662738L;

	public static final User dao = new User();
	
	/**
	 * 根据帐号获取用户
	 * @param loginId
	 * @return
	 */
	public User getByLoginId(String loginId) {
		return this.findFirst("select * from eova_user where login_id = ?", loginId);
	}
}