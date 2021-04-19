package com.iflytek.qb.yxjk;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.core.logging.LogChannelInterface;
import org.pentaho.di.core.row.RowDataUtil;
import org.pentaho.di.core.row.RowMetaInterface;
import org.pentaho.di.core.row.ValueMeta;
import org.pentaho.di.core.variables.VariableSpace;
import org.pentaho.di.trans.TransMeta;
import org.pentaho.di.trans.step.StepMeta;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.iflytek.qb.util.StringUtil;

import cn.benma666.kettle.mytuils.Db;
import cn.benma666.kettle.steps.easyexpand.EasyExpandRunBase;

public class YxjkXxts extends EasyExpandRunBase{
	/**
	 * 用户信息Map<主键,用户信息>，单独作业进行用户信息加载
	 */
	public static Map<String,JSONObject> yhMap = new HashMap<String,JSONObject>();
	
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
            init(ku.getLogChannel());
        }
        //创建输出记录
        Object[] outputRow = RowDataUtil.createResizedCopy( r, data.outputRowMeta.size() );
        disposeRow(outputRow);
        //将该记录设置到下一步骤的读取序列中
        ku.putRow(data.outputRowMeta, outputRow); // copy row to possible alternate rowset(s)
        return true;
    }
    
    /**
     * 初始化
     * @param log
     */
    public static void init(LogChannelInterface log){
    	if(yhMap.isEmpty()){
    		loadYhxx(log);
    	}
    }
	
	/**
	 * 加载运行监控用户信息
	 * @param log 
	 * @param ku 
	 */
	public static void loadYhxx(LogChannelInterface log){
		Map<String,JSONObject> map = new HashMap<String,JSONObject>();
		//查询用户信息
		List<JSONObject> resultList = YxjkInit.jkdb.find("zdry.selectYhxx", Db.buildMap());
		//List<JSONObject> resultList = zkdb.find(sql);
		log.logBasic("-------------------------------->运行监控用户信息加载数据："+resultList.size()+"条");
		//不为空
		if(resultList.size()>0){
			//根据比对号码来划分布控人员数据
			for(JSONObject json:resultList){
				String id = json.getString("id");
				map.put(id, json);
			}
			yhMap = map;
		}
		log.logBasic("-------------------------------->运行监控用户信息数据加载载体Map的size："+yhMap.size());
	}
	
	/**
    * 处理具体每一行数据 <br/>
    * @author jingma
    * @param outputRow
    */
    protected void disposeRow(Object[] outputRow) throws Exception{
    	//逗号间隔
    	String lxrdms = "";
    	if(null != outputRow[getFieldIndex("lxrdm")]){
    		lxrdms = outputRow[getFieldIndex("lxrdm")].toString();
    	}
    	String phone = "";
    	if(StringUtil.isNotBlank(lxrdms)){
    		String[] lxrdm = lxrdms.split(",");
    		//拼接发送信息的号码
    		for(String id :lxrdm){
    			if(yhMap.containsKey(id)){
    				String lxdh = yhMap.get(id).getString("lxdh");//联系电话
    				if(StringUtil.isNotBlank(lxdh)){
    					phone = phone + lxdh + "0";
    				}
    			}
    		}
    	}
    	//手机号码
    	if(StringUtil.isNotBlank(phone)){
    		outputRow[getFieldIndex("phone")] = phone.substring(0, phone.length()-1);
    		outputRow[getFieldIndex("sffsdx")] = "1";
    	}else{
    		outputRow[getFieldIndex("sffsdx")] = "0";
    	}
    }
	
	@Override
	public String getDefaultConfigInfo(TransMeta transMeta, String stepName) throws Exception {
		//创建一个JSON对象，用于构建配置对象，避免直接拼字符串构建JSON字符串
        JSONObject params = new JSONObject();
		return JSON.toJSONString(params, true);
	}
	
	@Override
	public void getFields(RowMetaInterface r, String origin, RowMetaInterface[] info, StepMeta nextStep,
			VariableSpace space) {
		addField(r,"phone",ValueMeta.TYPE_STRING,ValueMeta.TRIM_TYPE_BOTH,origin,"手机号码");
		addField(r,"sffsdx",ValueMeta.TYPE_STRING,ValueMeta.TRIM_TYPE_BOTH,origin,"是否发送短信");
	}

}
