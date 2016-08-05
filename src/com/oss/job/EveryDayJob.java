package com.oss.job;

import org.quartz.JobExecutionContext;

/**
 * 每天执行
 *
 * @author Jieven
 * @date 2014-7-7
 */
public class EveryDayJob extends AbsJob {

	@Override
	protected void process(JobExecutionContext context) {
		System.out.println("每日任务");
	}

}
