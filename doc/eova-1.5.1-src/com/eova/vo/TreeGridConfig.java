/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.vo;

/**
 * 菜单树表配置
 * 
 * @author Jieven
 * 
 */
public class TreeGridConfig {
	
	// 图标字段
	private String iconField;
	// 树形字段
	private String treeField;
	// 树父子关系字段
	private String parentField;

	public String getIconField() {
		return iconField;
	}

	public void setIconField(String iconField) {
		this.iconField = iconField;
	}

	public String getTreeField() {
		return treeField;
	}

	public void setTreeField(String treeField) {
		this.treeField = treeField;
	}

	public String getParentField() {
		return parentField;
	}

	public void setParentField(String parentField) {
		this.parentField = parentField;
	}
}