/**
* Project Name:myservice
* Date:2019年9月19日
* Copyright (c) 2019, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.myutils.JsonResult;
import cn.benma666.sjgl.DefaultLjq;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 自定义sql拦截器 <br/>
 * date: 2019年9月19日 <br/>
 * @author jingma
 * @version 
 */
public class ZdysqlLjq extends DefaultLjq {
/**
* 
* @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
*/
@Override
public JsonResult plcl(SysSjglSjdx sjdx, JSONObject myParams) {
    String cllx = myParams.getString(KEY_CLLX);
    JSONObject kzxx = myParams.getJSONObject(FIELD_KZXX);
    JSONObject jkpz = kzxx.getJSONObject("运行监控任务默认配置");
    switch (cllx) {
    case "scjkrw":
        //监控任务对象,及参数对象构建
        JSONObject jkrw = (JSONObject) myParams.clone();
        JSONObject p = (JSONObject) getJcxxByDxdm("SYS_YXJK_JKRW").getData();
        SysSjglSjdx jkrwdx = (SysSjglSjdx) p.get(KEY_SJDX);
        jkrw.putAll(p);
        
        //已存在任务
        int yczrw = 0;
        //生成的任务
        int scrw = 0;
        JSONArray list = ((JSONObject)getdata(sjdx, myParams).getData()).getJSONArray("list");
        for(JSONObject job:list.toArray(new JSONObject[]{})){
            String jtrw = job.getString("jtrw");
            JSONObject oldrw = db.findFirst("select * from sys_yxjk_jkrw t where t.jtrw=? and t.rwlx='5'", jtrw);
            if(oldrw==null){
                job.put("jtrw", jtrw);
                job.put("rwlb", "99");
                job.put("rwlx", "5");
                job.put("rwdj", "1");
                if(jkpz!=null){
                    job.putAll(jkpz);
                }
                jkrw.put(KEY_YOBJ, job);
                jkrw.put(KEY_CLLX, KEY_CLLX_INSERT);
                save(jkrwdx, jkrw);
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
