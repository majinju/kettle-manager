package com.eova.common.plugin.quartz;

import java.util.List;

import net.oschina.kettleutil.common.KuConst;

import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

import com.eova.model.Task;
import com.jfinal.kit.LogKit;
import com.jfinal.plugin.IPlugin;
import com.oss.job.AbsJob;

public class QuartzPlugin implements IPlugin {

	private SchedulerFactory sf = null;

	public static Scheduler scheduler = null;

	/**
	 * 启动Quartz
	 */
	@Override
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public boolean start() {
		// 创建调度工厂
		sf = new StdSchedulerFactory();

		try {
			scheduler = sf.getScheduler();

			List<Task> tasks = Task.dao.findAll();
			for (Task task : tasks) {
				String jobClassName = task.getStr("class");
				String jobCronExp = task.getStr("exp");
				int state = task.getInt("state");

				Class clazz;
				try {
                    clazz = Class.forName(jobClassName);
				} catch (ClassNotFoundException e) {
					throw new RuntimeException(e);
				}

				JobDetail job = JobBuilder.newJob(clazz).withIdentity(task.getStr(KuConst.FIELD_ID), jobClassName).build();
				job.getJobDataMap().put(AbsJob.TASK_KEY, task.toRecord());
				CronTrigger trigger = TriggerBuilder.newTrigger().withIdentity(task.getStr(KuConst.FIELD_ID), jobClassName).withSchedule(CronScheduleBuilder.cronSchedule(jobCronExp)).build();

				try {
					scheduler.scheduleJob(job, trigger);
					if (state == Task.STATE_STOP) {
						// 暂停触发
						scheduler.pauseTrigger(trigger.getKey());
					}
				} catch (SchedulerException e) {
					new RuntimeException(e);
				}

				LogKit.info(job.getKey() + " loading and exp: " + trigger.getCronExpression());
			}

			scheduler.start();

		} catch (SchedulerException e) {
			new RuntimeException(e);
		}

		return true;

	}

	/**
	 * 停止Quartz
	 */
	@Override
	public boolean stop() {
		try {
			scheduler.shutdown();
		} catch (SchedulerException e) {
			LogKit.error("shutdown error", e);
			return false;
		}
		return true;
	}

}