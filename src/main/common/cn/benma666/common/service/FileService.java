package cn.benma666.common.service;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.benma666.common.domain.TSysFileRecord;
import cn.benma666.constants.UtilConst;
import cn.benma666.iframe.BasicObject;
import cn.benma666.myutils.DateUtil;
import cn.benma666.myutils.FileUtil;
import cn.benma666.web.AConfig;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * 文件相关服务
 */
@Service
public class FileService extends BasicObject{
    
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
     * 上传类别_FASTDFS
     */
    public static final String SCLB_FASTDFS = "FASTDFS";
    
    /**
     * 不删除（有效数据标识）
     */
    public static final String ISDEL_NO= "0";
    /**
     * 删除（无效数据标识）
     */
    public static final String ISDEL_YES= "1";
    
    /**
     * 上传文件
     * @param t
     * @param file
     * @return
     * @throws IOException
     */
    public JSONObject uploadFiles(TSysFileRecord t,MultipartFile file){
        //文件名称
        String fileName = file.getOriginalFilename();
        //文件类型
        String fileType = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();
        //文件上传路径
        String sclb = AConfig.getVal(SYS_SCLB);
        //上传后文件的路径以及文件的名称
        String filePath = AConfig.getVal(SYS_SCLJ) + t.getYwdm() +UtilConst.FXG
                +fileName.substring(0,fileName.lastIndexOf('.'))+"_"
                + DateUtil.getDateTimeStr(DateUtil.DATE_FORMATTER14) 
                + "." + fileType;
        File files = new File(filePath);
        FileUtil.saveFileToDisk(files, file);
        //去重码ywdm+wjlb+MD5
        String qcm= t.getYwdm()+t.getWjlb()+FileUtil.getFileMD5(files);
        
        //将文件信息存入数据库        
        TSysFileRecord obj = new TSysFileRecord(t.getYwdm(),fileName,qcm,sclb,filePath,fileType,t.getWjlb());

        //如果表中存在此去重码则把这个文件删除
        JSONObject f = db.findFirst("select * from T_SYS_FILE_RECORD t where t.QCM = ?", qcm);
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
    
}
