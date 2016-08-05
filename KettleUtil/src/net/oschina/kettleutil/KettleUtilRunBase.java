/**
* Project Name:KettleUtil
* Date:2016年7月6日下午4:25:59
* Copyright (c) 2016, jingma All Rights Reserved.
*/

package net.oschina.kettleutil;

import net.oschina.mytuils.KettleUtils;

import org.apache.commons.lang3.StringUtils;
import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.core.row.RowDataUtil;
import org.pentaho.di.core.row.RowMetaInterface;
import org.pentaho.di.core.row.ValueMeta;
import org.pentaho.di.core.row.ValueMetaInterface;
import org.pentaho.di.core.variables.VariableSpace;
import org.pentaho.di.job.Job;
import org.pentaho.di.trans.Trans;
import org.pentaho.di.trans.step.StepMeta;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * kettleUtil插件扩展基础类 <br/>
 * 要运用于该插件的类必须继承这个类<br/>
 * date: 2016年7月6日 <br/>
 * @author jingma
 * @version 
 */
public abstract class KettleUtilRunBase {
    /**
    * kettleUtil控件
    */
    protected KettleUtil ku;
    protected KettleUtilMeta meta;
    protected KettleUtilData data;
    /**
    * 配置信息
    */
    protected JSONObject configInfo;
    /**
     * Creates a new instance of KettleUtilRunBase.
     */
    public KettleUtilRunBase() {
    }

    /**
    * 获取本步骤的输出字段 <br/>
    * @author jingma
    * @param r
    * @param origin
    * @param info
    * @param nextStep
    * @param space
    */
    public abstract void getFields(RowMetaInterface r, String origin, RowMetaInterface[] info, StepMeta nextStep, VariableSpace space);

    /**
    * 开始处理每一行数据 <br/>
    * @author jingma
    * @return 
    * @throws KettleException 
    */
    public boolean run() throws KettleException{
        Object[] r = ku.getRow(); // get row, blocks when needed!
        if (r == null) // no more input to be expected...
        {
            return end();
        }
        getFields(data.outputRowMeta, ku.getStepname(), null, null, ku);
        init();
        //创建输出记录
        Object[] outputRow = RowDataUtil.createResizedCopy( r, data.outputRowMeta.size() );
        disposeRow(outputRow);
        //将该记录设置到下一步骤的读取序列中
        ku.putRow(data.outputRowMeta, outputRow); // copy row to possible alternate rowset(s)
        return true;
        
    }

    /**
    * 处理具体每一行数据 <br/>
    * @author jingma
    * @param outputRow
    */
    protected void disposeRow(Object[] outputRow) {
        
    }

    /**
    * 初始化工作 <br/>
    * @author jingma
    */
    protected void init() {
        if (!ku.first) {
            return;
        }
        ku.first = false;
    }

    /**
    * 结束工作 <br/>
    * @author jingma
    * @return
    */
    protected boolean end() {
        ku.setOutputDone();
        return false;
    }

    /**
    * 添加字段 <br/>
    * @author jingma
    * @param r 行
    * @param name 字段名称
    * @param type 类型
    * @param trimType 去除空白规则
    * @param origin 宿主
    * @param comments 描述
    */
    protected void addField(RowMetaInterface r, String name, int type,
            int trimType, String origin, String comments) {
        addField(r, name, type, trimType, origin,comments, 0);
    }
    /**
    * 添加字段 <br/>
    * @author jingma
    * @param r 行
    * @param name 字段名称
    * @param type 类型
    * @param trimType 去除空白规则
    * @param origin 宿主
    * @param comments 描述
    * @param length 长度
    */
    @SuppressWarnings("deprecation")
    protected void addField(RowMetaInterface r, String name, int type,
            int trimType, String origin, String comments, int length) {
        ValueMetaInterface v = new ValueMeta();
        v.setName(name.toUpperCase());
        v.setType(type);
        v.setTrimType(trimType);
        v.setOrigin(origin);
        v.setComments(comments);
        if(length>0){
            v.setLength(length);
        }
        r.addValueMeta(v);
    }
    /**
    * 获取输出字段在数组中的下标 <br/>
    * @author jingma
    * @param field 字段名称
    * @return 下标
    */
    public int getFieldIndex(String field){
        return data.outputRowMeta.indexOfValue(field.toUpperCase());
    }
    
    /**
    * 设置变量到根作业 <br/>
    * @author jingma
    * @param variableName 变量名
    * @param variableValue 变量值
    */
    public void setVariableRootJob(String variableName,String variableValue){
        ku.setVariable(variableName, variableValue);
        Trans trans = ku.getTrans();
        while(trans.getParentTrans()!=null){
            trans.setVariable(variableName, variableValue);
            trans = trans.getParentTrans();
        }
        trans.setVariable(variableName, variableValue);
        Job job = trans.getParentJob();
        while(job!=null){
            job.setVariable(variableName, variableValue);
            job = job.getParentJob();
        }
    }
    /**
    * 从根job获取变量 <br/>
    * @author jingma
    * @param variableName 变量名
    * @return 变量值
    */
    public String getVariavle(String variableName){
        return KettleUtils.getProp(ku,variableName);
    }
    /**
     * @return ku 
     */
    public KettleUtil getKu() {
        return ku;
    }

    /**
     * @param ku the ku to set
     */
    public void setKu(KettleUtil ku) {
        this.ku = ku;
    }

    /**
     * @return meta 
     */
    public KettleUtilMeta getMeta() {
        return meta;
    }

    /**
     * @param meta the meta to set
     * @param space 
     */
    public void setMeta(KettleUtilMeta meta, VariableSpace space) {
        this.meta = meta;
        //将配置信息解析成josn对象,支持变量
        if(StringUtils.isNotBlank(meta.getConfigInfo())){
            setConfigInfo(JSON.parseObject(space.environmentSubstitute(meta.getConfigInfo())));
        }
    }

    /**
     * @return data 
     */
    public KettleUtilData getData() {
        return data;
    }

    /**
     * @param data the data to set
     */
    public void setData(KettleUtilData data) {
        this.data = data;
    }

    /**
     * @return configInfo 
     */
    public JSONObject getConfigInfo() {
        return configInfo;
    }

    /**
     * @param configInfo the configInfo to set
     */
    public void setConfigInfo(JSONObject configInfo) {
        this.configInfo = configInfo;
    }
}
