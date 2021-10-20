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
import cn.benma666.sjsj.web.LjqManager;
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
        SysQxYhxx oldUser = (SysQxYhxx) myParams.get(KEY_USER);
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        SysQxYhxx user;
        switch (getCllx(myParams)) {
            case "yhdl":
                //用户账户密码登陆
                if (DateUtil.getGabDate().compareTo(Conf.getVal("sys.yxq")) > 0
                        && !"sys".equals(yobj.getString("yhdm"))) {
                    return failed("系统版本过旧，请升级后使用");
                }
                if (StringUtil.isBlank(yobj.getString("yhmm")) || StringUtil.isBlank(yobj.getString("yhdm"))) {
                    return failed("用户名或密码为空");
                }
                if(oldUser.getYhdm().equals(yobj.getString("yhdm"))){
                    return xtjcxx(sjdx, myParams, oldUser);
                }
                JSONObject jsonObj = db().findFirst(SqlId.of("sjsj", "findUser"), yobj);
                if (jsonObj == null) {
                    return failed("没有找到该用户" , yobj.getString("yhdm"));
                }
                SysQxYhxx yhxx = jsonObj.toJavaObject(SysQxYhxx.class);
                String yhmm;
                try {
                    yhmm = DesUtil.decrypt(yhxx.getYhmm(), Conf.getVal("benma666.yhxx.ejmm"));
                } catch (Exception e) {
                    return failed("用户密码解析出错，请联系管理员");
                }
                if (!yobj.getString("yhmm").equals(yhmm)) {
                    return failed("密码不正确");
                }
                if (StringUtil.isNotBlank(yhxx.getXzip())
                        && !oldUser.getClientIp().matches(yhxx.getXzip())) {
                    return failed("你未不在授权的ip范围内登录");
                }
                user = UserManager.getUserBydYhdm(yobj.getString("yhdm"));
                return xtjcxx(sjdx, myParams, user);
            case "wxdl":
                //微信登陆
                JSONObject r = HttpUtil.doUrl(Conf.getVal("wx.api.base.url") + "/sns/jscode2session",
                        Conf.getVal("wx.api.login.params." + yobj.getString("projectCode")) + oldUser.getToken());
                if (r.getIntValue("errcode") != 0) {
                    return failed(r.getString("errmsg"));
                }
                log.debug("从微信获取的用户信息："+r.toJSONString());
                //微信用户唯一标志
                String wxyhid = r.getString("openid");
                try {
                    if(wxyhid.equals(oldUser.getWxyhid())){
                        return success("用户已经登录过了", oldUser.getToken());
                    }
                    user = UserManager.getUserBydWzyhid(wxyhid);
                    user.set("wxLogin", r);
                    return xtjcxx(sjdx, myParams, user);
                } catch (MyException e) {
                    //系统中还没有该微信用户
                    oldUser.set("wxLogin", r);
                    //返回临时用户
                    return xtjcxx(sjdx, myParams, oldUser);
                }
            case "yhtc":
                return UserManager.removeUser(oldUser);
            case "sxyhqx":
                UserManager.flushUserQxxx();
                return success("刷新用户权限成功");
            default:
                //执行默认操作
                return super.data(sjdx, myParams);
        }
    }

    /**
     * @param sjdx 数据对象
     * @param myParams 参数
     * @param user 最新用户信息
     * @return 系统基础信息
     */
    private Result xtjcxx(SysSjglSjdx sjdx, JSONObject myParams, SysQxYhxx user) {
        UserManager.addUser(JSONPath.eval(myParams,$_SYS_TOKEN).toString(), user);
        myParams.put(KEY_USER, user);
        JSONPath.set(myParams,$_SYS_CLLX,KEY_CLLX_XTJCXX);
        return LjqManager.data(sjdx, myParams);
    }
}
