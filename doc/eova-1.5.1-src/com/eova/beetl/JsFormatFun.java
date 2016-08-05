/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.beetl;

import org.beetl.core.Context;
import org.beetl.core.Function;

import com.eova.common.utils.xx;

/**
 * JS 参数自动获取并处理默认值
 * 
 * @author Jieven
 * @date 2014-5-23
 */
public class JsFormatFun implements Function {
	@Override
	public Object call(Object[] paras, Context ctx) {
		if (paras.length != 1) {
			throw new RuntimeException("参数错误，期望Object");
		}
		Object obj = paras[0];
		if (xx.isEmpty(obj)) {
			return "undefined";
		}
		if (xx.isNum(obj)) {
			return obj.toString();
		}
		return xx.format(obj);
	}
}