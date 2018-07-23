package cn.benma666.common.contorller;

import java.io.File;
import java.io.PrintWriter;

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
	
	@RequestMapping(value="/common/file/ueditorConfig.do")
	public void ueditorConfig(HttpServletRequest request, HttpServletResponse response){
     /*   String rootPath = request.getSession().getServletContext().getRealPath("/");
        ActionEnter actionEnter = new ActionEnter(request, rootPath);
        String result = actionEnter.exec();
        WebUtil.sendJson(response, result);*/
	}
	
	/**
	 * @Description:文件上传
	 */
	@RequestMapping(value = "/common/file/uploadFile.do", method = RequestMethod.POST)
	public void uploadFile(HttpServletRequest request,HttpServletResponse response, HttpSession session,TSysFileRecord t){
		//获取文件
		MultipartFile file =((MultipartHttpServletRequest) request).getFile("file");
		try{
			//输出流	
			response.setContentType("text/html;charset=UTF-8");  
			PrintWriter writer = response.getWriter();			
			//上传文件
			TSysFileRecord record = fileService.uploadFiles(t,file);
			if(record!=null){
				// 结果返回流
				writer.println(StringUtil.success(record));
			}else{
				writer.println(StringUtil.error("上传文件失败"));	
			}			
		}catch(Exception e){
			LogHelper.getLogger().error("上传文件出错", e);
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
			TSysFileRecord record = fileService.selectTSysFileRecord(t);
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
			LogHelper.getLogger().error("导出excel出错", e);
		}
	}
	

}
