/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.engine;

import java.util.ArrayList;
import java.util.List;

import com.alibaba.druid.sql.ast.expr.SQLIdentifierExpr;
import com.alibaba.druid.sql.ast.expr.SQLPropertyExpr;
import com.alibaba.druid.sql.ast.statement.SQLSelectItem;
import com.alibaba.druid.sql.ast.statement.SQLSelectOrderByItem;
import com.alibaba.druid.sql.ast.statement.SQLTableSource;
import com.eova.common.utils.xx;
import com.eova.config.EovaConfig;
import com.eova.model.MetaField;
import com.eova.model.MetaObject;

/**
 * Eova表达式解析器
 * @author Jieven
 *
 */
public class EovaExp {

	public String ds;
	public String sql;
	public String select;
	public String simpleSelect;
	public String from;
	public String where;
	public String order;
	public String pk;
	public String cn;

	protected SqlParse sp;

	public EovaExp() {
	}

	public EovaExp(String exp) {
		try {
			// 格式化
			exp = exp.trim();//.toLowerCase();

			// 拆分表达式
			if (!exp.contains(";")) {
				this.sql = exp;
				this.ds = xx.DS_MAIN;
			} else {
				String[] strs = exp.split(";");
				this.sql = strs[0];
				this.ds = strs[1].substring(3);
				// TODO 截取
			}

			// 初始化SQL解析器
			sp = new SqlParse(EovaConfig.EOVA_DBTYPE, sql);

			// 解析Sql
			initParse();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) throws Exception {
		// String exp =
		// "select g.id ID,g.name 昵称 from game g where 1=1 and id = 3 order by id ,indexNum desc;ds=main";
		String exp = "select id ID,nickname CN from users where <%if(user.id != 0){%> and id > ${user.id}<%}%> order by id desc";
//		String exp = "select id ID,name CN from region where lv = 1 order by id desc";
//		String exp = "select value ID,name CN from dicts where object = 'hotel' and field = 'state'";
		EovaExp se = new EovaExp(exp);
		System.out.println(se.sql);
		System.out.println(se.ds);
		System.out.println(se.simpleSelect);
		System.out.println(se.select);
		System.out.println(se.from);
		System.out.println(se.where);
		System.out.println(se.order);
		System.out.println(se.pk);
		System.out.println(se.cn);
	}

	public void initParse() {
		List<SQLSelectItem> items = sp.getSelectItem();
		try {
		    if(items.size()>=2){
	            // 第1列默认为主键
	            this.pk = SqlParse.getExprName(items.get(0).getExpr());
	            // 第2列默认为CN键
	            this.cn = SqlParse.getExprName(items.get(1).getExpr());
		    }
		} catch (Exception e) {
			e.printStackTrace();
		}
		buildSelect();
		buildSimpleSelect();
		buildFrom();
		buildWhere();
		buildOrder();
	}

	private void buildSelect() {
		this.select = "select "
				+ sp.getSelectItem().toString().replaceAll("\\[|\\]", "");
	}

	private void buildSimpleSelect() {
		StringBuilder sb = new StringBuilder("select ");
		for (SQLSelectItem item : sp.getSelectItem()) {
			sb.append(item.getExpr()).append(", ");
		}
		sb.delete(sb.length() - 2, sb.length() - 1);
		this.simpleSelect = sb.toString().trim();
	}

	private void buildFrom() {
		SQLTableSource ts = sp.query.getFrom();

		String s = " from " + ts.toString();

		this.from = formart(s);
	}

	private void buildWhere() {
		if (sp.query.getWhere() == null) {
			this.where = "";
			return;
		}
		String s = " where " + sp.query.getWhere();
		this.where = formart(s);
	}

	private void buildOrder() {
		StringBuilder sb = new StringBuilder(" order by ");

		List<SQLSelectOrderByItem> items = sp.getOrderItem();
		if (items == null) {
			return;
		}
		for (SQLSelectOrderByItem x : items) {
            if(x.getExpr() instanceof SQLPropertyExpr){
                SQLPropertyExpr expr = (SQLPropertyExpr) x.getExpr();
                sb.append(expr.toString());
            }else{
                SQLIdentifierExpr expr = (SQLIdentifierExpr) x.getExpr();
                sb.append(expr.toString());
            }
			if (x.getType() != null) {
				sb.append(' ' + x.getType().name());
			}
			sb.append(',');
		}
		sb.delete(sb.length() - 1, sb.length());

		this.order = sb.toString();
	}

	private static String formart(String str) {
		str = str.replaceAll("\t|\r|\n", " ");
		str = str.replaceAll("  ", " ");
		return str;
	}

	/**
	 * 构建元对象
	 * 
	 * @param exp
	 *            表达式
	 * @return
	 */
	public MetaObject getObject() {
		// 获取元对象模版
		MetaObject eo = MetaObject.dao.getTemplate();
		eo.put("data_source", ds);
		eo.put("name", "");
		// 获取第一的值作为主键
		eo.put("pk_name", pk);
		// 获取第二列的值作为CN
		eo.put("cn", cn);

		return eo;
	}

	/**
	 * 构建元字段属性
	 * 
	 * @param exp
	 *            表达式
	 * @return
	 */
	public List<MetaField> getFields() {

		// select id id,nickname 昵称,loginid 帐号 from eova_user where id = ?
		List<MetaField> fields = new ArrayList<MetaField>();
		int index = 0;
		List<SQLSelectItem> items = sp.getSelectItem();
		for (SQLSelectItem item : items) {
			index++;
			// 字段名->字段名
            String en = null;
            String owner = null;
            if(item.getExpr() instanceof SQLPropertyExpr){
                SQLPropertyExpr expr = (SQLPropertyExpr) item.getExpr();
                // 字段名->字段名
                en = expr.getName();
                owner =  ((SQLIdentifierExpr)expr.getOwner()).getName();
			}else{
			    SQLIdentifierExpr expr = (SQLIdentifierExpr) item.getExpr();
	            // 字段名->字段名
	            en = expr.toString();
                owner =  null;
			}

			// 字段别名->字段列名
			String cn = item.getAlias();

			// 首列之后的默认都可以查询
			boolean isQuery = true;
//			if (index == 1) {
//				isQuery = false;
//			}
			fields.add(buildItem(index, en, owner, cn, isQuery));
		}
		return fields;
	}

    /**
     * 手工组装字段元数据
     * 
     * @param index
     *            排序
     * @param en
     *            英文名
     * @param cn
     *            中文名
     * @param isQuery
     *            是否可查询
     * @return
     */
    public static MetaField buildItem(int index, String en, String cn,
            boolean isQuery) {
        return buildItem(index, en, null, cn, isQuery);
    }
	/**
	 * 手工组装字段元数据
	 * 
	 * @param index
	 *            排序
	 * @param en
	 *            英文名
     * @param owner
     *            所有者
	 * @param cn
	 *            中文名
	 * @param isQuery
	 *            是否可查询
	 * @return
	 */
	public static MetaField buildItem(int index, String en,String owner, String cn,
			boolean isQuery) {

		en = en.toLowerCase();
		// 获取元模版字段
		MetaField ei = MetaField.dao.getTemplate();
		ei.put("order_num", index);
		ei.put("en", en);
        ei.put("owner", owner);
		ei.put("cn", cn);
		ei.put("data_type", "string");
		ei.put("type", "文本框");
		ei.put("is_query", isQuery);
		ei.put("width", 180);
		
		return ei;
	}

}