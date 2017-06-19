/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.engine;

import java.util.List;

import com.alibaba.druid.sql.ast.SQLExpr;
import com.alibaba.druid.sql.ast.SQLStatement;
import com.alibaba.druid.sql.ast.expr.SQLIdentifierExpr;
import com.alibaba.druid.sql.ast.expr.SQLPropertyExpr;
import com.alibaba.druid.sql.ast.statement.SQLSelect;
import com.alibaba.druid.sql.ast.statement.SQLSelectItem;
import com.alibaba.druid.sql.ast.statement.SQLSelectOrderByItem;
import com.alibaba.druid.sql.ast.statement.SQLSelectQueryBlock;
import com.alibaba.druid.sql.ast.statement.SQLSelectStatement;
import com.alibaba.druid.sql.dialect.mysql.ast.statement.MySqlSelectQueryBlock;
import com.alibaba.druid.sql.dialect.postgresql.ast.stmt.PGSelectQueryBlock;
import com.alibaba.druid.sql.parser.SQLParserUtils;
import com.alibaba.druid.sql.parser.SQLStatementParser;
import com.alibaba.druid.util.JdbcUtils;

/**
 * Druid SQL 解析器
 * @author Jieven
 *
 */
public class SqlParse {

	private String dbType;

	public List<SQLStatement> stmtList;
	public SQLSelectStatement selectStatement;
	public SQLSelect sqlselect;
	public SQLSelectQueryBlock query;

	public SqlParse() {
	}

	public SqlParse(String dbType, String sql) {
		this.dbType = dbType;

		SQLStatementParser parser = SQLParserUtils.createSQLStatementParser(sql, dbType);
		this.stmtList = parser.parseStatementList();
		this.selectStatement = (SQLSelectStatement) stmtList.get(0);
		this.sqlselect = selectStatement.getSelect();
		this.query = (SQLSelectQueryBlock) sqlselect.getQuery();
	}

	public List<SQLSelectItem> getSelectItem() {
		return query.getSelectList();
	}

	public List<SQLSelectOrderByItem> getOrderItem() {
		if (dbType.equals(JdbcUtils.MYSQL)) {
			MySqlSelectQueryBlock block = (MySqlSelectQueryBlock) query;
			if (block.getOrderBy() == null) {
				return null;
			}
			return block.getOrderBy().getItems();
		} else if (dbType.equals(JdbcUtils.ORACLE)) {
			if (sqlselect.getOrderBy() == null) {
				return null;
			}
			return sqlselect.getOrderBy().getItems();
		} else if (dbType.equals(JdbcUtils.POSTGRESQL)) {
			PGSelectQueryBlock block = (PGSelectQueryBlock) query;
			if (block.getOrderBy() == null) {
				return null;
			}
			return block.getOrderBy().getItems();
		} else {
			// SQL_SERVER
			if (sqlselect.getOrderBy() == null) {
				return null;
			}
			return sqlselect.getOrderBy().getItems();
		}
	}

	/**
	 *  获取表达式
	 * @param expr
	 * @return
	 */
	public static String getExprName(SQLExpr expr){
		if (expr instanceof SQLPropertyExpr) {
			return ((SQLPropertyExpr)expr).getName();
		} else if(expr instanceof SQLIdentifierExpr){
			return ((SQLIdentifierExpr)expr).getName();
		}
//		return "";
	    return expr.toString();
	}
	
	public static void main(String[] args) {

		System.out.println("------------mysql");
		print(JdbcUtils.MYSQL);
		System.out.println("------------ORACLE");
		print(JdbcUtils.ORACLE);
		System.out.println("------------POSTGRESQL");
		print(JdbcUtils.POSTGRESQL);
		System.out.println("------------SQL_SERVER");
		print(JdbcUtils.SQL_SERVER);
	}

	private static void print(String dbType) {
		String sql = "select t1.a 呵呵, t1.b , t2.c from t1 left join t2 where t1.id = t2.pid and a.id = 1 order by id,indexNum desc";

		SqlParse sp = new SqlParse(dbType, sql);
		System.out.println("select ");
		{
			List<SQLSelectItem> items = sp.getSelectItem();
			for (SQLSelectItem s : items) {
				// 没有别名
				// SQLIdentifierExpr exp = (SQLIdentifierExpr) x.getExpr();
				// 如果有 用了别名 才是此类型SQLPropertyExpr exp = (SQLPropertyExpr) x.getExpr();
				SQLPropertyExpr exp = (SQLPropertyExpr) s.getExpr();
				System.out.println(exp.getOwner().toString() + '.' + exp.getName() + ' ' + s.getAlias());
			}
		}

		System.out.println(" form " + sp.query.getFrom().toString());
		System.out.println(" where " + sp.query.getWhere().toString());

		System.out.println("order by ");

		{
			List<SQLSelectOrderByItem> items = sp.getOrderItem();
			for (SQLSelectOrderByItem s : items) {
				SQLIdentifierExpr exp = (SQLIdentifierExpr) s.getExpr();
				System.out.print(exp.getName() + ' ');
				if (s.getType() != null) {
					System.out.println(s.getType().name());
				}
			}
		}

		System.out.println();
	}

}