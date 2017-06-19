/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.core.menu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.eova.common.Easy;
import com.eova.common.base.BaseCache;
import com.eova.common.utils.xx;
import com.eova.common.utils.db.DbUtil;
import com.eova.config.EovaConfig;
import com.eova.config.EovaConst;
import com.eova.model.Button;
import com.eova.model.Menu;
import com.eova.model.MetaObject;
import com.eova.model.RoleBtn;
import com.eova.template.common.config.TemplateConfig;
import com.eova.vo.MenuConfig;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;

/**
 * 菜单管理
 * 
 * @author Jieven
 * @date 2014-9-11
 */
public class MenuController extends Controller {

	public void toAdd() {
		keepPara("parent_id");
		render("/eova/menu/form.html");
	}

	public void toUpdate() {
		int pkValue = getParaToInt(1);
		Menu menu = Menu.dao.findById(pkValue);

		setAttr("menu", menu);

		render("/eova/menu/form.html");
	}

	/**
	 * 菜单基本功能管理
	 */
	public void toMenuFun() {
		String menuCode = getPara(0);
		Menu menu = Menu.dao.findByCode(menuCode);

		setAttr("menu", menu);

		HashMap<Integer, List<Button>> btnMap = new HashMap<Integer, List<Button>>();

		List<Button> btns = Button.dao.findNoQueryByMenuCode(menuCode);
		for (Button b : btns) {
			int group = b.getInt("group_num");
			List<Button> list = btnMap.get(group);
			if (list == null) {
				list = new ArrayList<Button>();
				btnMap.put(group, list);
			}
			list.add(b);
		}

		setAttr("btnMap", btnMap);

		render("/eova/menu/menuFun.html");
	}

	// 一键导入
	@Before(Tx.class)
	public void addAll() {
		if (!getPara(0, "").equals("eova")) {
			renderJson(new Easy("请输入校验码，防止误操作！！！！！"));
			return;
		}

		List<MetaObject> objects = MetaObject.dao.find("select * from eova_object where diy_card = 1");
		for (MetaObject o : objects) {

			String menuCode = "biz_" + o.getStr("code");

			Menu menu = new Menu();
			menu.set("parent_id", 3);
			menu.set("name", o.getStr("name"));
			menu.set("code", menuCode);
			menu.set("type", TemplateConfig.SINGLE_GRID);

			// 菜单配置
			MenuConfig config = new MenuConfig();
			config.setObjectCode(o.getStr("code"));
			menu.setConfig(config);
			menu.save();

			createMenuButton(menuCode, TemplateConfig.SINGLE_GRID, config);

			// 还原成默认状态
			o.set("diy_card", null);
			o.update();
		}
		// 新增菜单使缓存失效
		BaseCache.delSer(EovaConst.ALL_MENU);

		renderJson(new Easy("Auto Create Menu:" + objects.size(), true));
	}

	// 导出选中菜单数据
	public void doExport() {
		String ids = getPara(0);

		StringBuilder sb = new StringBuilder();

		String sql = "select * from eova_menu where id in (" + ids + ")";
		List<Record> objects = Db.use(xx.DS_EOVA).find(sql);
		DbUtil.generateSql(objects, "eova_menu", "id", sb);

		renderText(sb.toString());
	}

