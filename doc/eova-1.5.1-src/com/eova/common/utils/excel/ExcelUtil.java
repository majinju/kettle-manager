package com.eova.common.utils.excel;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.format.Colour;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

import com.eova.model.MetaField;
import com.eova.model.MetaObject;
import com.jfinal.plugin.activerecord.Record;

/**
 * Excel导入导出
 * 
 * @author Jieven
 * 
 */
public class ExcelUtil {
	public static void createExcel(OutputStream os, List<Record> list, List<MetaField> items, MetaObject object) throws WriteException, IOException {
		// 创建工作薄
		WritableWorkbook workbook = Workbook.createWorkbook(os);
		// 创建新的一页
		WritableSheet sheet = workbook.createSheet("Sheet1", 0);

		int row = 0;// 当前行索引
		// 写入标题
		for (int i = 0; i < items.size(); i++) {
			MetaField item = items.get(i);
			WritableCellFormat format = new WritableCellFormat();
			format.setBackground(Colour.GRAY_25);// 设置灰色背景
			sheet.addCell(new Label(i, row, item.getCn(), format));
			// 设置列宽度(列宽px值/10)
			sheet.setColumnView(i, item.getInt("width") / 10);
		}
		row++;
		// 写入数据行
		for (; row <= list.size(); row++) {
			Record record = list.get(row - 1);
			// 获取当前行数据
			String[] values = getValues(items, record);
			for (int i = 0; i < values.length; i++) {
				sheet.addCell(new Label(i, row, values[i]));
			}
		}

		// 把创建的内容写入到输出流中，并关闭输出流
		workbook.write();
		workbook.close();

	}

	/**
	 * 获取数据行
	 * 
	 * @param names
	 * @param record
	 * @return
	 */
	private static String[] getValues(List<MetaField> items, Record record) {
		String[] values = new String[items.size()];
		int i = -1;
		for (MetaField item : items) {
			i++;
			Object value = record.get(item.getEn());
			if (value == null) {
				continue;
			}
			values[i] = value.toString();
		}
		return values;
	}

	public static List<Record> importExcel(InputStream is, List<MetaField> items) {

		List<Record> list = new ArrayList<Record>();

		Workbook workbook = null;
		try {
			// 从读取流创建只读Workbook对象
			workbook = Workbook.getWorkbook(is);
			// 获取第一张Sheet表
			Sheet readsheet = workbook.getSheet(0);
			// 总列数
			int colSum = readsheet.getColumns();
			// 总行数
			int rowSum = readsheet.getRows();

			// 表头中文信息
			String[] headers = new String[colSum];
			// EN -> CN
			Map<String, String> field = getKeyValue(items);

			int row = 0;

			// 读取表头
			for (int i = 0; i < colSum; i++) {
				Cell cell = readsheet.getCell(i, 0);
				headers[i] = cell.getContents();
			}
			row++;
			
			// 获取指定单元格的对象引用
			for (; row < rowSum; row++) {
				Record record = new Record();
				for (int i = 0; i < colSum; i++) {
					Cell cell = readsheet.getCell(i, row);
					// 根据表头CN获取EN
					record.set(field.get(headers[i]), cell.getContents());
				}
				list.add(record);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			workbook.close();
		}

		return list;
	}

	private static Map<String, String> getKeyValue(List<MetaField> items) {
		HashMap<String, String> map = new HashMap<String, String>();
		for (MetaField item : items) {
			map.put(item.getCn(), item.getEn());
		}
		return map;
	}
}