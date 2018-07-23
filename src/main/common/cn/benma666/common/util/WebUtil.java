package cn.benma666.common.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.Assert;

import cn.benma666.myutils.PageInfo;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

public class WebUtil {
	/**
	 * 文件
	 */
	public static final String CONTENTTYPE_APPLICATION_STREAM = "application/octet-stream";
	public static final String CONTENTTYPE_APPLICATION_EXCEL = "application/vnd.ms-excel";
	public static final String CONTENTTYPE_TEXTHTML = "text/html";
	public static final String CONTENTTYPE_TEXTJSON = "text/json";
	public static final String CONTENTTYPE_TEXTXML = "text/xml";
	
	public static final String CONTENT_CHARSET_GBK = "GBK";
	public static final String CONTENT_CHARSET_GB2312 = "GB2312";
	public static final String CONTENT_CHARSET_UTF8 = "UTF-8";

	public static void sendJson(HttpServletResponse response, String s) {
		sendDirectToClient(response,s,CONTENTTYPE_TEXTJSON,CONTENT_CHARSET_UTF8);
	}
    public static void sendJson(HttpServletResponse response, Object o) {
        sendDirectToClient(response,JSON.toJSONString(o),CONTENTTYPE_TEXTJSON,CONTENT_CHARSET_UTF8);
    }
    public static void sendPage(HttpServletResponse response, PageInfo<?> page) {
        sendDirectToClient(response,JSON.toJSONString(page, SerializerFeature.WriteMapNullValue),
                CONTENTTYPE_TEXTJSON,CONTENT_CHARSET_UTF8);
    }
	
