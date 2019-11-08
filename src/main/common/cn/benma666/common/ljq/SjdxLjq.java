/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import cn.benma666.constants.UtilConst;
import cn.benma666.db.Db;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.domain.SysSjglSjzd;
import cn.benma666.iframe.DictManager;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.sjgl.SjglException;

import com.alibaba.druid.util.JdbcUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * 数据对象拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class SjdxLjq extends DefaultLjq{
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#save(cn.benma666.domain.SysSjglSjdx, java.util.Map)
    */
    @Override
    public JsonResult save(SysSjglSjdx sjdx, JSONObject params) {
        JSONObject jsonObj = (JSONObject) params.get(KEY_OBJ);
        if(StringUtil.isNotBlank(jsonObj.getString(FIELD_DXDM))){
            jsonObj.put(FIELD_DXDM, jsonObj.getString(FIELD_DXDM).toUpperCase());
        }
        switch (params.getString(KEY_CLLX)) {
        case KEY_CLLX_INSERT:
            JSONObject yobj = params.getJSONObject(KEY_OBJ);
            SysSjglSjdx jtdx = JSON.parseObject(yobj.toString(), SysSjglSjdx.class);
            jtdx.setId(StringUtil.getUUIDUpperStr());
            yobj.put("id", jtdx.getId());
//            sqlManager.insertTemplate(jtdx);
            JsonResult r = super.save(sjdx, params);
            //新增
            r.addMsg(impFields(jtdx,params,sjdx).getMsg());
            return success("编辑成功,"+r.getMsg());
        default:
            return super.save(sjdx, params);
        }
    }
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult plcl(SysSjglSjdx sjdx, JSONObject params) {
        String cllx = params.getString(LjqInterface.KEY_CLLX);
        int count = 0;
        JsonResult result = error("未处理");
        switch (cllx) {
        case KEY_CLLX_PLSC:
            //删除相关字段
            result = super.plcl(sjdx, params);
            //后进行逻辑删除
            int sczds = db.update("update sys_sjgl_sjzd t set yxx='0' where t.sjdx "+params.getString(KEY_IDS_IN));
            result.addMsg("逻辑删除字段数："+sczds);
            return result;
        case "dis":
            //获取导入字段的默认sql
            return getDefaultImpSql(params, cllx);
        case "fzdx":
            //复制对象
            count = 0;
            for(String id:(String[])params.get(KEY_IDS_ARRAY)){
                //获取对象
                SysSjglSjdx newsjdx = sqlManager.single(SysSjglSjdx.class, id);
                newsjdx.setId(StringUtil.getUUIDUpperStr());
                newsjdx.setDxdm(newsjdx.getDxdm()+"_"+db.getCurrentDateStr14());
                newsjdx.setDxmc(newsjdx.getDxmc()+"-复制品");
                sqlManager.insert(newsjdx);
                //复制字段
                params.put("oldSjdxId", id);
                params.put("newSjdx", newsjdx);
                result = DefaultLjq.getDefaultSql(newsjdx, "fzzd", params);
                sqlManager.executeUpdate(result.getMsg(), params);
                count++;
            }
            return success("成功复制对象个数："+count);
        case "sxdx":
            //刷新对象
            count = 0;
            result = success("");
            for(String id:(String[])params.get(KEY_IDS_ARRAY)){
                //获取对象
                SysSjglSjdx jtdx = sqlManager.single(SysSjglSjdx.class, id);
                JsonResult r = impFields(jtdx,params,sjdx);
                result.addMsg(r.getMsg());
                count++;
            }
            result.addMsg("成功刷新对象个数："+count);
            return result;
        case "scdxst":
            //生成对象实体
            count = 0;
            result = success("");
            for(String id:(String[])params.get(KEY_IDS_ARRAY)){
                //获取对象
                SysSjglSjdx jtdx = sqlManager.single(SysSjglSjdx.class, id);
                JsonResult r = scdxst(jtdx,params);
                result.addMsg(r.getMsg());
                count++;
            }
            result.addMsg("成功生成对象实体个数："+count);
            return result;
        default:
            return super.plcl(sjdx, params);
        }
    }
    /**
    * 获取默认导入sql <br/>
    * @author jingma
    * @param params
    * @param cllx
    * @return
    */
    public JsonResult getDefaultImpSql(JSONObject params,String cllx) {
        JsonResult result;
        SysSjglSjdx ysjdx = JSON.parseObject(params.getJSONObject(KEY_YOBJ).toJSONString(), SysSjglSjdx.class);
        JSONObject dbObj = DictManager.zdObjByDmByCache(LjqInterface.ZD_SYS_COMMON_SJZT, ysjdx.getDxzt());
        ysjdx.setDxztlx(dbObj.getString("lx"));
        switch (ysjdx.getDxztlx()) {
        case JdbcUtils.ORACLE:
        case JdbcUtils.MYSQL:
        case JdbcUtils.POSTGRESQL:
        case LjqInterface.ZD_SJZTLX_GREENPLUM:
        case LjqInterface.ZD_SJZTLX_HWMPP:
            result = DefaultLjq.getDefaultSql(ysjdx, cllx, params);
            if(!result.isStatus()){
                return result;
            }
            SysSjglSjdx dx = new SysSjglSjdx();
            dx.setZddrsql(result.getMsg());
            return success("获取字段默认导入sql成功", dx);
        default:
            throw new SjglException("不支持的对象载体类型："+ysjdx.getDxztlx());
        }
    }
    /**
    * 生成对象实体 <br/>
    * @author jingma
    * @param jtdx
    * @param params
    * @return
    */
    private JsonResult scdxst(SysSjglSjdx jtdx, JSONObject params) {
        throw new SjglException("暂未实现该功能");
    }
    /**
    * 
    * @return 
     * @see cn.benma666.sjgl.DefaultLjq#wlscByYxx(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult wlscByYxx(SysSjglSjdx sjdx, JSONObject params) {
        JsonResult result = super.wlscByYxx(sjdx, params);
        int scs = db.update("delete from sys_sjgl_sjzd t where yxx='0' and t.sjdx "+params.getString(KEY_IDS_IN));
        result.addMsg("物理删除字段数："+scs);
        return result;
    }
    /**
    * 导入字段 <br/>
    * @author jingma
    * @param jtdx
     * @param params 
     * @param sjdx 
    * @return 
    */
    public JsonResult impFields(SysSjglSjdx jtdx, JSONObject params, SysSjglSjdx sjdx) {
        JSONObject dbObj = DictManager.zdObjByDmByCache(LjqInterface.ZD_SYS_COMMON_SJZT, sjdx.getDxzt());
        String zddrsql = jtdx.getZddrsql();
        if(StringUtil.isBlank(zddrsql)){
            zddrsql = DefaultLjq.getDefaultSql(jtdx, "dis", params).getMsg();
            jtdx.setZddrsql(zddrsql);
        }
        if(!zddrsql.startsWith("select")){
            //非查询语句则按自定义字段规则导入。
            List<JSONObject> fieldsList = new ArrayList<JSONObject>();
            for(String row:zddrsql.split("\n")){
                JSONObject zdObj = new JSONObject();
                String[] sxs = row.split("\\|");
                zdObj.put("zddm", sxs[0]);
                zdObj.put("zdms", sxs[1]);
                zdObj.put("zdlx", sxs[2]);
                zdObj.put("zdcd", sxs[3]);
                fieldsList.add(zdObj);
            }
            return crzd(jtdx, params, sjdx, fieldsList);
        }else{
            jtdx.setDxztlx(dbObj.getString("lx"));
            switch (jtdx.getDxztlx()) {
            case JdbcUtils.ORACLE:
            case JdbcUtils.MYSQL:
            case JdbcUtils.POSTGRESQL:
            case LjqInterface.ZD_SJZTLX_GREENPLUM:
            case LjqInterface.ZD_SJZTLX_HWMPP:
                return impFieldsDB(jtdx,params,sjdx);
            case LjqInterface.ZD_SJZTLX_FTP:
            case LjqInterface.ZD_SJZTLX_BDWJ:
                return impFieldsBdwj(jtdx,params,sjdx);
            default:
                throw new SjglException("不支持的对象载体类型："+jtdx.getDxztlx());
            }
        }
    }

    /**
    *  <br/>
    * @author jingma
    * @param jtdx
    * @param params
    * @param sjdx
    * @return
    */
    private JsonResult impFieldsBdwj(SysSjglSjdx jtdx, JSONObject params,
            SysSjglSjdx sjdx) {
        return success("文件字段导入待实现");
    }
    /**
    * 获取默认导入sql-载体类型为数据库 <br/>
    * @author jingma
    * @param jtdx
    * @param params 
     * @param sjdx 
    * @return
    */
    private JsonResult impFieldsDB(SysSjglSjdx jtdx, JSONObject params, SysSjglSjdx sjdx) {
        Db tdb = Db.use(jtdx.getDxzt());
        List<JSONObject> fieldsList = tdb.find(jtdx.getZddrsql());
        return crzd(jtdx, params, sjdx, fieldsList);
    }
    /**
    * 插入字段 <br/>
    * @author jingma
    * @param jtdx
    * @param params
    * @param sjdx
    * @param fieldsList
    * @return
    */
    public JsonResult crzd(SysSjglSjdx jtdx, JSONObject params,
            SysSjglSjdx sjdx, List<JSONObject> fieldsList) {
        int idx = 20;
        Map<String, JSONObject> oldFiledMap = Db.listToMap(
                db.find("select * from sys_sjgl_sjzd t where t.sjdx=?", 
                        jtdx.getId()), "zddm");
        //新导入的对象复制默认字段
        int count = 0;
        if(oldFiledMap.isEmpty()){
            params.put("oldSjdxId", "SYS_SJGL_SJZD");
            params.put("newSjdx", jtdx);
            params.put("mrzd", UtilConst.WHETHER_TRUE);
            JsonResult r = getDefaultSql(sjdx, "fzzd", params);
            count = sqlManager.executeUpdate(r.getMsg(), params);
        }
        for(JSONObject fieldObj:fieldsList){
            idx += 10;
            SysSjglSjzd zd = JSON.parseObject(fieldObj.toJSONString(), SysSjglSjzd.class);
            //设置字段代码，统一用小写
            zd.setZddm(zd.getZddm().toLowerCase());
            if(oldFiledMap.containsKey(zd.getZddm())){
                //存在的字段
                oldFiledMap.remove(zd.getZddm());
                continue;
            }
            count++;
            //设置对应的数据对象关联信息
            zd.setSjdx(jtdx.getId());
            //根据数据库顺序进行设置px作为默认排序
            zd.setPx(BigDecimal.valueOf(idx));
            if(StringUtil.isNotBlank(zd.getZdms())){
                //根据字段描述进行默认设置
                String[] zdms = zd.getZdms().replace("；", ";").split(";");
                String[] zdms1 = zdms[0].split("@");
                //设置字段名称
                zd.setZdmc(zdms1[0]);
                if(zdms1.length==2){
                    //配置了字典信息
                    zd.setZdzdlb(zdms1[1]);
                    //逻辑判断类的字段一般都比较短
                    if("SYS_COMMON_LJPD".equals(zdms1[1])){
                        zd.setZdkd(BigDecimal.valueOf(80));
                        zd.setKjlx(LjqInterface.ZD_SJDX_KJLX_CHECKBOX);
                    }else{
                        //自动进行字典的一些常见设置
                        zd.setKjlx(LjqInterface.ZD_SJDX_KJLX_DICT);
                    }
                    zd.setZdms(zdms1[0]);
                }else if(zdms1[0].indexOf("时间")>-1||zdms1[0].indexOf("日期")>-1){
                    //时间字段的默认设置
                    zd.setKjlx("time");
                    zd.setCxmrz("goDay:-30");
                    zd.setGshff("vueTimeGsh");
                    zd.setFgshff("vueTimeFgsh");
                    zd.setZdkd(BigDecimal.valueOf(130));
                    zd.setHdyzgz("date:yyyyMMddHHmmss");
                }
                if(zdms.length==2){
                    //存在单独的字段描述信息
                    zd.setZdms(zdms[1]);
                }
                //设置字段的简拼和全拼
                zd.setZdjp(StringUtil.getSimpleSpell(zd.getZdmc()));
                zd.setZdqp(StringUtil.getFullSpell(zd.getZdmc()));
            }else{
                zd.setZdmc(zd.getZddm());
            }
            //保存该字段
            sqlManager.insertTemplate(zd);
        }
        return success(jtdx.getDxmc()+"导入字段数："+count);
    }
}
