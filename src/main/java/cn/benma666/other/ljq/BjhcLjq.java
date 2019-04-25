/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.other.ljq;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.CacheFactory;
import cn.benma666.iframe.DictManager;
import cn.benma666.myutils.HttpUtil;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.PageInfo;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.LjqInterface;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * 机场员工拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class BjhcLjq extends DefaultLjq{
    /**
    * 人员核查结果缓存
    */
    public static JSONObject bjhcjg = CacheFactory.use("BJHCJG");
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#save(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @SuppressWarnings("unchecked")
    @Override
    public JsonResult save(SysSjglSjdx sjdx, JSONObject myParams) {
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        SysQxYhxx user = (SysQxYhxx) myParams.get(KEY_USER);
        List<JSONObject> l= null;
        if(bjhcjg.containsKey(user.getId())){
            l= (List<JSONObject>) bjhcjg.get(user.getId());
        }else{
            l = new ArrayList<JSONObject>();
            bjhcjg.put(user.getId(), l);
        }
        l.add(yobj);
        return success("核查成功");
    }
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#page(cn.benma666.domain.SysSjglSjdx, cn.benma666.myutils.PageInfo, java.lang.String, com.alibaba.fastjson.JSONObject)
    */
    @SuppressWarnings("unchecked")
    @Override
    public JsonResult page(SysSjglSjdx sjdx, PageInfo<JSONObject> page,
            String defaultSql, JSONObject myParams) {
        SysQxYhxx user = (SysQxYhxx) myParams.get(KEY_USER);
        if(bjhcjg.containsKey(user.getId())){
            List<JSONObject> list = (List<JSONObject>) bjhcjg.get(user.getId());
            String param;
            try {
                  param = URLEncoder.encode(JSON.toJSONString(list), "UTF-8");
                  JSONObject app = DictManager.zdObjByDmByCache(LjqInterface.ZD_SYS_QX_APP, "cqqb2");
                  JSONObject result = HttpUtil.doPost(app.getString("dz")+"ryhc/bjhc.do?sjly=cqqb",
                          "&hcList="+param);
                  if(result.getBooleanValue("status")){
                      PageInfo<Object> page1 = new PageInfo<Object>();
                      page1.setList(result.getJSONArray("data"));
                      return success("核查成功",page1);
                  }else{
                      return error("核查失败"+result.getString("msg"));
                  }
            } catch (Exception e) {
                log.error("核查失败："+JSON.toJSONString(list), e);
                return error("核查失败"+e.getMessage());
            }
        }else{
            return error("你还没有上传核查名单");
        }
    }
}
