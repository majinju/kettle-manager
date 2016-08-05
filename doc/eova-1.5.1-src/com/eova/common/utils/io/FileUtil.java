package com.eova.common.utils.io;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

public class FileUtil {

	/** 允许上传的图片类型 **/
	public static final String IMG_TYPE = ".jpg|.gif|.png|.bmp";
	/** 允许上传的所有文件类型 **/
	public static final String ALL_TYPE = ".jpg|.jepg|.gif|.png|.bmp|.gz|.rar|.zip|.pdf|.txt|.swf|.mp3|.jar|.apk|.ipa";

	/**
	 * 根据操作系统自动格式化Path
	 * @param path
	 * @return
	 */
	public static String formatPath(String path) {
        if (path.contains("/")){
        	path = path.replace("/", File.separator);
        }
        if (path.contains("\\")){
        	path = path.replace("/", File.separator);
        }
        return path;
    } 
	
	/**
	 * 检测文件大小
	 * 
	 * @param file 文件
	 * @param size 限制大小
	 * @return true 超过限制
	 */
	public static boolean checkFileSize(File file, int kb) {
		long size = file.length();
		if (size > 1024 * kb) {
			return true;
		}
		return false;
	}

	/**
	 * 检查文件类型
	 * 
	 * @param 文件名
	 * @param isImg 是否检查图片
	 * @return true=后缀合法
	 * @throws
	 */
	public static boolean checkFileType(String fileName, boolean isImg) {
		String fileType = getFileType(fileName);
		if (isImg) {
			return IMG_TYPE.indexOf(fileType.toLowerCase()) != -1;
		} else {
			return ALL_TYPE.indexOf(fileType.toLowerCase()) != -1;
		}
	}

	/**
	 * 获取文件类型
	 * 
	 * @param fileName
	 * @throws
	 */
	public static String getFileType(String fileName) {
		return fileName.substring(fileName.lastIndexOf("."), fileName.length());
	}

	/**
	 * 文件是否存在
	 * 
	 * @param path
	 * @return
	 */
	public static boolean isExists(String path) {
		File file = new File(path);
		if (file.exists() && file.length() > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 目录是否存在
	 * 
	 * @param path
	 * @return
	 */
	public static boolean isDir(String path) {
		File file = new File(path);
		if (file.exists() && file.isDirectory()) {
			return true;
		}
		return false;
	}

	/**
	 * 删除文件
	 * 
	 * @param path
	 */
	public static void delete(String path) {
		delete(new File(path));
	}

	/**
	 * 删除文件
	 * 
	 * @param file
	 */
	public static void delete(File file) {
		if (file.exists()) {
			file.delete();
		}
	}

	/**
	 * 重命名文件
	 * 
	 * @param path
	 * @param toPath
	 * @throws Exception
	 */
	public static void rename(String path, String toPath) throws IOException {
		File toBeRenamed = new File(path);
		// 检查要重命名的文件是否存在，是否是文件
		if (!toBeRenamed.exists() || toBeRenamed.isDirectory()) {
			throw new IOException("File does not exist: " + path);
		}

		File newFile = new File(toPath);
		if (toBeRenamed.renameTo(newFile) == false) {
			throw new IOException("rename error");
		}
	}

	/**
	 * 获取目录下文件列表
	 * 
	 * @param path 目录URL
	 * @return
	 */
	public static File[] getFiles(String path) {
		File file = new File(path);
		if (file.exists()) {
			return file.listFiles();
		}
		return null;
	}

	/**
	 * 将文件转为属性
	 * 
	 * @param file
	 * @return
	 */
	public static Properties getProp(File file) {
		InputStream inputStream = null;
		try {
			inputStream = new FileInputStream(file);
			Properties properties = new Properties();
			properties.load(new InputStreamReader(inputStream, "UTF-8"));
			return properties;
		} catch (IOException e) {
			throw new RuntimeException("Error loading properties file.", e);
		} finally {
			if (inputStream != null)
				try {
					inputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
	}

	public static void main(String[] args) {
		{
			System.out.println(formatPath("C:\\static\\img" + "/product"));
			System.out.println(formatPath("C:/static/img" + "/product"));
			System.out.println(formatPath("home/static/img" + "/product"));
		}
	}
}
