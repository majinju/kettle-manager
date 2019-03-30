package cn.benma666.common.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.benma666.constants.UtilConst;
import cn.benma666.domain.SysFileRecord;
import cn.benma666.myutils.DateUtil;
import cn.benma666.myutils.FileUtil;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.PageInfo;
import cn.benma666.myutils.StringUtil;
import cn.benma666.web.BasicService;
import cn.benma666.web.SConf;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * 文件相关服务
 */
@Service
public class FileService extends BasicService{
    
    /**
     * 文件上传路径
     */
    public static final String SYS_SCLJ = "sys.sclj";
    /**
     * 上传类别
     */
    public static final String SYS_SCLB = "sys.sclb";
    
    /**
     * 上传类别_LOCAL
     */
    public static final String SCLB_LOCAL = "LOCAL";
    
    /**
     * 上传类别_FTP
     */
    public static final String SCLB_FTP = "FTP";
    
    /**
     * 上传类别_FASTDFS
     */
    public static final String SCLB_FASTDFS = "FASTDFS";
    
    /**
     * 上传文件
     * @param t
     * @param file
     * @return
     * @throws IOException
     */
    public JSONObject upload(SysFileRecord t,MultipartFile file){
        //文件名称
        String fileName = file.getOriginalFilename();
        //文件类型
        String fileType = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();
        //文件上传路径
        String sclb = SConf.getVal(SYS_SCLB);
        //上传后文件的路径以及文件的名称
        String filePath = SConf.getVal(SYS_SCLJ) + t.getYwdm() +UtilConst.FXG
                +fileName.substring(0,fileName.lastIndexOf('.'))+"_"
                + DateUtil.getDateTimeStr(DateUtil.DATE_FORMATTER14) 
                + "." + fileType;
        File files = new File(filePath);
        FileUtil.saveFileToDisk(files, file);
        //去重码ywdm+wjlb+MD5
        String qcm= t.getYwdm()+t.getWjlb()+FileUtil.getFileMD5(files);
        
        //将文件信息存入数据库        
        SysFileRecord obj = new SysFileRecord(t.getYwdm(),fileName,qcm,sclb,filePath,fileType,t.getWjlb());

        //如果表中存在此去重码则把这个文件删除
        JSONObject f = db.findFirst("select * from sys_file_record t where t.qcm = ?", qcm);
        if(f!=null){
            log.info(f+"文件已经存在");
            files.delete();
            return f;
        }else{
            //保存文件信息
            sqlManager.insertTemplate(obj);
            log.info(obj+"文件上传成功");
        }
        return (JSONObject) JSON.toJSON(obj);       
    }

    /**
    *  <br/>
    * @author jingma
    * @param t
    * @param page
    * @return
    */
    public PageInfo<JSONObject> queryPage(SysFileRecord t,
            PageInfo<JSONObject> page) {
        //开始
        List<Object> values = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer("select * from sys_file_record t where 1=1");
        //加条件
        addLike(sql,values,"and wjm like ?",t.getWjm());
        addEq(sql,values,"and sclb = ?",t.getSclb());
        addLike(sql,values,"and wjlx like ?",t.getWjlx());
        addLike(sql,values,"and wjlb like ?",t.getWjlb());
        addLike(sql,values,"and ywdm like ?",t.getYwdm());
        addEqDate(sql,values,t,"createdate");
        addEq(sql,values,"and isdel=?",t.getIsdel());
        //加排序
        addPxField(sql,"createdate desc",t);
        //分页查询
        page = db.queryPage(page, sql.toString(),values.toArray());
        return page;
    }

    /**
    *  <br/>
    * @author jingma
    * @param fromData
    * @return
    */
    public JsonResult txSave(String fromData) {
        JsonResult result;
        try {
            SysFileRecord obj = JSON.parseObject(fromData, SysFileRecord.class);
            if(StringUtil.isBlank(obj.getId())){
                //新增
                sqlManager.insertTemplate(obj);
            }else{
                //修改
                obj.setEtldate(db.getCurrentDateStr14());
                sqlManager.updateTemplateById(obj);
            }
            result = success("编辑成功!");
        } catch (Exception ex) {
            log.error("编辑时出错", ex);
            result = error("编辑时出错！");
        }
        return result;
    }

    /**
    *  <br/>
    * @author jingma
    * @param t
    */
    public void batchDelete(SysFileRecord t) {
        db.update("update sys_file_record t set t.isdel=?,t.etldate=? where t.id in ('"
                +t.get("ids").toString().replace(",", "','")+"')", 
                UtilConst.WHETHER_TRUE,db.getCurrentDateStr14());
    }
    
}
