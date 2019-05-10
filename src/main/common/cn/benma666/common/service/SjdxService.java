/**
* Project Name:hl_2018
* Date:2018年5月24日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.service;

import org.springframework.stereotype.Service;

import cn.benma666.constants.UtilConst;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.myutils.JsonResult;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.sjgl.LjqManager;
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
    * @param user 
    * @param myParams
    */
    public JsonResult txPlcl(SysSjglSjdx sjdx, JSONObject myParams) {
        Object ids = sjdx.get(LjqInterface.KEY_IDS);
        if(ids!=null){
            myParams.put(LjqInterface.KEY_IDS_IN, " in ('"+ids.toString().replace(",", "','")+"')");
            myParams.put(LjqInterface.KEY_IDS_ARRAY, ids.toString().split(","));
        }
        Object cllxObj = sjdx.get(LjqInterface.KEY_CLLX);
        if(cllxObj==null){
            return error("操作失败：没有配置处理类型");
        }else{
            myParams.put(LjqInterface.KEY_CLLX, cllxObj.toString());
        }
        sjdx = (SysSjglSjdx)myParams.get(LjqInterface.KEY_SJDX);
        return LjqManager.plcl(sjdx,myParams);
    }
    
    /**
    * 批量保存列表数据 <br/>
    * @author jingma
    * @param dbSjdx
    * @param myParams
    * @return
    */
    public JsonResult txSaveListData(SysSjglSjdx dbSjdx, JSONObject myParams) {
        //JSON对象
        JSONArray dataArr = myParams.getJSONObject(LjqInterface.KEY_YOBJ).getJSONArray("listEditData");
        int count=0;
        for(JSONObject obj:dataArr.toArray(new JSONObject[]{})){
            if(UtilConst.WHETHER_TRUE.equals(obj.getString("my-ybj"))){
                myParams.put(LjqInterface.KEY_YOBJ, obj);
                LjqManager.save(dbSjdx, myParams);
                count++;
            }
        }
        return success("保存成功数据条数："+count);
    }

    /**
    *  <br/>
    * @author jingma
    * @param dbSjdx
    * @param myParams
    * @return
    */
    public JsonResult getdata(SysSjglSjdx sjdx, JSONObject myParams) {
        Object ids = sjdx.get(LjqInterface.KEY_IDS);
        if(ids!=null){
            myParams.put(LjqInterface.KEY_IDS_IN, " in ('"+ids.toString().replace(",", "','")+"')");
            myParams.put(LjqInterface.KEY_IDS_ARRAY, ids.toString().split(","));
        }
        Object cllxObj = sjdx.get(LjqInterface.KEY_CLLX);
        if(cllxObj==null){
            cllxObj = LjqInterface.KEY_CLLX_GETDATA;
        }
        myParams.put(LjqInterface.KEY_CLLX, cllxObj.toString());
        sjdx = (SysSjglSjdx)myParams.get(LjqInterface.KEY_SJDX);
        return LjqManager.getdata(sjdx,myParams);
    }

}
