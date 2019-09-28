/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import cn.benma666.db.Db;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.myutils.JsonResult;
import cn.benma666.sjgl.DefaultLjq;

import com.alibaba.fastjson.JSONObject;

/**
 * SQL执行拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class SqlzxLjq extends DefaultLjq{
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#save(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult save(SysSjglSjdx sjdx, JSONObject myParams) {
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        String zxsql = yobj.getString("zxsql");
        Db db = Db.use(yobj.getString("sjzt"));
        try {
            if(zxsql.toLowerCase().trim().startsWith("select")){
                return success("查询成功",db.find(zxsql));
            }else{
                return success("执行成功",db.update(zxsql));
            }
        } catch (Exception e) {
            log.debug("sql执行失败",e);
            return error("执行失败："+e.getMessage());
        }
    }
}
