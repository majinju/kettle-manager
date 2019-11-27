
package cn.benma666.common.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.benma666.constants.UtilConst;
import cn.benma666.db.Db;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglFile;
import cn.benma666.exception.MyException;
import cn.benma666.iframe.DictManager;
import cn.benma666.myutils.DateUtil;
import cn.benma666.myutils.FileUtil;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.web.BasicService;
import cn.benma666.web.QxManager;
import cn.benma666.web.SConf;
import cn.benma666.web.WebUtil;

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
        QxManager.setCjrInfo(user, fileObj);
        //文件类型
        fileObj.setWjlx(wjm.substring(wjm.lastIndexOf('.') + 1).toLowerCase());
        //去重码ywdm+wjlb+MD5
        try {
            fileObj.setQcm(fileObj.getYwdm()+fileObj.getWjlb()+FileUtil.getFileMD5(file.getInputStream()));
        } catch (Exception e) {
            log.error("生成文件去重码失败", e);
        }
        //如果表中存在此去重码则把这个文件删除
        JSONObject f = db.findFirst("select * from sys_sjgl_file t where t.yxx='1' and t.qcm = ?", fileObj.getQcm());
        if(f!=null){
            log.info(f.getString("id")+"文件已经存在");
            return f;
        }
        if(StringUtil.isBlank(fileObj.getSjzt())){
            fileObj.setSjzt(SConf.getVal("wjsc.mrsjzt"));
        }
        JSONObject sjzt = DictManager.zdObjByDmByCache(LjqInterface.ZD_SYS_COMMON_SJZT, fileObj.getSjzt());
        if("bdwj".equals(sjzt.getString("lx"))){
            //数据载体为本地文件时
            //文件上传路径:上传后文件的路径以及文件的名称
            String sclj = sjzt.getString("ljc")
                    + fileObj.getYwdm() +UtilConst.FXG
                    + fileObj.getWjlb() +UtilConst.FXG
                    +wjm.substring(0,wjm.lastIndexOf('.'))+"_"
                    + DateUtil.getGabDate() + "." + fileObj.getWjlx();
            fileObj.setSclj(sclj);
            File localFile = new File(sclj);
            FileUtil.saveFileToDisk(localFile, file);
        }else if("oracle".equals(sjzt.getString("lx"))){
            //数据载体为oracle
            Db wjdb = Db.use(sjzt.getString("dm"));
            String id = StringUtil.getUUIDUpperStr();
            try {
                wjdb.update("insert into "+fileObj.getYwdm()+"(id,"+fileObj.getWjlb()+") values (?,?)", 
                        id,file.getBytes());
                fileObj.setSclj("id='"+id+"'");
            } catch (Exception e) {
                throw new MyException("文件入数据库失败", e);
            }
        }else if("ftp".equals(sjzt.getString("lx"))){
            //数据载体为ftp
            //ftp也需要一个类似Db的工具类
        }
        //保存文件信息
        fileObj.setId(StringUtil.getUUIDUpperStr());
        fileObj.set("user", null);
        sqlManager.insertTemplate(fileObj);
        log.debug(fileObj+"文件上传成功");
        return (JSONObject) JSON.toJSON(fileObj);
    }
    public void download(HttpServletResponse response, SysSjglFile obj) {
        SysSjglFile fileObj = sqlManager.single(SysSjglFile.class, obj.getId());
        if(fileObj!=null){
            fileObj.setXzms(obj.isXzms());
            JSONObject sjzt = DictManager.zdObjByDmByCache(LjqInterface.ZD_SYS_COMMON_SJZT, fileObj.getSjzt());
            if("bdwj".equals(sjzt.getString("lx"))){
                //数据载体为本地文件时
                File file = new File(fileObj.getSclj());
                WebUtil.sendFile(response, file, fileObj);
            }else if("oracle".equals(sjzt.getString("lx"))){
                //数据载体为oracle
                Db wjdb = Db.use(sjzt.getString("dm"));
                String where = obj.getSclj();
                if(StringUtil.isBlank(where)){
                    where = fileObj.getSclj();
                }
                JSONObject wj = wjdb.findFirst("select "+fileObj.getWjlb()+" wj from "
                        +fileObj.getYwdm()+" t where "+where);
                if(wj!=null){
                    WebUtil.sendBytes(response, wj.getBytes("wj"), fileObj);
                }else{
                    log.debug("下载的文件不存在："+obj);
                    WebUtil.sendJson(response,error("下载的文件不存在",obj));
                }
            }else if("ftp".equals(sjzt.getString("lx"))){
                //数据载体为ftp

            }else if("qtzt".equals(sjzt.getString("lx"))){
                //数据载体为其他载体
                if("wywztb".equals(sjzt.getString("dm"))){
                    //网页文字图标
                    WebUtil.sendDirectToClient(response, fileObj.getSclj(),
                            WebUtil.CONTENTTYPE_TEXTHTML, WebUtil.CONTENT_CHARSET_UTF8);
                }
            }
        }else{
            log.debug("下载的文件不存在："+obj);
            WebUtil.sendJson(response,error("下载的文件不存在",obj));
        }
    }
}
