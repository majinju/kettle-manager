package com.iflytek.qb.yxjk;

import java.util.HashMap;
import java.util.Map;

import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.core.row.RowDataUtil;
import org.pentaho.di.core.row.RowMetaInterface;
import org.pentaho.di.core.variables.VariableSpace;
import org.pentaho.di.trans.TransMeta;
import org.pentaho.di.trans.step.StepMeta;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.iflytek.qb.util.StringUtil;
import com.iflytek.qb.util.TmplUtil;

import cn.benma666.kettle.mytuils.KettleUtils;
import cn.benma666.kettle.steps.easyexpand.EasyExpandRunBase;

public class YxjkXxmb extends EasyExpandRunBase{
	private static final String PARAM_HFXXYCYY = "监控任务恢复消息异常原因";
	private static final String JKRW_YCYY = "ycyy";
	private static final String JKRW_RWDJ = "rwdj";
	private static final String JKRW_XXDJ = "xxdj";
	private static final String JKRW_XXLX = "xxlx";
	private static final String JKRW_XXMB = "xxmb";
	private static final String JKRW_CLFK = "clfk";
	private static final String XX_XXNR = "xxnr";
	
	/**
	 * 其它-是否生成预警：0-否、1-是
	 */
	public final static String QT_SFSCYJ = "sfscyj";
	
	/**
	 * 消息模板
	 */
	public static String xxmb_ = "";
	
	/**
    * 开始处理每一行数据 <br/>
    * @author jingma
    * @return 
    * @throws KettleException 
    */
    public boolean run() throws Exception{
        Object[] r = ku.getRow(); // get row, blocks when needed!
        if (r == null) // no more input to be expected...
        {
            end();
            ku.setOutputDone();
            return false;
        }
        if (ku.first) {
            data.outputRowMeta = (RowMetaInterface) ku.getInputRowMeta().clone();
            getFields(data.outputRowMeta, ku.getStepname(), null, null, ku);
            ku.first = false;
            init(ku);
        }
        //创建输出记录
        Object[] outputRow = RowDataUtil.createResizedCopy( r, data.outputRowMeta.size() );
        disposeRow(outputRow);
        //将该记录设置到下一步骤的读取序列中
        ku.putRow(data.outputRowMeta, outputRow); // copy row to possible alternate rowset(s)
        return true;
    }
    
    /**
     * 获取消息模板
     * @param space
     */
    protected void init(VariableSpace space){
    	xxmb_ = KettleUtils.getProp(space,"xxmb");
    }
	
	/**
    * 处理具体每一行数据 <br/>
    * @author jingma
    * @param outputRow
    */
    protected void disposeRow(Object[] outputRow) throws Exception{
    	String sfscyj = "";
    	if(outputRow[getFieldIndex(QT_SFSCYJ)]!=null){
    		sfscyj = outputRow[getFieldIndex(QT_SFSCYJ)].toString();
    	}
    	if("1".equals(sfscyj)){
    		String xxmb = "";	//监控任务的信息模板，后面可能单独处理
        	if(outputRow[getFieldIndex(JKRW_XXMB)] != null){
        		xxmb = outputRow[getFieldIndex(JKRW_XXMB)].toString();
        	}
        	if(StringUtil.isBlank(xxmb)){
        		xxmb = xxmb_;
        	}
    		//String jkrwid = outputRow[getFieldIndex("id")].toString();		//监控任务id
    		//Map<String,Object> values = YxjkInit.jkrwMap.get(jkrwid);
        	//恢复消息时，单独处理异常原因和消息等级
    		if(outputRow[getFieldIndex(JKRW_XXLX)]!=null
    				&&"2".equals(outputRow[getFieldIndex(JKRW_XXLX)].toString())){
    			outputRow[getFieldIndex(JKRW_XXDJ)] = outputRow[getFieldIndex(JKRW_RWDJ)];
    			outputRow[getFieldIndex(JKRW_YCYY)] = configInfo.getString(PARAM_HFXXYCYY);
    		}
    		outputRow[getFieldIndex(XX_XXNR)] = getMsg(xxmb,getValues(outputRow));
    		outputRow[getFieldIndex(JKRW_CLFK)] = getMsg(xxmb,getValues(outputRow));
    	}else{
    		//处理反馈字段映射
    		outputRow[getFieldIndex(XX_XXNR)] = "";
    	}
    }
    
    /**
     * 组模板值
     * @param outputRow
     */
    public Map<String,Object> getValues(Object[] outputRow){
    	Map<String,Object> values = new HashMap<String,Object>();
    	//将源数据流中的数据放入map中 
    	for(String field : data.outputRowMeta.getFieldNames()){
    		if(outputRow[getFieldIndex(field)]!=null){
    			values.put(field, outputRow[getFieldIndex(field)].toString());
    		}
    	}
    	return values;
    }
    
    
    /**
     * 填充模板
     * @param xxmb
     * @param values
     * @return
     */
    private String getMsg(String xxmb,Map<String,Object> values){
    	return TmplUtil.buildStr(xxmb, values);
    }
    
    @Override
	public String getDefaultConfigInfo(TransMeta transMeta, String stepName) throws Exception {
		//创建一个JSON对象，用于构建配置对象，避免直接拼字符串构建JSON字符串
        JSONObject params = new JSONObject();
        params.put(PARAM_HFXXYCYY, "异常恢复");
		return JSON.toJSONString(params, true);
	}

	@Override
	public void getFields(RowMetaInterface r, String origin, RowMetaInterface[] info, StepMeta nextStep,
			VariableSpace space) {
	}

	

}
