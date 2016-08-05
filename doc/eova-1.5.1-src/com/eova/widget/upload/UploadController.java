/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.widget.upload;

import java.io.File;

import org.joda.time.DateTime;

import com.eova.common.utils.xx;
import com.eova.common.utils.io.FileUtil;
import com.eova.common.utils.io.ImageUtil;
import com.eova.config.EovaConfig;
import com.eova.config.EovaConst;
import com.jfinal.core.Controller;
import com.jfinal.upload.UploadFile;

/**
 * 上传组件
 * 
 * @author Jieven
 * 
 */
public class UploadController extends Controller {

	// 异步传图(返回必须是html,否则无法解析)
	public void img() {

		String name = getPara("name");
		String filedir = getPara("filedir");
		if (xx.isEmpty(name)) {
			renderHtml("{\"success\":false, \"msg\": '找不到上传控件，一开始是拒绝的！'}");
			return;
		}
		if (xx.isEmpty(filedir)) {
			filedir = "/temp";
		}

		String fileName = "";

		UploadFile file = null;
		try {

			// 上传
			file = getFile(name, FileUtil.formatPath(filedir));
			if (xx.isEmpty(file)) {
				renderHtml("{\"success\":false, \"msg\": '请选择一个图片'}");
				return;
			}
			// 大小限制
			if (FileUtil.checkFileSize(file.getFile(), EovaConst.UPLOAD_IMG_SIZE)) {
				String msg = "图片大小不能超过2M";
				renderHtml("{\"success\":false, \"msg\": '" + msg + "'}");
				return;
			}
			// 图片合法性严格检查(图片后缀+图片头)
			if (!ImageUtil.isImage(file.getFile().getPath())) {
				renderHtml("{\"success\":false, \"msg\": '该文件不是标准的图片文件，请勿手工对图片文件进行修改'}");
				return;
			}

			// 获取文件名
			fileName = file.getFileName();
			// 获取文件后缀
			String suffix = FileUtil.getFileType(fileName);
			// 创建新的随机文件名
			fileName = System.currentTimeMillis() + suffix;

			// 新文件 Path
			String path = file.getUploadPath() + File.separator + fileName;

			FileUtil.rename(file.getFile().getPath(), path);
			System.out.println(file.getFile().getPath());
			System.out.println(path);

		} catch (Exception e) {
			e.printStackTrace();
			renderHtml("{\"success\":false, \"msg\": '系统异常：图片上传失败,请稍后再试'}");
			return;
		}
		// 返回必须是html,否则无法解析
		renderHtml("{\"success\":true, \"msg\": \"上传成功\", \"fileName\": \"" + fileName + "\"}");
	}

	// 异步传文件
	public void file() {
		String filedir = getPara("filedir");
		if (xx.isEmpty(filedir)) {
			// 默认按日期划分目录
			String today = DateTime.now().toString("yyyyMMdd");
			filedir = File.separator + "upload" + File.separator + today;
		}
		upload(false, filedir);
	}

	// 异步上传临时文件
	public void tempfile() {
		upload(true, EovaConfig.props.get("eova_upload_temp"));
	}

	// 上传文件(返回必须是html,否则无法解析)
	private void upload(boolean isDelete, String fileDir) {
		String name = getPara("name");
		if (xx.isEmpty(name)) {
			renderHtml("{\"success\":false, \"msg\": '找不到上传控件，一开始是拒绝的！'}");
			return;
		}

		String fileName = "";

		UploadFile file = null;
		try {
			// 上传到/upload 目录
			file = getFile(name, fileDir);
			if (xx.isEmpty(file)) {
				renderHtml("{\"success\":false, \"msg\": '请选择一个文件'}");
				return;
			}
			// 大小限制
			if (FileUtil.checkFileSize(file.getFile(), 1024 * 500)) {
				String msg = "文件大小不能超过500M";
				renderHtml("{\"success\":false, \"msg\": '" + msg + "'}");
				return;
			}
			// 文件后缀
			if (!FileUtil.checkFileType(file.getFile().getPath(), false)) {
				renderHtml("{\"success\":false, \"msg\": '请勿上传非法类型文件'}");
				return;
			}

			// 获取文件名
			fileName = file.getFileName();
			// 获取文件后缀
			String suffix = FileUtil.getFileType(fileName);
			// 创建新的随机文件名
			fileName = System.currentTimeMillis() + suffix;

			// 新文件 Path
			String path = file.getUploadPath() + File.separator + fileName;

			FileUtil.rename(file.getFile().getPath(), path);
			System.out.println(file.getFile().getPath());
			System.out.println(path);

		} catch (Exception e) {
			e.printStackTrace();
			renderHtml("{\"success\":false, \"msg\": '系统异常：文件上传失败,请稍后再试'}");
			return;
		} finally {
			if (isDelete) {
				// 强制删除已上传的文件(如果还存在)
				FileUtil.delete(file.getFile());
			}
		}
		// 返回必须是html,否则无法解析
		renderHtml("{\"success\":true, \"msg\": \"上传成功\", \"fileName\": \"" + fileName + "\"}");
	}

}