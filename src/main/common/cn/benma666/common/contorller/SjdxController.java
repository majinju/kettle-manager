package cn.benma666.common.contorller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.benma666.common.service.SjdxService;
import cn.benma666.domain.SysSjglFile;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.PageInfo;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.sjgl.LjqManager;
import cn.benma666.web.BasicController;

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
        setEParam(sjdx, request);
        result = LjqManager.jcxx(sjdx,myparams,request);
        if(result.isStatus()){
            myParams = (JSONObject) result.getData();
            dbSjdx = (SysSjglSjdx)myParams.get(LjqInterface.KEY_SJDX);
            result = LjqManager.list(dbSjdx,myParams,model);
            if(result.isStatus()){
                return result.getMsg();
            }
        }
        return pageError(sjdx, request, response);
    }
    /**
    * 进入编辑新增页面 <br/>
     * @param request 
    */
    @RequestMapping(value = "/edit.do")
    public String edit(SysSjglSjdx sjdx,String myparams, Model model, 
            HttpServletRequest request,HttpServletResponse response) {
        setEParam(sjdx, request);
        result = LjqManager.jcxx(sjdx,myparams,request);
        if(result.isStatus()){
            myParams = (JSONObject) result.getData();
            dbSjdx = (SysSjglSjdx)myParams.get(LjqInterface.KEY_SJDX);
            result = LjqManager.edit(dbSjdx, myParams,model);
            if(result.isStatus()){
                return result.getMsg();
            }
        }
        return pageError(sjdx, request, response);
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
        } catch (Throwable e) {
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
        } catch (Throwable e) {
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
        } catch (Throwable e) {
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
        } catch (Throwable e) {
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
        } catch (Throwable e) {
            log.error("数据处理异常"+sjdx, e);
            sendJson(response, error("数据处理异常："+e.getMessage()));
        }
    }
    /**
    * 获取文件<br/>
    * @author jingma
    * @param sjdx
    * @param myparams
    * @param response
    * @param session
    */
    @RequestMapping(value = "/getFile.do")
    public void getFile(SysSjglSjdx sjdx,String myparams,
            HttpServletRequest request,HttpServletResponse response) {
        try {
            if(basicJcxx(sjdx,myparams,request,response)){
                //后台还是走批量处理接口
                JsonResult r = sjdxService.txPlcl(dbSjdx,myParams);
                if(r.isStatus()){
                    JSONObject data = (JSONObject) r.getData();
                    sendFile(response, data.getBytes(LjqInterface.KEY_FILE_BYTES),
                            (SysSjglFile) data.get(LjqInterface.KEY_FILE_OBJ));
                }else{
                    sendJson(response, r);
                }
            }
        } catch (Throwable e) {
            log.error("数据处理异常"+sjdx, e);
            sendJson(response, error("数据处理异常："+e.getMessage()));
        }
    }
    /**
    * 获取数据 <br/>
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
        } catch (Throwable e) {
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
        } catch (Throwable e) {
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
        } catch (Throwable e) {
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
