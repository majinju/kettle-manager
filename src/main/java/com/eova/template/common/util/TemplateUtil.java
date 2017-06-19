/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.template.common.util;

import com.eova.common.utils.xx;
import com.eova.common.utils.util.ExceptionUtil;
import com.eova.model.MetaField;

public class TemplateUtil {

	/**
	 * 值的类型转换
	 * 
	 * @param item 元字段
	 * @param value
	 * @return
	 */
	public static Object convertValue(MetaField item, Object value) {
		// 控件类型
		String type = item.getStr("type");
		// 数据类型
		// String dataType = item.getStr("data_type");
		// 复选框需要特转换值
		if (type.equals(MetaField.TYPE_CHECK)) {
			if (xx.isEmpty(value) || xx.isFalse(value)) {
				return "0";
			} else {
				return "1";
			}
		}

		// Oracle Date格式化
		if (xx.isOracle()) {
			if (!xx.isEmpty(value)) {
				if (item.getStr("data_type").equals(MetaField.DATATYPE_STRING)
						&&type.equals(MetaField.TYPE_TIME)) {
			        value = value.toString();
			    } else if (type.equals(MetaField.TYPE_TIME)) {
					value = java.sql.Timestamp.valueOf(value.toString());
				} else if(type.equals(MetaField.TYPE_DATE)){
					value = java.sql.Date.valueOf(value.toString());
				}
			}
		}
		return value;
	}

	/**
	 * 构建异常信息为HTML
	 * 
	 * @param e
	 * @return
	 */
	public static String buildException(Exception e) {
		e.printStackTrace();
		
		String type = e.getClass().getName();
		type = type.replace("java.lang.", "");
		return "<p title=\"" + ExceptionUtil.getStackTrace(e) + "\">" + type + ":" + e.getMessage() + "</p>";
	}

	/**
	 * 初始化业务拦截器
	 * 
	 * @param bizIntercept
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static <T> T initIntercept(String bizIntercept) {
		if (!xx.isEmpty(bizIntercept)) {
			try {
				// 实例化自定义拦截器
				return (T) Class.forName(bizIntercept).newInstance();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}