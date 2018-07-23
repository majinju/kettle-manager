package cn.benma666.common.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.security.MessageDigest;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.multipart.MultipartFile;

/**
* 文件处理工具类 <br/>
* date: 2015年10月8日 下午4:01:55 <br/>
* @author jingma
* @version 0.0.1
*/
public class FileUtil extends FileUtils {
	/**
	* 日志
	*/
	private static Log log = LogFactory.getLog(FileUtil.class);

	/**
	 * 保存文件的信息到磁盘中
	 * @param nfile 文件信息
	 * @param file 需要保存的信息
	 */
	public static boolean saveFileToDisk(File nfile, MultipartFile file) {
		try {
			//文件夹不存在则自动创建文件夹
			nfile.mkdirs();
			file.transferTo(nfile);
			return true;
		} catch (Exception e) {
			log.error("上传的文件保存失败："+nfile.getAbsolutePath(), e);
			return false;
		}
	}
	/**
	 * 从磁盘上下载所需的文件信息
	 * @param file 文件的信息
	 * @param wjmc 修改后的文件名称
	 * @param resp 响应信息
	 */
	public static void downLoadFileFromDisk(String data,
			HttpServletResponse resp, String wjmc) {
		// 设置响应编码
		resp.setContentType("application/octet-stream;charset=GBK");
		byte[] dataByte = data.getBytes();
		// 声明比特数组
		resp.setContentLength(dataByte.length);
		//
		ServletOutputStream so = null;

		try {
			// 设置编码
			resp.setHeader("Content-Disposition", "attachment;filename="
					+ new String(wjmc.getBytes("GBK"), "iso-8859-1"));
			so = resp.getOutputStream();
			so.write(dataByte);
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
	public static void downLoadFileFromDisk(File file,
			HttpServletResponse resp, String wjmc) {
		// 设置响应编码
		resp.setContentType("application/octet-stream;charset=GBK");
		// 声明比特数组
		resp.setContentLength((int) file.length());
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
			e.printStackTrace();
		} finally {
			// 关闭输入流
			if (fin != null) {
				try {
					fin.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		//
		ServletOutputStream so = null;

		try {
			so = resp.getOutputStream();
			so.write(bFile);
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
	 * 获取文件的MD5值
	 * @param file 上传文件
	 * @return 文件MD5值
	 */
	public static String getFileMD5(File file) {
		//文件是否合法
		if (!file.isFile()) {
			return null;
		}
		//信息摘要
		MessageDigest digest = null;
		FileInputStream in = null;
		byte buffer[] = new byte[1024];
		int len;
		try {
			digest = MessageDigest.getInstance("MD5");
			in = new FileInputStream(file);
			//更新信息摘要
			while ((len = in.read(buffer, 0, 1024)) != -1) {
				digest.update(buffer, 0, len);
			}
			in.close();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		BigInteger bigInt = new BigInteger(1, digest.digest());
		//返回
		return bigInt.toString(16);
	}
	
	/**
	* 关闭输入流 <br/>
	* @author jingma
	* @param is 要关闭输入流
	*/
	public static void closeInputStream(InputStream is){
		try {
			if(is != null){
				is.close();
			}
		} catch (IOException e) {
			log.error("关闭文件流失败："+is.toString(), e);
		}
	}
}
