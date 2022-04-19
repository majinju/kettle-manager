/**
 * Project Name:myutils
 * Date:2018年12月16日
 * Copyright (c) 2018, jingma All Rights Reserved.
 */

package cn.benma666.sjsj.web;

import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.exception.MyException;
import cn.benma666.iframe.*;
import cn.benma666.myutils.JsonUtil;
import cn.benma666.sjsj.myutils.Msg;
import cn.benma666.sjzt.Db;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.parser.Feature;
import org.beetl.sql.core.SqlId;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.HashSet;
import java.util.Set;

/**
 * 系统-数据管理-拦截器管理 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 */
@Component
public class LjqManager extends BasicObject {
    /**
     * spring容器，可以从中获取注册的bean
     */
    private static ApplicationContext context;
    /**
     * 数据对象Map<对象key，对象>
     */
    private static final JSONObject sjdxMap = CacheFactory.use(LjqInterface.KEY_SJDX);
    /**
     * 内部调用缓存-对象基础信息Map<对象key，对象基础信息>
     */
    private static final JSONObject jcxxMap = CacheFactory.use(LjqInterface.KEY_CLLX_DXJCXX);
    /**
     * 拦截器结合，用于重复判断，避免再次出现注入单例对象
     */
    private static final Set<LjqInterface> ljqSet = new HashSet<>();
    /**
     * 虚拟对象
     */
    private static SysSjglSjdx xndx;

    public LjqManager(ApplicationContext context){
        //给虚拟对象赋值
        xndx = new SysSjglSjdx();
        xndx.setId(LjqInterface.ZD_SJDX_ZDYWLB_XNZD);
        LjqManager.context = context;
    }
    /**
     * 使用对应的拦截器 <br/>
     * 对象中配置的拦截器>对象代码注解设置的拦截器>默认拦截器
     * @param sjdx 数据对象
     * @return 拦截器
     * @author jingma
     */
    public static LjqInterface use(SysSjglSjdx sjdx) {
        LjqInterface ljq = (LjqInterface) sjdx.getLjqObj();
        if (ljq == null) {
            String ljqStr = sjdx.getLjq();
            if(isBlank(ljqStr)){
                //没有在对象中配置拦截器
                try{
                    ljq = (LjqInterface) context.getBean(sjdx.getDxdm());
                }catch (Throwable t){
                    //通过对象代码获取拦截器失败,忽略
                }
            }
            //没有通过对象代码找到拦截器
            if(ljq==null){
                //没有配置拦截器
                if(isBlank(ljqStr)){
                    //从配置文件中读取默认拦截器
                    ljqStr = Conf.getVal("benma666.ljq.default","MyDefaultLjq");
                }
                try{
                    // 支持从spring容器中取拦截器，从而支持开发在拦截器中使用spring的注解
                    ljq = (LjqInterface) context.getBean(ljqStr);
                }catch (Throwable t){
                    //忽略
                    try{
                        Class<?> ljqClass = Class.forName(ljqStr);
                        try{
                            // 支持从spring容器中取拦截器，从而支持开发在拦截器中使用spring的注解
                            ljq = (LjqInterface) context.getBean(ljqClass);
                        }catch (Throwable t1){
                            // 实例化定制拦截器
                            ljq = (LjqInterface) ljqClass.getConstructor().newInstance();
                        }
                    } catch (Exception e) {
                        throw new MyException("拦截器实例化失败："+ljqStr+e.getMessage(), e);
                    }
                }
            }
            if(ljqSet.contains(ljq)){
                throw new MyException("拦截器必须是多例，该拦截配置不正确："+ljqStr);
            }
            ljqSet.add(ljq);
            sjdx.setLjqObj(ljq);
            ljq.setDlLjq(ljq);
            ljq.setSjdx(sjdx);
            ljq.init();
        }
        return ljq;
    }
    /**
     * 获取数据对象基础信息 <br/>
     * @param id 数据对象id
     * @return 基础信息
     * @author jingma
     */
    public static JSONObject jcxxById(String id) {
        return jcxxById(id,null);
    }
    /**
     * 获取数据对象基础信息 <br/>
     * @param id 数据对象id
     * @return 基础信息
     * @author jingma
     */
    public static JSONObject jcxxById(String id, SysQxYhxx user) {
        JSONObject myParams = new JSONObject();
        myParams.set("$.sjdx.id", id);
        return jcxx(myParams,user);
    }
    /**
     * 获取数据对象基础信息 <br/>
     * @param dxdm 数据对象代码
     * @return 基础信息
     * @author jingma
     */
    public static JSONObject jcxxByDxdm(String dxdm) {
        return jcxxByDxdm(dxdm,null);
    }
    public static JSONObject jcxxByDxdm(String dxdm, SysQxYhxx user) {
        JSONObject myParams = new JSONObject();
        myParams.set("$.sjdx.dxdm", dxdm);
        return jcxx(myParams,user);
    }
    /**
     * 获取数据对象基础信息 <br/>
     * @param authCode 数据对象代码
     * @return 基础信息
     * @author jingma
     */
    public static JSONObject jcxxByAuthCode(String authCode) {
        return jcxxByDxdm(authCode,null);
    }
    public static JSONObject jcxxByAuthCode(String authCode, SysQxYhxx user) {
        JSONObject myParams = new JSONObject();
        myParams.set("$.sys.authCode", authCode);
        return jcxx(myParams,user);
    }

