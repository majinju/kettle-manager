/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.beetl;

import org.beetl.core.Context;
import org.beetl.core.Function;

/**
 * 自定判断是否为True
 * 
 * @author Jieven
 * @date 2014-5-23
 */
public class IsTrueFun implements Function {
	public Object call(Object[] paras, Context ctx) {
		if (paras.length != 1) {
			throw new RuntimeException("参数错误，期望Object");
		}
		Object para = paras[0];
		if (para == null) {
			return false;
		}
		if (para.toString().equalsIgnoreCase("true")) {
			return true;
		}
		if (para.toString().equals("1")) {
			return true;
		}
		return false;
	}
}