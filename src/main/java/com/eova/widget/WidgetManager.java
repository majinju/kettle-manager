/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.widget;

import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import cn.benma666.constants.UtilConst;
import cn.benma666.myutils.StringUtil;

import com.eova.common.utils.xx;
import com.eova.common.utils.time.DateUtil;
import com.eova.config.EovaConst;
import com.eova.config.PageConst;
import com.eova.engine.DynamicParse;
import com.eova.engine.EovaExp;
import com.eova.model.MetaField;
import com.eova.model.MetaObject;
import com.eova.template.common.config.TemplateConfig;
import com.eova.template.common.util.TemplateUtil;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.oss.common.Dict;

/**
 * 组件公共业务
 * 
 * @author Jieven
 * 
 */
public class WidgetManager {

	/**
	 * 获取排序
	 * @param c
	 * @param eo 元对象
	 * @param order 指定排序
	 * @return
	 */
	public static String getSort(Controller c, String order) {

		String sql = "";
		
		// 指定默认排序方式
		if (!xx.isEmpty(order)) {
			sql = order;
		}
		
		// 当前Request的排序方式
		String orderField = c.getPara(PageConst.SORT, "");// 获取排序字段
		String orderType = c.getPara(PageConst.ORDER, "");// 获取排序方式
		if (!xx.isEmpty(orderField)) {
			sql = " order by " + orderField + ' ' + orderType;
		}
		
		return sql;
	}

	public static String getSort(Controller c) {
		return getSort(c, null);
	}

	/**
	 * 获取条件
	 * 
	 * @param c
	 * @param eo
	 * @param eis
	 * @param parmList SQL参数
	 * @return
	 */
	public static String getWhere(Controller c, List<MetaField> eis, List<Object> parmList, String where) {

		StringBuilder sb = new StringBuilder();
		
		boolean isWhere = true;
		for (MetaField ei : eis) {
			// sql where 初始化
			if (isWhere) {
				// 存在初始过滤条件
				if (!xx.isEmpty(where)) {
					// 补where
					if (!where.toLowerCase().contains("where")) {
						sb.insert(0, " where ");
					} else {
						sb.append(" ");
					}
					sb.append(where + " ");
				} else {
					sb.append(" where 1=1 ");
				}
				isWhere = false;
			}

			String key = ei.getEn();
			// 给查询表单添加前缀，防止和系统级别字段重名
			String value = c.getPara(PageConst.QUERY + key, "").trim();
			
			String startTime = c.getPara(PageConst.START + key, "").trim();
			String endTime = c.getPara(PageConst.END + key, "").trim();
			// 当前字段 既无文本值 也无时间值，说明没填，直接跳过
			if ((xx.isEmpty(value) || value.equals("-1")) && xx.isAllEmpty(startTime, endTime)) {
				continue;
			}
			
			if(StringUtil.isNotBlank(ei.getStr("owner"))){
			    key = ei.getStr("owner")+"."+key;
			}
			// 复选框需要转换值
			value = TemplateUtil.convertValue(ei, value).toString();
			
			// 文本类型查询条件为模糊匹配
			if (ei.getStr("type").equals(MetaField.TYPE_TEXT) || ei.getStr("type").equals(MetaField.TYPE_TEXTS)) {
				sb.append(" and " + key + " like ?");
				parmList.add("%" + value + "%");
			} else if (ei.getStr("data_type").equals(MetaField.DATATYPE_STRING)
					&&ei.getStr("type").equals(MetaField.TYPE_TIME)) {
				if(!xx.isEmpty(startTime)){
					sb.append(" and " + key + " >= ? ");
					parmList.add(DateUtil.format(DateUtil.format(startTime),cn.benma666.myutils.DateUtil.DATE_FORMATTER8));
				}
				if(!xx.isEmpty(endTime)){
					sb.append(" and " + key + " <= ?");
					parmList.add(DateUtil.format(DateUtil.format(endTime),cn.benma666.myutils.DateUtil.DATE_FORMATTER8));
				}
			} else if (ei.getStr("type").equals(MetaField.TYPE_TIME)) {
				if(!xx.isEmpty(startTime)){
					if (xx.isOracle()) {
						sb.append(" and " + key + " >= to_date(?,'yyyy-mm-dd') ");
					} else {
						sb.append(" and date(" + key + ") >= ? ");
					}
					parmList.add(startTime);
				}
				if(!xx.isEmpty(endTime)){
					if (xx.isOracle()) {
						sb.append(" and " + key + " < to_date(?,'yyyy-mm-dd')+1");
					} else {
						sb.append(" and date(" + key + ") <= ?");
					}
					parmList.add(endTime);
				}
			} else {
				if (ei.getBoolean("is_multiple")) {
					// 多值条件
					sb.append(" and (");
					for(String val : value.split(",")){
						if (!sb.toString().endsWith(" (")) {
							sb.append(" or ");
						}
						sb.append(key + " like ");
						sb.append("?");
						parmList.add('%' + val + '%');
					}
					sb.append(")");
				} else {
					// 单值条件
					sb.append(" and " + key + " = ?");
					parmList.add(value);
				}
			}
			
			// 保持条件值回显
			ei.put("value", value);
		}
		
		// 动态解析变量和逻辑运算
		return DynamicParse.buildSql(sb.toString(), c.getSessionAttr(EovaConst.USER));
	}

