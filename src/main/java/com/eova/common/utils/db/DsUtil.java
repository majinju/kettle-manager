package com.eova.common.utils.db;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import cn.benma666.myutils.StringUtil;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.eova.common.utils.xx;
import com.jfinal.plugin.activerecord.Config;
import com.jfinal.plugin.activerecord.DbKit;

/**
 * 数据源工具类
 * 
 * @author Jieven
 * @date 2015-6-27
 */
public class DsUtil {

	public static final String TABLE = "Table";
	public static final String VIEW = "View";

	/**
	 * 获得元数据对象
	 * 
	 * @param ds 数据源
	 * @param props 连接配置
	 * @return
	 */
	public static DatabaseMetaData getDatabaseMetaData(String ds, Properties props) {
		Connection conn = null;
		try {
			Config config = DbKit.getConfig(ds);
			if (config == null) {
				throw new SQLException(ds + " datasrouce can not get config");
			}
			conn = config.getDataSource().getConnection();
			// TODO Mysql Test is OK!
			if (props != null) {
				conn.setClientInfo(props);
			}
			DatabaseMetaData md = conn.getMetaData();
			return md;
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			closeConn(conn);
		}
	}

	public static DatabaseMetaData getDatabaseMetaData(String ds) {
		return getDatabaseMetaData(ds, null);
	}

	/**
	 * 获取数据源的数据库名
	 * 
	 * @param ds 数据源
	 * @return
	 */
	public static String getDbNameByConfigName(String ds) {
		String dbName = null;
		Connection conn = null;
		try {
			Config config = DbKit.getConfig(ds);
			if (config == null) {
				throw new SQLException(ds + " datasrouce can not get config");
			}
			conn = config.getConnection();
			dbName = conn.getCatalog();
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			closeConn(conn);
		}
		return dbName;
	}

	/**
	 * 获取数据源的用户名
	 * 
	 * @param ds 数据源
	 * @return
	 */
	public static String getUserNameByConfigName(String ds) {
		try {
			DatabaseMetaData databaseMetaData = getDatabaseMetaData(ds);
			return databaseMetaData.getUserName();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 获取数据源中表/视图的名字列表
	 * 
	 * @param ds 数据源
	 * @param type DsUtil.TABLE/VIEW
	 * @param schemaPattern TODO
	 * @param tableNamePattern TODO
	 * @return
	 */
	public static List<String> getTableNamesByConfigName(String ds, String type, String schemaPattern, String tableNamePattern) {

        if (StringUtil.isBlank(tableNamePattern)) {
			tableNamePattern = "%";
		}

		List<String> tables = new ArrayList<String>();
		ResultSet rs = null;
		try {
			DatabaseMetaData md = getDatabaseMetaData(ds);
			rs = md.getTables(null, schemaPattern, tableNamePattern, new String[] { type.toUpperCase() });
			while (rs.next()) {
				tables.add(rs.getString("TABLE_NAME"));
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			closeResultSet(rs);
		}
		return tables;
	}

	public static String getPkName(String ds, String table) {
		ResultSet rs = null;
		try {
			String schemaPattern = null;
			if (xx.isOracle()) {
				schemaPattern = getUserNameByConfigName(ds);
			}
			DatabaseMetaData md = getDatabaseMetaData(ds);
			rs = md.getPrimaryKeys(null, schemaPattern, table);
			while (rs.next()) {
				return rs.getString("COLUMN_NAME");
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			closeResultSet(rs);
		}
		return null;
	}

    /**
     * 获取数据源中元数据Column信息
     * 
     * @param ds 数据源
     * @param tableNamePattern 表名
     * @return
     */
    public static JSONArray getColumnInfoByConfigName(String ds, String tableNamePattern) {
        return getColumnInfoByConfigName(ds, tableNamePattern, null);
    }
	/**
	 * 获取数据源中元数据Column信息
	 * 
	 * @param ds 数据源
	 * @param tableNamePattern 表名
     * @param schema 模式名
	 * @return
	 */
	public static JSONArray getColumnInfoByConfigName(String ds, String tableNamePattern,String schema) {
		JSONArray array = new JSONArray();
		ResultSet rs = null;
		try {
			Properties props = null;
			if(xx.isMysql()){
				props = new Properties();
				props.setProperty("REMARKS", "true");// 获取注释
				props.setProperty("COLUMN_DEF", "true");// 获取默认值
			}
			DatabaseMetaData md = getDatabaseMetaData(ds, props);
			String schemaPattern = schema;
			if (StringUtil.isBlank(schemaPattern)&&xx.isOracle()) {
				schemaPattern = getUserNameByConfigName(ds);
			}
			rs = md.getColumns(null, schemaPattern, tableNamePattern, null);
			// 获取列数
			ResultSetMetaData metaData = rs.getMetaData();
			int columnCount = metaData.getColumnCount();
			// 遍历ResultSet中的每条数据
			while (rs.next()) {
//				System.out.println("Remarks: "+ rs.getObject(12));
				JSONObject json = new JSONObject();
				// 遍历每一列
				for (int i = 1; i <= columnCount; i++) {
					String columnName = metaData.getColumnLabel(i);
					String value = rs.getString(columnName);
					json.put(columnName, value);
				}
				array.add(json);
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			closeResultSet(rs);
		}
		return array;
	}

	private static void closeConn(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException ignore) {
			}
		}
	}

	private static void closeResultSet(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException ignore) {
			}
		}
	}
}
