/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.widget.form;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.eova.aop.AopContext;
import com.eova.aop.MetaObjectIntercept;
import com.eova.common.Easy;
import com.eova.common.utils.xx;
import com.eova.model.EovaLog;
import com.eova.model.MetaField;
import com.eova.model.MetaObject;
import com.eova.model.Widget;
import com.eova.service.sm;
import com.eova.template.common.config.TemplateConfig;
import com.eova.template.common.util.TemplateUtil;
import com.eova.widget.WidgetManager;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.Record;

/**
 * Form组件
 * 
 * @author Jieven
 * 
 */
public class FormController extends Controller {

	final Controller ctrl = this;

	/** 自定义拦截器 **/
	protected MetaObjectIntercept intercept = null;

	/** 异常信息 **/
	private String errorInfo = "";

	/** 当前操作的主对象 **/
	private final Record record = new Record();

	public void add() throws Exception {
		String objectCode = this.getPara(0);
		MetaObject object = sm.meta.getMeta(objectCode);

		// 字段禁用默认对新增无效
		for (MetaField mf : object.getFields()) {
			mf.put("is_disable", false);
		}

		// 构建关联参数值
		WidgetManager.buildRef(this, object);

		// 业务拦截
		intercept = TemplateUtil.initIntercept(object.getBizIntercept());
		if (intercept != null) {
			AopContext ac = new AopContext(ctrl, object);
			intercept.addInit(ac);
		}

		setAttr("object", object);
		setAttr("fields", object.getFields());
		render("/eova/widget/form/add.html");
	}

	public void doAdd() {

		String objectCode = this.getPara(0);

		final MetaObject object = sm.meta.getMeta(objectCode);

		// 构建对象数据
		final Map<String, Record> reMap = WidgetManager.buildData(this, object.getFields(), record, object.getPk(), true);

		intercept = TemplateUtil.initIntercept(object.getBizIntercept());
		// 事务(默认为TRANSACTION_READ_COMMITTED)
		boolean flag = Db.tx(new IAtom() {
			@Override
			public boolean run() throws SQLException {
				try {

					AopContext ac = new AopContext(ctrl, record);

					// 新增前置任务
					if (intercept != null) {
						String msg = intercept.addBefore(ac);
						if (!xx.isEmpty(msg)) {
							errorInfo = msg;
							return false;
						}
					}

					if (!xx.isEmpty(object.getTable())) {
						// update table
						Db.use(object.getDs()).save(object.getTable(), object.getPk(), record);
					} else {
						// update view
						WidgetManager.operateView(object.getPk(), reMap, TemplateConfig.ADD);
					}

					// 新增后置任务
					if (intercept != null) {
						String msg = intercept.addAfter(ac);
						if (!xx.isEmpty(msg)) {
							errorInfo = msg;
							return false;
						}
					}
				} catch (Exception e) {
					errorInfo = TemplateUtil.buildException(e);
					return false;
				}
				return true;
			}
		});

		// AOP提示信息
		if (!flag) {
			renderJson(new Easy(errorInfo));
			return;
		}

		if (!flag) {
			renderJson(new Easy("新增失败" + errorInfo));
			return;
		}

		// 记录新增日志
		EovaLog.dao.info(this, EovaLog.ADD, object.getStr("code"));

		// 新增成功之后
		if (intercept != null) {
			try {
				ArrayList<Record> records = new ArrayList<Record>();
				records.add(record);

				AopContext ac = new AopContext(this, records);
				String msg = intercept.addSucceed(ac);
				if (!xx.isEmpty(msg)) {
					errorInfo = msg;
				}
			} catch (Exception e) {
				errorInfo = TemplateUtil.buildException(e);
				renderJson(new Easy("新增成功,addSucceed拦截执行异常!" + errorInfo));
				return;
			}
		}

		renderJson(new Easy());
	}

