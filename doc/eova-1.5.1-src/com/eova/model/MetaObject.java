/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.model;

import java.util.List;

import com.eova.common.base.BaseModel;
import com.eova.common.utils.xx;

public class MetaObject extends BaseModel<MetaObject> {

	private static final long serialVersionUID = 1635722346260249629L;

	public static final MetaObject dao = new MetaObject();
	
	private List<MetaField> fields;

	public List<MetaField> getFields() {
		return fields;
	}

	public void setFields(List<MetaField> fields) {
		this.fields = fields;
	}

	/**
	 * 获取数据源
	 * 
	 * @return
	 */
	public String getDs() {
		return this.getStr("data_source");
	}

	/**
	 * 获取table
	 * 
	 * @return
	 */
	public String getTable() {
		return this.getStr("table_name");
	}

	/**
	 * 获取主键名
	 * 
	 * @return
	 */
	public String getPk() {
		return this.getStr("pk_name");
	}

	/**
	 * 获取View(没有视图用Table)
	 * 
	 * @return
	 */
	public String getView() {
		String view = this.getStr("view_name");
		if (xx.isEmpty(view)) {
			view = getTable();
		}
		return view;
	}

	public String getBizIntercept(){
		 return this.getStr("biz_intercept");
	}
	
	/**
	 * 获取元对象数据模版(用于模拟元数据)
	 * @return
	 */
	public MetaObject getTemplate(){
		return this.queryFisrtByCache("select * from eova_object where id = 1");
	}
	
	/**
	 * 根据Code获得对象
	 * @param code 对象Code
	 * @return 对象
	 */
	public MetaObject getByCode(String code) {
		return MetaObject.dao.queryFisrtByCache("select * from eova_object where code = ?", code);
	}

	/**
	 * 是否存在查询条件
	 * @param objectCode
	 * @return
	 */
	public boolean isExistQuery(String objectCode){
		return MetaObject.dao.isExist("select count(*) from eova_field where is_query = 1 and object_code = ?", objectCode);
	}
}