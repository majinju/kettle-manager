/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import java.util.Map;
import java.util.Map.Entry;

import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.myutils.JsonResult;
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
    public JsonResult plcl(SysSjglSjdx sjdx, JSONObject params) {
        String cllx = params.getString(LjqInterface.KEY_CLLX);
        Map<String, JSONObject> fields;
        switch (cllx) {
        case "bzpx":
            SysSjglSjdx obj = new SysSjglSjdx();
            obj.setId(sjdx.get(LjqInterface.KEY_IDS).toString());
            fields = getFields(obj);
            int idx = 0;
            for(Entry<String, JSONObject> field:fields.entrySet()){
                idx+=10;
                db.update("update sys_sjgl_sjzd t set t.px=? where t.id=?", 
                        idx,field.getValue().getString(FIELD_ID));
            }
            return success("成功标准化排序字段数："+fields.size());
        default:
            return super.plcl(sjdx, params);
        }
    }
}
