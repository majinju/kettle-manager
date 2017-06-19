/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.core.meta;

import java.util.ArrayList;
import java.util.List;

import net.oschina.kettleutil.common.KuConst;
import cn.benma666.myutils.StringUtil;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.eova.common.Easy;
import com.eova.common.utils.xx;
import com.eova.common.utils.db.DbUtil;
import com.eova.common.utils.db.DsUtil;
import com.eova.config.EovaConfig;
import com.eova.engine.EovaExp;
import com.eova.model.MetaField;
import com.eova.model.MetaObject;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.oss.common.Dict;

/**
 * 元数据相关获取
 * 
 * @author Jieven
 * 
 */
public class MetaController extends Controller {

	// 获取元对象
	public void object() {
		String code = getPara(0);
		MetaObject mo = MetaObject.dao.getByCode(code);
		renderJson(JsonKit.toJson(mo));
	}

	// 获取元字段集
	public void fields() {
		String code = getPara(0);
		List<MetaField> mfs = MetaField.dao.queryByObjectCode(code);
		// 获取Edit 控件类型
		for (MetaField item : mfs) {
			String type = item.getStr("type");
			String dataType = item.getStr("data_type");
			if (type.equals(MetaField.TYPE_CHECK)) {
				item.put("editor", "eovacheck");
			} else if (type.equals(MetaField.TYPE_COMBO)) {
				item.put("editor", "eovacombo");
			} else if (type.equals(MetaField.TYPE_FIND)) {
				item.put("editor", "eovafind");
			} else if (dataType.equals(MetaField.DATATYPE_TIME)) {
				item.put("editor", "eovatime");
			} else if (dataType.equals(MetaField.DATATYPE_STRING)
			        &&type.equals(MetaField.TYPE_TIME)) {
                item.put("editor", "eovatime");
            } else {
				item.put("editor", "eovatext");
			}
		}
		renderJson(JsonKit.toJson(mfs));
	}

	// 编辑元数据
	public void edit() {
		String objectCode = getPara(0);
		setAttr("objectCode", objectCode);
		render("/eova/meta/edit.html");
	}

	// 导入页面
	public void imports() {
		List<JSONObject> ds = Dict.dictList(KuConst.DICT_CATEGORY_DATABASE);
		setAttr("dataSources", ds);
		render("/eova/meta/import.html");
	}

	// 查找表结构表头
	public void find() {

		String ds = getPara(0);
		String type = getPara(1);
        String schema = getPara(2);
		// 根据表达式手工构建Eova_Object
		MetaObject eo = MetaObject.dao.getTemplate();
		eo.put("data_source", ds);
		// 第1列名
		eo.put("pk_name", "table_name");
		// 第2列名
		eo.put("cn", "table_name");

		// 根据表达式手工构建Eova_Item
		List<MetaField> eis = new ArrayList<MetaField>();
		eis.add(EovaExp.buildItem(1, "table_name", "编码", false));
		eis.add(EovaExp.buildItem(2, "table_name", "表名", true));

		setAttr("objectJson", JsonKit.toJson(eo));
		setAttr("fieldsJson", JsonKit.toJson(eis));
		setAttr("itemList", eis);

		String action = "/meta/findJson/" + ds + '-' + type;
		if(StringUtil.isNotBlank(schema)){
		    action += "-"+schema;
		}
		setAttr("action", action);
		setAttr("isPaging", false);

		render("/eova/widget/find/find.html");
	}