	/**
	 * 新增菜单
	 */
	@Before(Tx.class)
	public void add() {

		String menuCode = getPara("code");
		String type = getPara("type");

		Menu temp = Menu.dao.findByCode(menuCode);
		if (temp != null) {
			renderJson(new Easy("菜单编码不能重复"));
			return;
		}

		try {
			Menu menu = new Menu();
			menu.set("parent_id", getPara("parent_id"));
			menu.set("icon", getPara("icon", ""));
			menu.set("name", getPara("name"));
			menu.set("code", menuCode);
			menu.set("order_num", getPara("indexNum"));
			menu.set("type", type);
			menu.set("biz_intercept", getPara("bizIntercept", ""));
			menu.set("url", getPara("url", ""));

			// 菜单配置
			MenuConfig config = new MenuConfig();
			buildConfig(type, config);
			menu.setConfig(config);
			menu.save();

			// 目录没有默认按钮
			if (type.equals(Menu.TYPE_DIR)) {
				renderJson(new Easy());
				return;
			}
			// 自定义URL默认有查询按钮
			if (type.equals(Menu.TYPE_DIY)) {
				initButton(menuCode, Button.FUN_QUERY);
				renderJson(new Easy());
				return;
			}

			createMenuButton(menuCode, type, config);

		} catch (Exception e) {
			e.printStackTrace();
			renderJson(new Easy("新增菜单失败,请认真填写！"));
			return;
		}

		renderJson(new Easy());
	}

	/**
	 * 创建菜单的按钮
	 * 
	 * @param menuCode
	 *            菜单编码
	 * @param type
	 *            菜单类型
	 * @param config
	 *            菜单配置
	 */
	private void createMenuButton(String menuCode, String type, MenuConfig config) {

		// 初始化主表功能按钮(默认按钮组)
		if (type.equals(TemplateConfig.SINGLE_GRID) || type.equals(TemplateConfig.MASTER_SLAVE_GRID)) {
			initButton(menuCode, Button.FUN_QUERY);
			initButton(menuCode, Button.FUN_ADD);
			initButton(menuCode, Button.FUN_UPDATE);
			initButton(menuCode, Button.FUN_DELETE);
			initButton(menuCode, Button.FUN_DETAIL);
		}
		// 只有单表默认带导入
		if (type.equals(TemplateConfig.SINGLE_GRID)) {
			initButton(menuCode, Button.FUN_IMPORT);
		}

		// 主子模版：初始化子表功能按钮
		if (type.equals(TemplateConfig.MASTER_SLAVE_GRID)) {
			int groupNum = 1;
			for (String code : config.getObjects()) {
				MetaObject object = MetaObject.dao.getByCode(code);
				String name = object.getStr("name");
				initButton(menuCode, Button.FUN_ADD, name + Button.FUN_ADD_NAME, groupNum);
				initButton(menuCode, Button.FUN_UPDATE, name + Button.FUN_UPDATE_NAME, groupNum);
				initButton(menuCode, Button.FUN_DELETE, name + Button.FUN_DELETE_NAME, groupNum);
				groupNum++;
			}
		}

		// 新增菜单使缓存失效
		BaseCache.delSer(EovaConst.ALL_MENU);
	}

	/**
	 * 自动授权给超级管理员
	 * 
	 * @param btn
	 */
	private void autoToAdmin(int bid) {
		RoleBtn rf = new RoleBtn();
		rf.set("rid", EovaConst.ADMIN_RID);
		rf.set("bid", bid);
		rf.save();
	}

	/**
	 * 配置菜单
	 * 
	 * @param type
	 *            模版类型
	 * @param config
	 */
	private void buildConfig(String type, MenuConfig config) {
		if (type.equals(TemplateConfig.SINGLE_GRID)) {
			// 单表
			config.setObjectCode(getPara("objectCode"));
		} else if (type.equals(TemplateConfig.MASTER_SLAVE_GRID)) {
			// 主
			String masterObjectCode = getPara("masterObjectCode");
			String masterFieldCode = getPara("masterFieldCode");
			config.setObjectCode(masterObjectCode);
			config.setObjectField(masterFieldCode);
			
			// 子
			ArrayList<String> objects = new ArrayList<String>();
			ArrayList<String> fields = new ArrayList<String>();
			for (int i = 1; i <= 5; i++) {
				String slaveObjectCode = getPara("slaveObjectCode" + i);
				String slaveFieldCode = getPara("slaveFieldCode" + i);
				if (xx.isOneEmpty(slaveObjectCode, slaveFieldCode)) {
					break;
				}
				objects.add(slaveObjectCode);
				fields.add(slaveFieldCode);
			}
			config.setObjects(objects);
			config.setFields(fields);
		}
	}

