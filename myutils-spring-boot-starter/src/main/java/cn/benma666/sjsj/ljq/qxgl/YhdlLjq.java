/**
 * Project Name:sjgl
 * Date:2018年12月16日
 * Copyright (c) 2018, jingma All Rights Reserved.
 */

package cn.benma666.sjsj.ljq.qxgl;

import cn.benma666.domain.SysQxYhxx;
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
import org.beetl.sql.core.SqlId;

import java.util.Map;

/**
 * 用户登录拦截器 <br/>
 * date: 2018年12月16日 <br/>
 *
 * @author jingma
 */
public class YhdlLjq extends DefaultLjq {

    /**
     * 用户登陆
     * @return 处理结果
     */
    public Result yhdl(JSONObject myParams) {
        SysQxYhxx oldUser = (SysQxYhxx) myParams.get(KEY_USER);
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        SysQxYhxx user;
        //用户账户密码登陆
        if (DateUtil.getGabDate().compareTo(Conf.getVal("sys.yxq")) > 0
                && !"sys".equals(yobj.getString("yhdm"))) {
            return failed("系统版本过旧，请升级后使用");
        }
        if (StringUtil.isBlank(yobj.getString("yhmm")) || StringUtil.isBlank(yobj.getString("yhdm"))) {
            return failed("用户名或密码为空");
        }
        if(oldUser.getYhdm().equals(yobj.getString("yhdm"))){
            return xtjcxx(myParams, oldUser);
        }
        JSONObject jsonObj = db().findFirst(SqlId.of("sjsj", "findUser"), yobj);
        if (jsonObj == null) {
            return failed("没有找到该用户" , yobj.getString("yhdm"));
        }
        SysQxYhxx yhxx = jsonObj.toJavaObject(SysQxYhxx.class);
        String yhmm;
        try {
            // 获取用户信息基础参数对象
            JSONObject yhxxParams = LjqManager.jcxxByDxdm("SYS_QX_YHXX");
            //将用户输入的密码加密
            yhmm = StringUtil.desEnByField(yobj.getString("yhmm"),((Map<String, JSONObject>)
                    yhxxParams.get(KEY_FIELDS)).get("yhmm"));
        } catch (Exception e) {
            return failed("用户密码解析出错，请联系管理员");
        }
        if (!yhxx.getYhmm().equals(yhmm)) {
            return failed("密码不正确");
        }
        if (StringUtil.isNotBlank(yhxx.getXzip())
                && !oldUser.getClientIp().matches(yhxx.getXzip())) {
            return failed("你未不在授权的ip范围内登录");
        }
        user = UserManager.findUser(jsonObj);
        return xtjcxx(myParams, user);
    }
    /**
     * 微信登陆
     * @return 处理结果
     */
    public Result wxdl(JSONObject myParams) {
        SysQxYhxx oldUser = (SysQxYhxx) myParams.get(KEY_USER);
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        SysQxYhxx user;
        //微信登陆
        JSONObject r = HttpUtil.doJosnByFrom(Conf.getVal("wx.api.base.url") + "/sns/jscode2session",
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
            return xtjcxx(myParams, user);
        } catch (MyException e) {
            //系统中还没有该微信用户
            oldUser.set("wxLogin", r);
            //返回临时用户
            return xtjcxx(myParams, oldUser);
        }
    }
    /**
     * 用户退出
     * @return 处理结果
     */
    public Result yhtc(JSONObject myParams) {
        SysQxYhxx oldUser = (SysQxYhxx) myParams.get(KEY_USER);
        return UserManager.removeUser(oldUser);
    }

    /**
     * @param myParams 参数
     * @param user 最新用户信息
     * @return 系统基础信息
     */
    private Result xtjcxx(JSONObject myParams, SysQxYhxx user) {
        UserManager.addUser(myParams.getString($_SYS_TOKEN), user);
        myParams.put(KEY_USER, user);
        return super.xtjcxx(myParams);
    }
}
