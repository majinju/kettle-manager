/**
 * Project Name:myservice
 * Date:2019年9月19日
 * Copyright (c) 2019, jingma All Rights Reserved.
 */

package cn.benma666.sjsj.ljq.sjgl;

import cn.benma666.iframe.PageInfo;
import cn.benma666.iframe.Result;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjsj.web.DefaultLjq;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/**
 * 线程管理拦截器 <br/>
 * date: 2019年9月19日 <br/>
 * @author jingma
 * @version 0.1
 */
public class XcglLjq extends DefaultLjq {
    /**
     * 中断线程
     */
    public Result jsxc(JSONObject myParams) {
        JSONArray idSet = myParams.getJSONArray($_SYS_IDS);
        Map<Thread, StackTraceElement[]> maps = Thread.getAllStackTraces();
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
    }

    /**
     * 中断线程
     */
    public Result zdxc(JSONObject myParams) {
        JSONArray idSet = myParams.getJSONArray($_SYS_IDS);
        Map<Thread, StackTraceElement[]> maps = Thread.getAllStackTraces();
        for(Entry<Thread, StackTraceElement[]> t:maps.entrySet()){
            Thread th = t.getKey();
            if(idSet.contains(th.getId()+"")){
                th.interrupt();
            }
        }
        return success("中断线程数："+idSet.size());

    }
    @Override
    public Result select(JSONObject myParams) {
        //获取分页对象
        PageInfo<JSONObject> page = myParams.getObject(KEY_PAGE,PageInfo.class);
        if (StringUtil.isBlank(page.getOrderBy())) {
            //请求没有设置排序时，采用默认排序
            page.setOrderBy(sjdx.getMrpx());
        }
        Map<Thread, StackTraceElement[]> maps = Thread.getAllStackTraces();
        List<JSONObject> list = new ArrayList<>();
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        String sName = yobj.getString("name");
        int id = yobj.getIntValue("id");
        for(Entry<Thread, StackTraceElement[]> t:maps.entrySet()){
            Thread th = t.getKey();
            //支持根据线程名称搜索
            if(StringUtil.isNotBlank(sName)&&!(th.getName().contains(sName))){
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
