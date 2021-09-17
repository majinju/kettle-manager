/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.Result;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.sjzt.Db;
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
    public Result jcxx(SysSjglSjdx sjdx, String myparams,
            HttpServletRequest request) {
        Result r = super.jcxx(sjdx, myparams, request);
        JSONObject p = (JSONObject)r.getData();
        JSONObject obj = p.getJSONObject(KEY_OBJ);
        SysQxYhxx user = (SysQxYhxx) p.get(KEY_USER);
        if(StringUtil.isNotBlank(obj.getString("bt"))){
            Result r1 = qxpdByBj( user,obj.getString("zt"),obj.getString("cjrdm"),
                    obj.getString("cjrdwdm"),obj.getString("kjx"));
            if(!r1.isStatus()){
                return r1;
            }
        }else if(StringUtil.isNotBlank(obj.getString("id"))){
            return failed("该文档不存在或没权限");
        }
        JSONObject yobj = p.getJSONObject(KEY_YOBJ);
        if(yobj.getBooleanValue("yd")){
            JSONObject s = p.getJSONObject(KEY_SJDX);
            Db.use(s.getString("dxzt")).update("update SYS_SJGL_GRBJ t set t.ydcs=(t.ydcs+1) where t.id=?",
                    yobj.getString("id"));
        }
        return r;
    }
    
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#getdata(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @SuppressWarnings("unchecked")
    @Override
    public Result getdata(SysSjglSjdx sjdx, JSONObject myParams) {
        Result r = super.getdata(sjdx, myParams);
        String cllx = myParams.getString(KEY_CLLX);
        SysQxYhxx user = (SysQxYhxx) myParams.get(KEY_USER);
        switch (cllx) {
        case "getTreeCN":
            JSONObject rd = (JSONObject) r.getData();
            List<JSONObject> list = (List<JSONObject>)rd.get("list");
            Iterator<JSONObject> li = list.iterator();
            while(li.hasNext()){
                JSONObject obj = li.next();
                if(!qxpdByBj( user,obj.getString("zt"),obj.getString("cjrdm"),
                        obj.getString("cjrdwdm"),obj.getString("kjx")).isStatus()){
                    //移除无权限的笔记
                    li.remove();
                }
            }
        default:
            //默认操作
            return r;
        }
    }

    /**
    * 权限判断-笔记 <br/>
    * @author jingma
    * @param user
    * @param zt
    * @param cjrdm
    * @param cjrdwdm
    * @param kjx
    * @return
    */
    public static Result qxpdByBj(SysQxYhxx user, String zt, String cjrdm, String cjrdwdm, String kjx) {
        //是否管理员
        if(QxManager.hasAuthCode(user, LjqInterface.KEY_AUTH_KFZFW_SYS)){
            //管理员无限制
            return success("系统管理员");
        }
        Result r1 = failed("");
        r1.setCode(QxManager.AUTH_CODE_WQX);
        //草稿状态，且非本人
        if("01".equals(zt)&&!cjrdm.equals(user.getYhdm())){
            r1.setMsg("该文档还为发布，敬请期待发布");
        }
        //可见范围控制
        switch (kjx) {
        case "01":
            //仅自己
            if(!cjrdm.equals(user.getYhdm())){
                r1.setMsg("该文档仅创建人可见");
            }
            break;
        case "02":
            //本单位
            if(!cjrdwdm.equals(user.getSsjg())){
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
        }
        if(StringUtils.isBlank(r1.getMsg())){
            //没有设置无权限消息，则是有权限
            r1 = success("有权限");
        }
        return r1;
    }
}
