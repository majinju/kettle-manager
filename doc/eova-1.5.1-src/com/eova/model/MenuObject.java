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
 * 菜单关联对象
 * 
 * @author Jieven
 * @date 2014-9-18
 */
public class MenuObject extends BaseModel<MenuObject> {

	private static final long serialVersionUID = 9176734392973431592L;

	public static final MenuObject dao = new MenuObject();

	/**
	 * 获取菜单关联对象
	 * @param menuCode
	 * @return
	 */
	public List<MenuObject> queryByMenuCode(String menuCode) {
		return MenuObject.dao.queryByCache("select object_code from eova_menu_object where menu_code = ?", menuCode);
	}
	
	/**
	 * 删除菜单关联数据对象
	 * @param menuCode
	 */
	public void deleteByMenuCode(String menuCode) {
		Db.use(xx.DS_EOVA).update("delete from eova_menu_object where menu_code = ?", menuCode);
	}
	
}