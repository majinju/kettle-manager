/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.template.treetogrid;

import java.util.List;

import com.eova.model.Button;
import com.eova.model.Menu;
import com.eova.model.MetaField;
import com.eova.model.MetaObject;
import com.eova.model.User;
import com.eova.vo.MenuConfig;
import com.jfinal.core.Controller;

/**
 * 业务模版:树(Tree)关联表(Grid)
 * 
 * @author Jieven
 * 
 */
public class TreeToGridController extends Controller {

	public void list() {
		
String menuCode = this.getPara(0);
		
		// 获取元数据
		Menu menu = Menu.dao.findByCode(menuCode);
		MenuConfig config = menu.getConfig();
		String objectCode = config.getObjectCode();
		MetaObject object = MetaObject.dao.getByCode(objectCode);
		List<MetaField> fields = MetaField.dao.queryByObjectCode(objectCode);

		// 根据权限获取功能按钮
		User user = this.getSessionAttr("user");
		List<Button> btnList = Button.dao.queryByMenuCode(menuCode, user.getInt("rid"));

		// 是否需要显示快速查询
		setAttr("isQuery", MetaObject.dao.isExistQuery(objectCode));

		setAttr("menu", menu);
		setAttr("btnList", btnList);
		setAttr("object", object);
		setAttr("fields", fields);

		render("/eova/template/treetogrid/list.html");
	}

}