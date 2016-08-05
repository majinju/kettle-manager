/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.widget.treegrid;

import java.util.ArrayList;
import java.util.List;

import com.eova.aop.AopContext;
import com.eova.aop.MetaObjectIntercept;
import com.eova.common.utils.xx;
import com.eova.config.EovaConst;
import com.eova.model.Menu;
import com.eova.model.MetaField;
import com.eova.model.MetaObject;
import com.eova.model.User;
import com.eova.template.common.util.TemplateUtil;
import com.eova.vo.TreeGridConfig;
import com.eova.widget.WidgetManager;
import com.eova.widget.WidgetUtil;
import com.eova.widget.tree.TreeUtil;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

/**
 * TreeGrid组件
 * 
 * @author Jieven
 * 
 */
public class TreeGridController extends Controller {

	final Controller ctrl = this;

	/** 元对象业务拦截器 **/
	protected MetaObjectIntercept intercept = null;

	/**
	 * 分页查询
	 * 
	 * @throws Exception
	 */
	public void query() throws Exception {

		String code = getPara(0);
		String menuCode = getPara(1);

		MetaObject object = MetaObject.dao.getByCode(code);
		List<MetaField> fields = MetaField.dao.queryByObjectCode(code);
		Menu menu = null;
		if (!xx.isEmpty(menuCode))
			menu = Menu.dao.findByCode(menuCode);

		String filter = object.getStr("filter");
		// 菜单初始过滤条件优先级高于对象初始过滤条件
		if (menu != null) {
			String menuFilter = menu.getStr("filter");
			if (!xx.isEmpty(menuFilter))
				filter = menuFilter;
		}
		if (!xx.isEmpty(filter)) {
			// 不对超级管理员做数据限制
			User user = (User) this.getSessionAttr(EovaConst.USER);
			if (user.getInt("rid") == EovaConst.ADMIN_RID) {
				// filter = null;暂时注释
			}
		}

		List<Object> parmList = new ArrayList<Object>();

		// 获取条件
		String where = WidgetManager.getWhere(this, fields, parmList, filter);

		// 获取排序
		String sort = WidgetManager.getSort(this);

		// 分页查询Grid数据
		String view = object.getView();
		String sql = "from " + view + where + sort;

		intercept = TemplateUtil.initIntercept(object.getBizIntercept());

		// 查询前置任务
		if (intercept != null) {
			AopContext ac = new AopContext(ctrl);
			intercept.queryBefore(ac);

			// AOP自定义条件和参数
			if (!xx.isEmpty(ac.condition)) {
				sql = "from " + view + " where " + ac.condition + sort;
				parmList = ac.params;
			}
		}

		// 转换SQL参数
		Object[] paras = new Object[parmList.size()];
		parmList.toArray(paras);
		List<Record> list = Db.use(object.getDs()).find("select * " + sql, paras);

		// 查询后置任务
		if (intercept != null) {
			AopContext ac = new AopContext(ctrl, list);
			intercept.queryAfter(ac);
		}

		// 备份Value列，然后将值列转换成Key列
		WidgetUtil.copyValueColumn(list, object.getPk(), fields);
		// 根据表达式将数据中的值翻译成汉字
		WidgetManager.convertValueByExp(this, fields, list);

		// 树形配置
		TreeGridConfig tg = menu.getConfig().getTreegrid();
		
		Integer rootId = 99999999;
		// 计算当前结果集的根节点
		for (Record record : list) {
			Integer pid = record.getInt(tg.getParentField());
			if (pid < rootId) {
				rootId = pid;
			}
		}
		
		// to tree json
		String json = TreeUtil.toTreeJson(list, rootId, tg.getIconField(), tg.getParentField());

		renderJson(json);
	}
	
}