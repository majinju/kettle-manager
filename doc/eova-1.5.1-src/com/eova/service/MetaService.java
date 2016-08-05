/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.service;

import java.util.List;

import com.eova.common.base.BaseService;
import com.eova.model.MetaField;
import com.eova.model.MetaObject;

/**
 * 元数据服务
 *
 * @author Jieven
 * @date 2013-1-3
 */
public class MetaService extends BaseService {

	/**
	 * 获取元数据(对象和字段)
	 * @param objectCode
	 * @return
	 */
	public MetaObject getMeta(String objectCode) {
		MetaObject object = MetaObject.dao.getByCode(objectCode);
		List<MetaField> fields = MetaField.dao.queryByObjectCode(objectCode);
		object.setFields(fields);
		return object;
	}

}