	public static void sendDirectToClient(HttpServletResponse resp, String s, String contentType, String charset) {
		Assert.notNull(resp);

		String charsetPrefix = ";charset=";
		String contentHead = contentType + charsetPrefix + charset;
		resp.setContentType(contentHead);
		try {
			PrintWriter writer = resp.getWriter();
			writer.write(s);
			writer.flush();
		} catch (IOException e) {
			LogHelper.getLogger().error("像前端发送数据失败", e);
		}
	}
	/**
	 * 从磁盘上下载所需的文件信息
	 * @param wjmc 修改后的文件名称
	 * @param resp 响应信息
	 */
	public static void sendBytes(HttpServletResponse resp, byte[] data, String wjmc) {
		Assert.notNull(resp);

		String charsetPrefix = ";charset=";
		String contentHead = CONTENTTYPE_APPLICATION_STREAM + charsetPrefix + CONTENT_CHARSET_GBK;
		resp.setContentType(contentHead);
		ServletOutputStream so = null;
		try {
			// 声明比特数组
			resp.setContentLength(data.length);
			// 设置编码
			resp.setHeader("Content-Disposition", "attachment;filename="
					+ new String(wjmc.getBytes("GBK"), "iso-8859-1"));
			so = resp.getOutputStream();
			so.write(data);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭输出流
			try {
				so.flush();
				so.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * 从磁盘上下载所需的文件信息
	 * @param file 文件的信息
	 * @param wjmc 修改后的文件名称
	 * @param resp 响应信息
	 */
	public static void sendFile(HttpServletResponse resp, String data, String wjmc) {
		sendBytes(resp, data.getBytes(), wjmc);
	}

	/**
	 * 从磁盘上下载所需的文件信息
	 * @param file 文件的信息
	 * @param wjmc 修改后的文件名称
	 * @param resp 响应信息
	 */
	public static void sendFile(HttpServletResponse resp,File file, String wjmc) {
		byte[] bFile = new byte[(int) file.length()];
		FileInputStream fin = null;
		try {
			// 设置编码
			resp.setHeader("Content-Disposition", "attachment;filename="
					+ new String(wjmc.getBytes("GBK"), "iso-8859-1"));
			fin = new FileInputStream(file);
			// 写入比特数组中
			fin.read(bFile);

		} catch (Exception e) {
			LogHelper.getLogger().error("像前端发送数据失败", e);
		} finally {
			// 关闭输入流
			if (fin != null) {
				try {
					fin.close();
				} catch (Exception e) {
					LogHelper.getLogger().error("像前端发送数据失败", e);
				}
			}
		}
		sendBytes(resp, bFile, wjmc);
	}

	/**
	* @Description: 获取HTTP请求的string类型参数值 
	* @param  request  
	* @param  name     参数名
	* @param  dval     默认赋值
	* @return String
	* @throws
	 */
	public static String getString(HttpServletRequest request, String name, String dval) {
		String value = getRequestValue(request, name);
		if (value == null) {
			value = dval;
		}
		if (value != null) {
			value = value.trim();
		}
		return value;
	}

	/**
	* @Description: 获取HTTP请求的boolean类型参数值  
	* @param  request
	* @param  name    参数名
	* @param  dval    默认赋值
	* @return boolean
	* @throws
	 */
	public static boolean getBoolean(HttpServletRequest request, String name, boolean dval) {
		String value = getRequestValue(request, name);
		boolean res = false;
		if (value != null) {
			if ("true".equals(value) || "yes".equals(value)) {
				res = true;
			}
		} else {
			res = dval;
		}
		return (res);
	}
    
	/**
	* @Description: 获取HTTP请求的int类型参数值   
	* @param request
	* @param name   参数名
	* @param dval   默认赋值
	* @return int
	 */
	public static int getInt(HttpServletRequest request, String name, int dval) {
		String value = getRequestValue(request, name);
		int res = 0;
		if (value != null) {
			try {
				res = Integer.parseInt(value);
			} catch (Exception e) {
				res = dval;
			}
		} else {
			res = dval;
		}
		return res;
	}
    
	/** 
	* @Description: 获取HTTP请求的long类型参数值 
	* @param  request
	* @param  name   参数名
	* @param  dval   默认赋值
	* @return long
	 */
	public static long getLong(HttpServletRequest request, String name, long dval) {
		String value = getRequestValue(request, name);
		long res = 0;
		if (value != null) {
			try {
				res = Long.parseLong(value);
			} catch (Exception e) {
				res = dval;
			}
		} else {
			res = dval;
		}
		return res;
	}
    
	/**
	* @Description:   获取HTTP请求的double类型参数值  
	* @param  request
	* @param  name    参数名
	* @param  dval    默认赋值
	* @return double
	 */
	public static double getDouble(HttpServletRequest request, String name, double dval) {
		String value = getRequestValue(request, name);
		double res = 0.0;
		if (value != null) {
			try {
				res = Double.parseDouble(value);
			} catch (Exception e) {
				res = dval;
			}
		} else {
			res = dval;
		}
		return res;
	}
    
	/**
	* @Description:   获取HTTP请求的float类型参数值  
	* @param  request
	* @param  name    参数名
	* @param  dval    默认赋值
	* @return double
	 */
	public static float getFloat(HttpServletRequest request, String name, float dval) {
		String value = getRequestValue(request, name);
		float res = 0;
		if (value != null) {
			try {
				res = Float.parseFloat(value);
			} catch (Exception e) {
				res = dval;
			}
		} else {
			res = dval;
		}
		return res;
	}

	private static String getRequestValue(HttpServletRequest request, String name) {

		String value = null;
		try {
			value = request.getParameter(name);
		} catch (Exception e) {
			value = null;
		}
		return (value);
	}

	public static String getBasePath(HttpServletRequest request) {
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
				+ "/";
		return basePath;
	}

	/**
	 * 获取IP
	 * 
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	/**
	 * 去除null
	 * 
	 * @param args
	 *            多个参数 例如： String s1,String s2........等
	 * @return
	 * @date 2014-4-26
	 */
	public static Object[] removeNUll(Object... args) {
		for (int i = 0, j = args.length; i < j; i++) {
			if (args[i] == null) {
				args[i] = "";
			}
		}
		return args;
	}

	public static Double getTimeToDouble(Date t) {
		if (t == null)
			return null;
		DateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		return Double.parseDouble(format.format(t));
	}

}