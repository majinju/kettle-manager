/**
* Project Name:myservice
* Date:2019年9月19日
* Copyright (c) 2019, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.Result;

import com.alibaba.fastjson.JSONObject;

/**
 * 自定义sql拦截器 <br/>
 * date: 2019年9月19日 <br/>
 * @author jingma
 * @version 
 */
public class ZdysqlLjq extends ScjkrwLjq {
/**
* 
* @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
*/
@Override
public Result plcl(SysSjglSjdx sjdx, JSONObject myParams) {
    String cllx = myParams.getString(KEY_CLLX);
    switch (cllx) {
    default:
        //执行默认操作
        return super.plcl(sjdx, myParams);
    }
}
}