	// 查找表结构数据
	public void findJson() {

		// 获取数据库
		String ds = getPara(0);
		String type = getPara(1);
        String schema = getPara(2);

		// 用户过滤
		String schemaPattern = schema;
		// Oracle需要根据用户名过滤表
		if (StringUtil.isBlank(schemaPattern)&&xx.isOracle()) {
			schemaPattern = DsUtil.getUserNameByConfigName(ds);
		}
		if(StringUtil.isNotBlank(schemaPattern)){
		    schemaPattern = schemaPattern.toUpperCase();
		}

		// 表名过滤
		String tableNamePattern = getPara("query_table_name");
		if (!xx.isEmpty(tableNamePattern)) {
			tableNamePattern = "%" + tableNamePattern + "%";
		}

		List<String> tables = DsUtil.getTableNamesByConfigName(ds, type, schemaPattern, tableNamePattern);
		JSONArray tableArray = new JSONArray();
		for (String tableName : tables) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("table_name", tableName);
			tableArray.add(jsonObject);
		}
		// 将分页数据转换成JSON
		String json = JsonKit.toJson(tableArray);
		json = "{\"total\":" + tableArray.size() + ",\"rows\":" + json + "}";
		renderJson(json);
	}

	// 一键导入
	@Before(Tx.class)
	public void importAll() {
		
		if (!getPara(0,"").equals("eova")) {
			renderJson(new Easy("请输入校验码，防止误操作！！！！！"));
			return;
		}
		
		String ds = xx.DS_MAIN;
		String type = DsUtil.TABLE;

		// 获取所有表名
		List<String> tables = DsUtil.getTableNamesByConfigName(ds, type, null, null);

		for (String table : tables) {
			
//			if (!table.startsWith("yimei_finance")) {
//				continue;
//			}
			System.out.println(table);

			String name = table;
			String code = table;

			JSONArray list = DsUtil.getColumnInfoByConfigName(ds, table);
			System.out.println(list);

			// 导入元字段
			importMetaField(code, list, ds, table);

			// 导入视图默认第一列为主键
			String pkName = DsUtil.getPkName(ds, table);
			if (xx.isEmpty(pkName)) {
				pkName = list.getJSONObject(0).getString("COLUMN_NAME");
			}

			// 导入元对象
			importMetaObject(ds, type, table, name, code, pkName);
		}

		renderJson(new Easy());
	}

	// 导入元数据
	@Before(Tx.class)
	public void doImports() {

		String ds = getPara("ds");
		String type = getPara("type");
		String table = getPara("table");
		String name = getPara("name");
		String code = getPara("code");

		JSONArray list = DsUtil.getColumnInfoByConfigName(ds, table);
		System.out.println(list);

		// 导入元字段
		importMetaField(code, list, ds, table);

		// 导入视图默认第一列为主键
		String pkName = DsUtil.getPkName(ds, table);
		if (xx.isEmpty(pkName)) {
			pkName = list.getJSONObject(0).getString("COLUMN_NAME");
		}

		// 导入元对象
		importMetaObject(ds, type, table, name, code, pkName);

		renderJson(new Easy());
	}

	// 导出选中元数据
	public void doExport() {
		String ids = getPara(0);
		
		StringBuilder sb = new StringBuilder();
		
		String sql1 = "select * from eova_object where id in (" + ids + ")";
		List<Record> objects = Db.use(xx.DS_EOVA).find(sql1);
		DbUtil.generateSql(objects, "eova_object", "id", sb);
		
		sb.append("\n\n");
		
		String sql2 = "select * from eova_field where object_code in (select code from eova_object where id in (" + ids + "))";
		List<Record> fields = Db.use(xx.DS_EOVA).find(sql2);
		DbUtil.generateSql(fields, "eova_field", "id", sb);
		
		renderText(sb.toString());
	}
	
	
	/**
	 * 导入元字段
	 * @param code 对象编码
	 * @param list 字段元数据
	 * @param ds 数据源
	 * @param table 表名
	 */
	private void importMetaField(String code, JSONArray list, String ds, String table) {
		// 因为 Oralce 配置参数 DatabaseMetaData 无法获取注释，手工从表中查询字段注释
		List<Record> comments = null;
		if (xx.isOracle()) {
			// 获取用户名
			String userName = DsUtil.getUserNameByConfigName(ds);
			String sql = "select column_name,comments from all_col_comments where owner = ? and table_name = ?";
			comments = Db.use(ds).find(sql, userName, table);
		}
		for (int i = 0; i < list.size(); i++) {
			JSONObject o = list.getJSONObject(i);
			String en = o.getString("COLUMN_NAME").toLowerCase();

			// 自动根据注释解析列名和字典
			String remarks = buildRemarks(o.getString("REMARKS"), table, en);

			MetaField mi = new MetaField();
			mi.set("en", en);
			mi.set("cn", remarks);
			mi.set("order_num", o.getIntValue("ORDINAL_POSITION")*10);
			mi.set("is_required", "YES".equalsIgnoreCase(o.getString("IS_NULLABLE")) ? "0" : "1");

			// Oracle 导入注释 特殊处理
			if (comments != null) {
				for (Record x : comments) {
					if (mi.getEn().equals(x.getStr("column_name").toLowerCase())) {
						mi.set("cn", x.getStr("comments"));
						break;
					}
				}
			}

			// 是否自增
			boolean isAuto = "YES".equalsIgnoreCase(o.getString("IS_AUTOINCREMENT")) ? true : false;
			mi.set("is_auto", isAuto);
			// 字段类型
			String typeName = o.getString("TYPE_NAME");
			mi.set("data_type", MetaUtil.getDataType(typeName));
			// 字段长度
			int size = o.getIntValue("COLUMN_SIZE");
			// 默认值
			String def = o.getString("COLUMN_DEF");
			mi.set("defaulter", def);

			// 控件类型
			mi.set("type", MetaUtil.getFormType(isAuto, typeName, size));
			// 将注释作为CN,若为空使用EN
			if (xx.isEmpty(mi.getCn())) {
				mi.set("cn", mi.getEn());
			}

			// 默认值
			if (xx.isEmpty(mi.getStr("defaulter"))) {
				mi.set("defaulter", "");
			}
			// 对象编码
			mi.set("object_code", code);

			// 智能预处理数据
			MetaEngine.build(mi);
			
			mi.save();

		}
	}

	/**
	 * 自动根据注释解析列名和字典
	 * 
	 * @param remarks 注释
	 * @param table 表
	 * @param en 字段
	 * @return
	 */
	private String buildRemarks(String remarks, String table, String field) {
		// eg. 状态:1=上架，2=售罄,3=下架 ,4=过期
		String[] ss = null;
		try {
			// 获取第1项注释作为列名
			if (remarks.contains(":") || remarks.contains("：")) {
				ss = remarks.split(":|：");
			}
			if (xx.isEmpty(ss)) {
				return remarks;
			}
			remarks = ss[0];

			// 获取第2项注释作为字典
			if (ss.length > 1) {
				String ss1 = ss[1];
				// 如果没有=号 说明是其它描述eg. 原价:大于等于0
				if (ss1.contains("=")) {
					String[] dicts = ss1.split(",|，");
					for (String dict : dicts) {
						String[] sss = dict.split("=");
						String value = sss[0];
						String name = sss[1];

						// 保存字典
						Record r = new Record();
						r.set("value", value);
						r.set("name", name);
						r.set("name", name);
						r.set("object", table);
						r.set("field", field);
						r.set("ext", "");
						Db.save(EovaConfig.props.get("main_dict_table"), r);

						System.out.print(value + '-' + name + '|');
					}
				}
			}

			System.out.println(' ' + remarks);

		} catch (Exception e) {
			System.err.println("元字段备注预处理异常:" + remarks);
			e.printStackTrace();
		}

		return remarks;
	}

