package com.eova.common.utils.io;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;

/**
 * 网络文件操作工具类
 * 
 * @author Jieven
 * 
 */
public class NetUtil {

	/**
	 * 异步从URL下载文件
	 * 
	 * @param url 目标URL
	 * @param file 输出文件
	 * @throws IOException
	 */
	public static void downloadAsync(String url, File file) throws IOException {
		InputStream inputStream = new URL(url).openStream();
		ReadableByteChannel rbc = Channels.newChannel(inputStream);
		FileOutputStream fos = new FileOutputStream(file);
		fos.getChannel().transferFrom(rbc, 0, 1 << 24);
	}

	/**
	 * 从URL下载文件
	 * 
	 * @param url 目标URL
	 * @param file 输出文件
	 * @throws IOException
	 */
	public static void download(String url, String path) {
		InputStream is = null;
		OutputStream os = null;
		try {
			is = new URL(url).openStream();
			byte[] bs = new byte[1024];
			int len;
			os = new FileOutputStream(path);
			while ((len = is.read(bs)) != -1) {
				os.write(bs, 0, len);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				is.close();
				os.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}
