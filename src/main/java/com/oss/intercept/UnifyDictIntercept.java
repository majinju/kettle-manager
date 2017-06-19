package com.oss.intercept;

import cn.benma666.constants.UtilConst;

import com.eova.aop.AopContext;
import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 
 * 统一字典拦截器
 * 
 * @author Jieven
 * 
 */
public class UnifyDictIntercept extends MetlMOIntercept {
	
	/**
	* 
	* @see com.eova.aop.MetaObjectIntercept#addBefore(com.eova.aop.AopContext)
	*/
	@Override
	public String addBefore(AopContext ac) throws Exception {
        removeCache();
		return super.addBefore(ac);
	}
    /**
	* 
	* @see com.eova.aop.MetaObjectIntercept#updateBefore(com.eova.aop.AopContext)
	*/
	@Override
	public String updateBefore(AopContext ac) throws Exception {
        removeCache();
		return super.updateBefore(ac);
	}
    /**
    *  <br/>
    * @author jingma
    */
    private void removeCache() {
        CacheKit.removeAll(UtilConst.CACHE_DICT);
    }
	
}
