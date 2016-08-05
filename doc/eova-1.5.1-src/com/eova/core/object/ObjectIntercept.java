/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.core.object;

import com.eova.aop.AopContext;
import com.eova.aop.MetaObjectIntercept;
import com.eova.model.MetaField;

public class ObjectIntercept extends MetaObjectIntercept {

	@Override
	public String deleteBefore(AopContext ac) throws Exception {
		Integer id = ac.record.getInt("id");
		// 删除对象关联元字段属性
		MetaField.dao.deleteByObjectId(id);
		// 删除对象关联的所有字典 慎重，会导致误删同表字段
		// String ds = ac.record.getStr("data_source");
		// String table = ac.record.getStr("table_name");
		// String dict = EovaConfig.props.get("main_dict_table");
		// Db.use(ds).update("delete from " + dict + " where object = ?", table);

		return null;
	}

}