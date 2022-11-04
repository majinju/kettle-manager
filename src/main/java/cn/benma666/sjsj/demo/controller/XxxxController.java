package cn.benma666.sjsj.demo.controller;

import cn.benma666.constants.UtilConst;
import cn.benma666.iframe.BasicObject;
import cn.benma666.iframe.MyParams;
import cn.benma666.iframe.Result;
import cn.benma666.sjsj.myutils.AMyParams;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 演示控制器
 */
@RestController
@RequestMapping("/demo/xxxx")
public class XxxxController extends BasicObject {
    @RequestMapping("select")
    public Result select(@AMyParams MyParams myParams) {
        //写自己的业务
        return success("请求成功:"+myParams.getString(UtilConst.$_SYS_CLLX));
    }
}
