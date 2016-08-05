/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.beetl.format;

import org.beetl.core.Format;

import com.eova.common.utils.web.HtmlUtil;

public class XSSFormat implements Format {

	@Override
	public Object format(Object data, String pattern) {
		if (null == data) {
			return null;
		} else {
			String content = (String) data;
			// XSS简单过滤
			content = HtmlUtil.XSSEncode(content);
			return content;
		}
	}
}