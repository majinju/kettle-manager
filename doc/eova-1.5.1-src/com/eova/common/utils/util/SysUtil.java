package com.eova.common.utils.util;

public class SysUtil {
	/**
	 * 是否为Windows系统
	 * 
	 * @return
	 */
	public static boolean isWindows() {
		String osName = System.getProperty("os.name");
		return osName.contains("Windows");
	}
}
