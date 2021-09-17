/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.CacheFactory;
import cn.benma666.iframe.Result;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.LjqInterface;

import com.alibaba.fastjson.JSONObject;

/**
 * 数据字段拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class SjzdLjq extends DefaultLjq{
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public Result plcl(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = myParams.getString(LjqInterface.KEY_CLLX);
        switch (cllx) {
        default:
            return super.plcl(sjdx, myParams);
        }
    }
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#save(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public Result save(SysSjglSjdx sjdx, JSONObject myParams) {
        CacheFactory.clear(KEY_CACHE_SJDXJCXX);
        return super.save(sjdx, myParams);
    }
}
