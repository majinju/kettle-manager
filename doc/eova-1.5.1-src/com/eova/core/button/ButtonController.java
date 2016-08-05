/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.core.button;

import java.util.List;

import com.eova.common.Easy;
import com.eova.common.utils.xx;
import com.eova.common.utils.db.DbUtil;
import com.eova.config.EovaConst;
import com.eova.model.Button;
import com.eova.model.RoleBtn;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;

/**
 * 按钮管理
 * 
 * @author Jieven
 * @date 2014-9-11
 */
public class ButtonController extends Controller {

	// 菜单基本功能管理
	public void quick() {
		setAttr("menuCode", getPara(0));
		render("/eova/button/quick.html");
	}

	// 菜单基本功能管理
	@Before(Tx.class)
	public void doQuick() {
		try {
			Button btn = new Button();
			String menuCode = getPara("menu_code");
			btn.set("menu_code", menuCode);
			Integer groupNum = getParaToInt("group_num", 0);
			btn.set("group_num", groupNum);
			btn.set("icon", getPara("icon"));
			btn.set("name", getPara("name"));
			btn.set("ui", getPara("ui"));
			btn.set("bs", getPara("bs"));
			// 计算最大排序值
			btn.set("order_num", Button.dao.getMaxOrderNum(menuCode, groupNum) + 1);
			btn.save();

			// 分配权限
			String roles = getPara("role", EovaConst.ADMIN_RID + "");
			for (String role : roles.split(",")) {
				RoleBtn rb = new RoleBtn();
				rb.set("rid", role);
				rb.set("bid", btn.get("id"));
				rb.save();
			}

		} catch (Exception e) {
			e.printStackTrace();
			renderJson(new Easy("新增按钮失败,请看控制台日志寻找原因！"));
			return;
		}

		renderJson(new Easy());
	}

	// 导出选中菜单数据
	public void doExport() {
		String ids = getPara(0);

		StringBuilder sb = new StringBuilder();

		String sql = "select * from eova_button where id in (" + ids + ")";
		List<Record> objects = Db.use(xx.DS_EOVA).find(sql);
		DbUtil.generateSql(objects, "eova_button", "id", sb);

		renderText(sb.toString());
	}

}