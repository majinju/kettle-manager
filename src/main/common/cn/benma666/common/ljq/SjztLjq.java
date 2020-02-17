/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import java.io.File;
import java.util.List;

import cn.benma666.constants.UtilConst;
import cn.benma666.db.Db;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.DictManager;
import cn.benma666.myutils.FtpUtil;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.sjgl.LjqManager;
import cn.benma666.sjgl.SjglException;
import cn.benma666.web.SConf;

import com.alibaba.druid.util.JdbcUtils;
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
        JSONArray list = null;
        switch (cllx) {
        case "cszt":
            //测试载体
            if(myParams.containsKey(KEY_IDS_IN)){
                List<JSONObject> ztList = Db.use(sjdx.getDxzt()).find("select * from sys_sjgl_sjzt t where t.id "+myParams.getString(KEY_IDS_IN));
                JsonResult r = success("测试完成,测试了"+ztList.size()+"个数据源，其中如下数据源未通过：");
                for(JSONObject obj:ztList){
                    if(!testSjzt(obj,true).isStatus()){
                        r.addMsg(obj.getString("dm"));
                    }
                }
                r.setMsg(r.getMsg().replace("：,", "："));
                return r;
            }else{
                JSONObject obj = myParams.getJSONObject(KEY_OBJ);
                JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
                boolean mmjm = true;
                if(StringUtil.isNotBlank(yobj.getString("mm"))){
                    mmjm = false;
                }
                obj.putAll(yobj);
                return testSjzt(obj, mmjm);
                
            }
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
            list = ((JSONObject)getdata(sjdx, myParams).getData()).getJSONArray("list");
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
                    JsonResult r = LjqManager.save(jkrwdx, jkrw);
                    if(!r.isStatus()){
                        return r;
                    }
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
        if(UtilConst.DEFAULT.equals(dbdm)){
            return error("默认数据源不允许修改");
        }
        obj.putAll(yobj);
        String ljc = obj.getString("ljc");
        switch (obj.getString("lx")) {
        case JdbcUtils.ORACLE:
        case JdbcUtils.MYSQL:
        case JdbcUtils.POSTGRESQL:
        case LjqInterface.ZD_SJZTLX_GREENPLUM:
        case LjqInterface.ZD_SJZTLX_HWMPP:
            if(KEY_CLLX_UPDATE.equals(cllx)){
                if(Db.isCz(obj.getString("dm"))){
                    Db.use(obj.getString("dm")).close();
                }
            }else{
                dbdm = yobj.getString("dm");
                yobj.put("csyj", Db.getDbCsyj(yobj.getString("lx"),yobj.getString("csyj")));
                //处理驱动
                yobj.put("sjkqd", Db.getDbQd(yobj.getString("lx"), ljc,yobj.getString("sjkqd")));
            }
            break;
        case "ftp":
            break;
        case "bdwj":
            //本地文件都以/结尾
            if(!ljc.endsWith("/")){
                yobj.put("ljc", ljc+"/");
            }
            break;
        default:
            throw new SjglException("不支持的对象载体类型："+sjdx.getDxztlx());
        }
        JsonResult result = super.save(sjdx, myJsonParams);
        if(!result.isStatus()){
            return result;
        }
        DictManager.clearDict(ZD_SYS_COMMON_SJZT);
        JSONObject dbObj = DictManager.zdObjByDmByCache(LjqInterface.ZD_SYS_COMMON_SJZT, dbdm);
        //数据库型数据载体才进行测试
        result = testSjzt(dbObj,true);
        return result;
    }

    /**
    * 测试数据载体是否可用 <br/>
    * @author jingma
    * @param sjztObj 数据载体对象
    * @param mmjm 是否密码加密
    * @return
    */
    public JsonResult testSjzt(JSONObject sjztObj,boolean mmjm) {
        JsonResult result = success("该数据载体可用");
        if(sjztObj==null){
            return error("数据载体为空");
        }
        String zt = "1";
        try {
            if(SConf.getVal("sjkxsjzt").indexOf(sjztObj.getString("lx"))>-1){
                //数据库型数据载体
                result = Db.testDb(sjztObj, mmjm);
            }else if("ftp".equals(sjztObj.getString("lx"))){
                //ftp测试
                JSONObject ftpObj = FtpUtil.paseFtpUrl(sjztObj);
                new FtpUtil(sjztObj.getString("dm"), true, ftpObj);
                result = success("测试通过");
            }else if("bdwj".equals(sjztObj.getString("lx"))){
                //本地文件测试
                File f = new File(sjztObj.getString("ljc"));
                if(!f.exists()){
                    result = error("该文件不存在");
                }
            }else{
                //TODO 其他类型载体后续添加测试功能
            }
        } catch (Exception e) {
            zt = "2";
            result = error("该数据载体当前不可用："+sjztObj+","+e.getMessage(),e);
            log.debug(result.getMsg(),e);
        }
        if(!result.isStatus()){
            zt = "2";
        }
        //更新数据源状态
        db.update("update SYS_SJGL_SJZT t set t.zt=?,t.gxsj=to_char(sysdate,'yyyymmddhh24miss') where t.id=?", 
                zt,sjztObj.getString("id"));
        return result;
    }

}
