/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.core;

import java.io.InputStream;
import java.net.URL;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.eova.common.Easy;
import com.eova.common.utils.EncryptUtil;
import com.eova.common.utils.xx;
import com.eova.common.utils.db.JdbcUtil;
import com.eova.config.EovaConfig;
import com.eova.config.EovaConst;
import com.eova.model.Menu;
import com.eova.model.User;
import com.eova.service.sm;
import com.eova.widget.WidgetUtil;
import com.jfinal.core.Controller;

/**
 * Eova入口
 * 
 * @author Jieven
 * @date 2015-1-6
 */
public class IndexController extends Controller {

	public void toMain() {
		render("/eova/main.html");
	}

	public void toIndex() {
		render("/eova/index.html");
	}

	public void toHeader() {
		User user = getSessionAttr(EovaConst.USER);
		setAttr("user", user);
		render("/eova/header.html");
	}

	public void toIcon() {
		render("/eova/icon.html");
	}

	public void toUe() {
		render("/eova/uedemo.html");
	}

	public void toTest() {
		setAttr("id", "testGrid");
		setAttr("objectCode", getPara(0));
		render("/eova/test.html");
	}
	
	public void toForm() {
		render("/eova/test/form.html");
	}

	public void toLogin() {

		int port = getRequest().getServerPort();
		String name = getRequest().getServerName();
		String ctx = "http://" + name + ':' + port;
		
		try {
			URL url = new URL(ctx + "/ui/css/common.css");
			@SuppressWarnings("unused")
			InputStream in = url.openStream();
		} catch (Exception e1) {
			System.out.println("资源无法访问，请检查Web容器配置!");
			setAttr("ctx", ctx);
			render("/eova/520.html");
			return;
		}

		render("/eova/login.html");
	}

	/**
	 * 修改密码
	 */
	public void toUpdatePwd() {
		User user = getSessionAttr("user");
		if (xx.isEmpty(user)) {
			setAttr("msg", "请先登录");
			toLogin();
			return;
		}
		render("/eova/updatePwd.html");
	}

	public void index() {
		User user = getSessionAttr("user");
		// 已经登录
		if (user != null) {
			int rid = user.getInt("rid");
			// int rid = user.getBigDecimal("rid").intValue();
			// 获取根节点作为模块
			List<Menu> cacheList = Menu.dao.queryRoot();
			// 防止迭代影响Cache，复制一个List
			List<Menu> rootList = new ArrayList<Menu>(cacheList);
			// 过滤当前角没有权限的模块
			// List迭代
			Iterator<Menu> it = rootList.iterator();
			while (it.hasNext()) {
				Menu x = it.next();
				// long count = sm.auth.countByParentId(x.getInt("id"), rid);
				// if (count == 0) {
				// 清除没有授权的根节点
				boolean flag = sm.auth.isExistsAuthByPidRid(x.getInt("id"), rid);
				if (!flag) {
					it.remove();
				}
			}
			if (xx.isEmpty(rootList)) {
				setAttr("msg", "当前角色没有任何功能授权！");
				toLogin();
				return;
			}
			setAttr("rootList", rootList);
			toIndex();
			return;
		}
		// 未登录
		toLogin();
	}

	public void doExit() {
		// 清除登录状态
		removeSessionAttr("user");
		toLogin();
	}

	public void doLogin() {
		String loginId = getPara("loginId");
		String loginPwd = getPara("loginPwd");

		User user = User.dao.getByLoginId(loginId);
		if (user == null) {
			setAttr("msg", "用户名不存在");
			toLogin();
			return;
		}
		if (!user.getStr("login_pwd").equals(EncryptUtil.getSM32(loginPwd))) {
			setAttr("msg", "密码错误");
			keepPara("loginId");
			toLogin();
			return;
		}
		// 登录成功
		setSessionAttr(EovaConst.USER, user);
		// 重定向到首页
		redirect("/");

	}

