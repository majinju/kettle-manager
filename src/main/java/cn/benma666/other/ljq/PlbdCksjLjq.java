/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.other.ljq;

import org.springframework.ui.Model;

import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.Result;
import cn.benma666.sjgl.DefaultLjq;

import com.alibaba.fastjson.JSONObject;

/**
 * 批量比对-查看数据-拦截器 <br/>
 * @author jingma
 * @version 
 */
public class PlbdCksjLjq extends DefaultLjq{
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#list(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject, org.springframework.ui.Model)
    */
    @Override
    public Result list(SysSjglSjdx sjdx, JSONObject myParams, Model model) {
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        SysQxYhxx user = (SysQxYhxx)myParams.get(KEY_USER);
        JSONObject yhtjP = QyzsLjq.tjhc.getJSONObject(user.getToken());
        if(yhtjP==null){
            return failed("你还没有进行查询操作，可能是会话过期，请先重新查询");
        }
        //本次查询的数据对象的参数对象
        JSONObject zyP = yhtjP.getJSONObject("xzcxxSjdxP").getJSONObject(yobj.getString("sjdx"));
        SysSjglSjdx zySjdx = (SysSjglSjdx) zyP.get(KEY_SJDX);
        return super.list(zySjdx, zyP, model);
    }
}
