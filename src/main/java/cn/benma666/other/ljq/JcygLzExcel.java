/**
 * Project Name:cqqb2
 * Date:2018年7月19日
 * Copyright (c) 2018, jingma All Rights Reserved.
 */

package cn.benma666.other.ljq;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.myutils.ExcelReader;
import cn.benma666.sjgl.LjqInterface;

import com.alibaba.fastjson.JSONObject;

/**
 * 机场员工离职excel处理<br/>
 * date: 2018年7月19日 <br/>
 * @author jingma
 * @version
 */
public class JcygLzExcel extends ExcelReader {
    public Log log = LogFactory.getLog(getClass());
    /**
    * 员工字段
    */
    private Map<String, JSONObject> ygFields;

    public JcygLzExcel() {
        super();
    }

    /**
    * Creates a new instance of JcygExcel.
    * @param sjdx 数据对象
    * @param myParams 相关参数
    */
    @SuppressWarnings("unchecked")
    public JcygLzExcel(SysSjglSjdx sjdx, JSONObject myParams,JSONObject fileObj,SysQxYhxx user) {
        super(sjdx, myParams, fileObj, user);
        ygFields = (Map<String, JSONObject>) myParams.get(LjqInterface.KEY_FIELDS);
        for(JSONObject f:ygFields.values()){
            if(f.getBooleanValue("mbzs")){
                this.fields.put(f.getString("zddm"),f);
            }
        }
        //批量时不进行身份证查重
        pcgzMap.put("gmsfhm", "zdpd");
    }

    /**
     * 处理具体每一行数据 <br/>
     * @author jingma
     * @param rowList 具体数据行
     */
    protected JSONObject doRow(List<String> rowList) throws RuntimeException {
        JSONObject jcyg = super.doRow(rowList);
        return jcyg;
    }

}
