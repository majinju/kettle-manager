/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.common;

/**
 * {"msg":"主键不可为空！","success":false}
 * @author Jieven
 *
 */
public class Easy {
	
	/**处理结果**/
	private boolean success = true;
	private String msg = "操作成功";
	
	/**
	 * 默认操作成功
	 */
	public Easy(){
		
	}
	
	/**
	 * 操作失败构造
	 * @param msg
	 */
	public Easy(String msg){
		this.msg = msg;
		this.success = false;
	}
	
	/**
	 * 自定义构造
	 * @param msg
	 * @param status
	 */
	public Easy(String msg, boolean status){
		this.msg = msg;
		this.success = status;
	}
	
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	/**
	 * 提示
	 * @param msg
	 * @return
	 */
	public static String info(String msg){
		return "info:" + msg;
	}
	
	/**
	 * 警告
	 * @param msg
	 * @return
	 */
	public static String warn(String msg){
		return "warn:" + msg;
	}
	
	/**
	 * 错误
	 * @param msg
	 * @return
	 */
	public static String error(String msg){
		return "error:" + msg;
	}
}