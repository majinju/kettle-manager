/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.core.menu;

import com.eova.aop.AopContext;
import com.eova.aop.MetaObjectIntercept;
import com.eova.common.base.BaseCache;
import com.eova.config.EovaConst;
import com.eova.model.Button;
import com.eova.model.RoleBtn;

public class MenuIntercept extends MetaObjectIntercept {

	@Override
	public String deleteBefore(AopContext ac) throws Exception {
		String code = ac.record.getStr("code");

		// 删除菜单按钮关联权限
		RoleBtn.dao.deleteByMenuCode(code);

		// 删除菜单关联按钮
		Button.dao.deleteByMenuCode(code);

		// 删除菜单关联对象,不能删除对象，因为对象可能被多个菜单用
		// MenuObject.dao.deleteByMenuCode(code);
		
		return null;
	}

	@Override
	public String addSucceed(AopContext ac) throws Exception {
		// 菜单使缓存失效
		BaseCache.delSer(EovaConst.ALL_MENU);
		
		return null;
	}
	
	@Override
	public String deleteSucceed(AopContext ac) throws Exception {
		// 菜单使缓存失效
		BaseCache.delSer(EovaConst.ALL_MENU);
		
		return null;
	}

	@Override
	public String updateSucceed(AopContext ac) throws Exception {
		// 菜单使缓存失效
		BaseCache.delSer(EovaConst.ALL_MENU);
		
		return null;
	}

}