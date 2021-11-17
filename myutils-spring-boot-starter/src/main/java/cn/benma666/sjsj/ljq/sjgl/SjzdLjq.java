/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.sjsj.ljq.sjgl;

import cn.benma666.iframe.Result;

import cn.benma666.sjsj.web.DefaultLjq;
import com.alibaba.fastjson.JSONObject;

/**
 * 数据字段拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 0.1
 */
public class SjzdLjq extends DefaultLjq {
    @Override
    public Result save(JSONObject myParams) {
        //对数据字段的修改清除字段缓存
        fieldsCache.clear();
        return super.save(myParams);
    }
}
