/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.domain.SysSjglTyzd;
import cn.benma666.iframe.DictManager;
import cn.benma666.iframe.PageInfo;
import cn.benma666.iframe.Result;
import cn.benma666.sjgl.DefaultLjq;

import com.alibaba.fastjson.JSONObject;

/**
 * 字典搜索拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class ZdssLjq extends DefaultLjq{
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#page(cn.benma666.domain.SysSjglSjdx, cn.benma666.myutils.PageInfo, java.lang.String, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public Result page(SysSjglSjdx sjdx, PageInfo<JSONObject> page,
            String defaultSql, JSONObject params) {
        page = DictManager.zdSearch(page, JSONObject.parseObject(params.getString(KEY_YOBJ), SysSjglTyzd.class));
        return success("查询成功", page);
    }
}
