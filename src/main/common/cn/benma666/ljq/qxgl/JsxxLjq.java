/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.ljq.qxgl;

import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.web.UserManager;

import com.alibaba.fastjson.JSONObject;

/**
 * 角色信息拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class JsxxLjq extends DefaultLjq{
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult plcl(SysSjglSjdx sjdx, JSONObject params) {
        String cllx = params.getString(KEY_CLLX);
        switch (cllx) {
        case KEY_CLLX_PLSC:
            return super.plcl(sjdx, params);
        default:
            //执行默认操作
            return super.plcl(sjdx, params);
        }
    }
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#saveDb(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    protected JsonResult saveDb(SysSjglSjdx t, JSONObject myparams) {
        JSONObject yobj = myparams.getJSONObject(KEY_YOBJ);
        String dm = yobj.getString("dm");
        JSONObject obj = myparams.getJSONObject(KEY_OBJ);
        if(StringUtil.isNotBlank(dm)){
            //权限代码调整时，联动调整子权限的代码
            db.update("update sys_qx_jsxx t set t.dm=replace(t.dm,?,?),t.fjs=replace(t.fjs,?,?),"
                    + "t.gxsj=to_char(sysdate,'YYYYMMDDHH24MISS') where t.dm like ?", 
                    obj.getString("dm")+"_",dm+"_",obj.getString("dm"),dm,obj.getString("dm")+"_%");
        }
        JsonResult r = super.saveDb(t, myparams);
        if(r.isStatus()&&StringUtil.isNotBlank(dm)){
            //修改授权信息中的权限代码。
            db.update("update sys_qx_jsqxgl t set t.js=replace(t.js,?,?),"
                    + "t.gxsj=to_char(sysdate,'YYYYMMDDHH24MISS') where t.js like ?", 
                    obj.getString("dm"),dm,obj.getString("dm")+"%");
            db.update("update sys_qx_yhjsgl t set t.js=replace(t.js,?,?),"
                    + "t.gxsj=to_char(sysdate,'YYYYMMDDHH24MISS') where t.js like ?", 
                    obj.getString("dm"),dm,obj.getString("dm")+"%");
            UserManager.flushUserQxxx();
        }
        return r;
    }
}
