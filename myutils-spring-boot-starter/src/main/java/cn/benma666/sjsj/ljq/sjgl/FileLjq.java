/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.sjsj.ljq.sjgl;

import java.io.File;
import java.util.List;

import cn.benma666.constants.UtilConst;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.DictManager;

import cn.benma666.iframe.PageInfo;
import cn.benma666.iframe.Result;
import cn.benma666.sjsj.web.DefaultLjq;
import cn.benma666.sjsj.web.LjqInterface;
import cn.benma666.sjzt.Db;
import com.alibaba.druid.DbType;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;

/**
 * 文件管理拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 0.1
 */
public class FileLjq extends DefaultLjq {

    @Override
    public Result plsc(SysSjglSjdx sjdx, JSONObject params) {
        //删除物理删除记录的对应的文件
        JSONPath.set(params,"$.yobj.yxx", UtilConst.WHETHER_FALSE);
        List<JSONObject> list = ((PageInfo<JSONObject>)select(sjdx,params).getData()).getList();
        int count = 0;
        String msg;
        for(JSONObject fileObj:list){
            JSONObject sjzt = DictManager.zdObjByDmByCache(LjqInterface.ZD_SYS_COMMON_SJZT, fileObj.getString("sjzt"));
            if (DbType.of(sjzt.getString("lx")) != null) {
                //数据载体为数据库
                String sclj = fileObj.getString("sclj");
                if(sclj.startsWith("select nr wj from")){
                    Db wjdb = Db.use(sjzt.getString("dm"));
                    //删除原始文件
                    count+=wjdb.update(sclj.replace("select nr wj", "delete"));
                }
            }else{
                switch (sjzt.getString("lx")) {
                    case "bdwj":
                        //数据载体为本地文件时
                        File file = new File(fileObj.getString("sclj"));
                        if(file.exists()){
                            file.delete();
                            count++;
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
        }
        msg = "删除原始文件数："+count;
        Result result = super.plcl(sjdx, params);
        result.addMsg(msg);
        return result;
    }
}
