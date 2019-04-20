/**
* Project Name:hl_2018
* Date:2018年5月24日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.service;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.benma666.constants.UtilConst;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglFile;
import cn.benma666.myutils.DateUtil;
import cn.benma666.myutils.FileUtil;
import cn.benma666.web.BasicService;
import cn.benma666.web.QxManager;
import cn.benma666.web.SConf;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * 通用 <br/>
 * date: 2018年5月24日 <br/>
 * @author jingma
 * @version 
 */
@Service()
public class CommonService extends BasicService{
    
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
     * @param fileObj
     * @param file
     * @param user 
     * @return
     * @throws IOException
     */
    public JSONObject upload(SysSjglFile fileObj,MultipartFile file, SysQxYhxx user){
        //文件名称
        String wjm = file.getOriginalFilename();
        fileObj.setWjm(wjm);
        //文件类型
        fileObj.setWjlx(wjm.substring(wjm.lastIndexOf('.') + 1).toLowerCase());
        //文件上传路径
        //上传后文件的路径以及文件的名称
        String sclj = SConf.getVal(SYS_SCLJ) 
                + fileObj.getYwdm() +UtilConst.FXG
                + fileObj.getWjlb() +UtilConst.FXG
                +wjm.substring(0,wjm.lastIndexOf('.'))+"_"
                + DateUtil.getGabDate() + "." + fileObj.getWjlx();
        fileObj.setSclj(sclj);
        File files = new File(sclj);
        FileUtil.saveFileToDisk(files, file);
        //去重码ywdm+wjlb+MD5
        fileObj.setQcm(fileObj.getYwdm()+fileObj.getWjlb()+FileUtil.getFileMD5(files));

        fileObj.setSclb(SConf.getVal(SYS_SCLB));
        QxManager.setCjrInfo(user, fileObj);
        //如果表中存在此去重码则把这个文件删除
        JSONObject f = db.findFirst("select * from sys_sjgl_file t where t.yxx='1' and t.qcm = ?", fileObj.getQcm());
        if(f!=null){
            log.info(f+"文件已经存在");
            files.delete();
            return f;
        }else{
            //保存文件信息
            fileObj.setId(null);
            sqlManager.insertTemplate(fileObj);
            log.info(fileObj+"文件上传成功");
        }
        return (JSONObject) JSON.toJSON(fileObj);
    }
    
}
