/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.myutils.DesUtil;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.web.SConf;
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
    * @see cn.benma666.sjgl.DefaultLjq#save(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult save(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = myParams.getString(LjqInterface.KEY_CLLX);
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        SysQxYhxx oldUser = (SysQxYhxx) myParams.get(KEY_USER);
        if(db.getCurrentDateStr14().compareTo("20210101000000")>0){
            return error("系统版本过旧，请升级后使用");
        }
        if(StringUtil.isBlank(yobj.getString("yhmm"))||StringUtil.isBlank(yobj.getString("yhdm"))){
            return error("用户名或密码为空");
        }
        if(!KEY_CLLX_UPDATE.equals(cllx)){
            JSONObject yhxx = db.findFirst("select * from sys_qx_yhxx t where t.yhdm=? and t.yxx='1'", 
                    yobj.getString("yhdm"));
            if(yhxx==null){
                return error("用户不存在");
            }
            if(!"2".equals(yhxx.getString("shzt"))){
                return error("该用户还未审核通过，请耐性等待或联系管理员");
            }
            String yhmm = null;
            try {
                yhmm = DesUtil.decrypt(yhxx.getString("yhmm"), SConf.getVal("yhxx.yhmm.ejmm"));
            } catch (Exception e) {
                return error("用户密码解析出错："+e.getMessage());
            }
            if(yobj.getString("yhmm").equals(yhmm)){
                if(StringUtil.isNotBlank(yhxx.getString("xzip"))
                        &&!oldUser.getClientIp().matches(yhxx.getString("xzip"))){
                    return error("你未不在授权的ip范围内登录");
                }else{
                    SysQxYhxx user = UserManager.getUserBydYhdm(yobj.getString("yhdm"));
                    //复制旧用的客户端ip到新用户
                    user.setClientIp(oldUser.getClientIp());
                    UserManager.addUser(oldUser.getToken(), user);
                    //将登陆凭证存入用户信息中返回前端，便于app类接口做后续请求
                    yhxx.put(UserManager.TOKEN, oldUser.getToken());
                    log.info(user.getYhxm()+"登陆成功");
                    return success("登录成功",yhxx);
                }
            }else{
                return error("密码不正确");
            }
        }
        return error("弄啥呢");
    }
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult plcl(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = myParams.getString(KEY_CLLX);
        switch (cllx) {
        case "yhtc":
            SysQxYhxx oldUser = (SysQxYhxx) myParams.get(KEY_USER);
            return UserManager.removeUser(oldUser);
        default:
            //执行默认操作
            return super.plcl(sjdx, myParams);
        }
    }
}
