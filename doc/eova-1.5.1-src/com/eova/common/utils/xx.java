package com.eova.common.utils;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.alibaba.druid.util.JdbcUtils;
import com.eova.config.EovaConfig;

/**
 * What：高频常用方法集合<br>
 * Where：xx.xxx简短快捷的输入操作<br>
 * Why：整合高频常用方法,编码速度+50%,代码量-70%
 * @author Jieven
 * 
 */
public class xx {
	
	/**默认数据源名称**/
	public static final String DS_MAIN = "main";
	/**EOVA数据源名称**/
	public static final String DS_EOVA = "eova";
	
	/**
	 * 对象是否为空
	 * @param obj String,List,Map,Object[],int[],long[]
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public static boolean isEmpty(Object o) {
		if (o == null) {
			return true;
		}
		if (o instanceof String) {
			if (o.toString().trim().equals("")) {
				return true;
			}
		} else if (o instanceof List) {
			if (((List) o).size() == 0) {
				return true;
			}
		} else if (o instanceof Map) {
			if (((Map) o).size() == 0) {
				return true;
			}
		} else if (o instanceof Set) {
			if (((Set) o).size() == 0) {
				return true;
			}
		} else if (o instanceof Object[]) {
			if (((Object[]) o).length == 0) {
				return true;
			}
		} else if (o instanceof int[]) {
			if (((int[]) o).length == 0) {
				return true;
			}
		} else if (o instanceof long[]) {
			if (((long[]) o).length == 0) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 对象组中是否存在 Empty Object
	 * @param os 对象组
	 * @return
	 */
	public static boolean isOneEmpty(Object... os) {
		for (Object o : os) {
			if(isEmpty(o)){
				return true;
			}
		}
		return false;
	}

	/**
	 * 对象组中是否全是 Empty Object
	 * @param os
	 * @return
	 */
	public static boolean isAllEmpty(Object... os) {
		for (Object o : os) {
			if (!isEmpty(o)) {
				return false;
			}
		}
		return true;
	}
	
	/**
	 * 是否为数字
	 * @param obj
	 * @return
	 */
	public static boolean isNum(Object obj) {
		try {
			Integer.parseInt(obj.toString());
		} catch (Exception e) {
			return false;
		}
		return true;
	}
	
	/**
	 * 字符串是否为 true
	 * @param str
	 * @return
	 */
	public static boolean isFalse(Object str) {
		if (xx.isEmpty(str) || str.toString().trim().equalsIgnoreCase("false")) {
			return true;
		}
		return false;
	}

	/**
	 * 格式化字符串->'str'
	 * @param str
	 * @return
	 */
	public static String format(Object str) {
		return "'" + str.toString() + "'";
	}

	/**
	 * 强转->Integer
	 * @param obj
	 * @return
	 */
	public static int toInt(Object obj) {
		return Integer.parseInt(obj.toString());
	}

	/**
	 * 强转->Integer
	 * @param obj
	 * @param defaultValue
	 * @return
	 */
	public static int toInt(Object obj, int defaultValue) {
		if (isEmpty(obj)) {
			return defaultValue;
		}
		return toInt(obj);
	}

	/**
	 * 强转->Long
	 * @param obj
	 * @return
	 */
	public static long toLong(Object obj) {
		return Long.parseLong(obj.toString());
	}

	/**
	 * 强转->Long
	 * @param obj
	 * @param defaultValue
	 * @return
	 */
	public static long toLong(Object obj, long defaultValue) {
		if (isEmpty(obj)) {
			return defaultValue;
		}
		return toLong(obj);
	}

	/**
	 * 强转->Double
	 * @param obj
	 * @return
	 */
	public static double toDouble(Object obj) {
		return Double.parseDouble(obj.toString());
	}
	
	/**
	 * 强转->Boolean
	 * @param obj
	 * @return
	 */
	public static Boolean toBoolean(Object obj) {
		return Boolean.parseBoolean(obj.toString());
	}
	
	/**
	 * 强转->Boolean
	 * @param obj
	 * @param defaultValue
	 * @return
	 */
	public static Boolean toBoolean(Object obj, Boolean defaultValue) {
		if (isEmpty(obj)) {
			return defaultValue;
		}
		return toBoolean(obj);
	}
	
	/**
	 * 是否Oracle数据源
	 * @return
	 */
	public static boolean isOracle(){
		return EovaConfig.EOVA_DBTYPE.equals((JdbcUtils.ORACLE));
	}
	
	/**
	 * 是否Mysql数据源
	 * @return
	 */
	public static boolean isMysql(){
		return EovaConfig.EOVA_DBTYPE.equals((JdbcUtils.MYSQL));
	}
	
	/**
	 * Array转字符串(用指定符号分割)
	 * @param array
	 * @param sign
	 * @return
	 */
	public static String join(Object[] array, char sign) {
		if (array == null) {
			return null;
		}
		int arraySize = array.length;
		int bufSize = (arraySize == 0 ? 0 : ((array[0] == null ? 16 : array[0].toString().length()) + 1) * arraySize);
		StringBuilder sb = new StringBuilder(bufSize);

		for (int i = 0; i < arraySize; i++) {
			if (i > 0) {
				sb.append(sign);
			}
			if (array[i] != null) {
				sb.append(array[i]);
			}
		}
		return sb.toString();
	}
	
	/**
	 * 删除末尾字符串
	 * @param str 待处理字符串
	 * @param sign 需要删除的符号
	 * @return
	 */
	public static String delEnd(String str, String sign){
		if (str.endsWith(sign)) {
			return str.substring(0, str.lastIndexOf(sign));
		}
		return str;
	}
	
}