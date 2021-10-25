/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.sjsj.ljq.sjgl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import cn.benma666.constants.UtilConst;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.domain.SysSjglSjzd;
import cn.benma666.exception.MyException;
import cn.benma666.iframe.DictManager;
import cn.benma666.iframe.Result;
import cn.benma666.myutils.DateUtil;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjsj.web.DefaultLjq;
import cn.benma666.sjsj.web.LjqInterface;
import cn.benma666.sjsj.web.LjqManager;
import cn.benma666.sjzt.Db;

import com.alibaba.druid.DbType;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;
import com.github.stuxuhai.jpinyin.PinyinException;
import org.beetl.sql.core.SqlId;

/**
 * 数据对象拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 0.1
 */
public class SjdxLjq extends DefaultLjq {
    @Override
    public Result insert(SysSjglSjdx sjdx, JSONObject myParams) throws MyException {
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        if(StringUtil.isNotBlank(yobj.getString(FIELD_DXDM))){
            yobj.put(FIELD_DXDM, yobj.getString(FIELD_DXDM).toUpperCase());
        }
        SysSjglSjdx jtdx = JSON.parseObject(yobj.toString(), SysSjglSjdx.class);
        Result r = super.insert(sjdx, myParams);
        if(!r.isStatus()){
            return r;
        }
        //新增
        try {
            r.addMsg(impFields(jtdx,myParams,sjdx).getMsg());
        } catch (PinyinException e) {
            throw new MyException("导入字段出错："+e.getMessage(),e);
        }
        return success("编辑成功,"+r.getMsg());
    }
    @Override
    public Result data(SysSjglSjdx sjdx, JSONObject myParams) {
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        int count = 0;
        Result result = failed("未处理");
        switch (getCllx(myParams)) {
        case KEY_CLLX_PLSC:
            //删除相关字段
            result = super.data(sjdx, myParams);
            //后进行逻辑删除
            int sczds = db().update(SqlId.of("sjsj","updateSjzd"),myParams);
            result.addMsg("逻辑删除字段数："+sczds);
            return result;
        case "dis":
            //获取导入字段的默认sql
            return getDefaultImpSql(myParams);
        case "fzdx":
            //复制对象
            String dmhz = "_"+DateUtil.getGabDate();
            String mchz = "-复制品";
            if(StringUtil.isNotBlank(yobj.getString("dmhz"))){
                dmhz = "_"+yobj.getString("dmhz");
            }
            if(StringUtil.isNotBlank(yobj.getString("mchz"))){
                mchz = "-"+yobj.getString("mchz");
            }
            for(String id:((JSONArray)JSONPath.eval(myParams,$_SYS_IDS)).toJavaList(String.class)){
                //获取对象
                SysSjglSjdx newsjdx = sqlManager().single(SysSjglSjdx.class, id);
                newsjdx.setId(StringUtil.getUUIDUpperStr());
                newsjdx.setDxdm(newsjdx.getDxdm()+dmhz);
                newsjdx.setDxmc(newsjdx.getDxmc()+mchz);
                sqlManager().insert(newsjdx);
                //复制字段
                myParams.put("oldSjdxId", id);
                myParams.put("newSjdx", newsjdx);
                String[] arr = LjqManager.getSql(sjdx, myParams, "fzzd");
                db(arr[0]).update(result.getMsg(), myParams);
                count++;
            }
            return success("成功复制对象个数："+count);
        case "sxdx":
            //刷新对象
            result = success("");
            for(String id:((JSONArray)JSONPath.eval(myParams,$_SYS_IDS)).toJavaList(String.class)){
                //获取对象
                SysSjglSjdx jtdx = sqlManager().single(SysSjglSjdx.class, id);
                Result r = null;
                try {
                    r = impFields(jtdx,myParams,sjdx);
                } catch (PinyinException e) {
                    throw new MyException("导入字段出错："+e.getMessage(),e);
                }
                result.addMsg(r.getMsg());
                count++;
            }
            result.addMsg("成功刷新对象个数："+count);
            return result;
        case "bzpx":
            //标准排序
            result = success("");
            for(String id:((JSONArray)JSONPath.eval(myParams,$_SYS_IDS)).toJavaList(String.class)){
                //获取对象
                SysSjglSjdx jtdx = sqlManager().single(SysSjglSjdx.class, id);
                myParams.put(KEY_SJDX, jtdx);
                Result r = bzpxFields(jtdx,myParams);
                result.addMsg(r.getMsg());
                count++;
            }
            result.addMsg("成功重新排序对象个数："+count);
            return result;
        case "scdxst":
            //生成对象实体
            result = success("");
            for(String id:((JSONArray)JSONPath.eval(myParams,$_SYS_IDS)).toJavaList(String.class)){
                //获取对象
                SysSjglSjdx jtdx = sqlManager().single(SysSjglSjdx.class, id);
                Result r = scdxst(jtdx,myParams);
                result.addMsg(r.getMsg());
                count++;
            }
            result.addMsg("成功生成对象实体个数："+count);
            return result;
        default:
            return super.data(sjdx, myParams);
        }
    }
    /**
    * 标准排序 <br/>
    * @author jingma
    * @param jtdx
    * @param myParams
    * @return
    */
    private Result bzpxFields(SysSjglSjdx jtdx, JSONObject myParams) {
        Map<String, JSONObject> fields = getFields(jtdx,myParams, (SysQxYhxx) myParams.get(KEY_USER));
        int idx = 50;
        for(Entry<String, JSONObject> field:fields.entrySet()){
            idx+=10;
            db().update("update sys_sjgl_sjzd t set t.px=? where t.id=?", 
                    idx,field.getValue().getString(FIELD_ID));
        }
        return success(jtdx.getDxmc()+"成功标准化排序字段数："+fields.size());
    }
    /**
    * 获取默认导入sql <br/>
    * @author jingma
    * @param params
    * @return
    */
    public Result getDefaultImpSql(JSONObject params) {
        Result result;
        SysSjglSjdx ysjdx = JSON.parseObject(params.getJSONObject(KEY_YOBJ).toJSONString(), SysSjglSjdx.class);
        JSONObject dbObj = DictManager.zdObjByDmByCache(LjqInterface.ZD_SYS_COMMON_SJZT, ysjdx.getDxzt());
        ysjdx.setDxztlx(dbObj.getString("lx"));
        if(DbType.of(dbObj.getString("lx"))!=null){
            String[] arr = LjqManager.getSql(ysjdx, params);
            SysSjglSjdx dx = new SysSjglSjdx();
            dx.setZddrsql(arr[1]);
            return success("获取字段默认导入sql成功", dx);
        }
        switch (ysjdx.getDxztlx()) {
        default:
            throw new MyException("不支持的对象载体类型："+ysjdx.getDxztlx());
        }
    }
    /**
    * 生成对象实体 <br/>
    * @author jingma
    * @param jtdx
    * @param params
    * @return
    */
    private Result scdxst(SysSjglSjdx jtdx, JSONObject params) {
        throw new MyException("暂未实现该功能");
    }

