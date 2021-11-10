/**
 * Project Name:sjgl
 * Date:2018年12月16日
 * Copyright (c) 2018, jingma All Rights Reserved.
 */

package cn.benma666.sjsj.ljq.sjgl;

import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.domain.SysSjglTyzd;
import cn.benma666.exception.MyException;
import cn.benma666.iframe.DictManager;
import cn.benma666.iframe.PageInfo;
import cn.benma666.iframe.Result;
import cn.benma666.sjsj.web.DefaultLjq;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;
import com.alibaba.fastjson.util.TypeUtils;

/**
 * 统一字典拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 0.1
 */
public class TyzdLjq extends DefaultLjq {
    @Override
    public Result insert(SysSjglSjdx sjdx, JSONObject myParams) {
        Result r = super.insert(sjdx, myParams);
        DictManager.clearDict(myParams.getString("$.yobj.zdlb"));
        return r;
    }

    @Override
    public Result update(SysSjglSjdx sjdx, JSONObject myParams) throws MyException {
        Result r = super.update(sjdx, myParams);
        DictManager.clearDict(myParams.getString("$.obj.zdlb"));
        return r;
    }

    /**
     * 清清除字典缓存
     * @return 处理结果
     */
    public Result qchc(SysSjglSjdx sjdx, JSONObject myParams) {
        DictManager.clearDict();
        return success("清除缓存成功");
    }
    /**
     * 获取字典列表
     */
    public Result zdList(SysSjglSjdx sjdx, JSONObject myParams) {
        if(myParams.getBoolean("$.sys.dataCache")){
            //使用缓存
            return success(msgCzcg(),DictManager.zdMapByCache(myParams.getObject(KEY_YOBJ, SysSjglTyzd.class)));
        }else{
            //不使用缓存
            return success(msgCzcg(),DictManager.zdMap(myParams.getObject(KEY_YOBJ, SysSjglTyzd.class)));
        }
    }
    /**
     * 获取字典树
     */
    public Result zdTree(SysSjglSjdx sjdx, JSONObject myParams) {
        if(myParams.getBoolean("$.sys.dataCache")){
            //使用缓存
            return success(msgCzcg(),DictManager.zdTreeByCache(myParams.getObject(KEY_YOBJ, SysSjglTyzd.class)));
        }else{
            //不使用缓存
            return success(msgCzcg(),DictManager.zdTree(myParams.getObject(KEY_YOBJ, SysSjglTyzd.class)));
        }
    }
    /**
     * 获取字典项对象
     */
    public Result zdObj(SysSjglSjdx sjdx, JSONObject myParams) {
        if(myParams.getBoolean("$.sys.dataCache")){
            //使用缓存
            return success(msgCzcg(),DictManager.zdObjByDmByCache(myParams.getObject(KEY_YOBJ, SysSjglTyzd.class)));
        }else{
            //不使用缓存
            return success(msgCzcg(),DictManager.zdObj(myParams.getObject(KEY_YOBJ, SysSjglTyzd.class)));
        }
    }
    /**
     * 字典搜索
     */
    public Result zdSearch(SysSjglSjdx sjdx, JSONObject myParams) {
        SysSjglTyzd zd = myParams.getObject(KEY_YOBJ, SysSjglTyzd.class);
        zd.setSearchKey(myParams.getString("$.sys.searchKey"));
        return success(msgCzcg(),DictManager.zdSearch(myParams.getObject(KEY_PAGE, PageInfo.class),zd));
    }
}
