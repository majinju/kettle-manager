package com.eova.common.utils.time;

import java.text.SimpleDateFormat;

/**
 * 格式化时间
 *
 * @author Jieven
 * @date 2013-10-21
 */
public class FormatUtil {

	public final static String YYYY = "yyyy";
	public final static String MM = "MM";
	public final static String DD = "dd";
	public final static String YYYY_MM_DD = "yyyy-MM-dd";
	public final static String YYYY_MM = "yyyy-MM";
	public final static String HH_MM_SS = "HH:mm:ss";
	public final static String YYYY_MM_DD_HH_MM_SS = "yyyy-MM-dd HH:mm:ss";

	/**
	 * 格式化Time为String
	 * @param time 时间(Data/Timestamp)
	 * @param style 格式
	 * @return
	 */
	public static String format(Object time, String style) {
		return new SimpleDateFormat(style).format(time);
	}
	
	/**
	 * 格式化当前时间
	 * @param style 格式
	 * @return
	 */
	public static String formatNow(String style) {
		return new SimpleDateFormat(style).format(System.currentTimeMillis());
	}
	
	public static void main(String[] args) {
		{
			String s = format(TimestampUtil.getNow(), YYYY_MM_DD);
			System.out.println(s);
		}
		{
			String s = format(DateUtil.getCurrDate(), YYYY_MM_DD);
			System.out.println(s);
		}
		{
			String s = formatNow(YYYY_MM_DD);
			System.out.println(s);
		}
	}
}
