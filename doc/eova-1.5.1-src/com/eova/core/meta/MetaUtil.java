package com.eova.core.meta;

import com.eova.model.MetaField;

public class MetaUtil {

	/**
	 * 转换数据类型
	 * 
	 * @param typeName DB数据类型
	 * @return
	 */
	public static String getDataType(String typeName) {
		typeName = typeName.toLowerCase();
		if (typeName.contains("int") || typeName.contains("bit") || typeName.equals("number") || typeName.equals("double")  || typeName.equals("float") ) {
			return MetaField.DATATYPE_NUMBER;
		} else if (typeName.contains("time") || typeName.contains("date")) {
			return MetaField.DATATYPE_TIME;
		} else {
			return MetaField.DATATYPE_STRING;
		}
	}

	/**
	 * 获取表单类型
	 * 
	 * @param isAuto 是否自增
	 * @param typeName 类型
	 * @param size 长度
	 * @return
	 */
	public static String getFormType(boolean isAuto, String typeName, int size) {
		typeName = typeName.toLowerCase();
		if (typeName.contains("time") || typeName.contains("date")) {
			return MetaField.TYPE_TIME;
		} else if (isAuto) {
			return MetaField.TYPE_AUTO;
		} else if (size > 255) {
			return MetaField.TYPE_TEXTS;
		} else if (size > 500) {
			return MetaField.TYPE_EDIT;
		} else if (typeName.contains("int") && size == 1) {
			return MetaField.TYPE_CHECK;
		} else {
			// 默认都是文本框
			return MetaField.TYPE_TEXT;
		}
	}

}
