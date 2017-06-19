/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.model;

import java.util.List;

import com.eova.common.base.BaseModel;
import com.eova.common.utils.xx;
import com.jfinal.plugin.activerecord.Db;

/**
 * 定时任务
 *
 * @author Jieven
 * @date 2014-9-10
 */
public class Task extends BaseModel<Task> {

	private static final long serialVersionUID = 4254060861819273244L;
	
	public static final Task dao = new Task();
	
	/** 暂停 **/
	public static final int STATE_STOP = 0;
	/** 运行 **/
	public static final int STATE_START = 1;
    /** 异常 **/
    public static final int STATE_EXCEPTION = 2;

	public List<Task> findAll(){
		return this.find("select * from eova_task");
	}
	
	public int updateState(int id, int state){
		return Db.use(xx.DS_EOVA).update("update eova_task set state = ? where id = ?", state, id);
	}
}