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
import cn.benma666.iframe.PageInfo;
import cn.benma666.iframe.Result;
import cn.benma666.myutils.DateUtil;
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
public class QyzsLjq extends DefaultLjq{
    /**
    * 用户查询条件缓存，按会话缓存
    */
    public static JSONObject tjhc = CacheFactory.use("qyzs-tjhc", CacheFactory.TYPE_MEMORY);
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#page(cn.benma666.domain.SysSjglSjdx, cn.benma666.myutils.PageInfo, java.lang.String, com.alibaba.fastjson.JSONObject)
    */
    @SuppressWarnings("unchecked")
    @Override
    public Result page(SysSjglSjdx sjdx, PageInfo<JSONObject> page,
            String defaultSql, JSONObject myParams) {
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        SysQxYhxx user = (SysQxYhxx)myParams.get(KEY_USER);
        JSONObject xzcxxParams = new JSONObject();
        JSONObject xzcxxSjdxP = new JSONObject();
        //设置全域智搜条件
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
        page.setPageSize(5000);
        page.setTotalRequired(true);
        page.setListRequired(false);
        List<JSONObject> list = new ArrayList<JSONObject>();
        JSONArray xzcxx = yobj.getJSONArray("xzcxx");
        if(xzcxx==null){
            return failed("请先选择搜索资源");
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
                //设置页大小为1000（单类资源最多查询1000条数据），调用分页方法获取数据
                Result result = DefaultLjq.getDefaultSql(zySjdx, "qyzs", zyP);
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
    public Result plcl(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = myParams.getString(KEY_CLLX);
        switch (cllx) {
        case "azylbDcsj":
            SysQxYhxx user = (SysQxYhxx)myParams.get(KEY_USER);
            JSONObject yhtjP = tjhc.getJSONObject(user.getToken());
            if(yhtjP==null){
                return failed("你还没有进行查询操作，可能是会话过期，请先重新查询");
            }
            JSONObject yobj = yhtjP.getJSONObject(KEY_YOBJ);
            //设置分页信息
            PageInfo<JSONObject> page = new PageInfo<JSONObject>();
            //设置页大小为1000（单类资源最多查询1000条数据），调用分页方法获取数据
            page.setPageSize(10000);
            //不进行统计，提升性能
            page.setTotalRequired(false);
            page.setListRequired(true);
            JSONObject xzcxxSjdxP = yhtjP.getJSONObject("xzcxxSjdxP");
            JSONArray xzcxx = yobj.getJSONArray("xzcxx");
            int sheetNum = 1;
            //输出字节流
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            ExcelWriter writer = new ExcelWriter(out, ExcelTypeEnum.XLSX, false);
            for(JSONObject cxx : xzcxx.toArray(new JSONObject[xzcxx.size()])){
                if(StringUtil.isNotBlank(cxx.getString("sjdx"))){
                    JSONObject zyP = xzcxxSjdxP.getJSONObject(cxx.getString("sjdx"));
                    SysSjglSjdx zySjdx = (SysSjglSjdx) zyP.get(KEY_SJDX);
                    //这个查询需要改为异步统计
                    //设置页大小为1000（单类资源最多查询1000条数据），调用分页方法获取数据
                    Result result = DefaultLjq.getDefaultSql(zySjdx, "qyzs", zyP);
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
                        List<List<String>> data = new ArrayList<List<String>>();
                        List<String> showCol = new ArrayList<String>();
                        List<String> row = new ArrayList<String>();
                        data.add(row);
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
                        Sheet sheet1 = new Sheet(sheetNum++, 0);
                        sheet1.setSheetName(cxx.getString("mc"));
                        sheet1.setAutoWidth(true);
                        sheet1.setStartRow(-1);
                        writer.write0(data, sheet1);
                    } catch (Exception e) {
                        log.error("导出失败:"+zyP, e);
                        return failed("导出失败："+e.getMessage());
                    }
                }
            }
            writer.finish();
            SysSjglFile file1 = new SysSjglFile();
            file1.setWjlx("xlsx");
            file1.setWjm("全域智搜-按资源类别导出-"+DateUtil.getGabDate()+".xlsx");
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
