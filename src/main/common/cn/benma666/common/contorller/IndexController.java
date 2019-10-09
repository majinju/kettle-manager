package cn.benma666.common.contorller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.benma666.common.service.CommonService;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.exception.MyException;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.sjgl.LjqManager;
import cn.benma666.web.BasicController;
import cn.benma666.web.QxManager;
import cn.benma666.web.UserManager;
import cn.benma666.web.WebUtil;

import com.alibaba.fastjson.JSONObject;

/**
* 通用 <br/>
* date: 2018年12月3日 <br/>
* @author jingma
* @version 
*/
@Controller
public class IndexController extends BasicController {
    @Autowired
    private CommonService commonService;
    @Autowired
    private SjdxController sjdxController;
    /**
    * 对象查询 <br/>
    * @param request 
    */
    @RequestMapping(value = "sjdx.do")
    public String sjdx(SysSjglSjdx sjdx,String myparams, Model model, 
            HttpServletRequest request,HttpServletResponse response) {
        setEParam(sjdx, request);
        result = LjqManager.jcxx(sjdx,myparams,request);
        if(result.isStatus()){
            myParams = (JSONObject) result.getData();
            dbSjdx = (SysSjglSjdx)myParams.get(LjqInterface.KEY_SJDX);
            model.addAttribute("sjdx", dbSjdx);
            if(StringUtil.isBlank(myparams)){
                myparams = "{}";
            }
            model.addAttribute("myparams", myparams);
            return LjqManager.sjdx(sjdx,model);
        }else{
            if(!QxManager.AUTH_CODE_WQX.equals(result.getCode())){
                throw new MyException(result.getMsg());
            }else{
                try {
                    if(getUser(request).getYhdm().equals(UserManager.LSYH)){
                        //临时用户访问没权限的页面则自动跳转到首页
                        response.sendRedirect(WebUtil.getBasePath(request));
                    }else{
                        response.sendError(HttpServletResponse.SC_FORBIDDEN, result.getMsg());
                    }
                } catch (Throwable e) {
                    log.error("重定向异常"+sjdx, e);
                }
            }
            return null;
        }
    }
    
    @Override
    public String getFModulePath() {
        return "";
    }
    @Override
    public String getModulePath() {
        return "";
    }

}
