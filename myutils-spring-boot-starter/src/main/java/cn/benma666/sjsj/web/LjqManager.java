/**
 * Project Name:myutils
 * Date:2018年12月16日
 * Copyright (c) 2018, jingma All Rights Reserved.
 */

package cn.benma666.sjsj.web;

import cn.benma666.domain.SysLogFwzr;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglFile;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.exception.MyException;
import cn.benma666.iframe.BasicObject;
import cn.benma666.iframe.CacheFactory;
import cn.benma666.iframe.DictManager;
import cn.benma666.iframe.Result;
import cn.benma666.myutils.*;
import cn.benma666.sjsj.myutils.Msg;
import cn.benma666.sjzt.Db;
import com.alibaba.druid.util.Utils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;
import com.alibaba.fastjson.parser.Feature;
import org.beetl.sql.core.SqlId;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;

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
        if (ljq != null) {
            //已经实例化则直接返回
            return ljq;
        }
        String ljqStr = sjdx.getLjq();
        try {
            if (StringUtil.isBlank(ljqStr)) {
                //没有设置定制拦截器则使用默认拦截器，每个数据对象单独创建一个拦截器对象
                ljq = new DefaultLjq();
            }else{
                //实例化定制拦截器
                ljq = (LjqInterface) Class.forName(ljqStr).getConstructor().newInstance();
            }
            ljq.setSjdx(sjdx);
            ljq.init();
            ljqCache.put(sjdx.getId(), ljq);
            return ljq;
        } catch (Exception e) {
            throw new MyException(Msg.msg("ljq.mamanger.scljqsb", ljqStr), e);
        }
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
            JSONObject dbObj = DictManager.zdObjByDmByCache(LjqInterface.ZD_SYS_COMMON_SJZT, sjdx.getDxzt());
            sjdx.setDxztlx(dbObj.getString("lx"));
            //设置缓存
            sjdxMap.put(cacheKey,sjdx);
        }
        try {
            //TODO 后续还是将该配置迁移到字典配置中
            JSONObject defParams= JSONObject.parseObject(Utils.readFromResource("myParams.json"), Feature.OrderedField);
            //合并新配置与默认配置
            myParams.putAll(JsonUtil.mergeJSONObjects(defParams,myParams));
            if(!nbdy){
                defParams= JSONObject.parseObject(Utils.readFromResource("myParams2.json"), Feature.OrderedField);
                //合并优先级高于用户传参的默认配置
                myParams.putAll(JsonUtil.mergeJSONObjects(myParams,defParams));
            }
            //合并数据对象的扩展信息到系统参数中
            JsonUtil.mergeJSONObjects(myParams, (JSONObject) sjdx.get("kzxxObj"));
        } catch (IOException e) {
            throw new MyException("读取默认配置失败",e);
        }
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
        SysLogFwzr czrz = myParams.getObject(LjqInterface.KEY_CZRZ, SysLogFwzr.class);
        if(czrz!=null){
            //记录日志
            String fhnr = r.toString();
            if(fhnr.length()<2000){
                czrz.setFhnr(fhnr);
            }else{
                JSONObject fhnrObj = JSON.parseObject(fhnr);
                //返回内容较大，不记录内容
                fhnrObj.remove("data");
                if(r.getMsg().length()>2000){
                    fhnrObj.put("msg",r.getMsg().substring(0,2000));
                }
                czrz.setFhnr(fhnrObj.toJSONString());
            }
            //设置请求耗时
            long kssj = (long) JSONPath.eval(myParams, "$.sys.qqkssj");
            czrz.setQqhs(BigDecimal.valueOf(System.currentTimeMillis()-kssj));
            //设置更新时间
            czrz.setGxsj(DateUtil.getGabDate());
            JSONObject rzJcxx = jcxxByDxdm("SYS_LOG_FWZR");
            rzJcxx.put(LjqInterface.KEY_YOBJ,czrz);
            rzJcxx.put(LjqInterface.KEY_USER,myParams.get(LjqInterface.KEY_USER));
            insert((SysSjglSjdx) rzJcxx.get(LjqInterface.KEY_SJDX),rzJcxx);
        }

        //根据返回类型向前端推送数据
        if (HttpStatus.OK.value()!=r.getCode()) {//错误场景
            response.setStatus(r.getCode());
            WebUtil.sendJson(response, r);
        } else if (MediaType.APPLICATION_OCTET_STREAM_VALUE.equals(r.getDateType())) {//文件下载场景
            JSONObject data = (JSONObject) r.getData();
            WebUtil.sendBytes(response, data.getBytes(LjqInterface.KEY_FILE_BYTES),
                    (SysSjglFile) data.get(LjqInterface.KEY_FILE_OBJ));
        } else {//默认JSON
            WebUtil.sendJson(response, r);
        }
    }

}
