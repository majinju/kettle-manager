package com.oss.job;

import org.quartz.JobExecutionContext;

/**
 * 每小时执行
 *
 * @author Jieven
 * @date 2014-7-7
 */
public class EveryHourJob extends AbsJob {

	@Override
	protected void process(JobExecutionContext context) {
		System.out.println("每小时任务");
	}

}
