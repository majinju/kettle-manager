/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.other.ljq;

import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglFile;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.CacheFactory;
import cn.benma666.iframe.DictManager;
import cn.benma666.myutils.DateUtil;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.PageInfo;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;

import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.metadata.Sheet;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 批量比对-拦截器 <br/>
 * @author jingma
 * @version 
 */
public class PlbdLjq extends DefaultLjq{
    /**
    * 用户查询条件缓存，按会话缓存
    */
    public static JSONObject tjhc = CacheFactory.use("plbd-tjhc", CacheFactory.TYPE_MEMORY);
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#page(cn.benma666.domain.SysSjglSjdx, cn.benma666.myutils.PageInfo, java.lang.String, com.alibaba.fastjson.JSONObject)
    */
    @SuppressWarnings("unchecked")
    @Override
    public JsonResult page(SysSjglSjdx sjdx, PageInfo<JSONObject> page,
            String defaultSql, JSONObject myParams) {
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        SysQxYhxx user = (SysQxYhxx)myParams.get(KEY_USER);
        JSONObject xzcxxParams = new JSONObject();
        JSONObject xzcxxSjdxP = new JSONObject();
        //设置全域智搜条件
        String zjhm = yobj.getString("zjhm").replace("\r", "");
        yobj.put("zjhmArray", zjhm.split("\n"));
        yobj.put("zjhmIn", " in ('"+zjhm.replace("\n", "','")+"')");
        myParams.put("qyzstj", yobj);
        //设置选中查询项的查询条件
        myParams.put("xzcxxParams", xzcxxParams);
        //设置选中查询项的参数对象
        myParams.put("xzcxxSjdxP", xzcxxSjdxP);
        //按登陆用户缓存查询条件
        tjhc.put(user.getToken(), myParams);
        //结构化选中查询项的参数
        for(Entry<String, Object> e:yobj.entrySet()){
            if(e.getKey().startsWith("xzcxx-")){
                String cxxid = e.getKey().substring(6, 12);
                JSONObject cxxp = xzcxxParams.getJSONObject(cxxid);
                if(cxxp==null){
                    cxxp = new JSONObject();
                    xzcxxParams.put(cxxid, cxxp);
                }
                cxxp.put(e.getKey().substring(13), e.getValue());
            }
        }
        page.setAutoCount(true);
        page.setQueryList(false);
        List<JSONObject> list = new ArrayList<JSONObject>();
        JSONArray xzcxx = yobj.getJSONArray("xzcxx");
        if(xzcxx==null){
            return error("请先选择搜索资源");
        }
        for(JSONObject cxx : xzcxx.toArray(new JSONObject[xzcxx.size()])){
            if(StringUtil.isNotBlank(cxx.getString("sjdx"))){
                //构建对象参数
                JSONObject zyP = (JSONObject) myParams.clone();
                zyP.putAll((JSONObject)getJcxxById(cxx.getString("sjdx")).getData());
                xzcxxSjdxP.put(cxx.getString("sjdx"), zyP);
                SysSjglSjdx zySjdx = (SysSjglSjdx) zyP.get(KEY_SJDX);
                JSONObject zyYobj = xzcxxParams.getJSONObject(cxx.getString("dm"));
                if(zyYobj==null){
                    zyYobj = new JSONObject();
                }
                //设置查询条件
                zyP.put(KEY_YOBJ, zyYobj);
                //这个查询需要改为异步统计
                JsonResult result = DefaultLjq.getDefaultSql(zySjdx, "plbd", zyP);
                if(!result.isStatus()){
                    return result;
                }
                String ds = result.getMsg();
                result = super.page(zySjdx, page, ds, zyP);
                if(!result.isStatus()){
                    return result;
                }
                page = (PageInfo<JSONObject>) result.getData();
                cxx.put("sjl", page.getRecordCount()+"");
                list.add(cxx);
            }
        }
        page.setList(list);
        page.setRecordCount(list.size());
        //结果处理
        return success("查询成功", page);
    }
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#getdata(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @SuppressWarnings("unchecked")
    @Override
    public JsonResult plcl(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = myParams.getString(KEY_CLLX);
        switch (cllx) {
        case "dcsj":
            SysQxYhxx user = (SysQxYhxx)myParams.get(KEY_USER);
            JSONObject yhtjP = tjhc.getJSONObject(user.getToken());
            if(yhtjP==null){
                return error("你还没有进行查询操作，可能是会话过期，请先重新查询");
            }
            JSONObject yobj = yhtjP.getJSONObject(KEY_YOBJ);
            //设置分页信息
            PageInfo<JSONObject> page = new PageInfo<JSONObject>();
            //设置页大小为1000（单类资源最多查询1000条数据），调用分页方法获取数据
            page.setPageSize(10000);
            //不进行统计，提升性能
            page.setAutoCount(false);
            page.setQueryList(true);
            JSONObject xzcxxSjdxP = yhtjP.getJSONObject("xzcxxSjdxP");
            JSONArray xzcxx = yobj.getJSONArray("xzcxx");
            int sheetNum = 1;
            //输出字节流
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            ExcelWriter writer = new ExcelWriter(out, ExcelTypeEnum.XLSX, false);
            Sheet sheet1 = new Sheet(sheetNum++, 0);
            sheet1.setSheetName("Sheet1");
            sheet1.setAutoWidth(true);
            sheet1.setStartRow(-1);
            List<List<String>> data = new ArrayList<List<String>>();
            List<String> row = new ArrayList<String>();
            data.add(row);
            row.add("资源类别");
            row.add("证件号码");
            //先写入第一行表头
            writer.write0(data, sheet1);
            for(JSONObject cxx : xzcxx.toArray(new JSONObject[xzcxx.size()])){
                if(StringUtil.isNotBlank(cxx.getString("sjdx"))){
                    JSONObject zyP = xzcxxSjdxP.getJSONObject(cxx.getString("sjdx"));
                    SysSjglSjdx zySjdx = (SysSjglSjdx) zyP.get(KEY_SJDX);
                    //这个查询需要改为异步统计
                    //设置页大小为1000（单类资源最多查询1000条数据），调用分页方法获取数据
                    JsonResult result = DefaultLjq.getDefaultSql(zySjdx, "plbd", zyP);
                    if(!result.isStatus()){
                        return result;
                    }
                    String ds = result.getMsg();
                    result = super.page(zySjdx, page, ds, zyP);
                    if(!result.isStatus()){
                        return result;
                    }
                    page = (PageInfo<JSONObject>) result.getData();
                    //开始生成excel
                    try {
                        Map<String, JSONObject> fields = (Map<String, JSONObject>) zyP.get(KEY_FIELDS);
                        data = new ArrayList<List<String>>();
                        row = new ArrayList<String>();
                        data.add(row);
                        row.add(cxx.getString("mc"));
                        row.add("资源表头");
                        List<String> showCol = new ArrayList<String>();
                        for(Entry<String, JSONObject> f:fields.entrySet()){
                            if(f.getValue().getBoolean("xqzs")
                                    &&!f.getValue().getString("kjlx").equals("password")){
                                //详情展示且前端没有要求不导出且控件类型不是密码的字段才导出
                                row.add(f.getValue().getString("zdmc"));
                                showCol.add(f.getKey());
                            }
                        }
                        for(JSONObject r:page.getList()){
                            row = new ArrayList<String>();
                            data.add(row);
                            row.add(cxx.getString("mc"));
                            row.add(r.getString(zySjdx.get("ZJHMZD").toString()));
                            for(String f:showCol){
                                String kjlx = fields.get(f).getString("kjlx");
                                if(ZD_SJDX_KJLX_DICT.equals(kjlx)||ZD_SJDX_KJLX_CHECKBOX.equals(kjlx)){
                                    row.add(DictManager.zdMcByMoreDm(fields.get(f).getString("zdzdlb"), r.getString(f)));
                                }else if(ZD_SJDX_KJLX_TIME.equals(kjlx)){
                                    row.add(DateUtil.doFormatDate(DateUtil.parseDate(r.getString(f)), DateUtil.DATE_FORMATTER_L));
                                }else{
                                    row.add(r.getString(f));
                                }
                            } 
                        }
                        writer.write0(data, sheet1);
                    } catch (Exception e) {
                        log.error("导出失败:"+zyP, e);
                        return error("导出失败："+e.getMessage());
                    }
                }
            }
            writer.finish();
            SysSjglFile file1 = new SysSjglFile();
            file1.setWjlx("xlsx");
            file1.setWjm("批量比对导出-"+DateUtil.getGabDate()+".xlsx");
            file1.setXzms(true);
            JSONObject r1 = new JSONObject();
            r1.put(KEY_FILE_BYTES, out.toByteArray());
            r1.put(KEY_FILE_OBJ, file1);
            return success("获取文件成功",r1);
        default:
            return super.getdata(sjdx, myParams);
        }
    }
}
