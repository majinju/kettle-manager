/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import java.io.File;
import java.util.List;

import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.myutils.JsonResult;
import cn.benma666.sjgl.DefaultLjq;

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
                File file = new File(fileObj.getString("sclj"));
                if(file.exists()){
                    file.delete();
                    count++;
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
