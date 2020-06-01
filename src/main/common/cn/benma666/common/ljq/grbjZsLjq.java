/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import javax.servlet.http.HttpServletRequest;

import cn.benma666.db.Db;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.myutils.JsonResult;
import cn.benma666.sjgl.DefaultLjq;

import com.alibaba.fastjson.JSONObject;

/**
* 个人笔记展示 <br/>
* date: 2020年5月25日 <br/>
* @author jingma
* @version 
*/
public class grbjZsLjq extends DefaultLjq{
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#jcxx(cn.benma666.domain.SysSjglSjdx, java.lang.String, javax.servlet.http.HttpServletRequest)
    */
    @Override
    public JsonResult jcxx(SysSjglSjdx sjdx, String myparams,
            HttpServletRequest request) {
        JsonResult r = super.jcxx(sjdx, myparams, request);
        JSONObject yobj = ((JSONObject)r.getData()).getJSONObject(KEY_YOBJ);
        JSONObject s = ((JSONObject)r.getData()).getJSONObject(KEY_SJDX);
        if(yobj.getBooleanValue("yd")){
            Db.use(s.getString("dxzt")).update("update SYS_SJGL_GRBJ t set t.ydcs=(t.ydcs+1) where t.id=?",
                    yobj.getString("id"));
        }
        return r;
    }
}
