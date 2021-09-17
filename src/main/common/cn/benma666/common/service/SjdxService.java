
package cn.benma666.common.service;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.benma666.constants.UtilConst;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.Result;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.sjgl.LjqManager;
import cn.benma666.web.BasicService;

import com.alibaba.fastjson.JSON;
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
    * 批量处理，该方法是一个事务 <br/>
    * @author jingma
    * @param sjdx
    * @param user 
    * @param myParams
    */
    @SuppressWarnings("deprecation")
    public Result txPlcl(SysSjglSjdx sjdx, JSONObject myParams) {
        Object ids = sjdx.get(LjqInterface.KEY_IDS);
        if(ids!=null&&StringUtil.isNotBlank(ids.toString())){
            myParams.put(LjqInterface.KEY_IDS_IN, " in ('"+ids.toString().replace(",", "','")+"')");
            myParams.put(LjqInterface.KEY_IDS_ARRAY, ids.toString().split(","));
        }else{
            myParams.remove(LjqInterface.KEY_IDS_IN);
            myParams.remove(LjqInterface.KEY_IDS_ARRAY);
        }
        Object cxtj = sjdx.get("my-cxtj");
        if(cxtj!=null){
            //根据查询条件，调用select模板得到操作条件
            myParams.put(LjqInterface.KEY_YOBJ, JSON.parseObject(URLDecoder.decode(cxtj.toString())));
            Result result = DefaultLjq.getDefaultSql(sjdx, "select", myParams, sjdx.getSqlmb());
            if(!result.isStatus()){
                return result;
            }
        }
        Object cllxObj = sjdx.get(LjqInterface.KEY_CLLX);
        if(cllxObj==null){
            return failed("操作失败：没有配置处理类型");
        }else{
            myParams.put(LjqInterface.KEY_CLLX, cllxObj.toString());
        }
        sjdx = (SysSjglSjdx)myParams.get(LjqInterface.KEY_SJDX);
        return LjqManager.plcl(sjdx,myParams);
    }

    /**
    * 通用获取数据接口 <br/>
    * @author jingma
    * @param dbSjdx
    * @param myParams
    * @return
    */
    public Result getdata(SysSjglSjdx sjdx, JSONObject myParams) {
        Object ids = sjdx.get(LjqInterface.KEY_IDS);
        if(ids!=null&&StringUtil.isNotBlank(ids.toString())){
            myParams.put(LjqInterface.KEY_IDS_IN, " in ('"+ids.toString().replace(",", "','")+"')");
            myParams.put(LjqInterface.KEY_IDS_ARRAY, ids.toString().split(","));
        }else{
            myParams.remove(LjqInterface.KEY_IDS_IN);
            myParams.remove(LjqInterface.KEY_IDS_ARRAY);
        }
        Object cllxObj = sjdx.get(LjqInterface.KEY_CLLX);
        if(cllxObj==null){
            cllxObj = LjqInterface.KEY_CLLX_GETDATA;
        }
        myParams.put(LjqInterface.KEY_CLLX, cllxObj.toString());
        sjdx = (SysSjglSjdx)myParams.get(LjqInterface.KEY_SJDX);
        return LjqManager.getdata(sjdx,myParams);
    }
    
    /**
    * 批量保存列表数据 <br/>
    * @author jingma
    * @param dbSjdx
    * @param myParams
    * @return
    */
    public Result txSaveListData(SysSjglSjdx dbSjdx, JSONObject myParams) {
        //JSON对象
        JSONObject yobj1 = myParams.getJSONObject(LjqInterface.KEY_YOBJ);
        JSONArray dataArr = yobj1.getJSONArray("listEditData");
        int count=0;
        List<Object> ro = new ArrayList<Object>();
        for(JSONObject yobj:dataArr.toArray(new JSONObject[]{})){
            JSONObject yobj2 = ((JSONObject)yobj1.clone());
            yobj2.putAll(yobj);
            if(UtilConst.WHETHER_TRUE.equals(yobj2.getString("my-ybj"))){
                Result r = DefaultLjq.putObj(dbSjdx, myParams, yobj2);
                if(!r.isStatus()){
                    return r;
                }
                myParams.put(LjqInterface.KEY_CLLX, LjqInterface.KEY_CLLX_UPDATE);
                r = LjqManager.save(dbSjdx, myParams);
                if(!r.isStatus()){
                    return r;
                }else{
                    ro.add(r.getData());
                    count++;
                }
            }
        }
        return success("保存成功数据条数："+count,ro);
    }

}
