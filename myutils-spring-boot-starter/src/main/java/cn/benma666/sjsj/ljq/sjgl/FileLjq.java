/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.sjsj.ljq.sjgl;

import cn.benma666.iframe.DictManager;
import cn.benma666.iframe.PageInfo;
import cn.benma666.iframe.Result;
import cn.benma666.sjsj.web.DefaultLjq;
import cn.benma666.sjsj.web.LjqInterface;
import cn.benma666.sjzt.Db;
import com.alibaba.druid.DbType;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.io.File;
import java.util.List;

/**
 * 文件管理拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 0.1
 */
public class FileLjq extends DefaultLjq {
    public Result upload(JSONObject myParams){
        JSONArray files = myParams.getJSONArray("$.sys.files");
        return success("成功上传"+files.size()+"个文件");
    }
    protected Result wlscByYxx(JSONObject myParams) {
        myParams.set("$.page.totalRequired",false);
        //删除物理删除记录的对应的文件
        List<JSONObject> list = ((PageInfo<JSONObject>)select(myParams).getData()).getList();
        int count = 0;
        for(JSONObject fileObj:list){
            if(fileObj.getBoolean("yxx")){
                //有效的过滤掉，只对已经逻辑删除过的文件进行物理删除
                continue;
            }
            JSONObject sjzt = DictManager.zdObjByDm(LjqInterface.ZD_SYS_COMMON_SJZT, fileObj.getString("sjzt"));
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
        Result result = super.wlscByYxx(myParams);
        result.addMsg("删除原始文件数："+count);
        return result;
    }
}
