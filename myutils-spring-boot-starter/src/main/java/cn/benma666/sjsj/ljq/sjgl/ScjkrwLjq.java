/**
* Project Name:myservice
* Date:2019年9月19日
* Copyright (c) 2019, jingma All Rights Reserved.
*/

package cn.benma666.sjsj.ljq.sjgl;

import cn.benma666.domain.SysQxYhxx;
import cn.benma666.iframe.DictManager;
import cn.benma666.iframe.Result;
import cn.benma666.sjsj.web.DefaultLjq;
import cn.benma666.sjsj.web.LjqManager;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 生成监控任务-拦截器 <br/>
 * @author jingma
 * @version 0.1
 */
public class ScjkrwLjq extends DefaultLjq {
    /**
     * 生成监控任务
     * @return 生成结果
     */
    public Result scjkrw(JSONObject myParams) {
        JSONObject jkpz = new JSONObject();
        JSONObject pz = DictManager.zdObjByDm("SYS_YXJK_SCRWPZ", sjdx.getDxdm());
        if(pz!=null){
            jkpz = JSON.parseObject(pz.getString("kzxx"));
        }
        //监控任务对象,及参数对象构建
        JSONObject jkrw = LjqManager.jcxxByDxdm("SYS_YXJK_JKRW",myParams.getObject(KEY_USER, SysQxYhxx.class));

        //已存在任务
        int yczrw = 0;
        //生成的任务
        int scrw = 0;
        JSONArray list = ((JSONObject) getdata(myParams).getData()).getJSONArray("list");
        for(JSONObject rw:list.toArray(new JSONObject[]{})){
            JSONObject oldrw = db().findFirst("select * from sys_yxjk_jkrw t where t.jtrw=? and t.rwlx=?",
                    rw.getString("jtrw"),rw.getString("rwlx"));
            if(oldrw==null){
                if(jkpz!=null){
                    rw.putAll(jkpz);
                }
                jkrw.put(KEY_YOBJ, rw);
                Result r = LjqManager.insert(jkrw);
                if(!r.isStatus()){
                    return r;
                }
                scrw++;
            }else{
                yczrw++;
            }
        }
        return success("已经存在监控任务数："+yczrw+",新生成监控任务数："+scrw);
    }
}
