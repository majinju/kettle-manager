package cn.benma666.common.contorller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.benma666.common.service.CommonService;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.sjgl.SysSjglSjdx;
import cn.benma666.web.BasicController;

/**
* 通用 <br/>
* date: 2018年12月3日 <br/>
* @author jingma
* @version 
*/
@Controller
@RequestMapping(value="/common")
public class CommonController extends BasicController {
    @Autowired
    private CommonService commonService;
    
    @RequestMapping(value = "/jcxx.do")
    public void jcxx(SysSjglSjdx sjdx,String myparams,
            HttpServletRequest request,HttpServletResponse response) {
        try {
            jcxx(sjdx,myparams,request);
            myJsonParams.remove(LjqInterface.KEY_FIELD_LIST);
            sendJson(response, result);
        } catch (Exception e) {
            log.error("数据处理异常"+sjdx, e);
            sendJson(response, error("数据处理异常："+e.getMessage()));
        }
    }
    @Override
    public String getFModulePath() {
        return "";
    }
    @Override
    public String getModulePath() {
        return "common";
    }

}
