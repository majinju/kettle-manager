/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.ljq.znbk;

import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;

import com.alibaba.fastjson.JSONObject;

/**
 * 比对核查-号码<br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class HmglLjq extends DefaultLjq{
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#save(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult save(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = myParams.getString(KEY_CLLX);
        if(KEY_CLLX_INSERT.equals(cllx)){
            //插入时，主证件号码为空则自动用核查证件号码填充
            JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
            if(StringUtil.isBlank(yobj.getString("zzjhm"))){
                yobj.put("zzjhm", yobj.getString("hczjhm"));
                yobj.put("zzjlx", yobj.getString("hczjlx"));
            }
            if(StringUtil.isBlank(yobj.getString("gkdw"))){
                SysQxYhxx user = (SysQxYhxx) myParams.get(KEY_USER);
                yobj.put("gkdw", user.getJgxx().getId());
            }
            yobj.put("ssxm", sjdx.get("ssxm"));
            if(!yobj.containsKey("ssrw")){
                yobj.put("ssrw", sjdx.get("ssrw"));
            }
        }
        return super.save(sjdx, myParams);
    }
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult plcl(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = myParams.getString(KEY_CLLX);
        switch (cllx) {
        }
        return super.plcl(sjdx, myParams);
    }
}
