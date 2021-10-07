/**
 * Project Name:sjgl
 * Date:2018年12月16日
 * Copyright (c) 2018, jingma All Rights Reserved.
 */

package cn.benma666.sjsj.ljq.qxgl;

import cn.benma666.crypt.DesUtil;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.exception.MyException;
import cn.benma666.iframe.Conf;
import cn.benma666.iframe.Result;
import cn.benma666.myutils.DateUtil;
import cn.benma666.myutils.HttpUtil;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjsj.web.DefaultLjq;
import cn.benma666.sjsj.web.UserManager;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;
import org.beetl.sql.core.SqlId;

/**
 * 用户登录拦截器 <br/>
 * date: 2018年12月16日 <br/>
 *
 * @author jingma
 */
public class YhdlLjq extends DefaultLjq {

    @Override
    public Result data(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = JSONPath.eval(myParams, $_SYS_CLLX).toString();
        SysQxYhxx oldUser = (SysQxYhxx) myParams.get(KEY_USER);
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        switch (cllx) {
            case "yhdl":
                //用户账户密码登陆
                if (DateUtil.getGabDate().compareTo(Conf.getVal("sys.yxq")) > 0
                        && !"sys".equals(yobj.getString("yhmm"))) {
                    return failed("系统版本过旧，请升级后使用");
                }
                if (StringUtil.isBlank(yobj.getString("yhmm")) || StringUtil.isBlank(yobj.getString("yhdm"))) {
                    return failed("用户名或密码为空");
                }
                if(oldUser.getYhdm().equals(yobj.getString("yhdm"))){
                    return success("用户已经登录过了", oldUser.getToken());
                }
                JSONObject jsonObj = db().findFirst(SqlId.of("sjsj", "findUser"), yobj);
                if (jsonObj == null) {
                    return failed("没有找到该用户：" + yobj.getString("yhdm"));
                }
                SysQxYhxx yhxx = jsonObj.toJavaObject(SysQxYhxx.class);
                String yhmm;
                try {
                    yhmm = DesUtil.decrypt(yhxx.getYhmm(), Conf.getVal("benma666.yhxx.ejmm"));
                } catch (Exception e) {
                    return failed("用户密码解析出错，请联系管理员");
                }
                if (yobj.getString("yhmm").equals(yhmm)) {
                    if (StringUtil.isNotBlank(yhxx.getXzip())
                            && !oldUser.getClientIp().matches(yhxx.getXzip())) {
                        return failed("你未不在授权的ip范围内登录");
                    } else {
                        SysQxYhxx user = UserManager.getUserBydYhdm(yobj.getString("yhdm"));
                        //复制旧用的客户端ip到新用户
                        user.setClientIp(oldUser.getClientIp());
                        UserManager.addUser(oldUser.getToken(), user);
                        //将登陆凭证存入用户信息中返回前端，便于app类接口做后续请求
                        log.info(user.getYhxm() + "登陆成功");
                        return success("登录成功", oldUser.getToken());
                    }
                } else {
                    return failed("密码不正确");
                }
            case "wxdl":
                //微信登陆
                JSONObject r = HttpUtil.doUrl(Conf.getVal("wx.api.base.url") + "/sns/jscode2session",
                        Conf.getVal("wx.api.login.params." + yobj.getString("projectCode")) + oldUser.getToken());
                if (r.getIntValue("errcode") == 0) {
                    log.debug(r.toJSONString());
                    //微信用户唯一标志
                    String wxyhid = r.getString("openid");
                    SysQxYhxx user;
                    try {
                        if(oldUser.getWxyhid().equals(yobj.getString("wxyhid"))){
                            return success("用户已经登录过了", oldUser.getToken());
                        }
                        user = UserManager.getUserBydWzyhid(wxyhid);
                        user.set("wxLogin", r);
                        user.setClientIp(oldUser.getClientIp());
                        UserManager.addUser(oldUser.getToken(), user);
                        return success("登陆成功", user);
                    } catch (MyException e) {
                        //系统中还没有该微信用户
                        oldUser.set("wxLogin", r);
                        //返回临时用户
                        return success("登陆成功", oldUser);
                    }
                } else {
                    return failed(r.getString("errmsg"));
                }
            case "yhtc":
                return UserManager.removeUser(oldUser);
            default:
                //执行默认操作
                return super.data(sjdx, myParams);
        }
    }
}
