/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.core.task;

import net.oschina.kettleutil.common.KuConst;

import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.TriggerBuilder;
import org.quartz.TriggerKey;

import com.eova.aop.AopContext;
import com.eova.aop.MetaObjectIntercept;
import com.eova.common.plugin.quartz.QuartzPlugin;
import com.eova.common.utils.xx;
import com.eova.model.Task;
import com.oss.job.AbsJob;

public class TaskIntercept extends MetaObjectIntercept {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public String addAfter(AopContext ac) throws Exception {
		String className = ac.record.getStr("class");
		String exp = ac.record.getStr("exp");

		Class clazz = Class.forName(className);
		JobDetail job = JobBuilder.newJob(clazz).withIdentity(
		        ac.record.getStr(KuConst.FIELD_ID), className).build();
        job.getJobDataMap().put(AbsJob.TASK_KEY, ac.record);
		CronTrigger trigger = TriggerBuilder.newTrigger().withIdentity(
                ac.record.getStr(KuConst.FIELD_ID), className).withSchedule(CronScheduleBuilder.cronSchedule(exp)).build();
		// 新增任务
		QuartzPlugin.scheduler.scheduleJob(job, trigger);
		// 默认暂停
		QuartzPlugin.scheduler.pauseJob(job.getKey());
		
		return null;
	}

	@Override
	public String deleteAfter(AopContext ac) throws Exception {
		String className = ac.record.getStr("class");

		// 删除任务(自动删除关联触发器)
		JobKey jobKey = JobKey.jobKey(
                ac.record.getStr(KuConst.FIELD_ID), className);

		QuartzPlugin.scheduler.deleteJob(jobKey);
		
		return null;
	}

	@Override
	public String updateAfter(AopContext ac) throws Exception {
		String className = ac.record.getStr("class");
		String exp = ac.record.getStr("exp");

		// 表达式调度构建器
		CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(exp);

		// 重新构建触发器覆盖原触发器
		TriggerKey triggerKey = TriggerKey.triggerKey(
                ac.record.getStr(KuConst.FIELD_ID), className);
		CronTrigger trigger = (CronTrigger) QuartzPlugin.scheduler.getTrigger(triggerKey);
		trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();

		JobDetail job = QuartzPlugin.scheduler.getJobDetail(trigger.getJobKey());
		job.getJobDataMap().put(AbsJob.TASK_KEY, ac.record);
		QuartzPlugin.scheduler.addJob(job, true,true);
        // 重置任务
		QuartzPlugin.scheduler.rescheduleJob(triggerKey, trigger);
		// 暂停
		QuartzPlugin.scheduler.pauseTrigger(triggerKey);
		
		// 状态变更为暂停
		Task.dao.updateState(xx.toInt(ac.record.get("id")), Task.STATE_STOP);
		
		return null;
	}

	
	@Override
	public String addBefore(AopContext ac) throws Exception {
		String cs = ac.record.getStr("class");
		//支持同一个实现类多次使用，配置不同参数
//		boolean flag = Task.dao.isExist("select count(*) from eova_task where class = ?", cs);
//		if (flag) {
//			throw new Exception("Job实现类已经存在:" + cs);
//		}
        try {
            AbsJob job = (AbsJob) Class.forName(cs).newInstance();
            String confInfo = job.getDefaultConfigInfo();
            ac.record.set(AbsJob.CONFIG_INFO_KEY, confInfo);
        } catch (Exception e) {
            throw new Exception(cs+"实例化获取默认参数失败:" + e.getMessage());
        }
		return null;
	}
	
}