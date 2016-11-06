/**
* Project Name:KettleUtil
* Date:2016年6月29日
* Copyright (c) 2016, jingma All Rights Reserved.
*/

package net.oschina.kettleutil.utilrun;

import net.oschina.kettleutil.KettleUtilRunBase;
import net.oschina.mytuils.KettleUtils;

import org.pentaho.di.core.row.RowMetaInterface;
import org.pentaho.di.core.row.ValueMeta;
import org.pentaho.di.core.variables.VariableSpace;
import org.pentaho.di.trans.TransMeta;
import org.pentaho.di.trans.step.StepMeta;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * kettle util 运行示例<br/>
 * date: 2016年6月29日 <br/>
 * @author jingma
 * @version 
 */
public class KurDemo extends KettleUtilRunBase{
    /**
    * 具体处理每一行数据
    * @see net.oschina.kettleutil.KettleUtilRunBase#disposeRow(java.lang.Object[])
    */
    @Override
    protected void disposeRow(Object[] outputRow) {
        //设置JOB名称
        outputRow[getFieldIndex("JOB_NAME")] = KettleUtils.getRootJobName(ku);
    }
    /**
    * 
    * @see net.oschina.kettleutil.KettleUtilRunBase#init()
    */
    @Override
    protected void init() {
        ku.logBasic("初始化插件");
    }
    /**
    * 
    * @see net.oschina.kettleutil.KettleUtilRunBase#end()
    */
    @Override
    protected void end() {
        ku.logBasic("数据处理结束");
    }

    /**
     * 
     * @see net.oschina.kettleutil.KettleUtilRunBase#getDefaultConfigInfo(org.pentaho.di.trans.TransMeta, java.lang.String)
     */
     @Override
     public String getDefaultConfigInfo(TransMeta transMeta, String stepName) throws Exception{
        //创建一个JSON对象，用于构建配置对象，避免直接拼字符串构建JSON字符串
        JSONObject params = new JSONObject();
        //设置一个参数key1
        params.put("key1", "");
        RowMetaInterface fields = transMeta.getPrevStepFields(stepName);
        if(fields.size()==0){
            throw new RuntimeException("没有获取到上一步骤的字段，请确认连接好上一步骤");
        }
        params.put("PrevInfoFields", fields.toString());
        //创建一个JSON数组对象，用于存放数组参数
        JSONArray arr = new JSONArray();
        arr.add("arr1");
        arr.add("arr2");
        params.put("array", arr);
        //生成的参数样例
        //{
        //  "array":[
        //          "arr1",
        //          "arr2"
        //  ],
        //  "key1":""
        //}
        //返回格式化后的默认JSON配置参数，供使用者方便快捷的修改配置
        return JSON.toJSONString(params, true);
    }
    
    public void getFields(RowMetaInterface r, String origin, RowMetaInterface[] info, StepMeta nextStep, VariableSpace space) {
        //添加输出到下一步的字段
        addField(r,"JOB_NAME",ValueMeta.TYPE_STRING,ValueMeta.TRIM_TYPE_BOTH,origin,"JOB名称");
    }
}