	/**
	 * 修改密码
	 */
	public void updatePwd() {
		String oldPwd = getPara("oldPwd");
		String newPwd = getPara("newPwd");
		String confirm = getPara("confirm");
		
		if (xx.isOneEmpty(oldPwd, newPwd, confirm)) {
			renderJson(new Easy("三个密码都不能为空"));
			return;
		}
		
		// 新密码和确认密码是否一致
		if (!newPwd.equals(confirm)) {
			renderJson(new Easy("新密码两次输入不一致"));
			return;
		}
		
		// 当前用户
		User user = getSessionAttr("user");
		String pwd = user.getStr("login_pwd");
		// 旧密码是否正确
		if (!pwd.equals(EncryptUtil.getSM32(oldPwd))) {
			renderJson(new Easy("密码错误"));
			return;
		}

		// 修改密码
		user.set("login_pwd", EncryptUtil.getSM32(newPwd)).update();

		renderJson(new Easy());
	}

	/**
	 * 获取菜单JSON
	 */
	public void showTree() {
		// 获取父节点
		Integer rootId = getParaToInt(0);
		if (rootId == null) {
			renderJson("系统异常");
			return;
		}
		// 获取登录用户的角色
		User user = getSessionAttr("user");
		int rid = user.getInt("rid");
		
		// 获取所有菜单信息
		LinkedHashMap<Integer, Menu> allMenu = (LinkedHashMap<Integer, Menu>) sm.auth.getByParentId(rootId);
		// 格式化EasyUI Tree Data
		WidgetUtil.formatEasyTree(allMenu);
		// 根据角色获取已授权菜单Code
		List<String> authMenuCodeList = sm.auth.queryMenuCodeByRid(rid);

		// 获取已授权菜单
		LinkedHashMap<Integer, Menu> authMenu = new LinkedHashMap<Integer, Menu>();
		for (Map.Entry<Integer, Menu> map : allMenu.entrySet()) {
			Menu menu = map.getValue();
			// TODO 仅可查看已授权部分
			if (authMenuCodeList.contains(menu.getStr("code"))) {
				authMenu.put(map.getKey(), menu);
			}
		}

		// 获取已授权子菜单的所有上级节点(若功能有授权，需要找到上级才能)
		LinkedHashMap<Integer, Menu> authParent = new LinkedHashMap<Integer, Menu>();
		for (Map.Entry<Integer, Menu> map : authMenu.entrySet()) {
			WidgetUtil.getParent(allMenu, authParent, map.getValue());
		}

		// 根节点不显示排除
		authParent.remove(rootId);
		
		// 将已授权的子菜单 放入 已授权 父菜单 Map
		// 顺序说明：父在前，子在后,子默认又是有序的
		authParent.putAll(authMenu);

		// Map 转 Tree Json
		String json = WidgetUtil.menu2TreeJson(authParent, rootId);

		renderJson(json);
	}

	/**
	 * 初始化操作
	 */
	public void init() {
		render("/eova/init.html");
	}
	
	/**
	 * 升级操作
	 */
	public void upgrade() {
		String isUpgrade = EovaConfig.props.get("isUpgrade");
		if(xx.isEmpty(isUpgrade) || !isUpgrade.equals("true")){
			renderText("未开启升级模式，请启动配置 isUpgrade = true");
			return;
		}
		
		render("/eova/help/upgrade.html");
	}

	/**
	 * 初始化操作
	 */
	public void doInit() {
		String ip = getPara("ip");
		String port = getPara("port");
		String userName = getPara("userName");
		String password = getPara("password");

		keepPara(ip);
		keepPara(port);
		keepPara(userName);
		keepPara(password);

		String local_url = MessageFormat.format("jdbc:mysql://{0}:{1}/web?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull", ip, port);
		// String local_user = userName;
		// String local_pwd = password;

		// String local_eova_url = MessageFormat.format("jdbc:mysql://{0}:{1}/eova?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull", ip, port);
		// String local_eova_user = userName;
		// String local_eova_pwd = password;

		// 自动生成JDBC配置 to eova.config
		String msg = JdbcUtil.initConnection(local_url, userName, password);
		if (msg != null) {

			if (msg.startsWith("Communications link failure")) {
				msg = "无法连接数据库，请检查IP:Port";
			} else if (msg.startsWith("Access denied for user")) {
				msg = "用户无权限访问，请检查用户名和密码";
			}

			setAttr("msg", msg);
			init();
			return;
		}

	}

}