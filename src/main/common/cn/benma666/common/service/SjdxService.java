/**
* Project Name:hl_2018
* Date:2018年5月24日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.service;

import org.springframework.stereotype.Service;

import cn.benma666.constants.UtilConst;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.PageInfo;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.sjgl.LjqManager;
import cn.benma666.sjgl.SjglException;
import cn.benma666.sjgl.SysSjglSjdx;
import cn.benma666.web.BasicService;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 数据对象 <br/>
 * 这个类里每个方法都需要支持拦截
 * date: 2018年5月24日 <br/>
 * @author jingma
 * @version 
 */
@Service()
public class SjdxService extends BasicService{

    /**
    *  <br/>
    * @author jingma
    * @param sjdx
    * @param myJsonParams
    * @param page
    * @return
    */
    public JsonResult page(SysSjglSjdx sjdx,JSONObject myJsonParams, PageInfo<JSONObject> page) {
        JsonResult result = DefaultLjq.getDefaultSql(sjdx, "select", myJsonParams, sjdx.getSqlmb());
        try {
            return LjqManager.page(sjdx, page, result.getMsg(),myJsonParams);
        } catch (Exception e) {
            throw new SjglException(e.getMessage()+",sql:"+result.getMsg(), e);
        }
    }

    /**
    *  <br/>
    * @author jingma
    * @param sjdx
    * @param user 
    * @param myJsonParams
    */
    public JsonResult txPlcl(SysSjglSjdx sjdx, JSONObject myJsonParams) {
        Object ids = sjdx.get(LjqInterface.KEY_IDS);
        if(ids!=null){
            myJsonParams.put(LjqInterface.KEY_IDS_IN, " in ('"+ids.toString().replace(",", "','")+"')");
            myJsonParams.put(LjqInterface.KEY_IDS_ARRAY, ids.toString().split(","));
        }
        Object cllxObj = sjdx.get(LjqInterface.KEY_CLLX);
        if(cllxObj==null){
            return error("操作失败：没有配置处理类型");
        }else{
            myJsonParams.put(LjqInterface.KEY_CLLX, cllxObj.toString());
        }
        sjdx = (SysSjglSjdx)myJsonParams.get(LjqInterface.KEY_SJDX);
        return LjqManager.plcl(sjdx,myJsonParams);
    }

    /**
    *  <br/>
    * @author jingma
    * @param dbSjdx
    * @param myJsonParams
    * @return
    */
    public JsonResult getdata(SysSjglSjdx sjdx, JSONObject myJsonParams) {
        Object ids = sjdx.get(LjqInterface.KEY_IDS);
        if(ids!=null){
            myJsonParams.put(LjqInterface.KEY_IDS_IN, " in ('"+ids.toString().replace(",", "','")+"')");
            myJsonParams.put(LjqInterface.KEY_IDS_ARRAY, ids.toString().split(","));
        }
        Object cllxObj = sjdx.get(LjqInterface.KEY_CLLX);
        if(cllxObj==null){
            return error("操作失败：没有配置处理类型");
        }else{
            myJsonParams.put(LjqInterface.KEY_CLLX, cllxObj.toString());
        }
        sjdx = (SysSjglSjdx)myJsonParams.get(LjqInterface.KEY_SJDX);
        return LjqManager.getdata(sjdx,myJsonParams);
    }
    
    /**
    * 批量保存列表数据 <br/>
    * @author jingma
    * @param dbSjdx
    * @param myJsonParams
    * @return
    */
    public JsonResult txSaveListData(SysSjglSjdx dbSjdx, JSONObject myJsonParams) {
        //JSON对象
        JSONArray dataArr = myJsonParams.getJSONObject(LjqInterface.KEY_YOBJ).getJSONArray("listEditData");
        int count=0;
        for(JSONObject obj:dataArr.toArray(new JSONObject[]{})){
            if(UtilConst.WHETHER_TRUE.equals(obj.getString("my-ybj"))){
                myJsonParams.put(LjqInterface.KEY_YOBJ, obj);
                LjqManager.save(dbSjdx, myJsonParams);
                count++;
            }
        }
        return success("保存成功数据条数："+count);
    }

}
