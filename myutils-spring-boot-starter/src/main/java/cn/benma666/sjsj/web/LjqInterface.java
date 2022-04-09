/**
 * Project Name:myutils
 * Date:2018年12月16日
 * Copyright (c) 2018, jingma All Rights Reserved.
 */

package cn.benma666.sjsj.web;

import cn.benma666.constants.UtilConstInstance;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.exception.MyException;
import cn.benma666.iframe.Result;
import cn.benma666.sjsj.myutils.Msg;
import com.alibaba.fastjson.JSONObject;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

/**
 * 系统-数据管理-拦截器接口 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 */
public interface LjqInterface extends UtilConstInstance {
    /**
     * 基础信息<br/>
     * @param myParams 相关参数
     * @return 基础信息
     * @author jingma
     */
    JSONObject jcxx(JSONObject myParams) throws MyException;
    /**
     * 验证规则
     *
     * @param myParams 相关参数
     */
    void yzgz(JSONObject myParams);

    /**
     * 上传文件
     * @param myParams 相关参数
     * @param files    文件列表
     * @return 处理结果
     */
    Result upload(JSONObject myParams, MultipartFile[] files) throws Exception;
    /**
     * 除上传文件外处理类型通用入口 <br/>
     * @param myParams 相关参数
     * @return 处理结果
     * @author jingma
     */
    Result data(JSONObject myParams);

    /**
     * 获取数据 <br/>
     * @param myParams 相关参数
     * @return 处理结果
     * @author jingma
     */
    Result getdata(JSONObject myParams);

    /**
     * 批量处理 <br/>
     * @param myParams 相关参数
     * @return 处理结果
     * @author jingma
     */
    Result plcl(JSONObject myParams);

    /**
     * 导出数据文件EXCEL <br/>
     * @param myParams 相关参数
     * @return 处理结果
     * @author jingma
     */
    Result dcsj(JSONObject myParams);

    /**
     * 获取文件 <br/>
     * @param myParams 相关参数
     * @return 处理结果
     * @author jingma
     */
    Result getfile(JSONObject myParams);

    /**
     * 数据批量上传 <br/>
     * @param myParams 相关参数
     * @return 处理结果
     * @author jingma
     */
    Result sjplsc(JSONObject myParams);

    /**
     * 批量删除 <br/>
     * @param myParams 相关参数
     * @return 处理结果
     * @author jingma
     */
    Result plsc(JSONObject myParams);

    /**
     * 分页 <br/>
     * @param myParams 相关参数
     * @return 分页查询结果
     * @author jingma
     */
    Result select(JSONObject myParams) throws MyException;

    /**
     * 新增数据
     * @param myParams 参数
     * @return 处理结果
     * @throws MyException 系统范围内处理异常
     */
    Result insert(JSONObject myParams) throws MyException;
    /**
     * 更新数据
     * @param myParams 参数
     * @return 处理结果
     * @throws MyException 系统范围内处理异常
     */
    Result update(JSONObject myParams) throws MyException;
    /**
     * 保存数据，可用进行新增和修改
     * @param myParams 参数
     * @return 处理结果
     * @throws MyException 系统范围内处理异常
     */
    Result save(JSONObject myParams) throws MyException;
    /**
     * 获取Sql <br/>
     * @param myParams 相关参数
     * @return 0:数据载体，1：sql
     * @author jingma
     */
    String[] getSql(JSONObject myParams) throws MyException;

    /**
     * 获取Sql <br/>
     * @param myParams 相关参数
     * @param cllx     处理类型
     * @return 0:数据载体，1：sql
     * @author jingma
     */
    String[] getSql(JSONObject myParams, String cllx) throws MyException;
    /**
     * 结果发送到前端
     * @param response 返回对象
     * @param myParams 相关参数
     * @param r 结果
     */
    void sendResult(HttpServletResponse response, JSONObject myParams, Result r);

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
     * @return 数据对象
     */
    SysSjglSjdx getSjdx();

    /**
     * 设置数据对象
     * @param sjdx 数据对象
     */
    void setSjdx(SysSjglSjdx sjdx);

    /**
     * @return 代理拦截器
     */
    LjqInterface getDlLjq();
    /**
     * 设置当前拦截器的代理拦截器
     * @param _this
     */
    void setDlLjq(LjqInterface _this);
    /**
     * 获取国际化消息-操作成功
     *
     * @return 国际化消息
     */
    default String msgCzcg() {
        return Msg.msg("common.czcg");
    }
}