//	public static void main(String[] args) {
//		String s = new MetaController().buildRemarks("状态:1=上架，2=售罄,3=下架 ,4=过期", "eova_log", "type");
//	}

	// 导入元对象
	private void importMetaObject(String ds, String type, String table, String name, String code, String pkName) {
		MetaObject mo = new MetaObject();
		// 编码
		mo.set("code", code);
		// 名称
		mo.set("name", name);
		// 主键
		mo.set("pk_name", pkName.toLowerCase());
		// 数据源
		mo.set("data_source", ds);
		// 表或视图
		if (type.equalsIgnoreCase(DsUtil.TABLE)) {
			mo.set("table_name", table.toLowerCase());
		} else {
			mo.set("view_name", table.toLowerCase());
		}
		mo.save();
	}

	// 自动绑定所有字典
	public void autoExp(){
		List<Record> list = Db.find("SELECT DISTINCT(field),object FROM dicts");
		for(Record r : list){
			String object = r.getStr("object");
			String field = r.getStr("field");
			// 自动根据字典 将对应的字段 设置成 下拉框 并生成表达式
			String sql = "update eova_field set type = '下拉框',exp = ? where object_code = ? and en = ?";
			String exp = "select value ID,name CN from "+ EovaConfig.props.get("main_dict_table") +" where object = '"+ object +"' and field = '"+ field +"'";
			Db.use(xx.DS_EOVA).update(sql, exp, object, field);
		}
		renderJson(new Easy());
	}
}