package cn.benma666.sjsj.demo.controller;

import cn.benma666.domain.SysQxYhxx;
import cn.benma666.iframe.BasicObject;
import cn.benma666.iframe.MyParams;
import cn.benma666.iframe.PageInfo;
import cn.benma666.iframe.Result;
import cn.benma666.myutils.WebUtil;
import cn.benma666.sjsj.demo.domain.SysSjglTyzdDemo;
import cn.benma666.sjsj.myutils.AMyParams;
import cn.benma666.sjzt.Db;
import com.alibaba.fastjson.JSONObject;
import org.beetl.sql.core.SqlId;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * 演示控制器，全定制场景，完全与数据对象无关，路径必须与前端页面路径一致，便于维护，同时系统权限控制也需要用<br/>
 * /custom为固定前缀，所有完全定制接口都必须以此为前缀，后续部分（/demo/tyzd）为业务路径<br/>
 * 此为一个可选方式，还是建议走拦截器形式便于统一实现穿透等机制。<br/>
 */
@RestController
@RequestMapping("/custom/demo")
public class TyzdController extends BasicObject {
    @RequestMapping("select")
    public Result select(@AMyParams MyParams myParams, HttpServletRequest request) {
        SysSjglTyzdDemo zd = myParams.yobj(SysSjglTyzdDemo.class);
        log.info("参数：{}",zd);
        log.info("请求方ip：{}", WebUtil.getIpAddr(request));
        PageInfo<JSONObject> page = db().queryPage(myParams.page(), SqlId.of("demo.tyzd", "select"), myParams);
        log.info("查询结果：{}",page.getList(SysSjglTyzdDemo.class));
        //写自己的业务
        return success("请求成功",page);
    }
    @RequestMapping("insert")
    public Result insert(@AMyParams MyParams myParams) {
        SysSjglTyzdDemo zd = myParams.yobj(SysSjglTyzdDemo.class);
        SysQxYhxx yhxx = myParams.user();
        zd.setCjrdwdm(yhxx.getId());
        int num = db().update(SqlId.of("demo.tyzd", "insert"), Db.buildMap(zd));
        return success("成功新增记录数："+num);
    }
    @RequestMapping("update")
    public Result update(@AMyParams MyParams myParams) {
        int num = db().update(SqlId.of("demo.tyzd", "update"),myParams);
        return success("成功更新记录数："+num);
    }
    @RequestMapping("plsc")
    public Result plsc(@AMyParams MyParams myParams) {
        int num = db().update(SqlId.of("demo.tyzd", "plsc"),myParams);
        return success("成功删除记录数："+num);
    }
}
