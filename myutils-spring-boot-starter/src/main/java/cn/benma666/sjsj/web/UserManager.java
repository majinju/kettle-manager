/**
 * Project Name:myutils
 * Date:2018年12月19日
 * Copyright (c) 2018, jingma All Rights Reserved.
 */

package cn.benma666.sjsj.web;

import cn.benma666.crypt.DesUtil;
import cn.benma666.domain.SysQxJgxx;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.exception.MyException;
import cn.benma666.iframe.*;
import cn.benma666.myutils.DateUtil;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjzt.Db;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;
import org.beetl.sql.core.SqlId;
import org.springframework.data.redis.core.RedisTemplate;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.Duration;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * 用户管理器 <br/>
 * date: 2018年12月19日 <br/>
 * @author jingma
 */
public class UserManager extends BasicObject {
    /**
     * 临时用户
     */
    public static final String LSYH = "lsyh";
    /**
     * 登陆凭证
     */
    public static final String TOKEN = "token";
    /**
     * 登陆时间KEY
     */
    public static final String DLSJ = "dlsj";
    /**
     * redis工具
     */
    private static RedisTemplate<String, Object> redisTemplate;
    /**
     * 会话有效期
     */
    private static long sessionYxq = 12*60;
    /**
     * 用户信息缓存
     */
    private static final JSONObject userCache = CacheFactory.use(LjqInterface.KEY_USER);

    public UserManager(RedisTemplate<String, Object> redisTemplate) {
        UserManager.redisTemplate = redisTemplate;
        sessionYxq = Duration.parse("PT"+valByDef(Conf.getVal("server.servlet.session.timeout"),
                sessionYxq+"m")).toMinutes();
    }

    /**
     * 获取用户信息 <br/>
     *
     * @param myParams 参数
     * @return 用户信息，当token为空时返回空
     * @author jingma
     */
    public static SysQxYhxx getUser(JSONObject myParams) {
        String token = myParams.getString(LjqInterface.$_SYS_TOKEN);
        if (StringUtil.isBlank(token)) {
            //token一般来说一定会有值，没有值为系统内部调用
            return null;
        }
        SysQxYhxx user = userCache.getObject(token,SysQxYhxx.class);
        if(user!=null){
            long dlsj = (long) user.get(DLSJ);
            if(System.currentTimeMillis()-dlsj>sessionYxq*600000){
                //过期
                user = null;
            }else{
                //重置有效期
                if(redisTemplate!=null){
                    redisTemplate.expire(LjqInterface.KEY_USER+token,sessionYxq, TimeUnit.MINUTES);
                }
                user.set(DLSJ,System.currentTimeMillis());
            }
        }
        if(user==null&&redisTemplate!=null){
            Object obj = redisTemplate.opsForValue().get(LjqInterface.KEY_USER+token);
            if(obj != null) {
                //本系统过期，或本系统第一次访问，其他子系统还在访问的场景
                user = (SysQxYhxx) obj;
                redisTemplate.expire(LjqInterface.KEY_USER+token,sessionYxq, TimeUnit.MINUTES);
                user.set(DLSJ,System.currentTimeMillis());
                userCache.put(user.getToken(),user);
            }
        }
        //实现免登陆，处理带用户信息的url
        if (user == null || (LSYH.equals(user.getYhdm()) && JSONPath.eval(myParams, "$.sys.userInfo") != null)) {
            //第一次请求或（是临时用户且提供了加密用户信息）
            return zddl(myParams, token);
        }
        return user;
    }

    /**
     * 将用户信息加密，然后重定向到指定url <br/>
     * @param url 待转发地址
     * @param projectCode 项目代码
     * @param user 用户标志，默认为用户身份证号，可以采用“yhdm=xxx”的形式传入用户代码进行自动登陆
     * @return 带用户信息的地址
     * @throws UnsupportedEncodingException 编码异常
     * @author jingma
     */
    public static String doDesEncryptUrl(String url, String projectCode, String user)
            throws UnsupportedEncodingException {
        String userInfo = DateUtil.getGabDate() + "@" + user;
        JSONObject app = DictManager.zdObjByDm(LjqInterface.ZD_SYS_QX_APP, projectCode);
        String pwd = app.getString("mm");
        if (StringUtil.isBlank(pwd)) {
            throw new MyException("应用必须设置密码");
        }
        try {
            pwd = DesUtil.decrypt(pwd, Conf.getVal("benma666.app.ejmm"));
        } catch (Exception e) {
            throw new MyException("应用密码解析出错：" + e.getMessage());
        }
        userInfo = DesUtil.encrypt(userInfo, pwd).replaceAll("[\n\r]", "");
        url = app.getString("dz") + url;
        int idx = url.indexOf("?");
        if (idx > -1) {
            //解决url中包含中文参数导致转发后中文信息丢失问题。
            StringBuilder url1 = new StringBuilder(url.substring(0, idx + 1));
            for (String p : url.substring(idx + 1).split("&")) {
                String[] pa = p.split("=");
                url1.append(pa[0]).append("=").append(URLEncoder.encode(pa[1], "utf8")).append("&");
            }
            url = url1.toString();
        } else {
            url += "?";
        }
        url += "sys.userInfo=" + URLEncoder.encode(userInfo, "utf8");
        return url;
    }

