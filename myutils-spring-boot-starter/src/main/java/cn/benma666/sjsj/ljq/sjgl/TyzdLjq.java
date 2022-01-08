/**
 * Project Name:sjgl
 * Date:2018年12月16日
 * Copyright (c) 2018, jingma All Rights Reserved.
 */

package cn.benma666.sjsj.ljq.sjgl;

import cn.benma666.exception.MyException;
import cn.benma666.iframe.DictManager;
import cn.benma666.iframe.Result;
import cn.benma666.sjsj.web.DefaultLjq;
import com.alibaba.fastjson.JSONObject;

/**
 * 统一字典拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 0.1
 */
public class TyzdLjq extends DefaultLjq {
    @Override
    public Result insert(JSONObject myParams) {
        Result r = super.insert(myParams);
        DictManager.clearDict(myParams.getString("$.yobj.zdlb"));
        return r;
    }

    @Override
    public Result update(JSONObject myParams) throws MyException {
        Result r = super.update(myParams);
        DictManager.clearDict(myParams.getString("$.obj.zdlb"));
        return r;
    }

    /**
     * 清清除字典缓存
     * @return 处理结果
     */
    public Result qchc(JSONObject myParams) {
        DictManager.clearDict();
        return success("清除缓存成功");
    }
    /**
     * 获取字典列表
     */
    public Result zdList(JSONObject myParams) {
        if(myParams.getBoolean("$.sys.dataCache")){
            //使用缓存
            return success(msgCzcg(),DictManager.zdMap(myParams));
        }else{
            //不使用缓存
            return success(msgCzcg(),DictManager.zdMapNoCache(myParams));
        }
    }
    /**
     * 获取字典树
     */
    public Result zdTree(JSONObject myParams) {
        if(myParams.getBoolean("$.sys.dataCache")){
            //使用缓存
            return success(msgCzcg(),DictManager.zdTree(myParams));
        }else{
            //不使用缓存
            return success(msgCzcg(),DictManager.zdTreeNoCache(myParams));
        }
    }
    /**
     * 获取字典项对象
     */
    public Result zdObj(JSONObject myParams) {
        if(myParams.getBoolean("$.sys.dataCache")){
            //使用缓存
            return success(msgCzcg(),DictManager.zdObj(myParams));
        }else{
            //不使用缓存
            return success(msgCzcg(),DictManager.zdObjNoCache(myParams));
        }
    }
    /**
     * 字典搜索
     */
    public Result zdSearch(JSONObject myParams) {
        return success(msgCzcg(),DictManager.zdSearch(myParams));
    }
}
