/**
 * Project Name:myutils
 * Date:2018年12月16日
 * Copyright (c) 2018, jingma All Rights Reserved.
 */

package cn.benma666.sjsj.web;

import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.exception.MyException;
import cn.benma666.iframe.PageInfo;
import cn.benma666.iframe.Result;
import cn.benma666.sjsj.utils.Msg;
import com.alibaba.fastjson.JSONObject;
import org.springframework.web.multipart.MultipartFile;

/**
 * 系统-数据管理-拦截器接口 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 */
public interface LjqInterface extends LjqConstant {
    /**
     * 基础信息<br/>
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @return 基础信息
     * @author jingma
     */
    JSONObject jcxx(SysSjglSjdx sjdx, JSONObject myParams) throws MyException;

    /**
     * 上传文件
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @param files    文件列表
     * @return 处理结果
     */
    Result upload(SysSjglSjdx sjdx, JSONObject myParams, MultipartFile[] files) throws Exception;
    /**
     * 获取数据对象相关信息 <br/>
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @return 处理结果
     * @author jingma
     */
    Result data(SysSjglSjdx sjdx, JSONObject myParams);

    /**
     * 获取数据对象相关信息 <br/>
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @return 处理结果
     * @author jingma
     */
    Result getData(SysSjglSjdx sjdx, JSONObject myParams);

    /**
     * 获取数据对象相关信息 <br/>
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @return 处理结果
     * @author jingma
     */
    Result plcl(SysSjglSjdx sjdx, JSONObject myParams);

    /**
     * 获取数据对象相关信息 <br/>
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @return 处理结果
     * @author jingma
     */
    Result dcsj(SysSjglSjdx sjdx, JSONObject myParams);

    /**
     * 获取数据对象相关信息 <br/>
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @return 处理结果
     * @author jingma
     */
    Result getFile(SysSjglSjdx sjdx, JSONObject myParams);

    /**
     * 获取数据对象相关信息 <br/>
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @return 处理结果
     * @author jingma
     */
    Result sjplsc(SysSjglSjdx sjdx, JSONObject myParams);

    /**
     * 获取数据对象相关信息 <br/>
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @return 处理结果
     * @author jingma
     */
    Result plsc(SysSjglSjdx sjdx, JSONObject myParams);

    /**
     * 分页 <br/>
     *
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @return 分页查询结果
     * @author jingma
     */
    PageInfo<JSONObject> page(SysSjglSjdx sjdx, JSONObject myParams) throws MyException;

    /**
     * 新增数据
     * @param sjdx 数据对象
     * @param myParams 参数
     * @return 处理结果
     * @throws MyException 系统范围内处理异常
     */
    Result insert(SysSjglSjdx sjdx, JSONObject myParams) throws MyException;
    /**
     * 更新数据
     * @param sjdx 数据对象
     * @param myParams 参数
     * @return 处理结果
     * @throws MyException 系统范围内处理异常
     */
    Result update(SysSjglSjdx sjdx, JSONObject myParams) throws MyException;
    /**
     * 获取Sql <br/>
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @return 0:数据载体，1：sql
     * @author jingma
     */
    String[] getSql(SysSjglSjdx sjdx, JSONObject myParams) throws MyException;

    /**
     * 获取Sql <br/>
     * @param sjdx     数据对象
     * @param myParams 相关参数
     * @param cllx     处理类型
     * @return 0:数据载体，1：sql
     * @author jingma
     */
    String[] getSql(SysSjglSjdx sjdx, JSONObject myParams, String cllx) throws MyException;

    /**
     * 拦截器初始化方法 <br/>
     *
     * @author jingma
     */
    void init();

    /**
     * 拦截器结束方法 <br/>
     *
     * @author jingma
     */
    void end();

    /**
     * 获取国际化消息-操作成功
     *
     * @return 国际化消息
     */
    default String megCzcg() {
        return Msg.msg("common.czcg");
    }
}