	/**
	 * 构建翻译查询条件
	 * @param sql
	 */
	public static void buildWhere(StringBuilder sql) {
		// 没有where关键字(说明表达式没有带条件)，自动添加where头，方便后续跟 and id in(x,x,x)
		if (!sql.toString().toLowerCase().contains("where")) {
			sql.append(" where 1=1 ");
		}
		// 自动切断后续条件，翻译是根据当前页所有ID查询外表，不需要关心额外条件
		// eg. where id = ${user.id}
//		int index = sql.indexOf("where");
//		if (index != -1) {
//			// 删除所有条件
//			sql.delete(index + 5, sql.length());
//			sql.append(" 1=1 ");
//		}
	}

	/**
	 * 添加where条件
	 * @param se
	 * @param condition
	 * @return
	 */
	public static String addWhere(EovaExp se, String condition){
		
		String select = se.simpleSelect;
		String from = se.from;
		String where = se.where;
		
		if(xx.isEmpty(where)){
			where = " where " + condition;
		} else {
			where += " and " + condition;
		}
		
		return select + from + where;
	}
	
	public static void convertValueByExp(Controller c, List<MetaField> eis, List<Record> reList) {
		// 根据表达式翻译显示CN(获取当前字段所有的 查询结果值，拼接成 字符串 用于 结合表达式进行 in()查询获得cn 然后替换之)
		for (MetaField ei : eis) {
			// 只翻译需要显示的字段
			if(!ei.getBoolean("is_show")){
				continue;
			}
			//字段类型是string，控件类型是复选框的字段，这里进行数据转换
			if(MetaField.TYPE_CHECK.equals(ei.getStr("type"))
					&&MetaField.DATATYPE_STRING.equals(ei.getStr("data_type"))){
				String en = ei.getEn();
				for (Record re : reList) {
					Object o = re.get(en);
					// 空字段无法翻译
					if (xx.isEmpty(o)) {
						re.set(en, "");
					}else if(UtilConst.WHETHER_TRUE.equals(o)){
						re.set(en, Boolean.TRUE);
					}else{
						re.set(en, Boolean.FALSE);
					}
				}
				continue;
			}
			// 获取控件表达式
			String exp = ei.getStr("exp");
            exp = Dict.dictCategoryToSql(exp);
			if (xx.isEmpty(exp)) {
				continue;
			}
			// 获取存在表达式的列名
			String en = ei.getEn();
			// System.out.println(en + " EovaExp:" + exp);
			// in 条件值
			Set<String> ids = new HashSet<String>();
			if (!xx.isEmpty(reList)) {
				for (Record re : reList) {
					String value = re.get(en,"").toString();
					if (value.contains(",")) {
						// 多值
						for(String val : value.split(",")){
							ids.add(val);
						}
					} else {
						// 单值
						ids.add(value);
					}
				}
			}

			exp = DynamicParse.buildSql(exp, c.getSessionAttr(EovaConst.USER));
			
			EovaExp se = new EovaExp(exp);
			String select = se.simpleSelect;
			String where = se.where;
			String from = se.from;
			String pk = se.pk;
			String cn = se.cn;
			
			// 清除value列查询条件，防止干扰翻译SQL条件
			where = filterValueCondition(where, pk);
			// PS:底部main有测试用例

			StringBuilder sql = new StringBuilder();
			sql.append(select);
			sql.append(from);
			sql.append(where);
			// 构建特殊翻译查询条件
			buildWhere(sql); 
			
			// 查询本次所有翻译值
			if (!xx.isEmpty(ids)) {
				sql.append(" and ").append(pk);
				sql.append(" in(");
				// 根据当前页数据value列查询外表name列
				for (String id : ids) {
					// TODO There might be a SQL injection risk warning
					sql.append(xx.format(id)).append(",");
				}
				sql.deleteCharAt(sql.length() - 1);
				sql.append(")");
			}
			
			List<Record> translates = Db.use(se.ds).find(sql.toString());

			// 翻译匹配项
			for (Record re : reList) {
				Object o = re.get(en);
				// 空字段无法翻译
				if (xx.isEmpty(o)) {
					re.set(en, "");
					continue;
				}
				
				String value = o.toString();
				
				String text = "";
				if (value.contains(",")) {
					// 多值
					for(String val : value.split(",")){
						text += translateValue(pk, cn, translates, val);
						text += ',';
					}
					text = xx.delEnd(text, ",");
				} else {
					text = translateValue(pk, cn, translates, value);
				}
				re.set(en, text);
			}
		}
	}