	public void update() throws Exception {
		MetaObject object = buildFormData(true);
		// 业务拦截
		intercept = TemplateUtil.initIntercept(object.getBizIntercept());
		if (intercept != null) {
			AopContext ac = new AopContext(ctrl, object);
			intercept.updateInit(ac);
		}
		render("/eova/widget/form/update.html");
	}

	public void doUpdate() {

		String objectCode = this.getPara(0);

		final MetaObject object = sm.meta.getMeta(objectCode);

		// 获取基础数据
		final Map<String, Record> reMap = WidgetManager.buildData(this, object.getFields(), record, object.getPk(), false);
		final Object pkValue = record.get(object.getPk());

		intercept = TemplateUtil.initIntercept(object.getBizIntercept());
		// 事务(默认为TRANSACTION_READ_COMMITTED)
		boolean flag = Db.tx(new IAtom() {
			@Override
			public boolean run() throws SQLException {
				try {

					AopContext ac = new AopContext(ctrl, record);

					// 修改前置任务
					if (intercept != null) {
						String msg = intercept.updateBefore(ac);
						if (!xx.isEmpty(msg)) {
							errorInfo = msg;
							return false;
						}
					}

					if (!xx.isEmpty(object.getTable())) {
						// update table
						System.out.println(JsonKit.toJson(record));
						Db.use(object.getDs()).update(object.getTable(), object.getPk(), record);
					} else {
						// update view
						WidgetManager.operateView(object.getPk(), reMap, TemplateConfig.UPDATE);
					}

					// 修改后置任务
					if (intercept != null) {
						String msg = intercept.updateAfter(ac);
						if (!xx.isEmpty(msg)) {
							errorInfo = msg;
						}
					}
				} catch (Exception e) {
					errorInfo = TemplateUtil.buildException(e);
					return false;
				}
				return true;
			}
		});

		// AOP提示信息
		if (!flag) {
			renderJson(new Easy(errorInfo));
			return;
		}

		if (!flag) {
			renderJson(new Easy("修改失败" + errorInfo));
			return;
		}

		// 记录新增日志
		EovaLog.dao.info(this, EovaLog.UPDATE, object.getStr("code") + "[" + pkValue + "]");

		// 修改成功之后
		if (intercept != null) {
			try {
				ArrayList<Record> records = new ArrayList<Record>();
				records.add(record);

				AopContext ac = new AopContext(this, records);
				String msg = intercept.updateSucceed(ac);
				if (!xx.isEmpty(msg)) {
					errorInfo = msg;
				}
			} catch (Exception e) {
				errorInfo = TemplateUtil.buildException(e);
				renderJson(new Easy("修改成功,updateSucceed拦截执行异常!" + errorInfo));
				return;
			}
		}

		renderJson(new Easy());
	}

	public void detail() {
		buildFormData(false);
		render("/eova/widget/form/detail.html");
	}

	/**
	 * 构建对象数据
	 */
	public MetaObject buildFormData(boolean isEdit) {
		String objectCode = this.getPara(0);
		// 获取主键的值
		Object pkValue = getPara(1);

		MetaObject object = sm.meta.getMeta(objectCode);

		// 根据主键获取对象
		Record record = Db.use(object.getDs()).findById(object.getView(), object.getPk(), pkValue);

		// 遍历给字段赋值
		for (MetaField ei : object.getFields()) {
			String key = ei.getEn();
			Object value = record.get(key);

			if (value == null) {
				value = "";
			}

			// 非编辑模式全部禁用(详情)
			if (!isEdit) {
				ei.set("is_disable", true);
			}

			ei.put("value", value);
		}

		// 构建关联参数值
		WidgetManager.buildRef(this, object);

		setAttr("object", object);
		setAttr("fields", object.getFields());
		
		buildWidget();

		return object;
	}

	/**
	 * 构建自定义控件
	 */
	private void buildWidget() {
		List<Widget> widgets = Widget.dao.findByType(Widget.TYPE_DIY);
		setAttr("widgets", widgets);
	}
}