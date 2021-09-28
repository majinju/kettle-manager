/**
* Project Name:myservice
* Date:2019年9月19日
* Copyright (c) 2019, jingma All Rights Reserved.
*/

package cn.benma666.sjsj.ljq.sjgl;

import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.DictManager;
import cn.benma666.iframe.Result;

import cn.benma666.sjsj.web.DefaultLjq;
import cn.benma666.sjsj.web.LjqManager;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;

/**
 * 生成监控任务-拦截器 <br/>
 * @author jingma
 * @version 
 */
public class ScjkrwLjq extends DefaultLjq {
@Override
public Result data(SysSjglSjdx sjdx, JSONObject myParams) {
    String cllx = getCllx(myParams);
    switch (cllx) {
    case "scjkrw":
        JSONObject jkpz = new JSONObject();
        JSONObject pz = DictManager.zdObjByDmByCache("SYS_YXJK_SCRWPZ", sjdx.getDxdm());
        if(pz!=null){
            jkpz = JSON.parseObject(pz.getString("kzxx"));
        }
        //监控任务对象,及参数对象构建
        JSONObject jkrw = (JSONObject) myParams.clone();
        JSONObject p = LjqManager.jcxxByDxdm("SYS_YXJK_JKRW");
        SysSjglSjdx jkrwdx = (SysSjglSjdx) p.get(KEY_SJDX);
        jkrw.putAll(p);
        
        //已存在任务
        int yczrw = 0;
        //生成的任务
        int scrw = 0;
        JSONArray list = ((JSONObject)getData(sjdx, myParams).getData()).getJSONArray("list");
        for(JSONObject rw:list.toArray(new JSONObject[]{})){
            JSONObject oldrw = db().findFirst("select * from sys_yxjk_jkrw t where t.jtrw=? and t.rwlx=?", 
                    rw.getString("jtrw"),rw.getString("rwlx"));
            if(oldrw==null){
                if(jkpz!=null){
                    rw.putAll(jkpz);
                }
                jkrw.put(KEY_YOBJ, rw);
                Result r = LjqManager.insert(jkrwdx, jkrw);
                if(!r.isStatus()){
                    return r;
                }
                scrw++;
            }else{
                yczrw++;
            }
        }
        return success("已经存在监控任务数："+yczrw+",新生成监控任务数："+scrw);
    default:
        //执行默认操作
        return super.plcl(sjdx, myParams);
    }
}
}
