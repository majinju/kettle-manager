package cn.benma666.common.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @Description: 日志辅助类
 *
 */
public class LogHelper {
	private static Log logger = LogFactory.getLog(LogHelper.class); 
	
	public static Log getLogger(){
		return logger;
	}
}