    /**
     * 自动登陆 <br/>
     * @param myParams 参数
     * @param token    权限认证key
     * @return 登陆后的用户信息
     * @author jingma
     */
    public static SysQxYhxx zddl(JSONObject myParams, String token) {
        SysQxYhxx user = null;
        Object obj = JSONPath.eval(myParams, "$.sys.userInfo");
        if (!StringUtil.isBlank(obj)) {
            String userInfo = obj.toString();
            JSONObject app = DictManager.zdObjByDm(LjqInterface.ZD_SYS_QX_APP,
                    Conf.getVal("benma666.app.dm"));
            String pwd = app.getString("mm");
            String zddlms = app.getString("zddlms");
            if (StringUtil.isBlank(pwd)) {
                throw new MyException("应用未设置密码", myParams);
            }
            try {
                //解密应用密码
                pwd = DesUtil.decrypt(pwd, Conf.getVal("benma666.app.ejmm"));
            } catch (Exception e) {
                throw new MyException("解析用户信息失败：" + userInfo + ">" + e.getMessage(), e);
            }
            if ("date_user".equals(zddlms)) {
                //用户时间加密模式，用户信息解密
                userInfo = DesUtil.decrypt(userInfo, pwd);
            }
            int idx = userInfo.indexOf("@");
            if ("date_user".equals(zddlms)) {
                //用户时间加密模式，推荐使用
                Date urlDate = DateUtil.parseDate(userInfo.substring(0, idx));
                if (Math.abs(urlDate.getTime() - new Date().getTime()) > 1000 * 60 * 5) {
                    throw new MyException("用户信息过期：" + userInfo, myParams);
                }
            } else if ("pwd_user".equals(zddlms)) {
                String ipxz = JSON.parseObject(app.getString("kzxx")).getString("ipxz");
                if(StringUtil.isBlank(ipxz)){
                    throw new MyException("一般密码模式自动登陆的应用必须配置ip限制：" + userInfo, myParams);
                }
                if(!myParams.getString("$.sys.clientIp").matches(ipxz)){
                    throw new MyException("请在规定的ip机器上访问：" + userInfo, myParams);
                }
                if(!pwd.equals(userInfo.substring(0, idx))){
                    //明文密码加用户模式，内部调用
                    throw new MyException("密码不正确：" + userInfo, myParams);
                }
            }
            try {
                String u = userInfo.substring(idx + 1);
                if (u.startsWith("yhdm=")) {
                    user = getUserBydYhdm(userInfo.substring(idx + 6));
                } else {
                    user = getUserBydSfzh(u);
                }
                slog.info("自动登陆成功:" + user.getSfzh());
            } catch (MyException e) {
                throw new MyException("查找用户失败，" + e.getMessage(), myParams);
            }
        }
        //没有登录时，返回临时用户，后续可以在权限系统中对临时用户进行授权
        if (user == null) {
            obj = userCache.get(LSYH);
            if(obj==null){
                user = getUserBydYhdm(LSYH);
                addUser(LSYH, user);
            }else{
                user = (SysQxYhxx) obj;
            }
        }
        if (StringUtil.isNotBlank(user.getXzip())
                && !user.getClientIp().matches(user.getXzip())) {
            throw new MyException("你未不在授权的ip范围内登录：" + user, myParams);
        } else {
            addUser(token, user);
        }
        return user;
    }

