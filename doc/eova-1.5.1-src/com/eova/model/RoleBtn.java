/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.model;

import java.util.List;

import com.eova.common.base.BaseModel;
import com.eova.common.utils.xx;
import com.jfinal.plugin.activerecord.Db;

/**
 * 角色已授权功能点
 * 
 * @author Jieven
 * @date 2014-9-10
 */
public class RoleBtn extends BaseModel<RoleBtn> {

	private static final long serialVersionUID = -1794335434198017392L;

	public static final RoleBtn dao = new RoleBtn();
	
	/**
	 * 获取角色已授权功能(按钮)ID
	 * 
	 * @param rid 角色ID
	 * @return
	 */
	public List<Integer> queryByRid(int rid) {
		return Db.use(xx.DS_EOVA).query("select bid from eova_role_btn where rid = ?", rid);
	}

	/**
	 * 删除菜单功能关联的权限
	 * @param menuCode
	 */
	public void deleteByMenuCode(String menuCode){
		String sql = "delete from eova_role_btn where bid in (select id from eova_button where menu_code = ?)";
		Db.use(xx.DS_EOVA).update(sql, menuCode);
	}
	
}