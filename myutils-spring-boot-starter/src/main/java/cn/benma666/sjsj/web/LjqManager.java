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
import cn.benma666.iframe.Result;
import cn.benma666.myutils.DateUtil;
import cn.benma666.myutils.JsonUtil;
import cn.benma666.myutils.StringUtil;
import cn.benma666.myutils.WebUtil;
import cn.benma666.sjsj.myutils.Msg;
import com.alibaba.druid.util.Utils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;
import com.alibaba.fastjson.util.TypeUtils;
import org.beetl.sql.core.SqlId;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

/**
 * 系统-数据管理-拦截器管理 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 */
public class LjqManager extends BasicObject {
    /**
     * 数据对象Map<对象key，对象>
     */
    private static final JSONObject sjdxMap = CacheFactory.use("sjdx");
    /**
     * 拦截器Map<对象id，拦截器实例>
     */
    private static final JSONObject ljqCache = CacheFactory.use("ljq");
    /**
     * 默认拦截器
     */
    private static LjqInterface defaultLjq = new DefaultLjq();

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
        if (StringUtil.isBlank(ljqStr)) {
            //没有设置定制拦截器则返回默认拦截器
            return getDefaultLjq();
        }
        try {
            //实例化定制拦截器
            ljq = (LjqInterface) Class.forName(ljqStr).getConstructor().newInstance();
            ljq.init();
            ljqCache.put(sjdx.getId(), ljq);
            return ljq;
        } catch (Exception e) {
            throw new MyException(Msg.msg("ljq.mamanger.scljqsb", ljqStr), e);
        }
    }
    /**
     * 获取数据对象基础信息 <br/>
     *
     * @param dxdm 数据对象
     * @return 基础信息
     * @author jingma
     */
    public static JSONObject jcxxByDxdm(String dxdm) {
        return jcxxByDxdm(dxdm,null);
    }
    public static JSONObject jcxxByDxdm(String dxdm, SysQxYhxx user) {
        JSONObject myParams = new JSONObject();
        myParams.put(LjqInterface.KEY_YOBJ,new JSONObject());
        JSONPath.set(myParams, "$.sjdx.dxdm", dxdm);
        if(user!=null){
            JSONPath.set(myParams,LjqInterface.$_SYS_TOKEN,user.getToken());
        }
        JSONPath.set(myParams, LjqInterface.$_SYS_CLLX, LjqInterface.KEY_CLLX_DXJCXX);
        return jcxx(myParams);
    }

    /**
     * 获取基础信息
     *
     * @param myParams 相关参数
     */
    public static JSONObject jcxx(JSONObject myParams) {
        try {
            //TODO 后续还是将该配置迁移到字典配置中
            JSONObject defParams= JSONObject.parseObject(Utils.readFromResource("myParams.json"));
            //合并新配置与默认配置
            myParams.putAll(JsonUtil.mergeJSONObjects(defParams,myParams));
            defParams= JSONObject.parseObject(Utils.readFromResource("myParams2.json"));
            //合并优先级高于用户传参的默认配置
            myParams.putAll(JsonUtil.mergeJSONObjects(myParams,defParams));
        } catch (IOException e) {
            throw new MyException("读取默认配置失败",e);
        }
        SysSjglSjdx sjdx;
        //读取缓存
        Object obj = sjdxMap.get(myParams.getString(LjqInterface.KEY_SJDX));
        if (obj != null && !TypeUtils.castToBoolean(JSONPath.eval(myParams, "$.sys.clearCache"))) {
            sjdx = (SysSjglSjdx) obj;
        } else {
            JSONObject jsonObj = db().findFirst(SqlId.of("sjsj", "findSjdx"), myParams);
            if (jsonObj == null) {
                throw new MyException(Msg.msg("interceptor.sjdxbwy", myParams.get(LjqInterface.KEY_SJDX)), myParams);
            }
            sjdx = jsonObj.toJavaObject(SysSjglSjdx.class);
            //设置缓存
            sjdxMap.put(myParams.getString(LjqInterface.KEY_SJDX),sjdx);
        }
        //设置从数据库中读取的数据对象
        myParams.put(LjqInterface.KEY_SJDX, sjdx);
        //合并数据对象的扩展信息到系统参数中
        JsonUtil.mergeJSONObjects(myParams,JSON.parseObject(sjdx.getKzxx()));
        //获取基础信息
        return LjqManager.jcxx(sjdx, myParams);
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
        return use(sjdx).jcxx(sjdx, myParams);
    }

    /**
     * 验证规则 <br/>
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @author jingma
     */
    public static void yzgz(SysSjglSjdx sjdx, JSONObject myParams) {
        use(sjdx).yzgz(sjdx, myParams);
    }
    /**
     * 数据处理 <br/>
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @return 基础信息
     * @author jingma
     */
    public static Result data(SysSjglSjdx sjdx, JSONObject myParams) {
        return use(sjdx).data(sjdx, myParams);
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
        return use(sjdx).upload(sjdx, myParams,files);
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
        return use(sjdx).select(sjdx, myParams);
    }
    public static Result insert(SysSjglSjdx sjdx, JSONObject myParams){
        return use(sjdx).insert(sjdx, myParams);
    }
    public static Result update(SysSjglSjdx sjdx, JSONObject myParams){
        return use(sjdx).update(sjdx, myParams);
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
        return use(sjdx).getSql(sjdx, myParams);
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
        return use(sjdx).getSql(sjdx, myParams,cllx);
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
            if(fhnr.length()<3000){
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
            WebUtil.sendJson(response, r.getMsg());
        } else if (MediaType.APPLICATION_OCTET_STREAM_VALUE.equals(r.getDateType())) {//文件下载场景
            JSONObject data = (JSONObject) r.getData();
            WebUtil.sendBytes(response, data.getBytes(LjqInterface.KEY_FILE_BYTES),
                    (SysSjglFile) data.get(LjqInterface.KEY_FILE_OBJ));
        } else {//默认JSON
            WebUtil.sendJson(response, r);
        }
    }

    /**
     * @return defaultLjq
     */
    public static LjqInterface getDefaultLjq() {
        return defaultLjq;
    }

    /**
     * @param defaultLjq the defaultLjq to set
     */
    public static void setDefaultLjq(LjqInterface defaultLjq) {
        LjqManager.defaultLjq = defaultLjq;
    }

}
