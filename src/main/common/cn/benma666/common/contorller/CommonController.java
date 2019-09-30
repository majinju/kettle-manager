package cn.benma666.common.contorller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cn.benma666.common.service.CommonService;
import cn.benma666.domain.BasicBean;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglFile;
import cn.benma666.domain.SysSjglTyzd;
import cn.benma666.iframe.CacheFactory;
import cn.benma666.iframe.DictManager;
import cn.benma666.myutils.ExportToExecl;
import cn.benma666.myutils.PageInfo;
import cn.benma666.myutils.StringUtil;
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
@Api(tags="公共服务接口")
@Controller
@RequestMapping(value="/common")
public class CommonController extends BasicController {
    @Autowired
    private CommonService commonService;
    @Autowired
    private SjdxController sjdxController;

    /**
    * @author jingma
    * @param obj
    * @param response
    */
    @ApiOperation(value="清理缓存",httpMethod="POST",
        notes="全部缓存，包含用户缓存、字典缓存、数据对象缓存等")
    @RequestMapping(value = "/clearCache.do")
    //@ModelAttribute SysSjglTyzd obj,
    public void clearCache(SysSjglTyzd obj,HttpServletRequest request, 
            HttpServletResponse response) {
        SysQxYhxx user = jkInit(obj, request);
        if(!"admin".equals(user.getYhdm())){
            sendJson(response, error("你无权清除缓存"));
        }else{
            CacheFactory.clear();
            sendJson(response, success("清除缓存成功"));
        }
    }
    /**
    * @author jingma
    * @param obj
    * @param response
    */
    @ApiOperation(value="获取字典列表",httpMethod="POST")
//    @ApiImplicitParam(name = "zdlb", value = "字典类别", required = true,paramType="query", dataType = "String")
//    @ApiImplicitParam(name = "obj", value = "字典对象", required = true, dataType = "SysSjglTyzd")
    @RequestMapping(value = "/zdList.do")
    //@RequestBody SysSjglTyzd obj,
    public void zdList(SysSjglTyzd obj,HttpServletRequest request, 
            HttpServletResponse response) {
        jkInit(obj, request);
        JSONObject map = DictManager.zdMapByCache(obj);
        if(map==null){
            sendJson(response, error("该字典类别不支持获取列表"));
        }else{
            String result = JSON.toJSONString(success("获取成功",map.values()), obj.isJsongsh());
            sendJson(response, result);
        }
    }

    /**
    * @author jingma
    * @param obj
    * @param response
    */
    @ApiOperation(value="获取字典项",httpMethod="POST")
    @RequestMapping(value = "/zdObj.do")
    public void zdObjByDm(SysSjglTyzd obj, HttpServletRequest request, 
            HttpServletResponse response) {
        jkInit(obj, request);
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
    * @author jingma
    * @param page
    * @param obj
    * @param response
    */
    @ApiOperation(value="字典搜索",httpMethod="POST")
    @RequestMapping(value = "/zdSearch.do")
    public void zdSearch(PageInfo<JSONObject> page, SysSjglTyzd obj,
            HttpServletRequest request, HttpServletResponse response) {
        jkInit(obj, request);
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
    @ApiOperation(value="导出Excel",httpMethod="POST")
    @RequestMapping(value="/saveToExecl.do")
    public void saveToExecl(HttpServletRequest request,HttpServletResponse response){
        try {
            ExportToExecl.fromHtmlTable(request, response);
        } catch (Exception e) {
            log.error("数据处理出错", e);
            WebUtil.sendJson(response,error("数据处理出错："+e.getMessage()));
        }
    }
   
    @ApiOperation(value="文件上传",httpMethod="POST")
    @RequestMapping(value = "/upload.do", method = RequestMethod.POST)
    public void upload(HttpServletRequest request,HttpServletResponse response, 
            SysSjglFile fileObj){
        jkInit(fileObj, request);
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
    * @author jingma
    * @param request
    * @param response
    * @param obj
    */
    @ApiOperation(value="下载文件",httpMethod="POST")
    @RequestMapping(value="/download.do")
    public void download(HttpServletRequest request,HttpServletResponse response, SysSjglFile obj){
        try {
            jkInit(obj, request);
            commonService.download(response, obj);
        } catch (Exception e) {
            log.error("数据处理出错", e);
            WebUtil.sendJson(response,error("数据处理出错："+e.getMessage()));
        }
    }
    /**
    * 接口初始化 <br/>
    * @author jingma
    * @param obj
    * @param request
    * @return
    */
    public SysQxYhxx jkInit(BasicBean obj, HttpServletRequest request) {
        setEParam(obj, request);
        SysQxYhxx user = getUser(request);
        obj.set("user", user);
        //TODO 进行权限鉴定，字典类别、数据库、应用、服务器等重要字典类别添加权限控制，没控制的默认可用。
        return user;
    }
    /**
    * eg:http://127.0.0.1:88/myservice/common/doDesEncryptUrl.do?projectCode=
    * kp&url=/plcl.do?id=21C74221753145F6A3B690042E0B563A%26e_cllx=qchc
    * @author jingma
    * @param request
    * @param url
    * @param userid
    * @param projectCode
    * @param response
    */
    @RequestMapping(value = "/doDesEncryptUrl.do")
    @ApiOperation(value="用户信息转发",notes="将用户信息加密，然后重定向到指定url",httpMethod="GET")
    public void doDesEncryptUrl(HttpServletRequest request,String url,
            String userid,String projectCode, HttpServletResponse response){
        try {
            if(StringUtil.isBlank(userid)){
                userid = getUser(request).getSfzh();
            }
            url = UserManager.doDesEncryptUrl(url,projectCode,userid);
            log.debug(userid+"转发到："+url);
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