    /**
     * 自定义参数获取对象信息-内部调用
     * @param myParams 自定义参数
     * @param user 用户信息
     * @return 对象参数
     */
    public static JSONObject jcxx(JSONObject myParams, SysQxYhxx user) {
        myParams.put(LjqInterface.KEY_YOBJ,new JSONObject());
        if(user!=null){
            myParams.set(LjqInterface.$_SYS_TOKEN,user.getToken());
        }
        myParams.set(LjqInterface.$_SYS_CLLX, LjqInterface.KEY_CLLX_DXJCXX);
        myParams.set(LjqInterface.$_SYS_NBDY, Boolean.TRUE);
        return jcxx(myParams,true);
    }

    /**
     * 获取基础信息
     *
     * @param myParams 相关参数
     */
    public static JSONObject jcxx(JSONObject myParams,boolean nbdy) {
        SysSjglSjdx sjdx;
        //读取缓存
        String cacheKey = myParams.getString(LjqInterface.KEY_SJDX)+myParams.getString(LjqInterface.$_SYS_AUTHCODE);
        JSONObject jcxx = jcxxMap.getJSONObject(cacheKey);
        if(jcxx!=null&&nbdy){
            //基础信息缓存不为空且为内部调用
            return jcxx;
        }
        synchronized (sjdxMap){
            //进行同步操作，不免重复查询，缓存加载完成后这里应该耗时很少，应该不会成为瓶颈
            Object obj = sjdxMap.get(cacheKey);
            if (obj != null && !valByDef(myParams.getBoolean("$.sys.clearCache"),false)) {
                sjdx = (SysSjglSjdx) obj;
            } else {
                JSONObject jsonObj = Db.use().findFirst(SqlId.of("sjsj", "findSjdx"), myParams);
                if (jsonObj == null) {
                    throw new MyException(Msg.msg("interceptor.sjdxbwy", myParams), myParams);
                }
                sjdx = jsonObj.toJavaObject(SysSjglSjdx.class);
                //解析扩展信息
                sjdx.set("kzxxObj",JSON.parseObject(jsonObj.getString(LjqInterface.FIELD_KZXX),Feature.OrderedField));
                //设置权限码
                String authCode = jsonObj.getString(LjqInterface.KEY_AUTH_CODE);
                sjdx.set(LjqInterface.KEY_AUTH_CODE, authCode);
                //设置数据载体
                JSONObject dbObj = DictManager.zdObjByDm(LjqInterface.ZD_SYS_COMMON_SJZT, sjdx.getDxzt());
                sjdx.setDxztlx(dbObj.getString("lx"));
                sjdx.set("sjztObj",dbObj);
                //设置缓存
                sjdxMap.put(cacheKey,sjdx);
            }
        }
        JSONObject defParams = JSONObject.parseObject(Conf.getVal("sjdx.jcxx1"), Feature.OrderedField);
        //合并新配置与默认配置
        myParams.putAll(JsonUtil.mergeJSONObjects(defParams,myParams));
        if(!nbdy){
            defParams= JSONObject.parseObject(Conf.getVal("sjdx.jcxx2"), Feature.OrderedField);
            //合并优先级高于用户传参的默认配置
            JsonUtil.mergeJSONObjects(myParams,defParams);
        }
        //合并数据对象的扩展信息到系统参数中
        JsonUtil.mergeJSONObjects(myParams, (JSONObject) sjdx.get("kzxxObj"));
        myParams.set(LjqInterface.$_SYS_AUTHCODE, sjdx.get(LjqInterface.KEY_AUTH_CODE));
        //设置从数据库中读取的数据对象
        myParams.put(LjqInterface.KEY_SJDX, sjdx);
        //获取基础信息
        jcxx = jcxx(sjdx,myParams);
        //内部调用基础信息缓存
        if(nbdy){
            jcxxMap.put(cacheKey,jcxx);
        }
        return jcxx;
    }

