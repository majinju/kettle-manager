package cn.benma666.sjsj.demo.controller;

import cn.benma666.iframe.BasicObject;
import cn.benma666.iframe.MyParams;
import cn.benma666.iframe.PageInfo;
import cn.benma666.iframe.Result;
import cn.benma666.sjsj.demo.domain.SysSjglTyzdDemo;
import cn.benma666.sjsj.myutils.AMyParams;
import com.alibaba.fastjson.JSONObject;
import org.beetl.sql.core.SqlId;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 演示控制器，全定制场景，完全与数据对象无关，路径与前端一致
 */
@RestController
@RequestMapping("/custom/demo/tyzd")
public class TyzdController extends BasicObject {
    @RequestMapping("select")
    public Result select(@AMyParams MyParams myParams) {
        SysSjglTyzdDemo zd = myParams.yobj(SysSjglTyzdDemo.class);
        log.info("参数：{}",zd);
        PageInfo<JSONObject> page = db().queryPage(myParams.page(), SqlId.of("demo.tyzd", "select"), myParams);
        log.info("查询结果：{}",page.getList(SysSjglTyzdDemo.class));
        //写自己的业务
        return success("请求成功",page);
    }
}