    /**
     * 添加用户 <br/>
     *
     * @param token 权限码
     * @param user 用户信息
     * @author jingma
     */
    public static void addUser(String token, SysQxYhxx user) {
        if (StringUtil.isNotBlank(token)) {
            user.setToken(token);
            if(redisTemplate!=null){
                redisTemplate.opsForValue().set(LjqInterface.KEY_USER+token, user, sessionYxq, TimeUnit.MINUTES);
            }
            //设置登陆时间
            user.set(DLSJ,System.currentTimeMillis());
            userCache.put(token,user);
        } else {
            slog.debug("权限码为空：" + user);
        }
    }

    /**
     * 移除登陆的用户，用户登陆退出 <br/>
     *
     * @param user 要移除的用户
     * @return 处理结果
     * @author jingma
     */
    public static Result removeUser(SysQxYhxx user) {
        if(redisTemplate!=null){
            redisTemplate.delete(LjqInterface.KEY_USER+user.getToken());
        }
        userCache.remove(user.getToken());
        return success("退出成功");
    }

    /**
     * 基于用户代码获取用户信息 <br/>
     *
     * @param sfzh 身份证
     * @return 用户信息
     * @author jingma
     */
    public static SysQxYhxx getUserBydSfzh(String sfzh) {
        JSONObject yobj = new JSONObject();
        yobj.put("sfzh", sfzh);
        return findUser(yobj);
    }

    /**
     * 基于用户代码获取用户信息 <br/>
     *
     * @param yhdm 用户代码
     * @return 用户信息
     * @author jingma
     */
    public static SysQxYhxx getUserBydYhdm(String yhdm) {
        JSONObject yobj = new JSONObject();
        yobj.put("yhdm", yhdm);
        return findUser(yobj);
    }

    /**
     * 基于微信用户信息获取用户信息 <br/>
     *
     * @param wxyhid 微信用户id
     * @return 用户信息
     * @author jingma
     */
    public static SysQxYhxx getUserBydWzyhid(String wxyhid) throws MyException {
        JSONObject yobj = new JSONObject();
        yobj.put("wxyhid", wxyhid);
        return findUser(yobj);
    }

    /**
     * 获取用户的完整信息，包括基础信息、机构、权限 <br/>
     *
     * @param yobj 用于获取用户信息的标志
     * @return 用户信息
     * @author jingma
     */
    public static SysQxYhxx findUser(JSONObject yobj) throws MyException {
        //查询用户
        SysQxYhxx user;
        user = Db.useSqlManager().selectSingle(SqlId.of("sjsj", "findUser"), yobj, SysQxYhxx.class);
        if(user==null){
            throw new MyException("没有找到用户："+yobj);
        }
        //取消用户密码，登录后就不再需要使用，避免传到前端
        user.setYhmm(null);
        //查询机构
        SysQxJgxx jgxx = Db.useSqlManager().selectSingle(SqlId.of("sjsj", "findJgxx"), user,
                SysQxJgxx.class);
        if(jgxx==null){
            throw new MyException("没有找到用户的机构："+user);
        }
        user.setJgxx(jgxx);
        //查询角色
        user.setJsMap(Db.use().findMap("js",SqlId.of("sjsj","findJsxx"),Db.buildMap(user.getId())));
        //设置用户权限
        user.setQxMap(Db.use().findMap("dm", SqlId.of("sjsj","findYhqxxx"), Db.buildMap(user)));
        return user;
    }

    /**
     * 刷新用户权限信息 <br/>
     *
     * @author jingma
     */
    public static void flushUserQxxx() {
        SysQxYhxx user;
        if(redisTemplate!=null){
            //使用redis
            for (String key : redisTemplate.keys("user*")) {
                user = ((SysQxYhxx) redisTemplate.opsForValue().get(key));
                Map<String, JSONObject> qxMap = Db.use().findMap("dm", SqlId.of("sjsj","findYhqxxx"),
                        Db.buildMap(user));
                user.setQxMap(qxMap);
                user.set(DLSJ,System.currentTimeMillis());
                userCache.put(user.getToken(),user);
                redisTemplate.opsForValue().set(key,user,sessionYxq, TimeUnit.MINUTES);
            }
        }else{
            //不使用redis
            for (String key : userCache.keySet()) {
                user = userCache.getObject(key,SysQxYhxx.class);
                Map<String, JSONObject> qxMap = Db.use().findMap("dm", SqlId.of("sjsj","findYhqxxx"),
                        Db.buildMap(user));
                user.setQxMap(qxMap);
                user.set(DLSJ,System.currentTimeMillis());
                userCache.put(user.getToken(),user);
            }
        }
    }
}
