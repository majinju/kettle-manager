package com.oss.job;

import org.quartz.JobExecutionContext;

/**
 * 每分钟执行
 *
 * @author Jieven
 * @date 2014-7-7
 */
public class EveryMinJob extends AbsJob {

	@Override
	protected void process(JobExecutionContext context) {
		System.out.println("每分钟任务");
	}
}
