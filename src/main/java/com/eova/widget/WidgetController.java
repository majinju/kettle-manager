/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.widget;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.eova.common.base.BaseCache;
import com.eova.common.utils.xx;
import com.eova.common.utils.data.CloneUtil;
import com.eova.common.utils.db.DbUtil;
import com.eova.config.EovaConst;
import com.eova.config.PageConst;
import com.eova.engine.DynamicParse;
import com.eova.engine.EovaExp;
import com.eova.model.MetaField;
import com.eova.model.MetaObject;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.oss.common.Dict;

/**
 * EOVA 控件
 * 
 * @author Jieven
 * 
 */
public class WidgetController extends Controller {

	/**
	 * 查找Dialog
	 */
	public void toFind() {
		render("/eova/widget/find/find.html");
	}

	/**
	 * 查找框Dialog
	 */
	public void find() {

		String url = "/widget/findJson?";

		String exp = getPara("exp");
		String code = getPara("code");
		String field = getPara("field");
		boolean isMultiple = getParaToBoolean("multiple", false);
		// 自定义表达式
		if (xx.isEmpty(exp)) {
			// 根据表达式获取ei
			MetaField ei = MetaField.dao.getByObjectCodeAndEn(code, field);
			exp = ei.getStr("exp");
            exp = Dict.dictCategoryToSql(exp);
			url += "code=" + code + "&field=" + field;
		} else {
            exp = Dict.dictCategoryToSql(exp);
			url += "exp=" + exp;
			try {
				exp = URLDecoder.decode(exp, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		// 动态解析变量和逻辑运算
		exp = DynamicParse.buildSql(exp, this.getSessionAttr(EovaConst.USER));
				
		// 根据表达式构建元数据
		EovaExp se = new EovaExp(exp);
		MetaObject mo = se.getObject();
		List<MetaField> mfs = se.getFields();
		if (isMultiple) {
			mo.set("is_single", false);
		}
//		mo.set("is_celledit", true);
//		for (MetaField mf : mfs) {
//			mf.set("is_edit", true);
//			mf.put("editor", "eovatext");
//		}

		setAttr("action", url);
		// 用于Grid呈现
		setAttr("objectJson", JsonKit.toJson(mo));
		setAttr("fieldsJson", JsonKit.toJson(mfs));
		// 用于query条件
		setAttr("itemList", mfs);
//		System.out.println(JsonKit.toJson(mo));

		toFind();
	}

	/**
	 * Find Dialog Grid Get JSON
	 */
	public void findJson() {

		String exp = getPara("exp");
		String code = getPara("code");
		String en = getPara("field");
		if (xx.isEmpty(exp)) {
			// 根据表达式获取ei
			MetaField ei = MetaField.dao.getByObjectCodeAndEn(code, en);
			exp = ei.getStr("exp").trim();
			exp = Dict.dictCategoryToSql(exp);
		} else {
			try {
				exp = URLDecoder.decode(exp, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		// 动态解析变量和逻辑运算
		exp = DynamicParse.buildSql(exp, this.getSessionAttr(EovaConst.USER));
		// 解析表达式
		EovaExp se = new EovaExp(exp);
		String select = se.simpleSelect;
		String from = se.from;
		String where = se.where;
		String ds = se.ds;
		List<MetaField> eis = se.getFields();

		// 获取分页参数
		int pageNumber = getParaToInt(PageConst.PAGENUM, 1);
		int pageSize = getParaToInt(PageConst.PAGESIZE, 15);

		// 获取条件
		List<Object> parmList = new ArrayList<Object>();
		where = WidgetManager.getWhere(this, eis, parmList, where);
		Object[] parm = new Object[parmList.size()];
		parmList.toArray(parm);

		// 获取排序
		String sort = WidgetManager.getSort(this, se.order);

		// 分页查询Grid数据
		String sql = from + where + sort;
		Page<Record> page = Db.use(ds).paginate(pageNumber, pageSize, select, DbUtil.formatSql(sql), parm);

		// 将分页数据转换成JSON
		String json = JsonKit.toJson(page.getList());
		json = "{\"total\":" + page.getTotalRow() + ",\"rows\":" + json + "}";
		// System.out.println(json);

		renderJson(json);
	}

	/**
	 * Find get CN by value
	 */
	public void findCnByEn() {
		String code = getPara(0);
		String en = getPara(1);
		String value = getPara(2);

		// 根据表达式获取元字段
		MetaField ei = MetaField.dao.getByObjectCodeAndEn(code, en);

		String exp = ei.getStr("exp");
        exp = Dict.dictCategoryToSql(exp);
		// 动态解析变量和逻辑运算
		exp = DynamicParse.buildSql(exp, this.getSessionAttr(EovaConst.USER));
		
		// 解析表达式
		EovaExp se = new EovaExp(exp);
		String ds = se.ds;
		
		// 查询本次所有翻译值
		StringBuilder sb = new StringBuilder();
		if (!xx.isEmpty(value)) {
			sb.append(se.pk);
			sb.append(" in(");
			// 根据当前页数据value列查询外表name列
			for (String id : value.split(",")) {
				// TODO There might be a sb injection risk warning
				sb.append(xx.format(id)).append(",");
			}
			sb.deleteCharAt(sb.length() - 1);
			sb.append(")");
		}
		System.out.println(sb.toString());
		
		// 根据表达式查询获得翻译的值
		String sql = WidgetManager.addWhere(se, sb.toString());
		
		List<Record> txts = Db.use(ds).find(sql);
		// 没有翻译值，直接返回原值
		if (xx.isEmpty(txts)) {
			renderJson(value);
			return;
		}
		
		JSONObject json = new JSONObject();
		json.put("text_field", se.cn);// 文本字段名
		json.put("data", JsonKit.toJson(txts));// 翻译字典数据
		renderJson(json.toJSONString());
	}

	/**
	 * Combo Load Data Get JSON
	 */
	public void comboJson() {
		String exp = getPara("exp");

		MetaField ei = null;
		if (xx.isEmpty(exp)) {
			// 根据元数据获取表达式
			String objectCode = getPara(0);
			String en = getPara(1);
			ei = MetaField.dao.getByObjectCodeAndEn(objectCode, en);
			exp = ei.getStr("exp");
		}
        exp = Dict.dictCategoryToSql(exp);

		// 动态解析变量和逻辑运算
		exp = DynamicParse.buildSql(exp, this.getSessionAttr(EovaConst.USER));
		
		// 解析表达式
		EovaExp se = new EovaExp(exp);
		String sql = se.sql;

		List<Record> list = null;
		try {
			list = CloneUtil.clone(Db.use(se.ds).findByCache(BaseCache.SER, sql, sql));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 添加下拉框默认值
		Record re = new Record();
		// 单选时添加默认空选项
		if (ei == null || !ei.getBoolean("is_multiple")) {
			re.set("id", "");
			re.set("cn", "");
			list.add(0, re);
		}

		// 转换成JSON
		String json = JsonKit.toJson(list);
		// json = "[value,name]";
		// System.out.println(json);
		renderJson(json);
	}

}