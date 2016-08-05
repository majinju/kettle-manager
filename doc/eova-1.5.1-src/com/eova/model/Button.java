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
 * 功能按钮
 * 
 * @author Jieven
 * @date 2014-9-10
 */
public class Button extends BaseModel<Button> {

	private static final long serialVersionUID = 3481288366186459644L;

	/** 基本通用功能-新增 **/
	public static final int FUN_QUERY = 1;
	public static final String FUN_QUERY_NAME = "查询";
	public static final String FUN_QUERY_UI = "query";
	public static final String FUN_QUERY_BS = "/grid/query";
	/** 基本通用功能-新增 **/
	public static final int FUN_ADD = 2;
	public static final String FUN_ADD_NAME = "新增";
	public static final String FUN_ADD_UI = "/eova/widget/form/btn/add.html";
	public static final String FUN_ADD_BS = "/form/add";
	/** 基本通用功能-修改 **/
	public static final int FUN_UPDATE = 3;
	public static final String FUN_UPDATE_NAME = "修改";
	public static final String FUN_UPDATE_UI = "/eova/widget/form/btn/update.html";
	public static final String FUN_UPDATE_BS = "/form/update";
	/** 基本通用功能-删除 **/
	public static final int FUN_DELETE = 4;
	public static final String FUN_DELETE_NAME = "删除";
	public static final String FUN_DELETE_UI = "/eova/widget/form/btn/delete.html";
	public static final String FUN_DELETE_BS = "/grid/delete";
	/** 基本通用功能-查看 **/
	public static final int FUN_DETAIL = 5;
	public static final String FUN_DETAIL_NAME = "查看";
	public static final String FUN_DETAIL_UI = "/eova/widget/form/btn/detail.html";
	public static final String FUN_DETAIL_BS = "/form/detail";
	/** 单表模版功能-导入 **/
	public static final int FUN_IMPORT = 6;
	public static final String FUN_IMPORT_NAME = "导入";
	public static final String FUN_IMPORT_UI = "/eova/template/single/btn/import.html";
	public static final String FUN_IMPORT_BS = "/single_grid/import";

	public static final Button dao = new Button();

	public Button() {
	}

	public Button(String menuCode, int type) {
		String ui = null;
		String bs = null;
		String name = null;
		switch (type) {
		case Button.FUN_QUERY:
			ui = Button.FUN_QUERY_UI;
			bs = Button.FUN_QUERY_BS;
			name = Button.FUN_QUERY_NAME;
			break;
		case Button.FUN_ADD:
			ui = Button.FUN_ADD_UI;
			bs = Button.FUN_ADD_BS;
			name = Button.FUN_ADD_NAME;
			break;
		case Button.FUN_UPDATE:
			ui = Button.FUN_UPDATE_UI;
			bs = Button.FUN_UPDATE_BS;
			name = Button.FUN_UPDATE_NAME;
			break;
		case Button.FUN_DELETE:
			ui = Button.FUN_DELETE_UI;
			bs = Button.FUN_DELETE_BS;
			name = Button.FUN_DELETE_NAME;
			break;
		case Button.FUN_DETAIL:
			ui = Button.FUN_DETAIL_UI;
			bs = Button.FUN_DETAIL_BS;
			name = Button.FUN_DETAIL_NAME;
			break;
		case Button.FUN_IMPORT:
			ui = Button.FUN_IMPORT_UI;
			bs = Button.FUN_IMPORT_BS;
			name = Button.FUN_IMPORT_NAME;
			break;
		}
		this.set("menu_code", menuCode);
		this.set("name", name);
		this.set("ui", ui);
		this.set("bs", bs);
		this.set("order_num", type);
		this.set("is_base", true);
	}

	/**
	 * 根据权限获取非查询功能按钮
	 * 
	 * @param menuCode
	 * @param rid
	 * @return
	 */
	public List<Button> queryByMenuCode(String menuCode, int rid) {
		// 为了同时兼容Mysql和Oracle的写法
		return Button.dao.queryByCache("select * from eova_button where menu_code = ? and ui <> ? and id in (select bid from eova_role_btn where rid = ?) order by order_num",
				menuCode, Button.FUN_QUERY_UI, rid);
	}

	/**
	 * 是否存在功能按钮
	 * 
	 * @param menuCode 菜单编码
	 * @param bs 服务端
	 * @return 是否存在该按钮
	 */
	public boolean isExistButton(String menuCode, String bs, int groupNum) {
		String sql = "select count(*) from eova_button where menu_code = ? and bs = ? and group_num = ?";
		long count = Db.use(xx.DS_EOVA).queryLong(sql, menuCode, bs, groupNum);
		if (count != 0) {
			return true;
		}
		return false;
	}

	/**
	 * 删除基础功能按钮(删除不用查询)
	 * 
	 * @param menuCode
	 */
	public void deleteFunByMenuCode(String menuCode) {
		String sql = "delete from eova_button where is_base = 1 and ui <> 'query' and menu_code = ?";
		Db.use(xx.DS_EOVA).update(sql, menuCode);
	}

	/**
	 * 删除菜单下所有按钮
	 * 
	 * @param menuCode
	 */
	public void deleteByMenuCode(String menuCode) {
		String sql = "delete from eova_button where menu_code = ?";
		Db.use(xx.DS_EOVA).update(sql, menuCode);
	}
	
	/**
	 * 获取功能按钮(不包括查询)
	 * @param menuCode 菜单编码
	 * @return
	 */
	public List<Button> findFunByMenuCode(String menuCode){
		return this.find("select * from eova_button where ui <> 'query' and menu_code = ?", menuCode);
	}
	
	/**
	 * 有序按组获取非查询功能按钮
	 * @param menuCode
	 * @return
	 */
	public List<Button> findNoQueryByMenuCode(String menuCode) {
		String sql = "select * from eova_button where ui <> 'query' and menu_code = ? order by group_num, order_num";
		return this.find(sql, menuCode);
	}

	/**
	 * 查询按钮当前最大排序值
	 * @param menuCode 菜单编码
	 * @param groupNum 按钮分组号
	 * @return
	 */
	public int getMaxOrderNum(String menuCode, int groupNum) {
		String sql = "select max(order_num) from eova_button where menu_code = ? and group_num = ?";
		return Db.use(xx.DS_EOVA).queryNumber(sql, menuCode, groupNum).intValue();
	}
}