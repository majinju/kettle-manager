/**
 * Project Name:sjgl
 * Date:2018年12月16日
 * Copyright (c) 2018, jingma All Rights Reserved.
 */

package cn.benma666.sjsj.ljq.sjgl;

import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.CacheFactory;
import cn.benma666.iframe.PageInfo;
import cn.benma666.iframe.Result;
import cn.benma666.sjsj.web.DefaultLjq;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 缓存拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 0.2
 */
public class CacheLjq extends DefaultLjq {

    @Override
    public PageInfo page(SysSjglSjdx sjdx, JSONObject myParams) {
        PageInfo<JSONObject> page = new PageInfo<>();
        List<JSONObject> list = new ArrayList<>();
        page.setList(list);
        Map<String, JSONObject> cache = CacheFactory.getCacheMap();
        for (String key:cache.keySet()){
            JSONObject obj = new JSONObject();
            obj.put("key",key);
            obj.put("size",cache.get(key).size());
            list.add(obj);
        }
        return page;
    }

    @Override
    public Result data(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = JSONPath.eval(myParams, $_SYS_CLLX).toString();
        switch (cllx) {
            case "qchc":
                Object ids = JSONPath.eval(myParams, $_SYS_IDS);
                if(ids==null){
                    return failed("请选择要清除的缓存");
                }
                ((JSONArray)ids).stream().forEach(key->{
                    CacheFactory.clear(key.toString());
                });
                return success("清除缓存成功");
            default:
                //执行默认操作
                return super.data(sjdx, myParams);
        }
    }
}
