package cn.benma666.sjsj.demo.controller;

import cn.benma666.iframe.BasicObject;
import cn.benma666.iframe.MyParams;
import cn.benma666.iframe.Result;
import cn.benma666.sjsj.demo.domain.SysSjglTyzdDemo;
import cn.benma666.sjsj.myutils.AMyParams;
import cn.benma666.sjsj.web.LjqManager;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 演示控制器，与数据对象结合的定制控制器场景<br/>
 * /csjdx为固定前缀，之后为对应的数据对象代码（为了好看可以转为小写）<br/>
 * 此为一个可选方式，还是建议走拦截器形式便于统一实现穿透等机制。
 */
@RestController
@RequestMapping("/csjdx/sys_sjgl_tyzd_demo")
public class CsjdxController extends BasicObject {
    @RequestMapping("select")
    public Result select(@AMyParams MyParams myParams) {
        SysSjglTyzdDemo zd = myParams.yobj(SysSjglTyzdDemo.class);
        log.info("参数：{}",zd);
        //写自己的业务
        return LjqManager.data(myParams);
    }
    @RequestMapping("insert")
    public Result insert(@AMyParams MyParams myParams) {
        SysSjglTyzdDemo zd = myParams.yobj(SysSjglTyzdDemo.class);
        log.info("参数：{}",zd);
        //写自己的业务
        return LjqManager.data(myParams);
    }
    @RequestMapping("update")
    public Result update(@AMyParams MyParams myParams) {
        SysSjglTyzdDemo zd = myParams.yobj(SysSjglTyzdDemo.class);
        log.info("参数：{}",zd);
        //写自己的业务
        return LjqManager.data(myParams);
    }
    @RequestMapping("plsc")
    public Result plsc(@AMyParams MyParams myParams) {
        SysSjglTyzdDemo zd = myParams.yobj(SysSjglTyzdDemo.class);
        log.info("参数：{}",zd);
        //写自己的业务
        return LjqManager.data(myParams);
    }
}