	/**
	 * 将value翻译text
	 * @param pk value
	 * @param cn text
	 * @param translates 字典集合
	 * @param re 待翻译对象
	 * @param value 
	 */
	public static String translateValue(String pk, String cn, List<Record> translates, String value) {
		for (Record r : translates) {
			// 翻译前的值(默认为第1列查询值)
			String key = r.get(pk).toString();
			// 翻译后的值(默认为第2列查询值)
			String name = r.get(cn).toString();
			if (value.equals(key)) {
				return name;
			}
		}
		return value;
	}

	/**
	 * 通过Form构建数据
	 * 
	 * @param c 控制器
	 * @param eis 对象属性
	 * @param record 主对象数据集
	 * @param pkName 主键字段名
	 * @return 其它对象数据集
	 */
	public static Map<String, Record> buildData(Controller c, List<MetaField> eis, Record record, String pkName, boolean isInsert) {
		Map<String, Record> reMap = new HashMap<String, Record>();
	
		// 获取字段当前的值
		for (MetaField item : eis) {
			// System.out.println(item.getEn() +'='+ c.getPara(item.getEn()));
			
			String type = item.getStr("type");// 控件类型
			String dataType = item.getStr("data_type");// 数据类型
			String key = item.getEn();// 字段名
			Object defaulter = DynamicParse.buildSql(item.getStr("defaulter"), c.getSessionAttr(EovaConst.USER));// 默认值
		
			// 获当前字段 Requset Parameter Value，禁用/隐藏=null,不填=""
			Object value = c.getPara(key);
			
			// 新增跳过自增长字段(新增时隐藏)
			if (value == null && type.equals(MetaField.TYPE_AUTO)) {
				continue;
			}

			// 值的预处理
			value = TemplateUtil.convertValue(item, value);

			//处理字符串的时间
            if (dataType.equals(MetaField.DATATYPE_STRING)&&MetaField.TYPE_TIME.equals(item.getStr("type"))) {
                value = cn.benma666.myutils.DateUtil.dateToStr14(value);
            }
			
			// 默认值处理
			if (dataType.equals(MetaField.DATATYPE_STRING)) {
				// 字符串为 null 并且存在默认值 使用之
				if (value == null && !xx.isEmpty(defaulter)) {
					value = defaulter;
				}
			} else {
				// 非字符串 为 null || "" 并且存在默认值 使用之
				if (xx.isEmpty(value) && !xx.isEmpty(defaulter)) {
					value = defaulter;
				}
				// 如果非string 类型字段，值为Empty(表单未填写)，强制 指定默认值 By Navicat
				if (value != null && value.equals("")) {
					if (dataType.equals(MetaField.DATATYPE_NUMBER)) {
						value = 0;
					} else if(dataType.equals(MetaField.DATATYPE_TIME)){
						value = "0000-00-00 00:00:00";
					}
				}
			}
	
			// 当前字段为空(禁用/隐藏/非字符并未填写 且没有默认值),说明不需要持久化，直接跳过
			if (value == null) {
				continue;
			}
			
			// 新增时，移除禁止新增的字段
			boolean isAdd = item.getBoolean("is_add");
			if (isInsert && !isAdd) {
				record.remove(key);
				continue;
			}
			// 更新时，移除禁止更新的字段
			boolean isUpdate = item.getBoolean("is_update");
			if (!isInsert && !isUpdate) {
				record.remove(key);
				continue;
			}
			
			// 当前字段的持久化对象
			String objectCode = item.getStr("po_code");
			// 当前字段的持久化关联字段
			if (!xx.isEmpty(objectCode)) {
				Record re = reMap.get(objectCode);
				if (re == null) {
					re = new Record();
				}
				re.set(key, value);
				reMap.put(objectCode, re);
				continue;
			}
			record.set(key, value);
		}
		return reMap;
	}

