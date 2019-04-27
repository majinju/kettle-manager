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
public class RyhcLjq extends DefaultLjq{
    /**
    * 人员核查结果缓存
    */
    public static JSONObject ryhcjg = CacheFactory.use("RYHCJG");
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult plcl(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = myParams.getString(KEY_CLLX);
        if(KEY_CLLX_SJPLSC.equals(cllx)){
            SysQxYhxx user = (SysQxYhxx) myParams.get(KEY_USER);
            ryhcjg.remove(user.getId());
        }
        return super.plcl(sjdx, myParams);
    }
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
        if(ryhcjg.containsKey(user.getId())){
            l= (List<JSONObject>) ryhcjg.get(user.getId());
        }else{
            l = new ArrayList<JSONObject>();
            ryhcjg.put(user.getId(), l);
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
        if(ryhcjg.containsKey(user.getId())){
            List<JSONObject> list = (List<JSONObject>) ryhcjg.get(user.getId());
            String param;
            try {
                  param = URLEncoder.encode(JSON.toJSONString(list), "UTF-8");
                  JSONObject app = DictManager.zdObjByDmByCache(LjqInterface.ZD_SYS_QX_APP, "CQQB2");
                  JSONObject result = HttpUtil.doUrl(app.getString("dz")+"ryhc/doRyhc.do",
                          "hcList="+param);
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
