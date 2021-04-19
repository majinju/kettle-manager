/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.other.ljq;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.CacheFactory;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.PageInfo;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.web.SConf;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 批量比对-拦截器 <br/>
 * @author jingma
 * @version 
 */
public class QympLjq extends DefaultLjq{
    /**
    * 用户查询条件缓存，按会话缓存
    */
    public static JSONObject tjhc = CacheFactory.use("qymp-tjhc", CacheFactory.TYPE_MEMORY);
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#page(cn.benma666.domain.SysSjglSjdx, cn.benma666.myutils.PageInfo, java.lang.String, com.alibaba.fastjson.JSONObject)
    */
    @SuppressWarnings("unchecked")
    @Override
    public JsonResult page(SysSjglSjdx sjdx, PageInfo<JSONObject> page,
            String defaultSql, JSONObject myParams) {
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        SysQxYhxx user = (SysQxYhxx)myParams.get(KEY_USER);
        JSONObject xzcxxParams = new JSONObject();
        JSONObject xzcxxSjdxP = new JSONObject();
        //设置全域智搜条件
        myParams.put("qyzstj", yobj);
        //设置选中查询项的查询条件
        myParams.put("xzcxxParams", xzcxxParams);
        //设置选中查询项的参数对象
        myParams.put("xzcxxSjdxP", xzcxxSjdxP);
        //按登陆用户缓存查询条件
        tjhc.put(user.getToken(), myParams);
        //结构化选中查询项的参数
        for(Entry<String, Object> e:yobj.entrySet()){
            if(e.getKey().startsWith("xzcxx-")){
                String cxxid = e.getKey().substring(6, 12);
                JSONObject cxxp = xzcxxParams.getJSONObject(cxxid);
                if(cxxp==null){
                    cxxp = new JSONObject();
                    xzcxxParams.put(cxxid, cxxp);
                }
                cxxp.put(e.getKey().substring(13), e.getValue());
            }
        }
        //最大查询
        int zdcxl = Integer.parseInt(SConf.getVal("SYS_PLBD_HM_QYMP.zdcxl"));
        page.setPageSize(zdcxl);
        page.setAutoCount(false);
        page.setQueryList(true);
        List<JSONObject> list = new ArrayList<JSONObject>();
        JSONArray xzcxx = yobj.getJSONArray("xzcxx");
        if(xzcxx==null){
            return error("请先选择搜索资源");
        }
        //需要对资源进行按数据量排序（也考虑先根据条件进行数据量统计，根据统计结果进行排序），优先处理数据量较小的资源，当现存的交集数量小于1000时，
        //则直接带入sql中进行筛选，适用于数据量较大的资源。
        //关于1000的限制是因为oracle的限制，可以考虑区分数据库对待，oracle则采用in or in 的机制进行支撑更多数据量，其他则直接生成in语句。
        Set<String> mphmMap = new HashSet<String>();
        int i=0;
        for(JSONObject cxx : xzcxx.toArray(new JSONObject[xzcxx.size()])){
            if(StringUtil.isNotBlank(cxx.getString("sjdx"))){
                //构建对象参数
                JSONObject zyP = (JSONObject) myParams.clone();
                zyP.putAll((JSONObject)getJcxxById(cxx.getString("sjdx")).getData());
                xzcxxSjdxP.put(cxx.getString("sjdx"), zyP);
                SysSjglSjdx zySjdx = (SysSjglSjdx) zyP.get(KEY_SJDX);
                JSONObject zyYobj = xzcxxParams.getJSONObject(cxx.getString("dm"));
                if(zyYobj==null){
                    zyYobj = new JSONObject();
                }
                //设置查询条件
                zyP.put(KEY_YOBJ, zyYobj);
                //这个查询需要改为异步统计
                JsonResult result = DefaultLjq.getDefaultSql(zySjdx, "qymp", zyP);
                if(!result.isStatus()){
                    return result;
                }
                String ds = result.getMsg();
                result = super.page(zySjdx, page, ds, zyP);
                if(!result.isStatus()){
                    return result;
                }
                page = (PageInfo<JSONObject>) result.getData();
                if(page.getList().size()==zdcxl){
                    return error(cxx.getString("mc")+"的查询条件请进一步细化，当前条件数据量过大，超过："+zdcxl);
                }
                Set<String> tmap = new HashSet<String>();
                for(JSONObject r:page.getList()){
                    tmap.add(r.getString("zjhm"));
                }
                if(i==0){
                    mphmMap = tmap;
                }else{
                    mphmMap.retainAll(tmap);
                }
                i++;
            }
        }
        for(String hm:mphmMap){
            JSONObject jo = new JSONObject();
            jo.put("zjhm", hm);
            list.add(jo);
        }
        page.setList(list);
        page.setRecordCount(list.size());
        //结果处理
        return success("查询成功", page);
    }
}
