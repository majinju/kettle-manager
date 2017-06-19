/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.widget.grid;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.eova.aop.AopContext;
import com.eova.aop.MetaObjectIntercept;
import com.eova.common.Easy;
import com.eova.common.render.XlsRender;
import com.eova.common.utils.xx;
import com.eova.common.utils.db.DbUtil;
import com.eova.config.EovaConst;
import com.eova.config.PageConst;
import com.eova.model.EovaLog;
import com.eova.model.Menu;
import com.eova.model.MetaField;
import com.eova.model.MetaObject;
import com.eova.model.User;
import com.eova.service.sm;
import com.eova.template.common.util.TemplateUtil;
import com.eova.widget.WidgetManager;
import com.eova.widget.WidgetUtil;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

/**
 * Grid组件
 * 
 * @author Jieven
 * 
 */
public class GridController extends Controller {

	/**
    * 跳过后续操作
    */
    public static final String CONTINUE = "continue";

    final Controller ctrl = this;

	/** 元对象业务拦截器 **/
	protected MetaObjectIntercept intercept = null;

	/** 异常信息 **/
	private String errorInfo = "";

	/**
	 * 分页查询
	 * @throws Exception 
	 */
	public void query() throws Exception {

		String code = getPara(0);
		String menuCode = getPara(1);

		MetaObject object = MetaObject.dao.getByCode(code);
		List<MetaField> fields = MetaField.dao.queryByObjectCode(code);
		Menu menu = null;
		if (!xx.isEmpty(menuCode)) menu = Menu.dao.findByCode(menuCode);

		// 获取分页参数
		int pageNumber = getParaToInt(PageConst.PAGENUM, 1);
		int pageSize = getParaToInt(PageConst.PAGESIZE, 10000);

		String filter = object.getStr("filter");
		// 菜单初始过滤条件优先级高于对象初始过滤条件
		if (menu != null) {
			String menuFilter = menu.getStr("filter");
			if(!xx.isEmpty(menuFilter)) filter = menuFilter;
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
		String sql = "from ";

		intercept = TemplateUtil.initIntercept(object.getBizIntercept());
		
		// 查询前置任务
		if (intercept != null) {
			AopContext ac = new AopContext(ctrl);
			//将已有条件传给拦截器
			ac.where = where;
			ac.params = parmList;
			ac.view = view;
			intercept.queryBefore(ac);
			sql += ac.view;
			// 追加条件
			if (!xx.isEmpty(ac.condition)) {
				where += ac.condition;
				parmList.addAll(ac.params);
			}
			// 覆盖条件
			if (!xx.isEmpty(ac.where)) {
				where = ac.where;
				parmList = ac.params;
			}
		}else{
            sql += view;
		}
		
		sql += where + sort;
		
		// 转换SQL参数
		Object[] paras = new Object[parmList.size()];
		parmList.toArray(paras);
		Page<Record> page = Db.use(object.getDs()).paginate(pageNumber, pageSize, "select *", DbUtil.formatSql(sql), paras);

		// 查询后置任务
		if (intercept != null) {
			AopContext ac = new AopContext(ctrl, page.getList());
			intercept.queryAfter(ac);
		}

		// 备份Value列，然后将值列转换成Key列
		WidgetUtil.copyValueColumn(page.getList(), object.getPk(), fields);
		// 根据表达式将数据中的值翻译成汉字
		WidgetManager.convertValueByExp(this, fields, page.getList());

		// 将分页数据转换成JSON
		String json = JsonKit.toJson(page.getList());
		json = "{\"total\":" + page.getTotalRow() + ",\"rows\":" + json;

		if (code.equals("yimei_product_order")) {
			json += ",\"footer\":[";

			double sum_v_cc = 0;
			double sum_v_sxf = 0;
			double sum_v_js = 0;
			for (Record record : page.getList()) {
				sum_v_cc += record.getDouble("v_cc");
				sum_v_sxf += record.getDouble("v_sxf");
				sum_v_js += record.getDouble("v_js");
			}

			JSONObject o = new JSONObject();
			o.put("order_id", "总计:(单位/元)");
			o.put("v_cc", xx.toDouble(String.format("%.2f", sum_v_cc)));
			o.put("v_sxf", xx.toDouble(String.format("%.2f", sum_v_sxf)));
			o.put("v_js", xx.toDouble(String.format("%.2f", sum_v_js)));
			json += o.toJSONString();

			json += "]";
		}

		json += "}";

		renderJson(json);
	}

	/**
	 * 新增
	 */
	public void add() {
		String objectCode = getPara(0);
		final MetaObject object = sm.meta.getMeta(objectCode);

		String json = getPara("rows");
		final List<Record> records = getRecordsByJson(json, object.getFields(), object.getPk());

		intercept = TemplateUtil.initIntercept(object.getBizIntercept());
		// 事务
		boolean flag = Db.tx(new IAtom() {
			@Override
			public boolean run() throws SQLException {
				try {
					for (Record record : records) {

						AopContext ac = new AopContext(ctrl, record);

						// 新增前置任务
						if (intercept != null) {
							String msg = intercept.addBefore(ac);
							if(CONTINUE.equals(msg)){
							    continue;
							}
							if (!xx.isEmpty(msg)) {
								errorInfo = msg;
								return false;
							}
						}
						Db.use(object.getDs()).save(object.getTable(), object.getPk(), record);
						EovaLog.dao.info(ctrl, EovaLog.ADD, object.getStr("code"));
						// 新增后置任务
						if (intercept != null) {
							String msg = intercept.addAfter(ac);
							if (!xx.isEmpty(msg)) {
								errorInfo = msg;
								return false;
							}
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

		// 新增成功之后
		if (intercept != null) {
			try {
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

	/**
	 * 删除
	 */
	public void delete() {
		String objectCode = getPara(0);
		final MetaObject object = sm.meta.getMeta(objectCode);

		String json = getPara("rows");

		final List<Record> records = getRecordsByJson(json, object.getFields(), object.getPk());

		intercept = TemplateUtil.initIntercept(object.getBizIntercept());
		// 事务
		boolean flag = Db.tx(new IAtom() {
			@Override
			public boolean run() throws SQLException {
				try {
					for (Record record : records) {

						AopContext ac = new AopContext(ctrl, record);

						// 删除前置任务
						if (intercept != null) {
							String msg = intercept.deleteBefore(ac);
                            if(CONTINUE.equals(msg)){
                                continue;
                            }
							if (!xx.isEmpty(msg)) {
								errorInfo = msg;
								return false;
							}
						}
						String pk = object.getPk();
						String pkValue = record.get(pk).toString();
						// 根据主键删除对象
						if (!xx.isEmpty(object.getTable())) {
							Db.use(object.getDs()).delete(object.getTable(), pk, record);
						} else {
							WidgetManager.deleteView(object.getStr("code"), pkValue);
						}
						EovaLog.dao.info(ctrl, EovaLog.DELETE, object.getStr("code") + "[" + pkValue + "]");
						// 删除后置任务
						if (intercept != null) {
							String msg = intercept.deleteAfter(ac);
							if (!xx.isEmpty(msg)) {
								errorInfo = msg;
								return false;
							}
						}
					}

				} catch (Exception e) {
					errorInfo = TemplateUtil.buildException(e);
					return false;
				}
				return true;
			}
		});

		if (!flag) {
			renderJson(new Easy("删除失败" + errorInfo));
			return;
		}

		// 删除成功之后
		if (intercept != null) {
			try {
				AopContext ac = new AopContext(this, records);
				String msg = intercept.deleteSucceed(ac);
				if (!xx.isEmpty(msg)) {
					errorInfo = msg;
				}
			} catch (Exception e) {
				errorInfo = TemplateUtil.buildException(e);
				renderJson(new Easy("删除成功,deleteSucceed执行异常!" + errorInfo));
				return;
			}
		}

		if (!xx.isEmpty(errorInfo)) {
			renderJson(new Easy(errorInfo));
			return;
		}

		renderJson(new Easy());
	}

	/**
	 * 更新
	 * 
	 * @throws IOException
	 */
	public void update() throws IOException {

		String objectCode = getPara(0);
		final MetaObject object = sm.meta.getMeta(objectCode);

		String json = getPara("rows");

		final List<Record> records = getRecordsByJson(json, object.getFields(), object.getPk());

		intercept = TemplateUtil.initIntercept(object.getBizIntercept());
		// 事务
		boolean flag = Db.tx(new IAtom() {
			@Override
			public boolean run() throws SQLException {
				try {
					for (Record record : records) {

						AopContext ac = new AopContext(ctrl, record);

						// 修改前置任务
						if (intercept != null) {
							String msg = intercept.updateBefore(ac);
                            if(CONTINUE.equals(msg)){
                                continue;
                            }
							if (!xx.isEmpty(msg)) {
								errorInfo = msg;
								return false;
							}
						}
						Db.use(object.getDs()).update(object.getTable(), object.getPk(), record);
						EovaLog.dao.info(ctrl, EovaLog.UPDATE, object.getStr("code") + "[" + record.get(object.getPk()) + "]");
						// 修改后置任务
						if (intercept != null) {
							String msg = intercept.updateAfter(ac);
							if (!xx.isEmpty(msg)) {
								errorInfo = msg;
								return false;
							}
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

		// 修改成功之后
		if (intercept != null) {
			try {
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

	/**
	 * 导出
	 */
	public void export() {
		String objectCode = getPara(0);
		MetaObject object = MetaObject.dao.getByCode(objectCode);
		List<MetaField> items = MetaField.dao.queryByObjectCode(objectCode);
		List<Record> data = Db.use(object.getDs()).find("select * from " + object.getView());
		render(new XlsRender(data, items, object));
	}

	/**
	 * json转List
	 * 
	 * @param json
	 * @param pkName
	 * @return
	 */
	private static List<Record> getRecordsByJson(String json, List<MetaField> items, String pkName) {
		List<Record> records = new ArrayList<Record>();

		List<JSONObject> list = JSON.parseArray(json, JSONObject.class);
		for (JSONObject o : list) {
			Map<String, Object> map = JSON.parseObject(o + "", new TypeReference<Map<String, Object>>() {
			});
			Record re = new Record();
			re.setColumns(map);
			// 将Text翻译成Value,然后删除val字段
			for (MetaField x : items) {
				String en = x.getEn();// 字段名
				String exp = x.getStr("exp");// 表达式
				Object value = re.get(en);// 值

                String valField = en + "_val";
				if (!xx.isEmpty(exp)&&re.get(valField)!=null) {
					// 获取值列中的值
					value = re.get(valField).toString();
					// 获得值之后删除值列防止持久化报错
					re.remove(valField);
				}

				re.set(en, TemplateUtil.convertValue(x, value));
			}
			// 删除主键备份值列
			re.remove("pk_val");
			// 删除Orcle分页产生的rownum_
			if (xx.isOracle()) {
				re.remove("rownum_");
			}
			records.add(re);
		}

		return records;
	}

	public static void main(String[] args) {

		String sl = "[{'id':1,'loginId':'111'},{'id':2,'loginId':'222'}]";
		List<JSONObject> list = JSON.parseArray(sl, JSONObject.class);
		for (JSONObject o : list) {
			Map<String, Object> map = JSON.parseObject(o + "", new TypeReference<Map<String, Object>>() {
			});
			Record re = new Record();
			re.setColumns(map);
			System.out.println(re.toJson());
		}
	}

}
