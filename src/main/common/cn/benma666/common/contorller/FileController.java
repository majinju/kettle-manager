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
import cn.benma666.common.iframe.BasicObject;
import cn.benma666.common.service.FileService;
import cn.benma666.common.util.ExportToExecl;
import cn.benma666.common.util.LogHelper;
import cn.benma666.common.util.StringUtil;
import cn.benma666.common.util.WebUtil;

import com.alibaba.fastjson.JSONObject;


/**
 * 文件上传下载等功能
 *
 * @date 2017年11月14日下午2:56:29
 * 
 */

@Controller
public class FileController extends BasicObject{
    
    @Autowired
    private FileService fileService;
    
    /**
     * @Description:文件上传
     */
    @RequestMapping(value = "/common/file/uploadFile.do", method = RequestMethod.POST)
    public void uploadFile(HttpServletRequest request,HttpServletResponse response, HttpSession session,TSysFileRecord t){
        //获取文件
        MultipartFile file =((MultipartHttpServletRequest) request).getFile("file");
        try{
            //上传文件
            JSONObject record = fileService.uploadFiles(t,file);
            WebUtil.sendJson(response, StringUtil.success(record));
        }catch(Exception e){
            LogHelper.getLogger().error("上传文件出错", e);
            WebUtil.sendJson(response,StringUtil.error("上传文件失败"));
        }
    
    }
    
    /**
     * 下载文件
     * @param request
     * @param response
     * @param session
     * @param id
     */
    @RequestMapping(value="/common/file/downloadFile.do")
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
    @RequestMapping(value="/common/file/saveToExecl.do")
    public void saveToExecl(HttpServletRequest request,HttpServletResponse response){
        try {
            ExportToExecl.fromHtmlTable(request, response);
        } catch (Exception e) {
            log.error("导出excel出错", e);
        }
    }
}
