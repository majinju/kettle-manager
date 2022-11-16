package cn.benma666.sjsj.demo.controller;

import cn.benma666.constants.UtilConst;
import cn.benma666.iframe.BasicObject;
import cn.benma666.iframe.MyParams;
import cn.benma666.iframe.Result;
import cn.benma666.sjsj.demo.domain.SysSjglTyzdDemo;
import cn.benma666.sjsj.myutils.AMyParams;
import cn.benma666.sjsj.web.LjqManager;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 演示控制器，与数据对象结合的定制控制器场景
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
}
