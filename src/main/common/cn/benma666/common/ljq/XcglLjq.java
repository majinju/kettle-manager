/**
 * Project Name:myservice
 * Date:2019年9月19日
 * Copyright (c) 2019, jingma All Rights Reserved.
 */

package cn.benma666.common.ljq;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.PageInfo;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;

import com.alibaba.fastjson.JSONObject;

/**
 * 线程管理拦截器 <br/>
 * date: 2019年9月19日 <br/>
 * 
 * @author jingma
 * @version
 */
public class XcglLjq extends DefaultLjq {
    /**
     * 
     * @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.domain.SysSjglSjdx,
     *      com.alibaba.fastjson.JSONObject)
     */
    @SuppressWarnings("deprecation")
    @Override
    public JsonResult plcl(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = myParams.getString(KEY_CLLX);
        String[] idArr = (String[]) myParams.get(KEY_IDS_ARRAY);
        Set<String> idSet = new HashSet<String>(Arrays.asList(idArr));
        Map<Thread, StackTraceElement[]> maps = Thread.getAllStackTraces();
        switch (cllx) {
        case "zdxc":
            for(Entry<Thread, StackTraceElement[]> t:maps.entrySet()){
                Thread th = t.getKey();
                if(idSet.contains(th.getId()+"")){
                    th.interrupt();
                }
            }
            return success("中断线程数："+idSet.size());
        case "jsxc":
            int jsyc = 0;
            for(Entry<Thread, StackTraceElement[]> t:maps.entrySet()){
                Thread th = t.getKey();
                if(idSet.contains(th.getId()+"")){
                    try {
                        th.stop();
                    } catch (Exception e) {
                        log.error("结束线程异常："+th.getName(), e);
                        jsyc++;
                    }
                }
            }
            String msg = "结束线程数："+idSet.size();
            if(jsyc>0){
                msg+="，其中结束异常数："+jsyc;
            }
            return success(msg);
        default:
            // 执行默认操作
            return error("未知操作："+cllx);
        }
    }
    
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#page(cn.benma666.domain.SysSjglSjdx, cn.benma666.myutils.PageInfo, java.lang.String, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult page(SysSjglSjdx sjdx, PageInfo<JSONObject> page,
            String defaultSql, JSONObject params) {
        Map<Thread, StackTraceElement[]> maps = Thread.getAllStackTraces();
        List<JSONObject> list = new ArrayList<JSONObject>();
        JSONObject yobj = params.getJSONObject(KEY_YOBJ);
        String sName = yobj.getString("name");
        int id = yobj.getIntValue("id");
        for(Entry<Thread, StackTraceElement[]> t:maps.entrySet()){
            Thread th = t.getKey();
            //支持根据线程名称搜索
            if(StringUtil.isNotBlank(sName)&&!(th.getName().indexOf(sName)>-1)){
                continue;
            }
            if(id!=0&&(th.getId()!=id)){
                continue;
            }
            JSONObject r = new JSONObject();
            r.put("id", th.getId());
            r.put("name", th.getName());
            r.put("alive", th.isAlive()+"");
            r.put("daemon", th.isDaemon()+"");
            r.put("interrupted", th.isInterrupted()+"");
            list.add(r);
        }
        page.setList(list);
        page.setTotalRow(list.size());
        return success("获取线程情况成功",page);
    }
}