	/**
	 * 菜单功能管理
	 */
	@Before(Tx.class)
	public void menuFun() {
		String menuCode = getPara(0);

		List<Button> btns = Button.dao.findFunByMenuCode(menuCode);
		// 动态获取按钮是否禁用
		for (Button btn : btns) {
			Integer groupNum = btn.getInt("group_num");
			Integer id = btn.getInt("id");
			// 获取按钮选择状态，勾选为启用，反选为禁用
			boolean isDel = getParaToBoolean(groupNum + "_" + id, true);
			// 按钮有变更
			if (btn.getBoolean("is_del") != isDel) {
				btn.set("is_del", isDel);
				btn.update();
			}
		}

		renderJson(new Easy());
	}

	// eova_button升级到V1.5
	public void v15ButtonUpdate() {

		String isUpgrade = EovaConfig.props.get("isUpgrade");
		if (xx.isEmpty(isUpgrade) || !isUpgrade.equals("true")) {
			renderText("未开启升级模式，请启动配置 isUpgrade = true");
			return;
		}

		String sql = "select distinct(menu_code) from eova_button";
		List<String> codes = Db.use(xx.DS_EOVA).query(sql);

		// 修正异常的 查询按钮
		Db.update("update eova_button set is_base = 1 where ui = 'query'");
		// 删除所有查询按钮和基础功能
		Db.update("delete from eova_button where is_base = 1 or ui = 'query'");

		for (String code : codes) {
			Menu menu = Menu.dao.findByCode(code);
			createMenuButton(code, menu.getStr("type"), menu.getConfig());
		}
		renderText("升级成功");
	}

	/**
	 * 初始化新菜单(没有生成按钮的菜单)
	 */
	@Before(Tx.class)
	public void initNewMenu() {

		String isUpgrade = EovaConfig.props.get("isUpgrade");
		if (xx.isEmpty(isUpgrade) || !isUpgrade.equals("true")) {
			renderText("未开启升级模式，请启动配置 eova.config isUpgrade = true");
			return;
		}

		String sql = "select code from eova_menu where type not in ('dir','diy') and code not in (select DISTINCT(menu_code) from eova_button);";
		List<String> codes = Db.use(xx.DS_EOVA).query(sql);

		for (String code : codes) {
			Menu menu = Menu.dao.findByCode(code);
			createMenuButton(code, menu.getStr("type"), menu.getConfig());
		}

		renderText("自动为没有按钮的菜单初始化成功！");
	}

	private void initButton(String menuCode, int fun) {
		initButton(menuCode, fun, true);
	}

	/**
	 * 初始化按钮
	 * 
	 * @param menuCode
	 *            菜单编码
	 * @param fun
	 *            功能
	 * @param isBase
	 *            是否基础功能
	 */
	private void initButton(String menuCode, int fun, boolean isBase) {
		Button btn = new Button(menuCode, fun);
		btn.set("is_base", isBase);
		btn.save();

		if (fun == Button.FUN_IMPORT) {
			// 导入默认不分配
			return;
		}
		autoToAdmin(Integer.valueOf(btn.get("id").toString()));
	}

	/**
	 * 初始化按钮
	 * 
	 * @param menuCode
	 *            菜单编码
	 * @param fun
	 *            功能
	 * @param name
	 *            功能名称
	 * @param groupNum
	 *            按钮组
	 */
	private void initButton(String menuCode, int fun, String name, int groupNum) {
		Button btn = new Button(menuCode, fun);
		btn.set("name", name);
		btn.set("group_num", groupNum);
		btn.save();

		autoToAdmin(Integer.valueOf(btn.get("id").toString()));
	}

}