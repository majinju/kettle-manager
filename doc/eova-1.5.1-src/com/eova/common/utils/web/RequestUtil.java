package com.eova.common.utils.web;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.eova.common.utils.xx;

public class RequestUtil {

	/**
	* 从request中获得参数Map，并返回可读的Map
	* 
	* @param request
	* @return
	*/
	@SuppressWarnings({"unchecked", "rawtypes"})
	public static Map getParameterMap(HttpServletRequest request) {
		// 参数Map
		Map properties = request.getParameterMap();
		// 返回值Map
		Map returnMap = new HashMap();
		Iterator entries = properties.entrySet().iterator();
		Map.Entry entry;
		String name = "";
		String value = "";
		while (entries.hasNext()) {
			entry = (Map.Entry) entries.next();
			name = (String) entry.getKey();
			Object valueObj = entry.getValue();
			if (null == valueObj) {
				value = "";
			} else if (valueObj instanceof String[]) {
				String[] values = (String[]) valueObj;
				for (int i = 0; i < values.length; i++) {
					value = values[i] + ",";
				}
				value = value.substring(0, value.length() - 1);
			} else {
				value = valueObj.toString();
			}
			returnMap.put(name, value);
		}
		return returnMap;
	}

	/**
	 * 获取上一次访问URI
	 * @param request
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public static String getLastUrl(HttpServletRequest request, Map<String, String> noReturnMaping) {
		String url = request.getHeader("Referer");
		if (url == null) {
			// 默认跳首页
			return "/";
		}

		Iterator iter = noReturnMaping.entrySet().iterator();
		while (iter.hasNext()) {
			Map.Entry entry = (Map.Entry) iter.next();
			Object key = entry.getKey();
			Object val = entry.getValue();
			if (url.contains(key.toString())) {
				return val.toString();
			}
		}

		return url;
	}

	/**
	 * 获取上次URL
	 * @param request
	 * @return
	 */
	public static String getReferer(HttpServletRequest request){
		return request.getHeader("Referer");
	}
	
	/**
	 * 获取终端标识
	 * @param request
	 * @return
	 */
	public static String getUserAgent(HttpServletRequest request){
		if(xx.isEmpty(request.getHeader("User-Agent"))){
			return "";
		}
		return request.getHeader("User-Agent");
		
	}
	
	/**
	 * 获取Nginx代理转发IP
	 * @param request
	 * @return
	 */
	public static String getNginxProxyIp(HttpServletRequest request){
		return request.getHeader("X-Real-IP");
	}
	
	/**
	 * 获取客户端IP
	 * @param request
	 * @return
	 */
	public static String getIp(HttpServletRequest request){
		String ip = getNginxProxyIp(request);
		if (xx.isEmpty(ip)) {
			ip = request.getRemoteAddr(); 
		}
		return ip;
	}
}

