/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import javax.servlet.http.HttpServletRequest;

import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.sjgl.SysSjglSjdx;
import cn.benma666.web.SysQxYhxx;
import cn.benma666.web.UserManager;
import cn.benma666.web.WebUtil;

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
    public JsonResult save(SysSjglSjdx sjdx, JSONObject myJsonParams) {
        String cllx = myJsonParams.getString(LjqInterface.KEY_CLLX);
        JSONObject yobj = myJsonParams.getJSONObject(KEY_YOBJ);
        if(!KEY_CLLX_UPDATE.equals(cllx)){
            JSONObject yhxx = db.findFirst("select * from sys_qx_yhxx t where t.yhdm=? and t.yxx='1'", 
                    yobj.getString("yhdm"));
            if(yhxx==null){
                return error("用户不存在");
            }else if(yobj.getString("yhmm").equals(yhxx.getString("yhmm"))){
                HttpServletRequest req = (HttpServletRequest) myJsonParams.get(KEY_REQUEST);
                if(StringUtil.isNotBlank(yhxx.getString("xzip"))
                        &&!WebUtil.getIpAddr(req).matches(yhxx.getString("xzip"))){
                    return error("你未不在授权的ip范围内登录");
                }else{
                    SysQxYhxx user = UserManager.getUserBydYhdm(yobj.getString("yhdm"));
                    UserManager.addUser(UserManager.getToken(req), user);
                    return success("登录成功",yhxx);
                }
            }else{
                return error("密码不正确");
            }
        }
        return error("弄啥呢");
    }
}
