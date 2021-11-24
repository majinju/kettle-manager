/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.sjsj.ljq.sjgl;

import cn.benma666.iframe.Result;
import cn.benma666.sjsj.web.DefaultLjq;
import cn.benma666.sjzt.Db;
import com.alibaba.fastjson.JSONObject;

/**
 * SQL执行拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 0.1
 */
public class SqlzxLjq extends DefaultLjq {
    @Override
    public Result insert(JSONObject myParams) {
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        String zxsql = yobj.getString("zxsql");
        Db db = Db.use(yobj.getString("sjzt"));
        try {
            long start = System.currentTimeMillis();
            Result r = null;
            if(zxsql.toLowerCase().trim().startsWith("select")){
                r = success("查询成功",db.find(zxsql));
            }else{
                r = success("执行成功",db.update(zxsql));
            }
            r.addMsg("耗时："+(System.currentTimeMillis()-start)+"毫秒");
            return r;
        } catch (Exception e) {
            log.debug("sql执行失败",e);
            return failed("执行失败："+e.getMessage());
        }
    }
}
