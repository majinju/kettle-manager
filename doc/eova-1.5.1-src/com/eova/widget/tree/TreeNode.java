/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.widget.tree;

import java.util.List;

import com.jfinal.plugin.activerecord.Record;

/**
 * Tree Node VO
 *
 * @author Jieven
 * @date 2014-9-8
 */
public class TreeNode extends Record {

	private static final long serialVersionUID = -5190761342805087001L;
	
	// 子节点
	private List<TreeNode> childs;

	public List<TreeNode> getChildList() {
		return childs;
	}

	public void setChildList(List<TreeNode> childList) {
		this.childs = childList;
	}

}