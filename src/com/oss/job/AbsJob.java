package com.oss.job;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.jfinal.kit.LogKit;


/**
 * 抽象JOB父类
 * 
 * @author Jieven
 * @date 2014-7-10
 */
public abstract class AbsJob implements Job {


	/*
	 * SimpleDateFormat dimple = new SimpleDateFormat("yyyy-MM-dd "); String time = dimple.format(new Date()) ;
	 */
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		String name = this.getClass().getName();
		LogKit.info("Job Start:" + name);

		try {
			// 业务处理
			process(context);
		} catch (Exception e) {
			LogKit.info("业务执行异常：", e);
		}

		LogKit.info("Job End:" + name);
	}

	/**
	 * 业务处理
	 * 
	 * @param context JOB上下文
	 */
	protected abstract void process(JobExecutionContext context);
}
