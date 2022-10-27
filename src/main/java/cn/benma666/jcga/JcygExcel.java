/**
 * Project Name:cqqb2
 * Date:2018年7月19日
 * Copyright (c) 2018, jingma All Rights Reserved.
 */

package cn.benma666.jcga;

import cn.benma666.constants.UtilConst;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglFile;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.domain.SysSjglSjzd;
import cn.benma666.iframe.VerifyRule;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjsj.web.LjqInterface;
import cn.benma666.sjsj.web.LjqManager;
import cn.benma666.sjsj.web.SjdxExcelReader;
import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.util.TypeUtils;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/**
 * 机场员工excel处理<br/>
 * date: 2018年7月19日 <br/>
 * @author jingma
 * @version 0.1
 */
public class JcygExcel extends SjdxExcelReader {
    /**
    * 员工模板字段数
    */
    private final int ygmbzds;
    /**
    * 社会关系模板字段
    */
    private final Map<String,SysSjglSjzd> shgxmbField;

    /**
    * 重复上传人员列表
    */
    private List<String> cfscryList = new ArrayList<>();
    /**
    * 已处理人员列表
    */
    private List<String> yclList = new ArrayList<>();

    /**
    * Creates a new instance of JcygExcel.
    * @param sjdx 数据对象
    * @param myParams 相关参数
    */
    public JcygExcel(SysSjglSjdx sjdx, JSONObject myParams, SysSjglFile fileObj, SysQxYhxx user) {
        super(sjdx, myParams, fileObj);
        /**
         * 员工字段
         */
        Map<String, SysSjglSjzd> ygFields = (Map<String, SysSjglSjzd>) myParams.get(LjqInterface.KEY_FIELDS);
        /**
         * 社会关系对象参数
         */
        JSONObject shgxParams = LjqManager.jcxxByDxdm("JCGA_JCYG_SHGX");
        /**
         * 社会关系字段
         */
        Map<String, SysSjglSjzd> shgxFields = (Map<String, SysSjglSjzd>) shgxParams.get(LjqInterface.KEY_FIELDS);
        for(SysSjglSjzd f: ygFields.values()){
            if(TypeUtils.castToBoolean(StringUtil.valByDef(f.getMbzs(),"0"))){
                this.fields.put(f.getZddm(),f);
            }
        }
        shgxmbField = new LinkedHashMap<String, SysSjglSjzd>();
        for(SysSjglSjzd f: shgxFields.values()){
            if(TypeUtils.castToBoolean(StringUtil.valByDef(f.getMbzs(),"0"))){
                shgxmbField.put(f.getZddm(),(SysSjglSjzd) f.clone());
            }
        }
        ygmbzds = this.fields.size();
        for(int i=0;i<5;i++){
            //模板中支持五个关系
            for(SysSjglSjzd f:shgxmbField.values()){
                f=(SysSjglSjzd) f.clone();
                //关系移除非空判断
//                f.put("hdyzgz", f.getString("hdyzgz").replace("notNull", ""));
                this.fields.put(i+"_"+f.getZddm(),f);
            }
        }
        //表头多了一行，从第一行开始
        setStartRow(1);

    }

    /**
     * 处理具体每一行数据 <br/>
     * @author jingma
     */
    @Override
    public void invoke(LinkedHashMap<Integer, String> rowMap, AnalysisContext context)
            throws RuntimeException {
        super.invoke(rowMap,context);
        JSONObject jcyg = result.getJSONObject(result.size() - 1);
        String sbglqtxz = jcyg.getString("sbglqtxz");
        String glqtxzlx = jcyg.getString("glqtxzlx");
        if(UtilConst.WHETHER_TRUE.equals(sbglqtxz)&&StringUtil.isBlank(glqtxzlx)){
            addError(-1, null, "申办隔离区通行证类型", "申办隔离区通行证必须选择申办隔离区通行证类型");
        }
        String kzqtxzlx = jcyg.getString("kzqtxzlx");
        if(UtilConst.WHETHER_TRUE.equals(jcyg.getString("kzqtxz"))&&StringUtil.isBlank(kzqtxzlx)){
            addError(-1, null, "已办隔离区证类型", "已办隔离区通行证必须选择已办隔离区通行证类型");
        }
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
            //获取备注信息
            boolean sfjy = true;
            String value = jcyg.getString(gxs+"_bz");
            if(StringUtil.isNotBlank(value)&&(value.startsWith("已经去世")
                    ||value.startsWith("已经离异")||value.startsWith("无法获取证件号码其他情况"))){
                sfjy = false;
            }
            JSONObject shgx = new JSONObject();
            for(Entry<String, SysSjglSjzd> e:shgxmbField.entrySet()){
                value = jcyg.getString(gxs+"_"+e.getKey());
                if(sfjy){
                    //不为空或需要校验
                    value = VerifyRule.ruleVerify(value, myParams,shgx,LjqInterface.KEY_CLLX_INSERT);
                }
                shgx.put(e.getKey(), value);
                jcyg.remove(gxs+"_"+e.getKey());
                idx++;
            }
            shgxs.add(shgx);
            gxs++;
        }
        if(((StringUtil.isNotBlank(glqtxzlx)&&glqtxzlx.indexOf("1")>-1)
                ||(StringUtil.isNotBlank(kzqtxzlx)&&kzqtxzlx.indexOf("1")>-1))
                &&gxs<2){
            addError(-1, null, "关系人", "长期证至少需要录入两个关系信息");
        }
        jcyg.put("shgxs", shgxs);
    }

    /**
     * @return cfscryList
     */
    public List<String> getCfscryList() {
        return cfscryList;
    }

    /**
     * @param cfscryList the cfscryList to set
     */
    public void setCfscryList(List<String> cfscryList) {
        this.cfscryList = cfscryList;
    }

    /**
     * @return yclList
     */
    public List<String> getYclList() {
        return yclList;
    }

    /**
     * @param yclList the yclList to set
     */
    public void setYclList(List<String> yclList) {
        this.yclList = yclList;
    }

}
