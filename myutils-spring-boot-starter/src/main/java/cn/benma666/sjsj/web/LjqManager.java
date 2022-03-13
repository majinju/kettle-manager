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
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

/**
 * 系统-数据管理-拦截器管理 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 */
public class LjqManager extends BasicObject {
    /**
     * 数据对象Map<对象key，对象>
     */
    private static final JSONObject sjdxMap = CacheFactory.use(LjqInterface.KEY_SJDX);
    /**
     * 拦截器Map<对象id，拦截器实例>
     */
    private static final JSONObject ljqCache = CacheFactory.use("ljq");

    /**
     * 使用对应的拦截器 <br/>
     *
     * @param sjdx 数据对象
     * @return 拦截器
     * @author jingma
     */
    public static LjqInterface use(SysSjglSjdx sjdx) {
        LjqInterface ljq = (LjqInterface) ljqCache.get(sjdx.getId());
        if (ljq == null) {
            String ljqStr = valByDef(sjdx.getLjq(), Conf.getVal("benma666.ljq.default-ljq",
                    "cn.benma666.sjsj.web.DefaultLjq"));
            try {
                //实例化定制拦截器
                ljq = (LjqInterface) Class.forName(ljqStr).getConstructor().newInstance();
                ljq.setSjdx(sjdx);
                ljq.init();
                ljqCache.put(sjdx.getId(), ljq);
                return ljq;
            } catch (Exception e) {
                throw new MyException(Msg.msg("ljq.mamanger.scljqsb", ljqStr), e);
            }
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
        synchronized (sjdxMap){
            //进行同步操作，不免重复查询，缓存加载完成后这里应该耗时很少，应该不会成为瓶颈
            Object obj = sjdxMap.get(cacheKey);
            if (obj != null && !valByDef(myParams.getBoolean("$.sys.clearCache"),false)) {
                sjdx = (SysSjglSjdx) obj;
            } else {
                JSONObject jsonObj = Db.use().findFirst(SqlId.of("sjsj", "findSjdx"), myParams);
                if (jsonObj == null) {
                    throw new MyException(Msg.msg("interceptor.sjdxbwy", myParams.get(LjqInterface.KEY_SJDX)), myParams);
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
                //设置缓存
                sjdxMap.put(cacheKey,sjdx);
            }
        }
        JSONObject defParams = JSONObject.parseObject(Conf.getVal("sjdx.jcxx1"), Feature.OrderedField);
        //合并新配置与默认配置
        myParams.putAll(JsonUtil.mergeJSONObjects(defParams,myParams));
        if(!nbdy){
            defParams = defaultCache.getJSONObject("sjdx.jcxx2");
            if(defParams==null){
                defParams= JSONObject.parseObject(Conf.getVal("sjdx.jcxx2"), Feature.OrderedField);
                defaultCache.put("sjdx.jcxx2",defParams);
            }
            //合并优先级高于用户传参的默认配置
            JsonUtil.mergeJSONObjects(myParams,defParams);
        }
        //合并数据对象的扩展信息到系统参数中
        JsonUtil.mergeJSONObjects(myParams, (JSONObject) sjdx.get("kzxxObj"));
        myParams.set(LjqInterface.$_SYS_AUTHCODE, sjdx.get(LjqInterface.KEY_AUTH_CODE));
        //设置从数据库中读取的数据对象
        myParams.put(LjqInterface.KEY_SJDX, sjdx);
        //获取基础信息
        return jcxx(sjdx,myParams);
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
     * 验证规则 <br/>
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @author jingma
     */
    public static void yzgz(SysSjglSjdx sjdx, JSONObject myParams) {
        use(sjdx).yzgz(myParams);
    }
    /**
     * 数据处理 <br/>
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @return 基础信息
     * @author jingma
     */
    public static Result data(SysSjglSjdx sjdx, JSONObject myParams) {
        return use(sjdx).data(myParams);
    }

    /**
     * 文件上传 <br/>
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @param files 文件列表
     * @return 基础信息
     * @author jingma
     */
    public static Result upload(SysSjglSjdx sjdx, JSONObject myParams,
                                MultipartFile[] files) throws Exception {
        return use(sjdx).upload(myParams,files);
    }
    /**
     * 分页查询 <br/>
     *
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @return 基础信息
     * @author jingma
     */
    public static Result select(SysSjglSjdx sjdx, JSONObject myParams) {
        return use(sjdx).select(myParams);
    }
    public static Result insert(SysSjglSjdx sjdx, JSONObject myParams){
        return use(sjdx).insert(myParams);
    }
    public static Result update(SysSjglSjdx sjdx, JSONObject myParams){
        return use(sjdx).update(myParams);
    }
    public static Result save(SysSjglSjdx sjdx, JSONObject myParams){
        return use(sjdx).save(myParams);
    }
    /**
     * 获取sql <br/>
     *
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @return 0:数据载体，1：sql
     * @author jingma
     */
    public static String[] getSql(SysSjglSjdx sjdx, JSONObject myParams) {
        return use(sjdx).getSql(myParams);
    }
    /**
     * 获取sql <br/>
     *
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @param cllx 相关参数
     * @return 0:数据载体，1：sql
     * @author jingma
     */
    public static String[] getSql(SysSjglSjdx sjdx, JSONObject myParams,String cllx) {
        return use(sjdx).getSql(myParams,cllx);
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
            sjdx = new SysSjglSjdx();
            sjdx.setId(LjqInterface.ZD_SJDX_ZDYWLB_XNZD);
            myParams.put(LjqInterface.KEY_SJDX,sjdx);
        }else{
            sjdx = myParams.getObject(LjqInterface.KEY_SJDX,SysSjglSjdx.class);
        }
        use(sjdx).sendResult(response,myParams,r);
    }

}
