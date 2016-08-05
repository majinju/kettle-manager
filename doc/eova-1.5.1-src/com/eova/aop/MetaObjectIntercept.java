/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.aop;


/**
 * 元对象业务拦截器<br>
 * 前置任务和后置任务(事务未提交)
 * 成功之后(事务已提交)
 * 
 * @author Jieven
 * @date 2014-8-29
 */
public class MetaObjectIntercept {

	/**
	 * 查询前置任务(DIY复杂查询条件)
	 * @throws Exception 
	 * 
	 */
	public void queryBefore(AopContext ac) throws Exception {
	}
	
	/**
	 * 查询后置任务
	 * 
	 * <br>records 查询的分页数据集
	 * 
	 */
	public void queryAfter(AopContext ac) throws Exception {
	}
	
	/**
	 * 新增页初始化
	 * 
	 * <br>object 当前操作元对象
	 * 
	 * @throws Exception
	 */
	public void addInit(AopContext ac) throws Exception {
	}
	
	/**
	 * 新增前置任务(事务内)
	 * 
	 * <br>record 当前操作数据
	 * @return TODO
	 * 
	 * @throws Exception
	 */
	public String addBefore(AopContext ac) throws Exception {
		return null;
	}

	/**
	 * 新增后置任务(事务内)
	 * 
	 * <br>record 当前操作数据
	 * 
	 * @throws Exception
	 */
	public String addAfter(AopContext ac) throws Exception {
		return null;
	}

	/**
	 * 新增成功之后(事务外)
	 * 
	 * <br>records 当前操作数据集
	 * 
	 * @throws Exception
	 */
	public String addSucceed(AopContext ac) throws Exception {
		return null;
	}

	/**
	 * 删除前置任务(事务内)
	 * 
	 * <br>record 当前操作数据(Form模式只有主键值)
	 * 
	 * @throws Exception
	 */
	public String deleteBefore(AopContext ac) throws Exception {
		return null;
	}

	/**
	 * 删除后置任务(事务内)
	 * 
	 * <br>record 当前操作数据(Form模式只有主键值)
	 * 
	 * @throws Exception
	 */
	public String deleteAfter(AopContext ac) throws Exception {
		return null;
	}

	/**
	 * 删除成功之后(事务外)
	 * 
	 * <br>records 当前操作数据集
	 * 
	 * @throws Exception
	 */
	public String deleteSucceed(AopContext ac) throws Exception {
		return null;
	}

	/**
	 * 修改页初始化
	 * 
	 * <br>object 当前操作元对象
	 * 
	 * @throws Exception
	 */
	public void updateInit(AopContext ac) throws Exception {
	}
	
	/**
	 * 更新前置任务(事务内)
	 * 
	 * <br>record 当前操作数据
	 * 
	 * @throws Exception
	 */
	public String updateBefore(AopContext ac) throws Exception {
		return null;
	}

	/**
	 * 更新后置任务(事务内)
	 * 
	 * <br>record 当前操作数据
	 * 
	 * @throws Exception
	 */
	public String updateAfter(AopContext ac) throws Exception {
		return null;
	}

	/**
	 * 更新成功之后(事务外)
	 * 
	 * <br>records 当前操作数据集
	 * 
	 * @throws Exception
	 */
	public String updateSucceed(AopContext ac) throws Exception {
		return null;
	}
	
}