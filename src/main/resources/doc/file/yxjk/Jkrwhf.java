package com.iflytek.qb.yxjk;

import org.pentaho.di.core.row.RowMetaInterface;
import org.pentaho.di.core.variables.VariableSpace;
import org.pentaho.di.trans.step.StepMeta;

import com.alibaba.fastjson.JSONObject;

import cn.benma666.kettle.steps.easyexpand.EasyExpandRunBase;

public class Jkrwhf extends EasyExpandRunBase{
	/**
	 * 处理具体每一行数据 <br/>
	 * @author jingma
	 * @param outputRow
	 */
	 protected void disposeRow(Object[] outputRow) throws Exception{
		 String jkrwid = outputRow[getFieldIndex("id")].toString();
		 JSONObject json = new JSONObject();
		 json.put("rwmc", outputRow[getFieldIndex("rwmc")].toString());
		 json.put("rwzt", outputRow[getFieldIndex("rwzt")].toString());
		 Jkrwzs.judgeZszt(jkrwid,json);
	 }
	

	@Override
	public void getFields(RowMetaInterface r, String origin, RowMetaInterface[] info, StepMeta nextStep,
			VariableSpace space) {
	}
}
