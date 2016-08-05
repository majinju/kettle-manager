package com.eova.common.plugin.automodel;

import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import com.eova.common.utils.xx;
import com.eova.common.utils.io.ClassUtil;
import com.jfinal.kit.LogKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.activerecord.Model;

/**
 * 自动绑定Model
 * @author Jieven
 *
 */
@SuppressWarnings("rawtypes")
public class AutoBindModel {

//	public final String classPathUrl = PathKit.getRootClassPath();
//	private final String lib = new File(classPathUrl).getParent() + "\\lib\\";
	
	private final URL classUrl = this.getClass().getResource("/");
	private final String lib = new File(classUrl.getFile()).getParent() + "\\lib\\";
	
	private static List<String> includeJars = new ArrayList<String>();
	private static List<Class<? extends Model>> excludeClasses = new ArrayList<Class<? extends Model>>();

	private ActiveRecordPlugin arp;

	public AutoBindModel(ActiveRecordPlugin arp) {
		this.arp = arp;
	}

	/**
	 * 排除Model
	 * @param cs
	 */
	public void addExcludeClass(Class<? extends Model> cs) {
		if (cs != null) {
			excludeClasses.add(cs);
		}
	}

	/**
	 * 查找并排除Model父类
	 * @param clazz
	 * @return
	 */
	public <T> List<Class<? extends T>> findInClasspathAndJars(Class<T> clazz) {
		List<String> classFileList = new ArrayList<String>();
		String classUrlPath = new File(classUrl.getFile()).getAbsolutePath();
		String libPath = new File(lib).getAbsolutePath();
		System.out.println(classUrlPath);
		System.out.println(libPath);
		// 如果有class 目录才找
		classFileList = ClassUtil.findFiles(classUrlPath, "*.class");
		classFileList.addAll(ClassUtil.findjarFiles(libPath, includeJars));
		return ClassUtil.extraction(clazz, classFileList);
	}

	/**
	 * 自动加载Model
	 */
	@SuppressWarnings("unchecked")
	public void loadModel() {
		LogKit.info("AutoBindModel.loadModel():classes url:" + classUrl);
		LogKit.info("AutoBindModel.loadModel():lib url:" + lib);
		List<Class<? extends Model>> modelClasses = findInClasspathAndJars(Model.class);

		for (Class modelClass : modelClasses) {
			if (excludeClasses.contains(modelClass)) {
				continue;
			}

			String tableName = modelClass.getSimpleName().toLowerCase();
			TableBind tb = (TableBind) modelClass.getAnnotation(TableBind.class);
			if (tb != null) {
				// 是否有表名注释
				if (!xx.isEmpty(tb.tableName())) {
					tableName = tb.tableName().toLowerCase();
				}
				// 是否有主键注释
				if (!xx.isEmpty(tb.pkName())) {
					arp.addMapping(tableName, tb.pkName(), modelClass);
					LogKit.debug("addMapping(" + tableName + ", " + tb.pkName() + "," + modelClass.getName() + ")");
					continue;
				}
			}
			arp.addMapping(tableName, modelClass);
			LogKit.debug("addMapping(" + tableName + ", " + modelClass.getName() + ")");
		}
	}

	public AutoBindModel addJar(String jarName) {
		if (!xx.isEmpty(jarName)) {
			includeJars.add(jarName);
		}
		return this;
	}
}
