/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.other.ljq;

import java.util.ArrayList;
import java.util.List;

import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.CacheFactory;
import cn.benma666.iframe.DictManager;
import cn.benma666.myutils.HttpUtil;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.PageInfo;
import cn.benma666.myutils.SfzhUtil;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * 人员核查拦截器 <br/>
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
            ryhcjg.remove(user.getToken());
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
        if(ryhcjg.containsKey(user.getToken())){
            l= (List<JSONObject>) ryhcjg.get(user.getToken());
        }else{
            l = new ArrayList<JSONObject>();
            ryhcjg.put(user.getToken(), l);
        }
        l.add(yobj);
        String zjhm = yobj.getString("zjhm");
        if (!SfzhUtil.validateCard(zjhm)) {
            yobj.put("hcjg","证件号码无效");
            return error("证件号码无效");
        }
        if(l.size()>Integer.parseInt(DictManager.zdMcByDm("OTHER_HCXT_APPCONFIG", "ryhc.maxsize"))){
            yobj.put("hcjg","超出数量限制");
            return error("超出数量限制");
        }
        try {
            JSONObject qqjg = HttpUtil.doUrl(
                    DictManager.zdMcByDm("OTHER_HCXT_APPCONFIG", "cqqbryhc.url")+zjhm);
            if(qqjg.getBooleanValue("state")){
                JSONObject hcjg = JSON.parseArray(qqjg.getString("data")).getJSONObject(0);
                yobj.putAll(hcjg);
                if (StringUtil.isNotBlank(yobj.getString("scxm")) 
                        && !yobj.getString("scxm").equals(yobj.getString("xm"))) {
                    yobj.put("hcjg","姓名不一致");
                } else {
                    yobj.put("hcjg","正确");
                }
            }else{
                yobj.put("hcjg","核查失败1，请重新核查:"+qqjg);
            }
        } catch (Exception e) {
            log.error("核查异常："+yobj, e);
            yobj.put("hcjg","核查异常："+e.getMessage());
        }
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
        if(ryhcjg.containsKey(user.getToken())){
            List<JSONObject> list = (List<JSONObject>) ryhcjg.get(user.getToken());
            page.setList(list);
            return success("核查成功",page);
        }else{
            return error("你还没有上传核查名单");
        }
    }
}
