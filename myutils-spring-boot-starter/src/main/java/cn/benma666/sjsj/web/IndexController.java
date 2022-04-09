/**
 * Project Name:sjsj
 * Date:2021年8月30日
 * Copyright (c) 2021, jingma All Rights Reserved.
 */

package cn.benma666.sjsj.web;

import cn.benma666.exception.MyException;
import cn.benma666.iframe.BasicObject;
import cn.benma666.iframe.MyParams;
import cn.benma666.iframe.Result;
import cn.benma666.sjsj.AMyParams;
import com.alibaba.fastjson.JSON;
import org.springframework.boot.web.error.ErrorAttributeOptions;
import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
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
    public void index(HttpServletResponse response, @AMyParams MyParams myParams) {
        Result r;
        try {
            r = LjqManager.data(myParams);
        }catch (MyException e){
            r = failed(e.getMessage(),e.getData());
            r.setCode(e.getCode());
            log.trace(r.toString(),e);
        }catch (Throwable e){
            r = failed("处理异常："+e.getMessage());
            log.error(r.getMsg(),e);
        }
        LjqManager.sendResult(response,myParams,r);
    }
    @RequestMapping("${benma666.service.addr}/{qqfs}/{qqz}/{cllx}")
    public void index0(HttpServletResponse response, @AMyParams MyParams myParams,
                       @PathVariable String qqfs,@PathVariable String qqz,@PathVariable String cllx) {
        index(response,myParams);
    }
    /**
     * 系统入口-文件上传
     */
    @RequestMapping(value = "${benma666.service.addr}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public void upload(HttpServletResponse response, @AMyParams MyParams myParams,
                      @RequestParam("files") MultipartFile[] files) {
        Result r;
        try {
            r = LjqManager.upload(myParams, files);
        }catch (MyException e){
            r = failed(e.getMessage(),e.getData());
            r.setCode(e.getCode());
            log.trace(r.toString(),e);
        }catch (Throwable e){
            r = failed("处理异常："+e.getMessage());
            log.error(r.getMsg(),e);
        }
        LjqManager.sendResult(response,myParams,r);
    }
    @RequestMapping(value = "${benma666.service.addr}/{qqfs}/{qqz}/{cllx}", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public void upload0(HttpServletResponse response, @AMyParams MyParams myParams,
                        @RequestParam("files") MultipartFile[] files,
                        @PathVariable String qqfs,@PathVariable String qqz,@PathVariable String cllx) {
        upload(response,myParams,files);
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
        Result r = failed("请求异常："+attr.get("error")+"->"+ex.getMessage());
        r.setCode(Integer.parseInt(attr.get("status").toString()));
        LjqManager.sendResult(response,null,r);
    }
}
