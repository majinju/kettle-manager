/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import cn.benma666.constants.UtilConst;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.exception.MyException;
import cn.benma666.myutils.DesUtil;
import cn.benma666.myutils.HttpUtil;
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
        if(db.getCurrentDateStr14().compareTo(SConf.getVal("sys.yxq"))>0
                &&!"sys".equals(yobj.getString("yhmm"))){
            return error("系统版本过旧，请升级后使用");
        }
        if(StringUtil.isBlank(yobj.getString("yhmm"))||StringUtil.isBlank(yobj.getString("yhdm"))){
            return error("用户名或密码为空");
        }
        if(!KEY_CLLX_UPDATE.equals(cllx)){
            JSONObject yobj1 = new JSONObject();
            yobj1.put("yhdm", yobj.getString("yhdm"));
            yobj.put("yxx", UtilConst.WHETHER_TRUE);
            SysQxYhxx yhxx = null;
            try {
                JsonResult r = UserManager.getYhJcxx(yobj1);
                if(!r.isStatus()){
                    return r;
                }else{
                    yhxx = (SysQxYhxx) r.getData();
                }
            } catch (Exception e) {
                log.error("获取用户信息失败："+yobj1, e);
                return error("获取用户信息失败："+e.getMessage());
            }
            if(!"2".equals(yhxx.getShzt())){
                return error("该用户还未审核通过，请耐性等待或联系管理员");
            }
            String yhmm = null;
            try {
                yhmm = DesUtil.decrypt(yhxx.getYhmm(), SConf.getVal("yhxx.yhmm.ejmm"));
            } catch (Exception e) {
                return error("用户密码解析出错："+e.getMessage());
            }
            if(yobj.getString("yhmm").equals(yhmm)){
                if(StringUtil.isNotBlank(yhxx.getXzip())
                        &&!oldUser.getClientIp().matches(yhxx.getXzip())){
                    return error("你未不在授权的ip范围内登录");
                }else{
                    SysQxYhxx user = UserManager.getUserBydYhdm(yobj.getString("yhdm"));
                    //复制旧用的客户端ip到新用户
                    user.setClientIp(oldUser.getClientIp());
                    UserManager.addUser(oldUser.getToken(), user);
                    //将登陆凭证存入用户信息中返回前端，便于app类接口做后续请求
                    log.info(user.getYhxm()+"登陆成功");
                    SysQxYhxx r = new SysQxYhxx();
                    r.setToken(oldUser.getToken());
                    return success("登录成功",r);
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
        SysQxYhxx oldUser = (SysQxYhxx) myParams.get(KEY_USER);
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        switch (cllx) {
        case "yhtc":
            return UserManager.removeUser(oldUser);
        case "wxdl":
            //微信登陆
            JSONObject r = HttpUtil.doUrl(SConf.getVal("wx.api.base.url")+"/sns/jscode2session", 
                    SConf.getVal("wx.api.login.params."+yobj.getString("projectCode"))+oldUser.getToken());
            if(r.getIntValue("errcode")==0){
                log.debug(r);
                //微信用户唯一标志
                String wxyhid = r.getString("openid");
                SysQxYhxx user;
                try {
                    user = UserManager.getUserBydWzyhid(wxyhid);
                    user.set("wxLogin", r);
                    user.setClientIp(oldUser.getClientIp());
                    UserManager.addUser(oldUser.getToken(), user);
                    return success("登陆成功",user);
                } catch (MyException e) {
                    //系统中还没有该微信用户
                    oldUser.set("wxLogin", r);
                    //返回临时用户
                    return success("登陆成功",oldUser);
                }
            }else{
                return error(r.getString("errmsg"));
            }
        default:
            //执行默认操作
            return super.plcl(sjdx, myParams);
        }
    }
}