    /**
     * 获取数据对象基础信息 <br/>
     *
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @return 基础信息
     * @author jingma
     */
    public static JSONObject jcxx(SysSjglSjdx sjdx, JSONObject myParams) {
        return use(sjdx).jcxx(myParams);
    }

    /**
     * 数据处理 <br/>
     * @param myParams 相关参数
     * @return 基础信息
     * @author jingma
     */
    public static Result data(JSONObject myParams) {
        return use(myParams.getObject(LjqInterface.KEY_SJDX,SysSjglSjdx.class)).data(myParams);
    }

    /**
     * 文件上传 <br/>
     * @param myParams 相关参数
     * @param files 文件列表
     * @return 基础信息
     * @author jingma
     */
    public static Result upload(JSONObject myParams,MultipartFile[] files) throws Exception {
        return use(myParams.getObject(LjqInterface.KEY_SJDX,SysSjglSjdx.class)).upload(myParams,files);
    }
    /**
     * 验证规则 <br/>
     * @param myParams 相关参数
     * @author jingma
     */
    public static void yzgz(JSONObject myParams) {
        use(myParams.getObject(LjqInterface.KEY_SJDX,SysSjglSjdx.class)).yzgz(myParams);
    }
    /**
     * 分页查询 <br/>
     *
     * @param myParams 相关参数
     * @return 基础信息
     * @author jingma
     */
    public static Result select(JSONObject myParams) {
        return use(myParams.getObject(LjqInterface.KEY_SJDX,SysSjglSjdx.class)).select(myParams);
    }
    public static Result insert(JSONObject myParams){
        return use(myParams.getObject(LjqInterface.KEY_SJDX,SysSjglSjdx.class)).insert(myParams);
    }
    public static Result update(JSONObject myParams) {
        return use(myParams.getObject(LjqInterface.KEY_SJDX,SysSjglSjdx.class)).update(myParams);
    }
    public static Result save(JSONObject myParams) {
        return use(myParams.getObject(LjqInterface.KEY_SJDX,SysSjglSjdx.class)).save(myParams);
    }
    /**
     * 获取sql <br/>
     *
     * @param myParams 相关参数
     * @return 0:数据载体，1：sql
     * @author jingma
     */
    public static String[] getSql(JSONObject myParams) {
        return use(myParams.getObject(LjqInterface.KEY_SJDX,SysSjglSjdx.class)).getSql(myParams);
    }
    /**
     * 获取sql <br/>
     *
     * @param myParams 相关参数
     * @param cllx 相关参数
     * @return 0:数据载体，1：sql
     * @author jingma
     */
    public static String[] getSql(JSONObject myParams,String cllx) {
        return use(myParams.getObject(LjqInterface.KEY_SJDX,SysSjglSjdx.class)).getSql(myParams,cllx);
    }
    /**
     * 结果发送到前端
     * @param response 返回对象
     * @param myParams 相关参数
     * @param r 结果
     */
    public static void sendResult(HttpServletResponse response,JSONObject myParams, Result r) {
        SysSjglSjdx sjdx;
        if(myParams==null){
            myParams = new JSONObject();
        }
        if(!myParams.containsKey(LjqInterface.KEY_SJDX)){
            //没有参数时，虚拟一个对象
            sjdx = xndx;
            myParams.put(LjqInterface.KEY_SJDX,sjdx);
        }else{
            sjdx = myParams.getObject(LjqInterface.KEY_SJDX,SysSjglSjdx.class);
        }
        use(sjdx).sendResult(response,myParams,r);
    }
}
