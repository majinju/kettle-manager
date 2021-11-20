/**
 * Project Name:sjsj
 * Date:2021年8月30日
 * Copyright (c) 2021, jingma All Rights Reserved.
 */

package cn.benma666.sjsj.web;

import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.exception.MyException;
import cn.benma666.iframe.BasicObject;
import cn.benma666.iframe.Result;
import cn.benma666.myutils.WebUtil;
import cn.benma666.sjsj.MyParams;
import cn.benma666.sjsj.MySjdx;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.boot.web.error.ErrorAttributeOptions;
import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * 系统web请求控制层，本系统只有这一个控制器<br/>
 * date: 2021年8月30日 <br/>
 * @author jingma
 */
@RestController
public class IndexController extends BasicObject implements ErrorController {
    private final ErrorAttributes errorAttributes;

    public IndexController(ErrorAttributes errorAttributes) {
        this.errorAttributes = errorAttributes;
    }

    /**
     * 系统入口
     */
    @RequestMapping("${benma666.service.addr}")
    public void index(HttpServletResponse response, @MyParams JSONObject myParams, @MySjdx SysSjglSjdx sjdx) {
        Result r;
        try {
            r = LjqManager.data(sjdx, myParams);
        }catch (MyException e){
            r = failed(e.getMessage(),e.getData());
            r.setCode(e.getCode());
            log.trace(r.toString(),e);
        }catch (Exception e){
            r = failed("处理异常："+e.getMessage());
            log.error(r.getMsg(),e);
        }
        LjqManager.sendResult(response,myParams,r);
    }
    /**
     * 系统入口-文件上传
     */
    @RequestMapping(value = "${benma666.service.addr}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public void upload(HttpServletResponse response, @MyParams JSONObject myParams,
                      @MySjdx SysSjglSjdx sjdx, @RequestParam("files") MultipartFile[] files) {
        Result r;
        try {
            r = LjqManager.upload(sjdx, myParams, files);
        }catch (MyException e){
            r = failed(e.getMessage(),e.getData());
            r.setCode(e.getCode());
            log.trace(r.toString(),e);
        }catch (Exception e){
            r = failed("处理异常："+e.getMessage());
            log.error(r.getMsg(),e);
        }
        LjqManager.sendResult(response,myParams,r);
    }
    /**
     * 系统范围外的异常
     * @param request 请求
     * @param ex 异常对象
     */
    @RequestMapping("/error")
    @ExceptionHandler(value = {Throwable.class})
    public void error(HttpServletResponse response, HttpServletRequest request, final Exception ex) {
        ServletWebRequest requestAttributes = new ServletWebRequest(request);
        Map<String, Object> attr = this.errorAttributes.getErrorAttributes(requestAttributes, ErrorAttributeOptions.defaults());
        log.error("请求异常："+ JSON.toJSONString(attr), ex);
        Result r = failed("请求异常："+attr.get("error"));
        r.setCode(Integer.parseInt(attr.get("status").toString()));
        WebUtil.sendJson(response,r);
    }
}
