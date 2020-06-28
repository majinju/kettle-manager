/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import javax.servlet.http.HttpServletRequest;

import cn.benma666.db.Db;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.myutils.JsonResult;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.web.QxManager;
import cn.benma666.web.UserManager;

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
        JSONObject p = (JSONObject)r.getData();
        JSONObject yobj = p.getJSONObject(KEY_YOBJ);
        JSONObject s = p.getJSONObject(KEY_SJDX);
        if(yobj.getBooleanValue("yd")){
            Db.use(s.getString("dxzt")).update("update SYS_SJGL_GRBJ t set t.ydcs=(t.ydcs+1) where t.id=?",
                    yobj.getString("id"));
        }
        JSONObject obj = p.getJSONObject(KEY_OBJ);
        SysQxYhxx user = (SysQxYhxx) p.get(KEY_USER);
        //是否管理员
        if(QxManager.hasAuthCode(user, KEY_AUTH_KFZFW_GLY)){
            //管理员无限制
            return r;
        }
        JsonResult r1 = error("");
        r1.setCode(QxManager.AUTH_CODE_WQX);
        //草稿状态，且非本人
        if("01".equals(obj.getString("zt"))&&!obj.getString("cjrdm").equals(user.getYhdm())){
            r1.setMsg("该文档还为发布，敬请期待发布");
        }
        //可见范围控制
        switch (obj.getString("kjx")) {
        case "01":
            //仅自己
            if(!obj.getString("cjrdm").equals(user.getYhdm())){
                r1.setMsg("该文档仅创建人可见");
            }
            break;
        case "02":
            //本单位
            if(!obj.getString("cjrdwdm").equals(user.getSsjg())){
                r1.setMsg("该文档仅创建人同单位人员可见");
            }
            break;
        case "03":
            //登陆用户
            if(UserManager.LSYH.equals(user.getYhdm())){
                r1.setMsg("该文档需要登录后才能查看");
            }
            break;
            //后续考虑支持授权访问，就是将笔记id作为权限编码加入权限管理，进行授权。
        default:
            //完全公开
            r1 = success("");
        }
        if(r1.isStatus()){
            return r;
        }else{
            return r1;
        }
    }
}
