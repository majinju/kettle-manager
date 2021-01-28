/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.other.ljq;

import java.util.Arrays;

import cn.benma666.constants.UtilConst;
import cn.benma666.db.Db;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.exception.ExcelReadException;
import cn.benma666.myutils.AutoId;
import cn.benma666.myutils.DateUtil;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.SfzhUtil;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.LjqManager;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 机场员工拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class JcygLjq extends DefaultLjq{
    /**
    * 员工编号自增id
    */
    private static AutoId ygbh = new AutoId("JCGA_JCYG_YGBH");
    private JcygExcel er;
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult plcl(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = myParams.getString(KEY_CLLX);
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        String msg;
        switch (cllx) {
        case "clygsj":
            er = new JcygExcel(sjdx,myParams,yobj.getJSONObject("fileObj"),(SysQxYhxx) myParams.get(KEY_USER));
            try {
                JsonResult r = er.disposeExcel();
                if(!r.isStatus()){
                    return r;
                }
            } catch (ExcelReadException e) {
                return error(e.getMessage());
            } catch (Exception e) {
                log.error("文件处理失败："+yobj+"->"+e.getMessage(), e);
                return error("文件处理失败："+e.getMessage());
            }
            for(JSONObject j:er.getResult().toArray(new JSONObject[]{})){
                myParams.put(KEY_YOBJ, j);
                myParams.put(KEY_CLLX, KEY_CLLX_INSERT);
                JsonResult r = save(sjdx,myParams);
                if(!r.isStatus()){
                    return error("保存失败："+j.getString("gmsfhm")+r.getMsg());
                }
            }
            msg = "成功上传员工数："+er.getResult().size();
            if(er.getCfscryList().size()>0){
                msg += "。<br/>如下员工已存在，系统已自动忽略：<br/>"+Arrays.toString(er.getCfscryList().toArray());
            }
            return success(msg);
        case KEY_CLLX_PLSC:
            //批量删除时，同步删除对应社会关系
            JsonResult result = super.plcl(sjdx, myParams);
            
            //物理删除关系
            int c = Db.use(sjdx.getDxzt()).update("delete from jcga_jcyg_shgx t where t.yxx='0' "
                    + "and exists(select 1 from jcga_jcyg_jcxx j where j.ygbh=t.ygbh "
                    + "and j.id "+myParams.getString(KEY_IDS_IN)+")");
            result.addMsg("物理删除关系数："+c);
            
            //后续继续进行逻辑删除操作
            c = Db.use(sjdx.getDxzt()).update("update jcga_jcyg_shgx t set t.yxx='0' "
                    + "where exists(select 1 from jcga_jcyg_jcxx j where j.ygbh=t.ygbh "
                    + "and j.id "+myParams.getString(KEY_IDS_IN)+")");
            result.addMsg("逻辑删除关系数："+c);
            return result;
            
        default:
            return super.plcl(sjdx, myParams);
        }
    }
    
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#save(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult save(SysSjglSjdx sjdx, JSONObject myParams) {
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        if(StringUtil.isNotBlank(yobj.getString("gmsfhm"))
                &&SfzhUtil.validateCard(yobj.getString("gmsfhm"))){
            //自动根据身份证号不全信息
            yobj.put("csrq", SfzhUtil.getBirthByIdCard(yobj.getString("gmsfhm")));
            yobj.put("nl", SfzhUtil.getAgeByIdCard(yobj.getString("gmsfhm"))+"");
            yobj.put("xb", SfzhUtil.getGenderByIdCard(yobj.getString("gmsfhm")));
        }
        
        String cllx = myParams.getString(KEY_CLLX);
        if(KEY_CLLX_INSERT.equals(cllx)){
            //新增时生成员工编号
            yobj.put("ygbh", DateUtil.getDateTimeStr("yyyy")+ygbh.next(5));
            yobj.put("id", StringUtil.getUUIDUpperStr());
            yobj.put("sjly", sjdx.getDxdm());
        }else{
            if(StringUtil.isBlank(yobj.getString("gmsfhm"))){
                yobj.put("bjhc", UtilConst.WHETHER_FALSE);
            }else{
                yobj.put("bjhc", UtilConst.WHETHER_TRUE);
            }
        }
        
        //社会关系对象,及参数对象构建
        JSONObject shgxParams = (JSONObject) myParams.clone();
        JSONObject p = (JSONObject) getJcxxByDxdm("JCGA_JCYG_SHGX").getData();
        SysSjglSjdx shgxSjdx = (SysSjglSjdx) p.get(KEY_SJDX);
        shgxParams.putAll(p);
        JSONObject pcyzgz = new JSONObject();
        pcyzgz.put("*", "not");
        shgxParams.put(KEY_PCYZGZ, pcyzgz);
        
        //添加本人关系,员工对应社会关系生成
        JSONObject shgxYobj = new JSONObject();
        shgxParams.put(KEY_YOBJ, shgxYobj);
        shgxYobj.putAll(yobj);
        if(StringUtil.isNotBlank(shgxYobj.getString("ygxm"))){
            shgxYobj.put("xm", shgxYobj.getString("ygxm"));
        }
        if(StringUtil.isNotBlank(shgxYobj.getString("gmsfhm"))){
            shgxYobj.put("zjhm", shgxYobj.getString("gmsfhm"));
        }
        if(StringUtil.isNotBlank(shgxYobj.getString("sj"))){
            shgxYobj.put("lxdh", shgxYobj.getString("sj"));
        }
        shgxYobj.put("shgx", "0");
        //保存本人关系
        JsonResult r = LjqManager.save(shgxSjdx, shgxParams);
        if(!r.isStatus()){
            r.setMsg("保存本人社会关系异常："+r.getMsg());
            return r;
        }
        
        //批量上报时传入的社会关系保存
        JSONArray shgxs = yobj.getJSONArray("shgxs");
        if(shgxs!=null){
            for(JSONObject shgx:shgxs.toArray(new JSONObject[]{})){
                shgx.put("ygbh", yobj.getString("ygbh"));
                shgxParams.put(KEY_YOBJ, shgx);
                r = LjqManager.save(shgxSjdx, shgxParams);
                if(!r.isStatus()){
                    r.setMsg("保存社会关系异常："+r.getMsg());
                    return r;
                }
            }
        }
        
        return super.save(sjdx, myParams);
    }
}
