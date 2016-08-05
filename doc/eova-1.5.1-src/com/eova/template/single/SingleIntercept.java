/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.template.single;

import com.eova.aop.AopContext;

/**
 * 单表模版业务拦截器<br>
 * 前置任务和后置任务(事务未提交)<br>
 * 成功之后(事务已提交)<br>
 * 
 * @author Jieven
 * @date 2014-8-29
 */
public class SingleIntercept {

	/**
	 * 导入前置任务(事务内)
	 * 
	 * @param ctrl 当前会话控制器
	 * @param records 当前操作数据
	 * @throws Exception
	 */
	public void importBefore(AopContext ac) throws Exception {
	}

	/**
	 * 导入后置任务(事务内)
	 * 
	 * @param ctrl 当前会话控制器
	 * @param records 当前操作数据
	 * @throws Exception
	 */
	public void importAfter(AopContext ac) throws Exception {
	}

	/**
	 * 导入成功之后(事务外)
	 * 
	 * @param ctrl 当前会话控制器
	 * @param records 当前操作数据
	 * @throws Exception
	 */
	public void importSucceed(AopContext ac) throws Exception {
	}
}