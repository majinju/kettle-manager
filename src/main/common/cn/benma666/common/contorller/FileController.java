package cn.benma666.common.contorller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cn.benma666.common.domain.TSysFileRecord;
import cn.benma666.common.service.FileService;
import cn.benma666.myutils.ExportToExecl;
import cn.benma666.web.BasicController;
import cn.benma666.web.WebUtil;

import com.alibaba.fastjson.JSONObject;

/**
* 文件上传下载等功能 <br/>
* date: 2018年12月6日 <br/>
* @author jingma
* @version 
*/
@Controller
@RequestMapping(value = "/common/file")
public class FileController extends BasicController{
    
    @Autowired
    private FileService fileService;
    
    /**
     * @Description:文件上传
     */
    @RequestMapping(value = "/uploadFile.do", method = RequestMethod.POST)
    public void uploadFile(HttpServletRequest request,HttpServletResponse response, HttpSession session,TSysFileRecord t){
        //获取文件
        MultipartFile file =((MultipartHttpServletRequest) request).getFile("file");
        try{
            //上传文件
            JSONObject record = fileService.uploadFiles(t,file);
            sendJson(response, success("",record));
        }catch(Exception e){
            log.error("上传文件出错", e);
            WebUtil.sendJson(response,error("上传文件失败"));
        }
    
    }
    
    /**
     * 下载文件
     * @param request
     * @param response
     * @param session
     * @param id
     */
    @RequestMapping(value="/downloadFile.do")
    public void downloadFile(HttpServletRequest request,HttpServletResponse response, HttpSession session,TSysFileRecord t){
        try {
            TSysFileRecord record = sqlManager.single(TSysFileRecord.class, t.getId());
            if(record!=null){
                File file = new File(record.getSclj());
                WebUtil.sendFile(response, file, record.getWjm());
            }                                                           
        } catch (Exception e) {
            log.error("下载附件出错", e);
        }
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
            log.error("导出excel出错", e);
        }
    }

    /**
    * 
    * @see cn.benma666.web.BasicController#getFModulePath()
    */
    @Override
    public String getFModulePath() {
        return "common";
    }

    /**
    * 
    * @see cn.benma666.web.BasicController#getModulePath()
    */
    @Override
    public String getModulePath() {
        return "file";
    }
}
