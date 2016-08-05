package com.eova.template.single;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;

import com.eova.aop.AopContext;
import com.eova.common.utils.xx;
import com.eova.common.utils.excel.ExcelUtil;
import com.eova.model.MetaObject;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.IAtom;
import com.jfinal.plugin.activerecord.Record;

public class SingleAtom implements IAtom {

	private final Controller ctrl;
	private File file;
	private MetaObject object;
	private SingleIntercept intercept;
	private List<Record> records;
	private Exception runExp;

	public SingleAtom(File file, MetaObject object, SingleIntercept intercept, Controller ctrl) {
		super();
		this.file = file;
		this.object = object;
		this.intercept = intercept;
		this.ctrl = ctrl;
	}

	@Override
	public boolean run() throws SQLException {
		try {

			// 导入Excel
			InputStream is = new FileInputStream(file);
			records = ExcelUtil.importExcel(is, object.getFields());

			// 导入前置任务
			if (intercept != null) {
				AopContext ac = new AopContext(ctrl, records);
				intercept.importBefore(ac);
			}

			// 保存导入数据
			for (Record re : records) {
				// System.out.println(re.toJson());
				// 移除主键(新增数据主键自增长)
				re.remove(object.getPk());
				if (!xx.isEmpty(object.getTable())) {
					Db.use(object.getDs()).save(object.getTable(), object.getPk(), re);
				}
			}

			// 新增后置任务
			if (intercept != null) {
				AopContext ac = new AopContext(ctrl, records);
				intercept.importAfter(ac);
			}
		} catch (Exception e) {
			runExp = e;
			return false;
		} finally {
			// 自动删除废弃临时文件
			if (file.exists()) {
				file.delete();
			}
		}
		return true;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}
	
	public MetaObject getObject() {
		return object;
	}

	public void setObject(MetaObject object) {
		this.object = object;
	}

	public SingleIntercept getIntercept() {
		return intercept;
	}

	public void setIntercept(SingleIntercept intercept) {
		this.intercept = intercept;
	}

	public List<Record> getRecords() {
		return records;
	}

	public void setRecords(List<Record> records) {
		this.records = records;
	}

	public Exception getRunExp() {
		return runExp;
	}

	public void setRunExp(Exception runExp) {
		this.runExp = runExp;
	}

}
