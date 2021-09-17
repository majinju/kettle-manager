/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import java.io.File;
import java.io.IOException;

import cn.benma666.common.service.CommonService;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglFile;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.Result;
import cn.benma666.myutils.HttpUtil;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.LjqManager;

import com.alibaba.fastjson.JSONObject;

/**
 * 用户注册拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class YhzcLjq extends DefaultLjq{
    
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public Result plcl(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = myParams.getString(KEY_CLLX);
        SysQxYhxx oldUser = (SysQxYhxx) myParams.get(KEY_USER);
        switch (cllx) {
        case "wx-save-user-info":
            JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
            JSONObject wxui = JSONObject.parseObject(yobj.getString("wxyhxx"));
            try {
                //头像保存到文件系统
                File f = HttpUtil.downLoadFromUrl(wxui.getString("avatarUrl"), null, wxui.getString("nickName")+".jpg", "/tmp/lswj");
                SysSjglFile fileObj = new SysSjglFile();
                fileObj.setSjzt("default");
                fileObj.setYwdm("wx");
                fileObj.setWjlb("tx");
                Result r1 = CommonService.upload(fileObj , f, oldUser);
                f.delete();
                if(!r1.isStatus()){
                    return r1;
                }
                JSONObject fo = (JSONObject) r1.getData();
                yobj.put("tx", fo.getString("id"));
                yobj.put("yhxm", wxui.getString("nickName"));
                JSONObject wxLogin = (JSONObject) oldUser.get("wxLogin");
                yobj.put("wxyhid", wxLogin.getString("openid"));
                //没有用户代码等信息，只能微信登陆，需要pc端登陆需要在微信中完善用户信息。
                myParams.put(KEY_CLLX, KEY_CLLX_INSERT);
                r1 = LjqManager.save(sjdx, myParams);
                if(r1.isStatus()){
                    return success("用户信息保存成功", yobj);
                }else{
                    return r1;
                }
            } catch (IOException e) {
                log.error("保存用户头像失败", e);
                return failed("保存用户头像失败");
            }
        default:
            //执行默认操作
            return super.plcl(sjdx, myParams);
        }
    }
}
