/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.model;

import java.util.List;

import com.alibaba.fastjson.JSON;
import com.eova.common.base.BaseModel;
import com.eova.common.utils.xx;
import com.eova.vo.MenuConfig;

public class Menu extends BaseModel<Menu> {

	private static final long serialVersionUID = 7072369370299999169L;

	/** 菜单类型-目录 **/
	public static final String TYPE_DIR = "dir";
	/** 菜单类型-自定义 **/
	public static final String TYPE_DIY = "diy";

	public static final Menu dao = new Menu();

	private List<Menu> childList;

	public List<Menu> getChildList() {
		return childList;
	}

	public void setChildList(List<Menu> childList) {
		this.childList = childList;
	}

	public String getBizIntercept() {
		return this.getStr("biz_intercept");
	}

	public MenuConfig getConfig() {
		String json = this.getStr("config");
		if (xx.isEmpty(json)) {
			return null;
		}
		return new MenuConfig(json);
	}

	public void setConfig(MenuConfig config) {
		this.set("config", JSON.toJSONString(config));
	}

	/**
	 * 获取访问URL
	 */
	public String getUrl() {
		String url = this.getStr("url");
		if (xx.isEmpty(url)) {
			return '/' + this.getStr("type") + "/list/" + this.getStr("code");
		}
		return url;
	}

	public Menu findByCode(String code) {
		String sql = "select * from eova_menu where code = ?";
		return Menu.dao.queryFisrtByCache(sql, code);
	}

	/**
	 * 获取根节点
	 * 
	 * @return
	 */
	public List<Menu> queryRoot() {
		return super.queryByCache("select * from eova_menu where parent_id = 0 order by order_num");
	}

	/**
	 * 获取所有节点
	 * 
	 * @return
	 */
	@Override
	public List<Menu> queryAll() {
		return super.queryByCache("select * from eova_menu order by order_num");
	}

}