package cn.benma666.sjsj.demo.controller;

import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.BasicObject;
import cn.benma666.iframe.MyParams;
import cn.benma666.sjsj.AMyParams;
import cn.benma666.sjsj.MySjdx;
import cn.benma666.sjsj.web.LjqManager;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;

/**
 * 演示控制器
 */
@RestController
@RequestMapping("/demo/xxxx")
public class XxxxController extends BasicObject {
    @RequestMapping("select")
    public void select(HttpServletResponse response, @AMyParams MyParams myParams, @MySjdx SysSjglSjdx sjdx) {
        //写自己的业务
        LjqManager.sendResult(response,myParams,success("请求成功"));
    }
}
