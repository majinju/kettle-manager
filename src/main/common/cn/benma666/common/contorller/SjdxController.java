package cn.benma666.common.contorller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.benma666.common.service.SjdxService;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.exception.MyException;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.PageInfo;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.sjgl.LjqManager;
import cn.benma666.web.BasicController;
import cn.benma666.web.QxManager;
import cn.benma666.web.WebUtil;

import com.alibaba.fastjson.JSONObject;

/**
* 数据对象 <br/>
* date: 2018年12月3日 <br/>
* @author jingma
* @version 
*/
@Controller
@RequestMapping(value="/sjdx")
public class SjdxController extends BasicController {
    @Autowired
    private SjdxService sjdxService;
    /**
     * Creates a new instance of SjdxController.
     */
    public SjdxController() {
    }
    /**
    * 对象查询 <br/>
    * @param request 
    */
    @RequestMapping(value = "/list.do")
    public String list(SysSjglSjdx sjdx,String myparams, Model model, 
            HttpServletRequest request,HttpServletResponse response) {
        result = LjqManager.jcxx(sjdx,myparams,request);
        if(result.isStatus()){
            myParams = (JSONObject) result.getData();
            dbSjdx = (SysSjglSjdx)myParams.get(LjqInterface.KEY_SJDX);
            model.addAttribute("sjdx", dbSjdx);
            if(StringUtil.isBlank(myparams)){
                myparams = "{}";
            }
            model.addAttribute("myparams", myparams);
            return LjqManager.list(sjdx,model);
        }else{
            if(!QxManager.AUTH_CODE_WQX.equals(result.getCode())){
                throw new MyException(result.getMsg());
            }else{
                try {
                    String url = WebUtil.getBasePath(request);
                    response.sendRedirect(url);
                } catch (IOException e) {
                    log.error("重定向异常"+sjdx, e);
                }
            }
            return null;
        }
    }
    /**
    * 进入编辑新增页面 <br/>
     * @param request 
    */
    @RequestMapping(value = "/edit.do")
    public String edit(SysSjglSjdx sjdx,String myparams, Model model, 
            HttpServletRequest request,HttpServletResponse response) {
        result = LjqManager.jcxx(sjdx,myparams,request);
        if(result.isStatus()){
            myParams = (JSONObject) result.getData();
            dbSjdx = (SysSjglSjdx)myParams.get(LjqInterface.KEY_SJDX);
            model.addAttribute("sjdx", dbSjdx);
            if(StringUtil.isBlank(myparams)){
                myparams = "{}";
            }
            model.addAttribute("myparams", myparams);
            return LjqManager.edit(sjdx,model);
        }else{
            if(!QxManager.AUTH_CODE_WQX.equals(result.getCode())){
                throw new MyException(result.getMsg());
            }else{
                try {
                    String url = WebUtil.getBasePath(request);
                    response.sendRedirect(url);
                } catch (IOException e) {
                    log.error("重定向异常"+sjdx, e);
                }
            }
            return null;
        }
    }
    
