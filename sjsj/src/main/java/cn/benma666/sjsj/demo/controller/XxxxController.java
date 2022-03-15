package cn.benma666.sjsj.demo.controller;

import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.BasicObject;
import cn.benma666.sjsj.MyParams;
import cn.benma666.sjsj.MySjdx;
import cn.benma666.sjsj.web.LjqManager;
import com.alibaba.fastjson.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;

/**
 * 演示控制器
 */
@RestController
public class XxxxController extends BasicObject {
    @RequestMapping("/demo/xxxx/select")
    public void select(HttpServletResponse response, @MyParams JSONObject myParams, @MySjdx SysSjglSjdx sjdx) {
        //写自己的业务
        LjqManager.sendResult(response,myParams,success("请求成功"));
    }
}
