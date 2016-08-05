/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.template.common.vo;

/**
 * 菜单URL命令处理类
 * 
 * @author Jieven
 */
public class UrlCmd {

	/**
	 * URL初始化 objectCode=xxx
	 * 
	 * @param url
	 */
	public UrlCmd(String url) {
		init(url);
	}
	
	private String menuCode;
	private String objectCode;

	private void init(String url) {
		String[] cmds = url.split("&");
		for (String cmd : cmds) {
			String key = cmd.substring(0, cmd.indexOf("="));
			String value = cmd.substring(cmd.indexOf("=") + 1, cmd.length());
			if (key.equals("menuCode")) {
				this.setMenuCode(value);
				continue;
			}
			if (key.equals("objectCode")) {
				this.setObjectCode(value);
				continue;
			}
		}
	}

	public static void main(String[] args) {
		UrlCmd cmd = new UrlCmd("menuCode=biz_game_list&objectCode=game_code");
		System.out.println(cmd.getObjectCode());
	}

	public String getMenuCode() {
		return menuCode;
	}

	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}

	public String getObjectCode() {
		return objectCode;
	}

	public void setObjectCode(String objectCode) {
		this.objectCode = objectCode;
	}
}