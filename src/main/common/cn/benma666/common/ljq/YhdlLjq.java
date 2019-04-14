/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.sjgl.SysSjglSjdx;
import cn.benma666.web.SysQxYhxx;
import cn.benma666.web.UserManager;

import com.alibaba.fastjson.JSONObject;

/**
 * 用户登录拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class YhdlLjq extends DefaultLjq{
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#save(cn.benma666.sjgl.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult save(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = myParams.getString(LjqInterface.KEY_CLLX);
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        SysQxYhxx oldUser = (SysQxYhxx) myParams.get(KEY_USER);
        if(StringUtil.isBlank(yobj.getString("yhmm"))||StringUtil.isBlank(yobj.getString("yhdm"))){
            return error("用户名或密码为空");
        }
        if(!KEY_CLLX_UPDATE.equals(cllx)){
            JSONObject yhxx = db.findFirst("select * from sys_qx_yhxx t where t.yhdm=? and t.yxx='1'", 
                    yobj.getString("yhdm"));
            if(yhxx==null){
                return error("用户不存在");
            }else if(yobj.getString("yhmm").equals(yhxx.getString("yhmm"))){
                if(StringUtil.isNotBlank(yhxx.getString("xzip"))
                        &&!oldUser.getClientIp().matches(yhxx.getString("xzip"))){
                    return error("你未不在授权的ip范围内登录");
                }else{
                    SysQxYhxx user = UserManager.getUserBydYhdm(yobj.getString("yhdm"));
                    user.setClientIp(oldUser.getClientIp());
                    UserManager.addUser(oldUser.getToken(), user);
                    return success("登录成功",yhxx);
                }
            }else{
                return error("密码不正确");
            }
        }
        return error("弄啥呢");
    }
}
