/**
* Project Name:myservice
* Date:2019年9月19日
* Copyright (c) 2019, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.myutils.JsonResult;
import cn.benma666.sjgl.DefaultLjq;

import com.alibaba.fastjson.JSONObject;

/**
 * 作业监控配置拦截器 <br/>
 * date: 2019年9月19日 <br/>
 * @author jingma
 * @version 
 */
public class ZyjkpzLjq extends DefaultLjq {
/**
* 
* @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
*/
@Override
public JsonResult plcl(SysSjglSjdx sjdx, JSONObject myParams) {
    String cllx = myParams.getString(KEY_CLLX);
    switch (cllx) {
    case "scjkrw":
        if(myParams.get(KEY_IDS_ARRAY)==null){
            //没有选择指定作业
        }else{
            //前端指定作业
            JSONObject result = (JSONObject)getdata(sjdx, myParams).getData();
            for(JSONObject job:result.getJSONArray("list").toArray(new JSONObject[]{})){
                
            }
//            int sczds = db.update(""
//                    + "select  from "+tableName+""+myParams.getString(KEY_IDS_IN));
        }
        return success("清除缓存成功");
    default:
        //执行默认操作
        return super.plcl(sjdx, myParams);
    }
}
}
