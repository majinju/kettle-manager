/**
 * Project Name:cqqb2
 * Date:2018年7月19日
 * Copyright (c) 2018, jingma All Rights Reserved.
 */

package cn.benma666.other.ljq;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.exception.ExcelReadException;
import cn.benma666.myutils.ExcelReader;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.LjqInterface;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 机场员工excel处理<br/>
 * date: 2018年7月19日 <br/>
 * @author jingma
 * @version
 */
public class JcygExcel extends ExcelReader {
    public Log log = LogFactory.getLog(getClass());
    /**
    * 员工字段
    */
    private Map<String, JSONObject> ygFields;
    /**
    * 社会关系字段
    */
    private Map<String, JSONObject> shgxFields;
    /**
    * 社会关系对象参数
    */
    private JSONObject shgxParams;
    /**
    * 员工模板字段数
    */
    private int ygmbzds;
    /**
    * 社会关系模板字段
    */
    private Map<String,JSONObject> shgxmbField;
    

    public JcygExcel() {
        super();
    }

    /**
    * Creates a new instance of JcygExcel.
    * @param sjdx 数据对象
    * @param myParams 相关参数
    * @param fileObj 文件对象
    */
    @SuppressWarnings("unchecked")
    public JcygExcel(SysSjglSjdx sjdx, JSONObject myParams, JSONObject fileObj) {
        excelPath = fileObj.getString("sclj");
        ygFields = (Map<String, JSONObject>) myParams.get(LjqInterface.KEY_FIELDS);
        shgxParams = (JSONObject) DefaultLjq.getJcxxByDxdm("JCGA_JCYG_SHGX").getData();
        shgxFields = (Map<String, JSONObject>) shgxParams.get(LjqInterface.KEY_FIELDS);
        for(JSONObject f:ygFields.values()){
            if(f.getBooleanValue("mbzs")){
                this.fields.put(f.getString("zddm"),f);
            }
        }
        shgxmbField = new LinkedHashMap<String, JSONObject>();
        for(JSONObject f:shgxFields.values()){
            if(f.getBooleanValue("mbzs")){
                shgxmbField.put(f.getString("zddm"),(JSONObject) f.clone());
            }
        }
        ygmbzds = this.fields.size();
        for(int i=0;i<5;i++){
            //模板中支持五个关系
            for(JSONObject f:shgxFields.values()){
                if(f.getBooleanValue("mbzs")){
                    //关系移除非空判断
                    f.put("hdyzgz", f.getString("hdyzgz").replace("notNull", ""));
                    this.fields.put(i+"_"+f.getString("zddm"),f);
                }
            }
        }
        startRow=1;
    }

    /**
     * 处理具体每一行数据 <br/>
     * @author jingma
     * @param rowList 具体数据行
     */
    protected JSONObject doRow(List<String> rowList) throws RuntimeException {
        JSONObject jcyg = super.doRow(rowList);
        //开始包装数据
        int idx = ygmbzds;
        
        //读取社会关系
        JSONArray shgxs = new JSONArray();
        int gxs=0;
        while(gxs<5){
            if(StringUtil.isBlank(jcyg.getString(gxs+"_shgx"))){
                //关系为空则认为没有关系了
                break;
            }
            JSONObject shgx = new JSONObject();
            for(Entry<String, JSONObject> e:shgxmbField.entrySet()){
                shgx.put(e.getKey(), ruleVerify(idx,jcyg.getString(gxs+"_"+e.getKey()),e.getValue()));
                jcyg.remove(gxs+"_"+e.getKey());
                idx++;
            }
            shgxs.add(shgx);
            gxs++;
        }
        if(gxs<2){
            throw new ExcelReadException("最少录入两个关系信息");
        }
        jcyg.put("shgxs", shgxs);
        return jcyg;
    }

}