    @Override
    public Result wlscByYxx(SysSjglSjdx sjdx, JSONObject myParams) {
        Result result = super.wlscByYxx(sjdx, myParams);
        int scs = db().update(SqlId.of("sjsj","deleteSjzd"), myParams);
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
    public Result impFields(SysSjglSjdx jtdx, JSONObject params, SysSjglSjdx sjdx) throws PinyinException {
        JSONObject dbObj = DictManager.zdObjByDmByCache(LjqInterface.ZD_SYS_COMMON_SJZT, sjdx.getDxzt());
        String zddrsql = jtdx.getZddrsql();
        if(StringUtil.isBlank(zddrsql)){
            String[] arr = LjqManager.getSql(jtdx, params, "dis");
            jtdx.setZddrsql(arr[1]);
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
            if(DbType.of(dbObj.getString("lx"))!=null){
                return impFieldsDB(jtdx,params,sjdx);
            }
            switch (jtdx.getDxztlx()) {
            case LjqInterface.ZD_SJZTLX_FTP:
            case LjqInterface.ZD_SJZTLX_BDWJ:
                return impFieldsBdwj(jtdx,params,sjdx);
            default:
                throw new MyException("不支持的对象载体类型："+jtdx.getDxztlx());
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
    private Result impFieldsBdwj(SysSjglSjdx jtdx, JSONObject params,
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
    private Result impFieldsDB(SysSjglSjdx jtdx, JSONObject params, SysSjglSjdx sjdx) throws PinyinException {
        Db tdb = Db.use(jtdx.getDxzt());
        List<JSONObject> fieldsList = tdb.find(jtdx.getZddrsql());
        return crzd(jtdx, params, sjdx, fieldsList);
    }
    /**
    * 插入字段 <br/>
    * @author jingma
    * @param jtdx
    * @param myParams
    * @param sjdx
    * @param fieldsList
    * @return
    */
    public Result crzd(SysSjglSjdx jtdx, JSONObject myParams,
            SysSjglSjdx sjdx, List<JSONObject> fieldsList) throws PinyinException {
        Map<String, JSONObject> oldFiledMap = Db.listToMap(
                db().find("select * from sys_sjgl_sjzd t where t.sjdx=?", 
                        jtdx.getId()), "zddm");
        //新导入的对象复制默认字段
        int count = 0;
        if(oldFiledMap.isEmpty()){
            myParams.put("oldSjdxId", "SYS_SJGL_SJDX");
            myParams.put("newSjdx", jtdx);
            myParams.put("newSjzd", fieldsList);
            //新建对象
            myParams.put("xjdx", UtilConst.WHETHER_TRUE);
            String[] arr = getSql(sjdx, myParams, "fzzd");
            myParams.remove("xjdx");
            count = db().update(arr[1], myParams);
        }
        int idx = oldFiledMap.size()*10+50;
        for(JSONObject fieldObj:fieldsList){
            idx += 10;
            SysSjglSjzd zd = JSON.parseObject(fieldObj.toJSONString(), SysSjglSjzd.class);
            //设置字段代码，统一用小写
            zd.setZddm(zd.getZddm().toLowerCase());
            if(oldFiledMap.containsKey(zd.getZddm())){
                //存在的字段
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
            //TODO 要改为通用新增方法，保存该字段
            sqlManager().insertTemplate(zd);
            oldFiledMap.put(zd.getZddm(), null);
        }
        if(fieldsList.isEmpty()&&oldFiledMap.isEmpty()){
            return failed("没有查询到字段信息，请确认数据载体是否选择正确");
        }else{
            return success(jtdx.getDxmc()+"导入字段数："+count);
        }
    }
}
