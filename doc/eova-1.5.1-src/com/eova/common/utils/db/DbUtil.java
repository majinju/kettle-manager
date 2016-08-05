package com.eova.common.utils.db;

import java.sql.Types;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.eova.common.utils.xx;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

public class DbUtil {

	/**
	 * 转换Oracle数据类型
	 * 
	 * @param typeName DB数据类型
	 * @return
	 */
	private static String convertDataType(String typeName) {
		if (typeName.contains("INT")) {
			return "NUMBER";
		} else if (typeName.contains("BIT")) {
			return "CHAR";
		} else if (typeName.indexOf("TIME") != -1) {
			return "DATE";
		} else {
			return "VARCHAR2";
		}
	}

	public static void createOracleSql(String ds, String tableNamePattern) {
		
		StringBuilder sbs = new StringBuilder();
		StringBuilder sbDrop = new StringBuilder();
		StringBuilder sbDropSeq = new StringBuilder();
		StringBuilder sbCreateSeq = new StringBuilder();
		
		List<String> tables = DsUtil.getTableNamesByConfigName(ds, DsUtil.TABLE, null, tableNamePattern);

		for (String table : tables) {

			String pk = DsUtil.getPkName(ds, table);
			
			String drop = "drop table " + table + ";\n";
			sbDrop.append(drop);
			
			String dropSeq = "drop sequence seq_" + table + ";\n";
			sbDropSeq.append(dropSeq);
			
			// 获取表中最大值
			String sql = "select max("+ pk +") from " + table;
			Object max = Db.use(ds).queryColumn(sql);
			if (xx.isEmpty(max)) {
				max = 0;
			}

			String createSeq = "create sequence seq_" + table + " increment by 1 start with "+ max + 1 +" maxvalue 9999999999;\n";
			sbCreateSeq.append(createSeq);

			JSONArray list = DsUtil.getColumnInfoByConfigName(ds, table);

			StringBuilder sb = new StringBuilder();
			StringBuilder sb2 = new StringBuilder();
			StringBuilder sb3 = new StringBuilder();

			// System.out.println(list);

			sb.append("create table " + table);
			sb.append("(\n");

			for (int i = 0; i < list.size(); i++) {
	            JSONObject o = list.getJSONObject(i);
	            
	            Record re = new Record();
				re.set("en", o.getString("COLUMN_NAME"));
				re.set("cn", o.getString("REMARKS"));
	            re.set("order_num", o.getIntValue("ORDINAL_POSITION"));
				re.set("is_required", "YES".equalsIgnoreCase(o.getString("IS_NULLABLE")) ? false : true);

				// 是否自增
				boolean isAuto = "YES".equalsIgnoreCase(o.getString("IS_AUTOINCREMENT")) ? true : false;
				re.set("is_auto", isAuto);
				// 字段类型
				String typeName = o.getString("TYPE_NAME");
				re.set("data_type", convertDataType(typeName));
				// 字段长度
				int size = o.getIntValue("COLUMN_SIZE");
				if(size == 0){
					size = 1;
				}
				// 默认值
				String def = o.getString("COLUMN_DEF");
				re.set("defaulter", def);

				String dataType = re.getStr("data_type");
				// create table
				sb.append("    " + re.getStr("en") + " " + dataType + (dataType.equals("DATE") ? "" : "(" + size + ")"));
				if (re.getBoolean("is_required")) {
					sb.append(" NOT NULL");
				}
				sb.append(",\n");

				// create remarks
				String remarks = o.getString("REMARKS");
				if (!xx.isEmpty(remarks)) {
					String str = "comment on column %s.%s is '%s';\n";
					sb2.append(String.format(str, table, re.getStr("en"), remarks));
				}

				// add default
				{
					if (!xx.isEmpty(def)) {
						String str = "alter table %s modify %s default %s;\n";
						sb3.append(String.format(str, table, re.getStr("en"), xx.format(def)));
					}

				}

	        }
			sb.delete(sb.length() - 2, sb.length() - 1);
			sb.append(");\n");
			
			// 导入元字段
			// importMetaField(code, list);

			// 导入视图默认第一列为主键
			String pkName = DsUtil.getPkName(ds, table);
			if (!xx.isEmpty(pkName)) {
				String str = "\nalter table %s add constraint pk_%s primary key(%s);\n";
				sb2.insert(0, String.format(str, table, table, pkName));
			}

			// 导入元对象
			// importMetaObject(ds, type, table, name, code, pkName);

			sbs.append(sb);
			sbs.append(sb2);
			sbs.append(sb3);
			sbs.append("\n");
		}

		System.out.println(sbDrop.toString());
		System.out.println(sbDropSeq.toString());
		System.out.println(sbCreateSeq.toString());
		System.out.println(sbs.toString());
	}

	/**
	 * 对Oracle部分类型做强转
	 * @param value
	 * @param type
	 * @return
	 */
	public static Object convertOracleValue(Object value, int type){
		String s = value.toString();
		if (type == Types.NUMERIC) {
			if (s.contains(".")) {
				return Double.valueOf(s);
			}
			if (s.length() > 11) {
				return Long.valueOf(s);
			}
			if (s.length() <= 11) {
				return Integer.valueOf(s);
			}
		}
		if (type == Types.CHAR) {
			if (s.equals("1")) {
				return Boolean.TRUE;
			} else {
				return Boolean.FALSE;
			}
		}
		return value;
	}
	
	/**
	 * 格式化Oracle Date
	 * @param value
	 * @return
	 */
	public static String buildDateValue(Object value){
		return "to_date('"+ value +"','yyyy-mm-dd HH24:MI:SS')";
	}
	
	/**
	 * 将数据变成Mysql插入脚本
	 * @param list 待生成数据集
	 * @param table 表名
	 * @param auto 自增列
	 * @param sb
	 */
	public static void generateSql(List<Record> list, String table, String auto, StringBuilder sb) {
		for (Record r : list) {
			sb.append("INSERT INTO "+ table +" (");
			String[] names = r.getColumnNames();
			for (String n : names) {
				if (n.equals(auto)) {
					continue;
				}
				sb.append(format(n));
				sb.append(',');
			}
			sb.deleteCharAt(sb.length() - 1);
			sb.append(")  VALUES (");
			for (String n : names) {
				if (n.equals(auto)) {
					continue;
				}
				sb.append(formatVal(r.get(n)));
				sb.append(',');
			}
			sb.deleteCharAt(sb.length() - 1);
			sb.append(");");
			sb.append("\n");
		}
	}
	
	public static String format(String name){
		return '`' + name + '`';
	}
	
	public static Object formatVal(Object o){
		if (o == null) {
			return o;
		}
		if (o.toString().equals("true")) {
			return 1;
		}
		if (o.toString().equals("false")) {
			return 0;
		}
		return xx.format(o);
	}
	
	/**
	 * 格式化SQL去除各种拼接逻辑产生的无意义字符
	 * @param sql
	 */
	public static String formatSql(String sql) {
		sql = sql.replace("  ", " ");
		sql = sql.replace(" where 1=1 and ", " where ");
		sql = sql.replace(" where 1=1 order ", " order ");
		if (sql.endsWith(" where 1=1 ")) {
			sql = sql.replace(" where 1=1 ", "");
		}
		return sql;
	}
}