    /**
    * 数据对象的相关数据 <br/>
    * @author jingma
    * @param sjdx
    * @param response
    */
    @RequestMapping(value = "/jcxx.do")
    public void jcxx(SysSjglSjdx sjdx,String myparams,
            HttpServletRequest request,HttpServletResponse response) {
        try {
            if(basicJcxx(sjdx,myparams,request,response)){
                myParams.remove(LjqInterface.KEY_FIELD_LIST);
                sendJson(response, result);
            }
        } catch (Exception e) {
            log.error("数据处理异常"+sjdx, e);
            sendJson(response, error("数据处理异常："+e.getMessage()));
        }
    }
    /**
    * 对象查询请求数据 <br/>
    * @author jingma
    * @param sjdx
    * @param response
    */
    @RequestMapping(value = "/page.do")
    public void page(SysSjglSjdx sjdx,String myparams,
            HttpServletRequest request,HttpServletResponse response,
            PageInfo<JSONObject> page) {
        try {
            if(basicJcxx(sjdx,myparams,request,response)){
                sendJson(response, LjqManager.page(dbSjdx,myParams, page));
            }
        } catch (Exception e) {
            log.error("数据处理异常"+sjdx, e);
            sendJson(response, error("数据处理异常："+e.getMessage()));
        }
    }
    /**
    * 对象查询请求数据 <br/>
    * @author jingma
    * @param sjdx
    * @param response
    */
    @RequestMapping(value = "/export.do")
    public void export(SysSjglSjdx sjdx,String myparams,
            HttpServletRequest request,HttpServletResponse response,
            PageInfo<JSONObject> page) {
        try {
            if(basicJcxx(sjdx,myparams.replace("%34", "\""),request,response)){
                LjqManager.export(dbSjdx,myParams, page,response);
            }
        } catch (Exception e) {
            log.error("数据处理异常"+sjdx, e);
            sendJson(response, error("数据处理异常："+e.getMessage()));
        }
    }
    /**
    * 获取数据模板 <br/>
    * @author jingma
    * @param sjdx
    * @param response
    */
    @RequestMapping(value = "/getMb.do")
    public void getMb(SysSjglSjdx sjdx,String myparams,
            HttpServletRequest request,HttpServletResponse response) {
        try {
            if(basicJcxx(sjdx,myparams,request,response)){
                JsonResult r = LjqManager.getMb(dbSjdx,myParams, response);
                if(!r.isStatus()){
                    sendJson(response, r);
                }
            }
        } catch (Exception e) {
            log.error("数据处理异常"+sjdx, e);
            sendJson(response, error("数据处理异常："+e.getMessage()));
        }
    }
    /**
    * 批量处理 <br/>
    * @author jingma
    * @param sjdx
    * @param myparams
    * @param response
    * @param session
    */
    @RequestMapping(value = "/plcl.do")
    public void plcl(SysSjglSjdx sjdx,String myparams,
            HttpServletRequest request,HttpServletResponse response) {
        try {
            if(basicJcxx(sjdx,myparams,request,response)){
                sendJson(response, sjdxService.txPlcl(dbSjdx,myParams));
            }
        } catch (Exception e) {
            log.error("数据处理异常"+sjdx, e);
            sendJson(response, error("数据处理异常："+e.getMessage()));
        }
    }
    /**
    * 批量处理 <br/>
    * @author jingma
    * @param sjdx
    * @param myparams
    * @param response
    * @param session
    */
    @RequestMapping(value = "/getdata.do")
    public void getdata(SysSjglSjdx sjdx,String myparams,
            HttpServletRequest request,HttpServletResponse response) {
        try {
            if(basicJcxx(sjdx,myparams,request,response)){
                sendJson(response, sjdxService.getdata(dbSjdx,myParams));
            }
        } catch (Exception e) {
            log.error("数据处理异常"+sjdx, e);
            sendJson(response, error("数据处理异常："+e.getMessage()));
        }
    }
    /**
    * 保存单条数据 <br/>
    * @author jingma
    * @param sjdx
    * @param myparams
    * @param response
    * @param session
    */
    @RequestMapping(value = "/save.do")
    public void save(SysSjglSjdx sjdx,String myparams,
            HttpServletRequest request,HttpServletResponse response) {
        try {
            if(basicJcxx(sjdx,myparams,request,response)){
                sendJson(response, LjqManager.save(dbSjdx, myParams));
            }
        } catch (Exception e) {
            log.error("数据处理异常"+sjdx, e);
            sendJson(response, error("数据处理异常："+e.getMessage()));
        }
    }

    /**
    * 保存列表数据 <br/>
    * @author jingma
    * @param sjdx
    * @param response
    */
    @RequestMapping(value = "/saveListData.do")
    public void saveListData(SysSjglSjdx sjdx,String myparams,
            HttpServletRequest request,HttpServletResponse response) {
        try {
            if(basicJcxx(sjdx,myparams,request,response)){
                sendJson(response, sjdxService.txSaveListData(dbSjdx,myParams));
            }
        } catch (Exception e) {
            log.error("数据处理异常", e);
            sendJson(response, error("数据处理异常："+e.getMessage()));
        }
    }

    @Override
    public String getFModulePath() {
        return "";
    }
    @Override
    public String getModulePath() {
        return "sjdx";
    }

}
