package cn.benma666.common.contorller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.benma666.sjgl.SysSjglSjdx;
import cn.benma666.web.BasicController;

/**
* 运行监控 <br/>
* date: 2019年3月18日 <br/>
* @author jingma
* @version 
*/
@Controller
@RequestMapping(value="/yxjk")
public class YxjkController extends BasicController {
    /**
     * Creates a new instance of SjdxController.
     */
    public YxjkController() {
    }

    @RequestMapping(value = "/gxt.do")
    public String gxt(SysSjglSjdx sjdx,String myparams, Model model, 
            HttpServletRequest request) {
        return getPath("gxt");
    }

    @Override
    public String getFModulePath() {
        return "";
    }
    @Override
    public String getModulePath() {
        return "yxjk";
    }

}
