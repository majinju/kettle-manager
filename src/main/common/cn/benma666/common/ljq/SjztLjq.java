/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import cn.benma666.db.Db;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.sjgl.SysSjglSjdx;
import cn.benma666.web.SConf;

import com.alibaba.fastjson.JSONObject;

/**
 * 数据载体拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class SjztLjq extends DefaultLjq{
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#save(cn.benma666.sjgl.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult save(SysSjglSjdx sjdx, JSONObject myJsonParams) {
        String cllx = myJsonParams.getString(LjqInterface.KEY_CLLX);
        JSONObject yobj = myJsonParams.getJSONObject(KEY_YOBJ);
        String vs = "validationQuery."+yobj.getString("lx");
        if(StringUtil.isBlank(yobj.getString("csyj"))&&!vs.equals(SConf.getVal(vs))){
            yobj.put("csyj", SConf.getVal(vs));
        }
        if(KEY_CLLX_UPDATE.equals(cllx)){
            JSONObject obj = myJsonParams.getJSONObject(KEY_OBJ);
            if(Db.isCz(obj.getString("dm"))){
                Db.use(obj.getString("dm")).close();
            }
        }else{
//            SysQxYhxx user = (SysQxYhxx) myJsonParams.get(KEY_USER);
//            QxManager.setCjrInfo(user, yobj);
        }
        return super.save(sjdx, myJsonParams);
    }
}
