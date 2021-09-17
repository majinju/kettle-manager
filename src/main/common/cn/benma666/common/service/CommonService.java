
package cn.benma666.common.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cn.benma666.constants.UtilConst;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglFile;
import cn.benma666.exception.MyException;
import cn.benma666.iframe.Conf;
import cn.benma666.iframe.DictManager;
import cn.benma666.iframe.Result;
import cn.benma666.myutils.DateUtil;
import cn.benma666.myutils.FileUtil;
import cn.benma666.myutils.StringUtil;
import cn.benma666.myutils.WebUtil;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.sjzt.Db;
import cn.benma666.web.BasicService;
import cn.benma666.web.QxManager;

import com.alibaba.druid.DbType;
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
    private static Log log = LogFactory.getLog(CommonService.class);

    /**
    * 上传文件
    * @author jingma
    * @param fileObj
    * @param file
    * @param user
    * @return
    */
    public static Result upload(SysSjglFile fileObj,File file, SysQxYhxx user){
        FileInputStream fi = null;
        try {
            //文件名称
            String wjm = file.getName();
            fileObj.setWjm(wjm);
            return success("上传成功", upload(fileObj, FileUtils.readFileToByteArray(file), user));
        } catch (Exception e) {
            log.error("处理文件失败", e);
            return failed("文件上传失败："+e.getMessage());
        }finally{
            FileUtil.closeInputStream(fi);
        }
        
    }
    /**
     * 上传文件
     * @param fileObj
     * @param file
     * @param user 
     * @return
     * @throws IOException
     */
    public static Result upload(SysSjglFile fileObj,MultipartFile file, SysQxYhxx user){
        try {
            //文件名称
            String wjm = file.getOriginalFilename();
            fileObj.setWjm(wjm);
            return success("上传成功", upload(fileObj, file.getBytes(), user));
        } catch (Exception e) {
            log.error("处理文件失败", e);
            return failed("文件上传失败："+e.getMessage());
        }
    }
    public static JSONObject upload(SysSjglFile fileObj,byte[] bFile, SysQxYhxx user) throws Exception{
        String wjm = fileObj.getWjm();
        //文件类型
        fileObj.setWjlx(wjm .substring(wjm.lastIndexOf('.') + 1).toLowerCase());
        fileObj.setWjdx(BigDecimal.valueOf(bFile.length));
        //去重码ywdm+wjlb+MD5
        fileObj.setQcm(fileObj.getYwdm()+fileObj.getWjlb()+FileUtil.getFileMD5(bFile));
        QxManager.setCjrInfo(user, fileObj);
        //如果表中存在此去重码则把这个文件删除
        JSONObject f = db().findFirst("select * from sys_sjgl_file t where t.yxx='1' and t.qcm = ?", fileObj.getQcm());
        if(f!=null){
            log.info(f.getString("id")+"文件已经存在");
            return f;
        }
        if(StringUtil.isBlank(fileObj.getSjzt())){
            fileObj.setSjzt(Conf.getVal("wjsc.mrsjzt"));
        }
        JSONObject sjzt = DictManager.zdObjByDmByCache(LjqInterface.ZD_SYS_COMMON_SJZT, fileObj.getSjzt());
        if(DbType.of(sjzt.getString("lx"))!=null){
            //数据载体为oracle
            Db wjdb = Db.use(sjzt.getString("dm"));
            String id = StringUtil.getUUIDUpperStr();
            try {
                wjdb.update("insert into sys_sjgl_blob(id,nr) values (?,?)", id,bFile);
                fileObj.setSclj("select nr wj from sys_sjgl_blob where id='"+id+"'");
            } catch (Exception e) {
                throw new MyException("文件入数据库失败", e);
            }
        }
        switch (sjzt.getString("lx")) {
        case "bdwj":
            //数据载体为本地文件时
            //文件上传路径:上传后文件的路径以及文件的名称
            String currDate = DateUtil.getGabDate();
            //按日期分文件夹
            String sclj = sjzt.getString("ljc");
            if(!UtilConst.WHETHER_FALSE.equals(fileObj.get("arqfwjj"))){
                //指定设置要求不按日期分文件夹
                sclj += currDate.substring(0,8) +UtilConst.FXG;
            }
            sclj += fileObj.getYwdm() +UtilConst.FXG
                    + fileObj.getWjlb() +UtilConst.FXG
                    +wjm.substring(0,wjm.lastIndexOf('.'));
            if(!UtilConst.WHETHER_FALSE.equals(fileObj.get("arqfwjj"))){
                //指定设置要求不按日期分文件夹
                sclj += "_"+ currDate.substring(8);
            }else{
                sclj += "_"+ currDate;
            }
            sclj += "." + fileObj.getWjlx();
            fileObj.setSclj(sclj);
            File localFile = new File(sclj);
            if(!localFile.getParentFile().exists()){
                localFile.getParentFile().mkdirs();
            }
            FileOutputStream out = new FileOutputStream(localFile);
            out.write(bFile);
            out.close();
            break;
        case "ftp":
            //数据载体为ftp
            //ftp也需要一个类似Db的工具类
            throw new MyException("暂不支持的数据载体类型："+sjzt.getString("lx"));

        default:
            throw new MyException("暂不支持的数据载体类型："+sjzt.getString("lx"));
        }
        //保存文件信息
        fileObj.setId(StringUtil.getUUIDUpperStr());
        fileObj.set("user", null);
        sqlManager().insertTemplate(fileObj);
        log.debug(fileObj+"文件上传成功");
        return (JSONObject) JSON.toJSON(fileObj);
    }
    public void download(HttpServletResponse response, SysSjglFile obj) {
        SysSjglFile fileObj = sqlManager().single(SysSjglFile.class, obj.getId());
        if(fileObj!=null){
            fileObj.setXzms(obj.isXzms());
            JSONObject sjzt = DictManager.zdObjByDmByCache(LjqInterface.ZD_SYS_COMMON_SJZT, fileObj.getSjzt());
            if(DbType.of(sjzt.getString("lx"))!=null){
                //数据载体为oracle
                Db wjdb = Db.use(sjzt.getString("dm"));
                String sclj = obj.getSclj();
                if(StringUtil.isBlank(sclj)){
                    sclj = fileObj.getSclj();
                }
                JSONObject wj = wjdb.findFirst(sclj);
                if(wj!=null){
                    WebUtil.sendBytes(response, wj.getBytes("wj"), fileObj);
                }else{
                    log.debug("下载的文件不存在："+sclj);
                    WebUtil.sendJson(response,failed("下载的文件不存在",sclj));
                }
            }
            switch (sjzt.getString("lx")) {
            case "bdwj":
                //数据载体为本地文件时
                File file = new File(fileObj.getSclj());
                WebUtil.sendFile(response, file, fileObj);
                break;
            case "ftp":
                //数据载体为ftp
                //ftp也需要一个类似Db的工具类
                throw new MyException("暂不支持的数据载体类型："+sjzt.getString("lx"));
            case "qtzt":
                //数据载体为其他载体
                if("wywztb".equals(sjzt.getString("dm"))){
                    //网页文字图标
                    WebUtil.sendDirectToClient(response, fileObj.getSclj(),
                            WebUtil.CONTENTTYPE_TEXTHTML, WebUtil.CONTENT_CHARSET_UTF8);
                }
                break;

            default:
                throw new MyException("暂不支持的数据载体类型："+sjzt.getString("lx"));
            }
        }else{
            log.debug("下载的文件不存在："+obj.getId());
            WebUtil.sendJson(response,failed("下载的文件不存在",obj.getId()));
        }
    }
}
