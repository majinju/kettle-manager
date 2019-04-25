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
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglFile;
import cn.benma666.domain.SysSjglTyzd;
import cn.benma666.iframe.CacheFactory;
import cn.benma666.iframe.DictManager;
import cn.benma666.myutils.ExportToExecl;
import cn.benma666.myutils.PageInfo;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.web.BasicController;
import cn.benma666.web.UserManager;
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
    * 清除缓存 <br/>
    * @author jingma
    * @param obj
    * @param response
    */
    @RequestMapping(value = "/clearCache.do")
    public void clearCache(SysSjglTyzd obj,HttpServletRequest request, 
            HttpServletResponse response) {
        setEParam(obj, request);
        SysQxYhxx user = getUser(request);
        if(!"admin".equals(user.getYhdm())){
            sendJson(response, error("你无权清除缓存"));
        }else{
            CacheFactory.clear();
            sendJson(response, success("清除缓存成功"));
        }
    }
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
    @RequestMapping(value = "/zdObj.do")
    public void zdObjByDm(SysSjglTyzd obj, HttpServletRequest request, 
            HttpServletResponse response) {
        setEParam(obj, request);
        obj.set(LjqInterface.KEY_USER, getUser(request));
        JSONObject result = null;
        if(obj.getMap().containsKey("cache")){
            result = DictManager.zdObj(obj);
        }else{
            result = DictManager.zdObjByDmByCache(obj);
        }
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
                list.add(DictManager.zdObj(obj));
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
    /**
    * 将用户信息加密，然后重定向到指定url <br/>
    * @author jingma
    * @param request
    * @param url
    * @param userid
    * @param projectCode
    * @param response
    */
    @RequestMapping(value = "/common/doDesEncryptUrl.do")
    public void doDesEncryptUrl(HttpServletRequest request,String url,
            String userid,String projectCode, HttpServletResponse response){
        try {
            url = UserManager.doDesEncryptUrl(url,projectCode,getUser(request).getSfzh());
            response.sendRedirect(url);
        } catch (Exception e) {
            log.error("用户信息编码失败", e);
            WebUtil.sendJson(response, error("用户信息编码失败:"+e.getMessage()));
            return;
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
