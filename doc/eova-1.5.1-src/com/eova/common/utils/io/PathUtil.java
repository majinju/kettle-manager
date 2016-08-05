package com.eova.common.utils.io;

import java.io.FileOutputStream;

/**
 * 文件路径安全判断
 *
 * @author Jieven
 * @date 2014-5-12
 */
public class PathUtil {

	// /00字符截断上传漏洞 
	public static void main(String[] args) {
		try {
			// 带 /00字符 的非法文件名(WINDOWS平台不支持 带有/00字符的文件目录或者文件名字)
			String filePath = "c://webshell.jsp" + (char) 0 + ".jpg";
			System.out.println(filePath);
			// filePath = filter(filePath);
			// System.out.println(filePath);
			// 写入文件，会在C盘生成名为：webshell.jsp的文件,因为存在/00 .jsp后面的.jpg 被截断了
			FileOutputStream fos = new FileOutputStream(filePath);
			fos.write("hello".getBytes());
			fos.close();
			// 如上BUG会导致上传漏洞
		} catch (Exception e) {
			
		}
	}

	/**
	 * 上传文件名过滤
	 * @param fileName
	 * @return
	 * @throws Exception
	 */
	public static String filter(String fileName) throws Exception {
		// 非法字符过滤(包括/00文件截断)
		// \\jsp\\asp\\cer\\asa\\php\\jsp\\aspx\\cgi\\exe
		fileName = fileName.replaceAll("\\/|\\/|\\||:|\\?|\\*|\"|<|>|\\p{Cntrl}", "");
		return fileName;
	}
}
