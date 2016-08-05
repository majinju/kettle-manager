package com.eova.common.base;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

/**
 * 基础通用数据访问操作
 * @author Jieven
 *
 */
public class BaseService {

	/**
	 * 查询自动缓存
	 * @param sql
	 * @return
	 */
	public List<Record> queryByCache(String sql) {
		// 查询SQL作为Key值
		return Db.findByCache(BaseCache.SER, sql, sql);
	}

	/**
	 * 查询自动缓存
	 * @param sql
	 * @param paras
	 * @return
	 */
	public List<Record> queryByCache(String sql, Object... paras) {
		// sql_xx_xx_xx
		String key = sql;
		for (Object obj : paras) {
			sql += "_" + obj.toString();
		}
		return Db.findByCache(BaseCache.SER, key, sql, paras);
	}
	
	/**
	 * 字段数值+N
	 * @param table 表名
	 * @param field 字段名
	 * @param pk 主键名
	 * @param pkValue 主键值
	 * @param num 数值
	 * @return
	 */
	public int updateAddN(String table, String field, String pk, int pkValue, int num) {
		StringBuilder sb = new StringBuilder();
		sb.append("update ");
		sb.append(table);
		sb.append(" set ");
		sb.append(field);
		sb.append(" = ");
		sb.append(field);
		sb.append(" + ");
		sb.append(num);
		sb.append(" where ");
		sb.append(pk);
		sb.append(" = ");
		sb.append(pkValue);
		return Db.update(sb.toString());
	}

	/**
	 * 字段数值+1
	 * @param table 表名
	 * @param field 字段名
	 * @param pk 主键名
	 * @param pkValue 主键值
	 * @return
	 */
	public int updateAdd1(String table, String field, String pk, int pkValue){
		return updateAddN(table, field, pk, pkValue, 1);
	}
}
