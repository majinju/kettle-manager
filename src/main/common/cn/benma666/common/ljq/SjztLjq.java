/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import cn.benma666.db.Db;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.DictManager;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.web.SConf;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 数据载体拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class SjztLjq extends DefaultLjq{
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult plcl(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = myParams.getString(KEY_CLLX);
        JSONObject kzxx = myParams.getJSONObject(FIELD_KZXX);
        JSONObject jkpz = kzxx.getJSONObject("运行监控任务默认配置");
        switch (cllx) {
        case "scjkrw":
            //监控任务对象,及参数对象构建
            JSONObject jkrw = (JSONObject) myParams.clone();
            JSONObject p = (JSONObject) getJcxxByDxdm("SYS_YXJK_JKRW").getData();
            SysSjglSjdx jkrwdx = (SysSjglSjdx) p.get(KEY_SJDX);
            jkrw.putAll(p);
            
            //已存在任务
            int yczrw = 0;
            //生成的任务
            int scrw = 0;
            JSONArray list = ((JSONObject)getdata(sjdx, myParams).getData()).getJSONArray("list");
            for(JSONObject job:list.toArray(new JSONObject[]{})){
                JSONObject oldrw = db.findFirst("select * from sys_yxjk_jkrw t where t.jtrw=? and t.rwlx='1'", 
                        job.getString("jtrw"));
                if(oldrw==null){
                    job.put("rwlb", "99");
                    job.put("rwlx", "1");
                    job.put("rwdj", "1");
                    if(jkpz!=null){
                        job.putAll(jkpz);
                    }
                    jkrw.put(KEY_YOBJ, job);
                    jkrw.put(KEY_CLLX, KEY_CLLX_INSERT);
                    save(jkrwdx, jkrw);
                    scrw++;
                }else{
                    yczrw++;
                }
            }
            return success("已经存在监控任务数："+yczrw+",新生成监控任务数："+scrw);
        default:
            //执行默认操作
            return super.plcl(sjdx, myParams);
        }
    }

    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#save(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult save(SysSjglSjdx sjdx, JSONObject myJsonParams) {
        String cllx = myJsonParams.getString(LjqInterface.KEY_CLLX);
        JSONObject yobj = myJsonParams.getJSONObject(KEY_YOBJ);
        JSONObject obj = myJsonParams.getJSONObject(KEY_OBJ);
        String dbdm = obj.getString("dm");
        if(KEY_CLLX_UPDATE.equals(cllx)){
            if(Db.isCz(obj.getString("dm"))){
                Db.use(obj.getString("dm")).close();
            }
        }else{
            dbdm = yobj.getString("dm");
            String vs = "validationQuery."+yobj.getString("lx");
            //处理测试语句
            if(StringUtil.isBlank(yobj.getString("csyj"))&&!vs.equals(SConf.getVal(vs))){
                yobj.put("csyj", SConf.getVal(vs));
            }
            //处理驱动
            if(StringUtil.isBlank(yobj.getString("sjkqd"))){
                yobj.put("sjkqd", Db.getDriverClassName(yobj.getString("lx"), yobj.getString("ljc")));
            }
        }
        JsonResult result = super.save(sjdx, myJsonParams);
        DictManager.clearDict(ZD_SYS_COMMON_SJZT);
        JSONObject dbObj = DictManager.zdObjByDmByCache(LjqInterface.ZD_SYS_COMMON_SJZT, dbdm);
        //数据库型数据载体才进行测试
        if(SConf.getVal("sjkxsjzt").indexOf(dbObj.getString("lx"))>-1){
            String zt = "1";
            try {
                    Db.use(dbdm);
            } catch (Exception e) {
                zt = "2";
                result = error("该数据源当前不可用："+obj.getString("dm"),e);
                log.debug(result.getMsg(),e);
            }
            //更新数据源状态
            db.update("update SYS_SJGL_SJZT t set t.zt=?,t.gxsj=to_char(sysdate,'yyyymmddhh24miss') where t.id=?", zt,yobj.getString("id"));
        }
        return result;
    }
}