	/**
	 * 更新/插入 View
	 * 
	 * @param viewPkName 视图主键名
	 * @param reMap 视图对象集
	 * @param isUpdate 是否更新操作
	 */
	@SuppressWarnings("rawtypes")
	public static void operateView(String viewPkName, Map<String, Record> reMap, String operate) {
		// 主键值
		Object pkValue = null;
	
		// 获取主键值
		Iterator iter = reMap.entrySet().iterator();
		while (iter.hasNext()) {
			Map.Entry entry = (Map.Entry) iter.next();
			Record record = (Record) entry.getValue();
			// 如果当前对象存在主键字段，说明是主对象
			List cols = Arrays.asList(record.getColumnNames());
			if (cols.contains(viewPkName)) {
				pkValue = record.get(viewPkName);
			}
		}
	
		// 获取主对象
		iter = reMap.entrySet().iterator();
		while (iter.hasNext()) {
			Map.Entry entry = (Map.Entry) iter.next();
			Record record = (Record) entry.getValue();
	
			// 获取对象信息
			String objectCode = entry.getKey().toString();
			MetaObject eo = MetaObject.dao.getByCode(objectCode);
	
			// 设置主键值
			record.set(eo.getPk(), pkValue);
	
			if (operate.equals(TemplateConfig.UPDATE)) {
				// 更新
				Db.use(eo.getDs()).update(eo.getTable(), eo.getPk(), record);
			} else if (operate.equals(TemplateConfig.ADD)) {
				// 新增
				Db.use(eo.getDs()).save(eo.getTable(), eo.getPk(), record);
				// 新增之后产生主键值
				pkValue = record.get(eo.getPk());
			}
		}
	}

	/**
	 * 自动删除视图关联对象数据
	 * 
	 * @param objectCode 视图对象Code
	 * @param pkValue 删除选中值
	 */
	public static void deleteView(String objectCode, String pkValue) {
	
		// 查询视图所属包含的对象Code
		List<MetaField> poCodes = MetaField.dao.queryPoCodeByObjectCode(objectCode);
		for (MetaField x : poCodes) {
			// 获取持久化源对象Code
			String poCode = x.getStr("po_code");
			MetaObject eo = MetaObject.dao.getByCode(poCode);
			Db.use(eo.getDs()).deleteById(eo.getTable(), eo.getPk(), pkValue);
		}
	
	}
	
	/**
	 * 过滤指定查询条件
	 * @param where 查询条件Sql
	 * @param colName 要过滤的列名
	 * @return 过滤后的Sql
	 */
	public static String filterValueCondition(String where, String colName) {
		if (where.contains(colName)) {
		    where = where.replaceAll("( "+ colName +".*?)and", "");
		}
		return where;
	}
	
	/**
	 * 获取关联参数
	 * @param c
	 * @return
	 */
	public static Record getRef(Controller c){
		Record r = new Record();
		
		try {
			String ref = c.getPara("ref");
			if (xx.isEmpty(ref)) {
				return null;
			}
			String[] fields = ref.split(",");
			for(String field : fields){
				String[] strs = field.split(":");
				r.set(strs[0], strs[1]);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return r;
	}

	/**
	 * 构建关联参数值
	 * @param object
	 */
	public static void buildRef(Controller ctrl, MetaObject object) {
		for (MetaField ei : object.getFields()) {
			String key = ei.getEn();
			
			Record ref = getRef(ctrl);
			if (ref != null && !xx.isEmpty(ref.get(key))) {
				ei.put("value", ref.get(key));
				ei.put("is_disable", true);
			}
		}
	}
	
	public static void main(String[] args) {
		/*
		 * 清除value列查询条件，防止干扰翻译SQL条件
		 * 自定义SQL		eg. where uid = ${user.id} and type = 3
		 * 自动翻译SQL	eg. and uid in(1,2,3)
		 */
		// String where = "where uid = ${user.id} and type = 1 and state = 1";
		// String where = "where type = 2 and uid = ${user.id} and state = 2";
		String where = "where type = 3 and uid = ${user.id} and state = 3 and uid = 3 and uid in (1,2,3)";
		String pk = "uid";
		System.out.println(where);
		where = filterValueCondition(where, pk);
		System.out.println(where);
		
		// addwhere
		System.out.println(addWhere(new EovaExp("select * from users where 1=1"), "id = 1"));
		System.out.println(addWhere(new EovaExp("select id ID,name CN from users where a = 1"), "id = 1"));
	}
}