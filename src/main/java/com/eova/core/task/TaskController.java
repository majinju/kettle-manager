/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.core.task;

import net.oschina.kettleutil.common.KuConst;

import org.quartz.JobKey;

import com.eova.common.Easy;
import com.eova.common.plugin.quartz.QuartzPlugin;
import com.eova.model.Task;
import com.jfinal.core.Controller;
import com.oss.job.AbsJob;

/**
 * 定时任务
 * 
 * @author Jieven
 * 
 */
public class TaskController extends Controller {

	// 启动任务
	public void start() {
		int id = getParaToInt(0);

		Task task = Task.dao.findById(id);

		try {
			String className = task.getStr("class");

			// 恢复任务
			JobKey jobKey = JobKey.jobKey(
			        task.getStr(KuConst.FIELD_ID), className);
//			jobKey.
			QuartzPlugin.scheduler.resumeJob(jobKey);

			Task.dao.updateState(id, Task.STATE_START);
		} catch (Exception e) {
			e.printStackTrace();
			renderJson(new Easy("任务启动失败！"));
		}

		renderJson(new Easy());
	}

	// 暂停任务
	public void stop() {
		int id = getParaToInt(0);

		Task task = Task.dao.findById(id);

		try {
			String className = task.getStr("class");

			// 暂停任务
			JobKey jobKey = JobKey.jobKey(
                    task.getStr(KuConst.FIELD_ID), className);
			QuartzPlugin.scheduler.pauseJob(jobKey);

			Task.dao.updateState(id, Task.STATE_STOP);
		} catch (Exception e) {
			e.printStackTrace();
			renderJson(new Easy("任务停止失败！"));
		}

		renderJson(new Easy());
	}

	// 立即运行一次任务
	public void trigger() {
		int id = getParaToInt(0);

		Task task = Task.dao.findById(id);

		try {
			String className = task.getStr("class");

			// 立即触发一次
			JobKey jobKey = JobKey.jobKey(
                    task.getStr(KuConst.FIELD_ID), className);
			QuartzPlugin.scheduler.triggerJob(jobKey);

		} catch (Exception e) {
			e.printStackTrace();
			renderJson(new Easy("任务停止失败！"));
		}

		renderJson(new Easy());
	}
    /**
    * 获取默认配置信息 <br/>
    * @author jingma
    * @throws Exception
    */
    public void getDefaultConfig() throws Exception{
        String className = getPara("class_name");
        //实例化配置的类，获取输出字段
        try {
            AbsJob aj = (AbsJob) Class.forName(className).newInstance();
            renderJson(new Easy(aj.getDefaultConfigInfo(),true));
        } catch (ClassNotFoundException e) {
            renderJson(new Easy("你输入的类不存在"));
        } catch (Exception e) {
            e.printStackTrace();
            renderJson(new Easy("获取默认配置失败："+e.getMessage()));
        }
    }

}