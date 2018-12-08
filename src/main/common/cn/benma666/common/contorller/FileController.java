package cn.benma666.common.contorller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cn.benma666.common.domain.SysFileRecord;
import cn.benma666.common.service.FileService;
import cn.benma666.constants.UtilConst;
import cn.benma666.myutils.ExportToExecl;
import cn.benma666.myutils.PageInfo;
import cn.benma666.myutils.StringUtil;
import cn.benma666.web.BasicController;
import cn.benma666.web.WebUtil;

import com.alibaba.fastjson.JSON;
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
    public void uploadFile(HttpServletRequest request,HttpServletResponse response, HttpSession session,SysFileRecord t){
        //获取文件
        MultipartFile file =((MultipartHttpServletRequest) request).getFile("file");
        try{
            //上传文件
            JSONObject record = fileService.uploadFiles(t,file);
            sendJson(response, success("",record));
        }catch(Exception e){
            log.error("数据处理出错", e);
            WebUtil.sendJson(response,error("数据处理出错："+e.getMessage()));
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
    public void downloadFile(HttpServletRequest request,HttpServletResponse response, HttpSession session,SysFileRecord t){
        try {
            SysFileRecord record = sqlManager.single(SysFileRecord.class, t.getId());
            if(record!=null){
                File file = new File(record.getSclj());
                WebUtil.sendFile(response, file, record.getWjm());
            }                                                           
        } catch (Exception e) {
            log.error("数据处理出错", e);
            WebUtil.sendJson(response,error("数据处理出错："+e.getMessage()));
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
            log.error("数据处理出错", e);
            WebUtil.sendJson(response,error("数据处理出错："+e.getMessage()));
        }
    }
    /**
    * 进入列表页面 <br/>
    * @author jingma
    * @param session
    * @param model
    * @return
    */
    @RequestMapping(value = "/list.do", method = RequestMethod.GET)
    public String list(HttpSession session, Model model) {
        return getPathList();
    }
    /**
    * 查询列表数据 <br/>
    * @author jingma
    * @param t
    * @param page
    * @param response
    * @param session
    */
    @RequestMapping(value = "/queryList.do", method = RequestMethod.POST)
    public void queryList(SysFileRecord t,PageInfo<JSONObject> page, 
            HttpServletResponse response, HttpSession session) {
        try {
            page = fileService.queryPage(t, page);
            sendPage(response, page);
        } catch (Exception e) {
            log.error("数据处理出错", e);
            WebUtil.sendJson(response,error("数据处理出错："+e.getMessage()));
        }
    }

    /**
    * 进入编辑新增页面 <br/>
    * @author jingma
    * @param id
    * @param response
    * @param model
    * @param session
    * @return
    */
    @RequestMapping(value = "/edit.do", method = RequestMethod.GET)
    public String update(String id,HttpServletResponse response,Model model, HttpSession session) {
        if(StringUtil.isNotBlank(id)){
            SysFileRecord file = sqlManager.single(SysFileRecord.class, id);
            JSONObject result = (JSONObject) JSON.toJSON(file);
            result.put("shgx", db.find(
                    "select * from sys_file_record t where t.id=? and t.isdel=?", 
                    file.getId(),UtilConst.WHETHER_TRUE));
            model.addAttribute("obj", result.toJSONString());
        }else{
            model.addAttribute("obj", "null");
        }
        return getPathEdit();
    }

    /**
    * 保存单条数据 <br/>
    * @author jingma
    * @param fromData
    * @param response
    * @param session
    */
    @RequestMapping(value = "/save.do", method = RequestMethod.POST)
    public void save(String fromData ,HttpServletResponse response, HttpSession session) {
        try {
            sendJson(response, fileService.txSave(fromData));
        } catch (Exception e) {
            log.error("数据处理出错", e);
            WebUtil.sendJson(response,error("数据处理出错："+e.getMessage()));
        }
    }

    /**
    * 单个删除处理 <br/>
    * @author jingma
    * @param t
    * @param response
    */
    @RequestMapping(value = "/delete.do", method = RequestMethod.POST)
    public void delete(SysFileRecord t, HttpServletResponse response) {
        try {
            t.setEtldate(db.getCurrentDateStr14());
            sqlManager.updateTemplateById(t);
            WebUtil.sendJson(response,success("恭喜您，删除成功!"));
        } catch (Exception e) {
            log.error("数据处理出错", e);
            WebUtil.sendJson(response,error("数据处理出错："+e.getMessage()));
        }
    }
    /**
    * 批量删除处理 <br/>
    * @author jingma
    * @param ids
    * @param response
    */
    @RequestMapping(value = "/batchDelete.do", method = RequestMethod.POST)
    public void batchDelete(String ids, HttpServletResponse response) {
        try {
            SysFileRecord t = new SysFileRecord();
            t.getMap().put("ids", ids);
            fileService.batchDelete(t);
            WebUtil.sendJson(response,success("批量删除成功！"));
        } catch (Exception e) {
            log.error("数据处理出错", e);
            WebUtil.sendJson(response,error("数据处理出错："+e.getMessage()));
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
