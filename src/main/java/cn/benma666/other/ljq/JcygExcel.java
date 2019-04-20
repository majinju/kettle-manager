/**
 * Project Name:cqqb2
 * Date:2018年7月19日
 * Copyright (c) 2018, jingma All Rights Reserved.
 */

package cn.benma666.other.ljq;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.benma666.exception.ExcelReadException;
import cn.benma666.myutils.ExcelReader;
import cn.benma666.myutils.StringUtil;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 机场员工excel处理<br/>
 * date: 2018年7月19日 <br/>
 * 
 * @author jingma
 * @version
 */
public class JcygExcel extends ExcelReader {
    public Log log = LogFactory.getLog(getClass());
    /**
     * 员工社会关系，模板中固定5个关系
     */
    public String[] shgxHeard = {};
    /**
     * 员工社会关系校验规则
     */
    public String[] shgxRule = {};
    

    public JcygExcel() {
        super();
    }

    public JcygExcel(String excelPath, String heards, String fields,
            String rules, int startRow,String shgxHeard,String shgxRule) {
        this(excelPath, heards.split(","), fields.split(","), rules.split(","), 
                startRow, shgxHeard.split(","), shgxRule.split(","));
    }

    public JcygExcel(String excelPath, String[] heards, String[] fields,
            String[] rules, int startRow,String[] shgxHeard,String[] shgxRule) {
        super(excelPath, heards, fields, rules, startRow);
        this.shgxHeard = shgxHeard;
        this.shgxRule = shgxRule;
    }


    /**
     * 处理具体每一行数据 <br/>
     * 
     * @author jingma@iflytek.com
     * @param rowList
     *            具体数据行
     */
    protected JSONObject doRow(List<String> rowList) throws RuntimeException {
        JSONObject jcgy = super.doRow(rowList);
        //开始包装数据
        int idx = fields.length;
        
        //读取社会关系
        JSONArray shgxs = new JSONArray();
        int gxs=0;
        while(gxs<5){
            if(StringUtil.isBlank(rowList.get(idx))){
                break;
            }
            JSONObject shgx = new JSONObject();
            for(int i=0;i<shgxHeard.length;i++){
                String j = shgxHeard[i];
                shgx.put(j, ruleVerify(idx,rowList.get(idx),heards[idx],shgxRule[i]));
                idx++;
            }
            shgxs.add(shgx);
            gxs++;
        }
        if(gxs<2){
            throw new ExcelReadException("最少录入两个关系信息");
        }
        jcgy.put("shgxs", shgxs);
        return jcgy;
    }

}
