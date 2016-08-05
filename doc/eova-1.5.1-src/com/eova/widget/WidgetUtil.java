/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.widget;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.eova.common.utils.xx;
import com.eova.model.Menu;
import com.eova.model.MetaField;
import com.eova.widget.tree.TreeNode;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Record;

public class WidgetUtil {
	/**
	 * 原值被自动转成了中文显示，所以转换前先备份值为"字段_val"
	 * 
	 * @param reList Grid数据集
	 * @param pkName 当前Eova_Object的主键名
	 */
	public static void copyValueColumn(List<Record> reList, String pkName, List<MetaField> eis) {
		// 复制主键列
		for (Record re : reList) {
			for (MetaField x : eis) {
				// 如果有表达式，说明会被翻译，所以需要备份列
				String exp = x.getStr("exp");
				if (!xx.isEmpty(exp)) {
					String en = x.getEn();
					// 备份被转换的列的值
					re.set(en + "_val", re.get(en,"").toString());
				}
			}
			// 复制主键值列
			re.set("pk_val", re.get(pkName).toString());
		}
	}

	/**
	 * 将Menu转为Tree Json
	 * 
	 * @param temp
	 * @return
	 */
	public static String menu2TreeJson(Map<Integer, Menu> temp, Integer rootId) {
		LinkedHashMap<Integer, Record> recordMap = new LinkedHashMap<Integer, Record>();
		// model to record
		for (Map.Entry<Integer, Menu> map : temp.entrySet()) {
			recordMap.put(map.getKey(), new Record().setColumns(map.getValue()));
		}
		return map2TreeJson(recordMap, rootId);
	}

	/**
	 * 菜单转化为Tree所需JSON结构
	 * 
	 * @param temp
	 * @return
	 */
	public static String map2TreeJson(Map<Integer, Record> temp, Integer rootId) {
		// EasyUI 公共数据格式处理
		for (Map.Entry<Integer, Record> map : temp.entrySet()) {
			Record x = map.getValue();

			// 是否默认折叠
			String state = "open";
			Boolean isCollapse = x.getBoolean("is_collapse");
			if (!xx.isEmpty(isCollapse) && isCollapse) {
				state = "closed";
			}
			x.set("state", state);
			x.set("iconCls", x.getStr("icon"));
			// 移除无用属性
			x.remove("is_collapse");
			x.remove("icon");
			x.remove("url");
			x.remove("diy_js");
			x.remove("config");
			x.remove("biz_intercept");
		}

		// 创建根节点
		temp.put(rootId, new TreeNode());

		// 将temp整理成Tree结构
		for (Map.Entry<Integer, Record> map : temp.entrySet()) {

			// 跳过新增的树根
			if (map.getKey() == 0) {
				continue;
			}

			Record re = map.getValue();
			Integer pid = re.getInt("parent_id");
			Record pr = temp.get(pid);
			if (pr == null) {
				// 父节点为空说明已经遍历到最外层父节点，直接跳过
				continue;
			}
			// System.out.println(re.getStr("name"));
			// 获取父节点子集
			List<Record> childList = pr.get("children");
			if (childList == null) {
				childList = new ArrayList<Record>();
				temp.get(pid).set("children", childList);
			}
			// 将当前节点加入父节点子集
			childList.add(re);
		}

		// 组装Tree Json
		StringBuilder sb = new StringBuilder("[");
		// 获取根节点
		List<Record> childList = temp.get(rootId).get("children");
		for (Record x : childList) {
			sb.append(JsonKit.toJson(x));
			sb.append(",");
		}
		sb.delete(sb.length() - 1, sb.length());
		sb.append("]");
		//System.out.println(sb.toString());

		// 大小写与EasyUI兼容问题：
		String json = sb.toString();
		json = json.replaceAll("iconcls", "iconCls");

		return json;
	}
	
	/**
	 * 格式化EasyUI Tree
	 * 
	 * @param maps Tree Map
	 */
	public static void formatEasyTree(Map<Integer, Menu> maps) {
		for (Map.Entry<Integer, Menu> map : maps.entrySet()) {
			Menu x = map.getValue();

			// 目录无URL，为功能构建URL
			JSONObject attrs = new JSONObject();
			if (!x.getStr("type").equals(Menu.TYPE_DIR)) {
				attrs.put("url", x.getUrl());
			}

			x.put("id", x.getInt("id"));
			x.put("text", x.getStr("name"));
			x.put("attributes", attrs);
			// menu.put("checked", false);
			x.remove("name");
		}
	}

	/**
	 * 递归获得上级节点
	 * 
	 * @param allMenu 所有菜单
	 * @param authParent 需要获取上级的节点Map(找到的父节点也会放进来)
	 * @param menu 当前节点
	 */
	public static void getParent(HashMap<Integer, Menu> allMenu, HashMap<Integer, Menu> authParent, Menu menu) {
		// 获取上级父节点
		Integer pid = menu.getInt("parent_id");
		// 上级不存在 || =0，说明到了Root
		if (xx.isEmpty(pid) || pid == 0) {
			return;
		}
		Menu pm = allMenu.get(pid);
		authParent.put(pid, pm);
		// 递归上上级
		getParent(allMenu, authParent, pm);
	}

	/**
	 * Tree数据准备 List转有序Map
	 * @param records
	 * @return
	 */
	public static LinkedHashMap<Integer, Menu> menusToLinkedMap(List<Menu> records) {
		LinkedHashMap<Integer, Menu> temp = new LinkedHashMap<Integer, Menu>();
		for (Menu x : records) {
			// 获取EasyUI所需ICON字段名
			String icon = x.get("icon");
			if (xx.isEmpty(icon)) {
				icon = "icon-application";
			}
			x.set("icon", icon);

			temp.put(x.getInt("id"), x);
		}
		return temp;
	}
	
	/**
	 * Tree数据准备 List转有序Map
	 * @param records
	 * @return
	 */
	public static Map<Integer, Record> listToLinkedMap(List<Record> records) {
		LinkedHashMap<Integer, Record> temp = new LinkedHashMap<Integer, Record>();
		for (Record x : records) {
			// 获取EasyUI所需ICON字段名
			String icon = x.get("icon");
			if (xx.isEmpty(icon)) {
				icon = "icon-application";
			}
			x.set("icon", icon);
			
			temp.put(x.getInt("id"), x);
		}
		return temp;
	}
	
}