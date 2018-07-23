package cn.benma666.common.util;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.htmlparser.Node;
import org.htmlparser.Parser;
import org.htmlparser.nodes.TagNode;
import org.htmlparser.nodes.TextNode;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

import cn.benma666.common.iframe.BasicObject;
import cn.benma666.myutils.DateUtil;

public class ExportToExecl extends BasicObject{
	public static Log log = LogFactory.getLog(ExportToExecl.class);
	/**
	 * 存放excel单元格样式
	 */
	public static final Map<String,HSSFCellStyle> styleMap = new HashMap<String,HSSFCellStyle>();
	
	public static void fromHtmlTable(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String tableHtml = "";
		String filename = "";
		String hiddenCol = "";
		
		request.setCharacterEncoding("UTF-8");
		tableHtml = request.getParameter("content");
		hiddenCol = request.getParameter("hiddenCol");
		filename = request.getParameter("filename")+"-"+DateUtil.getGabDate();
		log.debug("======================"+hiddenCol+"======================");
		OutputStream outputStream = response.getOutputStream();
		response.setContentType("application/vnd.ms-excel");
		response.addHeader("Content-Disposition", "attachment; filename=\""
				+ StringUtil.toUtf8(filename) + ".xls\"");
		List<String> hidCol = null;
		if (hiddenCol != null) {
			hidCol = Arrays.asList(hiddenCol.split(","));
		} else {
			hidCol = new ArrayList<String>();
			hidCol.add("");
		}
		int startIndex = tableHtml.indexOf("<table");
		if (startIndex == -1) {
			startIndex = tableHtml.indexOf("<TABLE");
		}
		int endIndex = tableHtml.lastIndexOf("</table>");
		if (endIndex == -1) {
			endIndex = tableHtml.lastIndexOf("</TABLE>");
		}
		tableHtml = tableHtml.substring(startIndex, endIndex + 8);
		tableHtml = tableHtml.replaceFirst("<TBODY[^>]*>", "")
				.replace("<tbody[^>]*>", "").replace("</TBODY>", "")
				.replace("</tbody>", "").replaceAll("<!--[^(-->)]*-->", "");
		HSSFWorkbook wb = new HSSFWorkbook();
		//使用POI写入excel数据时，如果使用的excel版本是2003,当批量创建过多的样式（格式）时容易发生单元格丢失问题（这样操作性能也差劲），
		//所以需要严格控制单元格样式的创建和生成,所以把其放到map中，随用随取
		styleMap.put("headStyle", getCellStyle(wb));
		
		HSSFSheet sheet = wb.createSheet("sheet1");
		Node node = parseHtmlTable(tableHtml);
		NodeList trList = node.getChildren();
		int rowIndex = 0;
		List<Integer> hidColIndex = new ArrayList<Integer>();
		boolean flagContinue = true;
		for (int trIndex = 0; trIndex < trList.size(); ++trIndex) {
			if (trList.elementAt(trIndex).getClass() == TextNode.class) {
				continue;
			}
			if (trList.elementAt(trIndex).getClass() == TagNode.class) {
				continue;
			}
			NodeList tdList = trList.elementAt(trIndex).getChildren();
			HSSFRow row = sheet.createRow((short) rowIndex);
			int cellIndex = 0;
			for (int tdIndex = 0; tdIndex < tdList.size(); ++tdIndex) {
				sheet.setColumnWidth(tdIndex, 20 * 250);
				if (tdList.elementAt(tdIndex).getClass() == TextNode.class) {
					continue;
				}
				NodeList text = tdList.elementAt(tdIndex).getChildren();
				@SuppressWarnings("deprecation")
				HSSFCell cell = row.createCell((short) cellIndex);

				if ((text != null) && (!(text.asString().equals("&nbsp;")))) {
					String value = text.asString().trim();
					if (text.toString().startsWith("LABEL:")) {
						value = ((org.htmlparser.tags.LabelTag) (text
								.elementAt(0))).getAttribute("title");
					}
					// 要隐藏的列
					if (flagContinue
							&& (value == null || hidCol.contains(value))) {
						hidColIndex.add(tdIndex);
						continue;
					}
					if (hidColIndex.contains(tdIndex)) {
						continue;
					}
					if (tdList.elementAt(tdIndex).getText().toLowerCase()
							.indexOf("th") != -1) {
						cell.setCellStyle(styleMap.get("headStyle"));
					} 
					cell.setCellValue(value);
				}
				++cellIndex;
			}
			flagContinue = false;
			++rowIndex;
		}
		if (wb != null) {
			wb.write(outputStream);
			outputStream.flush();
		}
	}
	/**
	 * 获取excel单元格样式对象
	 * @param wb
	 * @return
	 */
	private static HSSFCellStyle getCellStyle(HSSFWorkbook wb) {
		HSSFCellStyle style = wb.createCellStyle();
		style.setFillForegroundColor((short) 22);
		style.setFillPattern((short) 1);
		return style;
	}

	private static Node parseHtmlTable(String tableHtml) {
		try {
			Parser parser = new Parser(tableHtml);
			return parser.parse(null).elementAt(0);
		} catch (ParserException e) {
			e.printStackTrace();
		}
		return null;
	}
}