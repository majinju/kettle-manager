/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.other.ljq;

import cn.benma666.db.Db;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.DictManager;
import cn.benma666.myutils.DateUtil;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.SfzhUtil;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;

import com.alibaba.fastjson.JSONObject;

/**
 * 机场员工拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class JcygLjq extends DefaultLjq{
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult plcl(SysSjglSjdx sjdx, JSONObject params) {
        String cllx = params.getString(KEY_CLLX);
        JSONObject yobj = params.getJSONObject(KEY_YOBJ);
        switch (cllx) {
        case "clygsj":
            JSONObject fileObj = yobj.getJSONObject("fileObj");
            JcygExcel er = new JcygExcel(fileObj.getString("sclj"),
                    DictManager.zdMcByDm("JCGA_JCYG_APPCONFIG", "jcyg.heards"),
                    DictManager.zdMcByDm("JCGA_JCYG_APPCONFIG", "jcyg.fields"),
                    DictManager.zdMcByDm("JCGA_JCYG_APPCONFIG", "jcyg.rules"),1,
                    DictManager.zdMcByDm("JCGA_JCYG_APPCONFIG", "jcyg.shgx.fields"),
                    DictManager.zdMcByDm("JCGA_JCYG_APPCONFIG", "jcyg.shgx.rules"));
            try {
                er.disposeExcel();
            } catch (Exception e) {
                log.error("文件处理失败："+params+"->"+e.getMessage(), e);
                return error("文件处理失败："+e.getMessage());
            }
            for(JSONObject j:er.getResult().toArray(new JSONObject[]{})){
                params.put("yobj", j);
                params.put("shgx", j.getJSONArray("shgxs"));
                save(sjdx,params);
                System.out.println(j);
            }
            return success("成功上传员工数："+er.getResult().size());
        case KEY_CLLX_PLSC:
            //批量删除时，同步删除对应社会关系
            JsonResult result = super.plcl(sjdx, params);
            
            //物理删除关系
            int c = Db.use(sjdx.getDxzt()).update("delete from jcga_jcyg_shgx t where t.yxx='0' "
                    + "and exists(select 1 from jcga_jcyg_jcxx j where j.ygbh=t.ygbh "
                    + "and j.id "+params.getString(KEY_IDS_IN)+")");
            result.addMsg("物理删除关系数："+c);
            
            //后续继续进行逻辑删除操作
            c = Db.use(sjdx.getDxzt()).update("update jcga_jcyg_shgx t set t.yxx='0' "
                    + "where exists(select 1 from jcga_jcyg_jcxx j where j.ygbh=t.ygbh "
                    + "and j.id "+params.getString(KEY_IDS_IN)+")");
            result.addMsg("逻辑删除关系数："+c);
            return result;
            
        default:
            return super.plcl(sjdx, params);
        }
    }
    
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#save(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult save(SysSjglSjdx sjdx, JSONObject myParams) {
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        SysQxYhxx user = (SysQxYhxx) myParams.get(KEY_USER);
        if(StringUtil.isNotBlank(yobj.getString("gmsfhm"))){
            //自动根据身份证号不全信息
            yobj.put("csrq", SfzhUtil.getBirthByIdCard(yobj.getString("gmsfhm")));
            yobj.put("nl", SfzhUtil.getAgeByIdCard(yobj.getString("gmsfhm"))+"");
            yobj.put("xb", SfzhUtil.getGenderByIdCard(yobj.getString("gmsfhm")));
        }
        String cllx = myParams.getString(KEY_CLLX);
        if(KEY_CLLX_INSERT.equals(cllx)){
            //新增时生成员工编号
            yobj.put("ygbh", "CQJC"+DateUtil.getDateTimeStr(DateUtil.DATE_FORMATTER14+"SSS"));
            yobj.put("dw", user.getJgxx().getId());
        }
        
        //员工对应社会关系生成
        
        return super.save(sjdx, myParams);
    }
}
