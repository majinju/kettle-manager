package com.eova.common.utils.time;

import java.sql.Timestamp;
import java.util.Calendar;

/**
 * Timestamp Util
 * 
 * @author Jieven
 * @date 2013-5-5
 */
public class TimestampUtil {

	/**
	 * 获取当前时间
	 * @return
	 */
	public static Timestamp getNow() {
		return new Timestamp(System.currentTimeMillis());
	}

	/**
	 * 获取今天是第几周
	 * @return
	 */
	public static int getNowWeek(){
		return Calendar.getInstance().get(Calendar.WEEK_OF_YEAR);
	}
	
	/**
	 * 获取距当前时间之前第N天的时间点
	 * @param x 之前多少天
	 * @return
	 */
	public static Timestamp getBeforeDay(long x) {
		return new Timestamp(System.currentTimeMillis() - 1000 * 60 * 60 * 24 * x);
	}

	/**
	 * 获取距当前时间之前第N分钟的时间点
	 * @param x 之前多少分钟
	 * @return
	 */
	public static Timestamp getBeforeMin(long x) {
		return new Timestamp(System.currentTimeMillis() - 1000 * 60 * x);
	}

	/**
	 * 距当前xx天
	 * 
	 * @param timestamp
	 * @return
	 */
	public static int differDayByNow(Timestamp timestamp) {
		return (int) (differMsByNow(timestamp) / 1000 / 60 / 60 / 24);
	}

	/**
	 * 距当前xx时
	 * 
	 * @param timestamp
	 * @return
	 */
	public static int differHoursByNow(Timestamp timestamp) {
		return (int) (differMsByNow(timestamp) / 1000 / 60 / 60);
	}

	/**
	 * 距当前xx分
	 * 
	 * @param timestamp
	 * @return
	 */
	public static long differMinByNow(Timestamp timestamp) {
		return (int) (differMsByNow(timestamp) / 1000 / 60);
	}

	/**
	 * 距当前xx秒
	 * 
	 * @param timestamp
	 * @return
	 */
	public static long differSecByNow(Timestamp timestamp) {
		return differMsByNow(timestamp) / 1000;
	}

	/**
	 * 距当前xx毫秒
	 * @param timestamp
	 * @return
	 */
	public static long differMsByNow(Timestamp timestamp) {
		long now = System.currentTimeMillis();
		long time = timestamp.getTime();
		long diff = now - time;
		return diff;
	}

	/**
	 * 是否已经过期
	 * @param time
	 * @return
	 */
	public static boolean isOutTime(Timestamp time){
		Timestamp now = TimestampUtil.getNow();
		if(time.getTime() < now.getTime()){
			return true;
		}
		return false;
	}
}
