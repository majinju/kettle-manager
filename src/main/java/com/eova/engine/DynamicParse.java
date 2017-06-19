/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.eova.engine;

import java.io.IOException;
import java.util.Map;
import java.util.Map.Entry;

import org.beetl.core.Configuration;
import org.beetl.core.GroupTemplate;
import org.beetl.core.Template;
import org.beetl.core.resource.StringTemplateResourceLoader;

import com.eova.common.utils.xx;

/**
 * Eova表达式动态解析器
 * 变量+逻辑运算
 * @author Jieven
 *
 */
public class DynamicParse {

	public static GroupTemplate gt;
	
	static{
		if (gt == null) {
			StringTemplateResourceLoader resourceLoader = new StringTemplateResourceLoader();
			Configuration cfg = null;
			try {
				cfg = Configuration.defaultConfiguration();
			} catch (IOException e) {
				e.printStackTrace();
			}
			gt = new GroupTemplate(resourceLoader, cfg);
		}
	}

	public static String buildSql(String exp, Object... params) {
		
		if (xx.isEmpty(exp)) {
			return exp;
		}
		
		Template t = gt.getTemplate(exp);
		for(Object o : params){
			t.binding(o.getClass().getSimpleName().toLowerCase(), o);
		}
		
		return t.render();
	}

    /**
    * 模板绑定数据 <br/>
    * @author jingma
    * @param exp 模板
    * @param param 数据
    * @return 渲染后的字符串
    */
    public static String buildStr(String exp, Map<String, Object> params) {
        
        if (xx.isEmpty(exp)) {
            return exp;
        }
        
        Template t = gt.getTemplate(exp);
        for(Entry<String, Object> entry : params.entrySet()){
            t.binding(entry.getKey(),entry.getValue());
        }
        
        return t.render();
    }
}
