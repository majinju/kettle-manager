/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.sjsj.ljq.qxgl;

import cn.benma666.iframe.Result;
import cn.benma666.myutils.DateUtil;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjsj.web.DefaultLjq;
import cn.benma666.sjsj.web.UserManager;
import cn.benma666.sjzt.Db;
import com.alibaba.fastjson.JSONObject;

/**
 * 角色信息拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 0.1
 */
public class JsxxLjq extends DefaultLjq {
    @Override
    public Result update(JSONObject myParams) {
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        String dm = yobj.getString("dm");
        JSONObject obj = myParams.getJSONObject(KEY_OBJ);
        Result r = super.update(myParams);
        if(r.isStatus()&& StringUtil.isNotBlank(dm)){
            //权限代码调整时，联动调整子权限的代码
            db().update("update sys_qx_jsxx t set t.dm=replace(t.dm,?,?),t.fjs=replace(t.fjs,?,?),"
                    + "t.gxsj=? where t.dm like ?",
                    obj.getString("dm")+"_",dm+"_",obj.getString("dm"),dm,
                    DateUtil.getGabDate(),obj.getString("dm")+"_%");
            //修改授权信息中的权限代码。
            db().update("update sys_qx_jsqxgl t set t.js=replace(t.js,?,?),"
                    + "t.gxsj=? where t.js like ?",
                    obj.getString("dm"),dm,DateUtil.getGabDate(),obj.getString("dm")+"%");
            db().update("update sys_qx_yhjsgl t set t.js=replace(t.js,?,?),"
                    + "t.gxsj=? where t.js like ?",
                    obj.getString("dm"),dm,DateUtil.getGabDate(),obj.getString("dm")+"%");
            UserManager.flushUserQxxx();
        }
        return r;
    }
    /**
     * 刷新用户权限
     * @return 处理结果
     */
    public Result sxyhqx(JSONObject myParams) {
        UserManager.flushUserQxxx();
        return success("刷新用户权限成功");
    }
}
