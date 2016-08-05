/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 * <p/>
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.config;

import java.io.File;
import java.util.Properties;
import java.util.Set;

import com.eova.common.utils.xx;
import com.eova.common.utils.db.DbUtil;
import com.eova.common.utils.io.FileUtil;
import com.eova.common.utils.io.NetUtil;
import com.eova.common.utils.io.ZipUtil;
import com.jfinal.kit.PathKit;

public class EovaInit {

	/**
	 * 异步初始化JS插件包<br>
	 * 1.通过网络自动下载plugins.zip <br>
	 * 2.解压到webapp/plugins/ <br>
	 * 3.删除下载临时文件 <br>
	 */
	public static void initPlugins() {
		// 异步下载插件包
		Thread t = new Thread() {
			@Override
			public void run() {
				try {
					// 下载到Web根目录
					String zipPath = EovaConst.DIR_WEB + "plugins.zip";

					if (!FileUtil.isExists(EovaConst.DIR_PLUGINS)) {
						System.err.println("正在下载：" + EovaConst.PLUGINS_URL);
						NetUtil.download(EovaConst.PLUGINS_URL, zipPath);

						System.err.println("开始解压：" + zipPath);
						ZipUtil.unzip(zipPath, EovaConst.DIR_PLUGINS, null);
						System.err.println("已解压到：" + EovaConst.DIR_PLUGINS);

						FileUtil.delete(zipPath);
						System.err.println("清理下载Zip");
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		};
		t.start();
	}

	/**
	 * 初始化输出Oracle脚本
	 */
	public static void initCreateSql() {
		// 异步下载插件包
		Thread t = new Thread() {
			@Override
			public void run() {
				System.out.println("正在生成 eova oracle sql ing...");
				DbUtil.createOracleSql(xx.DS_EOVA, "EOVA%");
				// System.out.println("生成成功:/sql/oracle/eova.sql");

				System.out.println();
				System.out.println();

				System.out.println("正在生成 web oracle sql ing...");
				DbUtil.createOracleSql(xx.DS_MAIN, "%");
				// System.out.println("生成成功:/sql/oracle/*.sql");
			}
		};
		t.start();
	}

	/**
	 * 初始化配置
	 */
	public static void initConfig() {
		String resPath = PathKit.getRootClassPath() + File.separator;
		// 加载默认配置
		boolean flag = loadConfig(resPath + "default");
		if (flag) {
			System.out.println("默认配置加载成功:(resources/default)\n");
		}
		// 加载本地配置
		flag = loadConfig(resPath + "dev");
		if (flag) {
			System.out.println("本地配置覆盖成功:(resources/dev)\n");
		}

	}

	/**
	 * 加载配置
	 * 
	 * @param path
	 * @return
	 */
	public static boolean loadConfig(String path) {
		if (!FileUtil.isDir(path)) {
			return false;
		}
		File[] files = FileUtil.getFiles(path);
		for (File file : files) {
			if (!file.getName().endsWith(".config")) {
				continue;
			}
			Properties properties = FileUtil.getProp(file);
			Set<Object> keySet = properties.keySet();
			for (Object ks : keySet) {
				String key = ks.toString();
				EovaConfig.props.put(key, properties.getProperty(key));
			}
			System.out.println(file.getName());
		}
		return true;
	}
}