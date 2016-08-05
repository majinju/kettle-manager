/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.template.masterslave;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.eova.model.Button;
import com.eova.model.Menu;
import com.eova.model.MetaField;
import com.eova.model.MetaObject;
import com.eova.model.User;
import com.eova.vo.MenuConfig;
import com.jfinal.core.Controller;

/**
 * 业务模版：主子表(Grid ref Grid)
 * 
 * @author Jieven
 * 
 */
public class MasterSlaveController extends Controller {

	public void list() {

		String menuCode = this.getPara(0);

		Menu menu = Menu.dao.findByCode(menuCode);
		setAttr("menu", menu);

		MenuConfig config = menu.getConfig();
		String objectCode = config.getObjectCode();

		// 获取子对象集
		List<MetaObject> objects = new ArrayList<MetaObject>();
		List<String> objectCodes = config.getObjects();
		for (String code : objectCodes) {
			objects.add(MetaObject.dao.getByCode(code));
		}
		// 主->多子 元对象
		setAttr("object", MetaObject.dao.getByCode(objectCode));
		setAttr("objects", objects);

		// 用于页面逻辑
		setAttr("config", config);
		// json 配置 供Grid内的js 使用
		setAttr("configJson", menu.getStr("config"));

		// 是否存在查询条件
		setAttr("isQuery", MetaObject.dao.isExistQuery(objectCode));
		List<MetaField> fields = MetaField.dao.queryByObjectCode(objectCode);
		setAttr("itemList", fields);

		// 根据权限获取功能按钮
		User user = this.getSessionAttr("user");
		List<Button> btnList = Button.dao.queryByMenuCode(menuCode, user.getInt("rid"));

		HashMap<Integer, List<Button>> btnMap = new HashMap<Integer, List<Button>>();
		for (Button b : btnList) {
			int group = b.getInt("group_num");
			List<Button> list = btnMap.get(group);
			if (list == null) {
				list = new ArrayList<Button>();
				btnMap.put(group, list);
			}
			list.add(b);
		}

		setAttr("btnMap", btnMap);

		render("/eova/template/masterslave/list.html");
	}

}