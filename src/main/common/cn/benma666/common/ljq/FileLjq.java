/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import java.io.File;
import java.util.List;

import cn.benma666.db.Db;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.DictManager;
import cn.benma666.myutils.JsonResult;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.LjqInterface;

import com.alibaba.druid.util.JdbcUtils;
import com.alibaba.fastjson.JSONObject;

/**
 * 文件管理拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class FileLjq extends DefaultLjq{
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult plcl(SysSjglSjdx sjdx, JSONObject params) {
        String cllx = params.getString(KEY_CLLX);
        String msg = null;
        switch (cllx) {
        case KEY_CLLX_PLSC:
            //删除物理删除记录的对应的文件
            List<JSONObject> list = db.find("select * from sys_sjgl_file t where yxx='0' and t.id "
                    +params.getString("idsIn"));
            int count = 0;
            for(JSONObject fileObj:list){
                JSONObject sjzt = DictManager.zdObjByDmByCache(LjqInterface.ZD_SYS_COMMON_SJZT, fileObj.getString("sjzt"));
                switch (sjzt.getString("lx")) {
                case "bdwj":
                    //数据载体为本地文件时
                    File file = new File(fileObj.getString("sclj"));
                    if(file.exists()){
                        file.delete();
                        count++;
                    }
                    break;
                case JdbcUtils.ORACLE:
                case JdbcUtils.MYSQL:
                case JdbcUtils.POSTGRESQL:
                case LjqInterface.ZD_SJZTLX_GREENPLUM:
                case LjqInterface.ZD_SJZTLX_HWMPP:
                    //数据载体为数据库
                    String sclj = fileObj.getString("sclj");
                    if(sclj.startsWith("select nr wj from")){
                        Db wjdb = Db.use(sjzt.getString("dm"));
                        //删除原始文件
                        wjdb.update(sclj.replace("select nr wj", "delete"));
                    }
                    break;
                case "ftp":
                    //数据载体为ftp
                    //ftp也需要一个类似Db的工具类
                case "qtzt":
                    //数据载体为其他载体

                default:
                }
            }
            msg = "删除文件数："+count;
            break;
        default:
            break;
        }
        JsonResult result = super.plcl(sjdx, params);
        result.addMsg(msg);
        return result;
    }
}
