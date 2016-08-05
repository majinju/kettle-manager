/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.model;

import java.util.List;

import com.eova.common.base.BaseModel;

/**
 * 控件
 * 
 * @author Jieven
 * @date 2014-9-10
 */
public class Widget extends BaseModel<Widget> {

	private static final long serialVersionUID = 4254060861819273244L;

	public static final Widget dao = new Widget();

	/** EOVA控件 **/
	public static final int TYPE_EOVA = 1;
	/** DIY控件 **/
	public static final int TYPE_DIY = 2;

	public List<Widget> findByType(int type) {
		return this.queryByCache("select * from eova_widget where type = ?", type);
	}
}