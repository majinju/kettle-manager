/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import cn.benma666.myutils.JsonResult;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.sjgl.SysSjglSjdx;

import com.alibaba.fastjson.JSONObject;

/**
 * 统一字典拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class TyzdLjq extends DefaultLjq{
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#save(cn.benma666.sjgl.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult save(SysSjglSjdx sjdx, JSONObject myJsonParams) {
        String cllx = myJsonParams.getString(LjqInterface.KEY_CLLX);
//        JSONObject yobj = myJsonParams.getJSONObject(KEY_YOBJ);
        if(KEY_CLLX_UPDATE.equals(cllx)){
//            JSONObject obj = myJsonParams.getJSONObject(KEY_OBJ);
        }else{
        }
        return super.save(sjdx, myJsonParams);
    }
}
