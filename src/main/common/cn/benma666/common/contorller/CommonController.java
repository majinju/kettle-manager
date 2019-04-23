package cn.benma666.common.contorller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cn.benma666.common.service.CommonService;
import cn.benma666.domain.SysSjglFile;
import cn.benma666.domain.SysSjglTyzd;
import cn.benma666.iframe.DictManager;
import cn.benma666.myutils.ExportToExecl;
import cn.benma666.myutils.PageInfo;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.web.BasicController;
import cn.benma666.web.WebUtil;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

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
    @Autowired
    private SjdxController sjdxController;

    /**
    * 获取字典列表 <br/>
    * @author jingma
    * @param obj
    * @param response
    */
    @RequestMapping(value = "/zdList.do")
    public void zdList(SysSjglTyzd obj,HttpServletRequest request, 
            HttpServletResponse response) {
        setEParam(obj, request);
        obj.set(LjqInterface.KEY_USER, getUser(request));
        JSONObject map = DictManager.zdMapByCache(obj);
        if(map==null){
            sendJson(response, error("该字典类别不支持获取列表"));
        }else{
            String result = JSON.toJSONString(success("获取成功",map), obj.isJsongsh());
            sendJson(response, result);
        }
    }

    /**
    * 获取字典项 <br/>
    * @author jingma
    * @param obj
    * @param response
    */
    @RequestMapping(value = "/zdObjByDm.do")
    public void zdObjByDm(SysSjglTyzd obj, HttpServletRequest request, 
            HttpServletResponse response) {
        setEParam(obj, request);
        obj.set(LjqInterface.KEY_USER, getUser(request));
        JSONObject result = DictManager.zdObjByDmByCache(obj);
        if(result==null){
            sendJson(response, error("该字典项不存在"));
        }else{
            sendJson(response, success("获取成功",result));
        }
    }

    /**
    * 字典搜索 <br/>
    * @author jingma
    * @param page
    * @param obj
    * @param response
    */
    @RequestMapping(value = "/zdSearch.do")
    public void zdSearch(PageInfo<JSONObject> page, SysSjglTyzd obj,
            HttpServletRequest request, HttpServletResponse response) {
        setEParam(obj, request);
        obj.set(LjqInterface.KEY_USER, getUser(request));
        String searchValue = obj.getSearchValue();
        PageInfo<JSONObject> result;
        if (StringUtil.isNotBlank(searchValue)) {
            //此时为翻译
            List<JSONObject> list = new ArrayList<JSONObject>();
            for (String dm : searchValue.split(",")) {
                obj.setDm(dm);
                list.add(DictManager.zdObjByDm(obj));
            }
            page.setList(list);
            result = page;
        } else {
            result = DictManager.zdSearch(page,obj);
        }
        sendPage(response, result);
    }
    
    /**
     * 导出Excel
     * @param request
     * @param response
     */
    @RequestMapping(value="/saveToExecl.do")
    public void saveToExecl(HttpServletRequest request,HttpServletResponse response){
        try {
            ExportToExecl.fromHtmlTable(request, response);
        } catch (Exception e) {
            log.error("数据处理出错", e);
            WebUtil.sendJson(response,error("数据处理出错："+e.getMessage()));
        }
    }
    
    /**
     * @Description:文件上传
     */
    @RequestMapping(value = "/upload.do", method = RequestMethod.POST)
    public void upload(HttpServletRequest request,HttpServletResponse response, 
            HttpSession session,SysSjglFile fileObj){
        //获取文件
        MultipartFile file =((MultipartHttpServletRequest) request).getFile("file");
        try{
            //上传文件
            JSONObject record = commonService.upload(fileObj,file,getUser(request));
            sendJson(response, success("",record));
        }catch(Exception e){
            log.error("数据处理出错", e);
            WebUtil.sendJson(response,error("数据处理出错："+e.getMessage()));
        }
    
    }

    /**
    * 下载文件 <br/>
    * @author jingma
    * @param request
    * @param response
    * @param obj
    */
    @RequestMapping(value="/download.do")
    public void download(HttpServletRequest request,HttpServletResponse response, SysSjglFile obj){
        try {
            SysSjglFile fileObj = sqlManager.single(SysSjglFile.class, obj.getId());
            if(fileObj!=null){
                fileObj.setXzms(obj.isXzms());
                File file = new File(fileObj.getSclj());
                WebUtil.sendFile(response, file, fileObj);
            }else{
                log.debug("下载的文件不存在："+obj);
                WebUtil.sendJson(response,error("下载的文件不存在："+obj));
            }
        } catch (Exception e) {
            log.error("数据处理出错", e);
            WebUtil.sendJson(response,error("数据处理出错："+e.getMessage()));
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
