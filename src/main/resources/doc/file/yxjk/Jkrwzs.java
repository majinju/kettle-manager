package com.iflytek.qb.yxjk;

import java.util.ArrayList;
import java.util.List;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;

import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.core.row.RowDataUtil;
import org.pentaho.di.core.row.RowMetaInterface;
import org.pentaho.di.core.row.ValueMeta;
import org.pentaho.di.core.variables.VariableSpace;
import org.pentaho.di.trans.step.StepMeta;

import com.alibaba.fastjson.JSONObject;
import com.iflytek.qb.util.StringUtil;

import cn.benma666.kettle.steps.easyexpand.EasyExpand;
import cn.benma666.kettle.steps.easyexpand.EasyExpandData;
import cn.benma666.kettle.steps.easyexpand.EasyExpandRunBase;

/**
 * 依赖的监控任务此次还未执行监控时，会阻塞此监控任务。将此监控任务信息放入内存中进行等待，待所有依赖作业完成才进行此监控任务的执行
 * @date 2019年1月10日下午4:45:00
 */
public class Jkrwzs extends EasyExpandRunBase{
	/**
    * kettleUtil控件
    */
    protected static EasyExpand kucopy;
    protected static EasyExpandData datacopy;
	/**
	 * 监控任务-依赖任务状态
	 */
	private static final String JKRW_YLRWZT = "ylrwzt";
	/**
	 * 监控任务-异常依赖任务：如果依赖任务异常的话，将依赖任务名称放入此字段中；如果依赖任务正常，此字段为空
	 */
	private static final String JKRW_YCYLRW = "ycylrw";
	/**
	 * 监控任务-任务批次号
	 */
	private static final String JKRW_RWPCH = "rwpch";
	/*** 监控任务-任务状态：0-未知*/
	public final static String RWZT_WZ = "0";
	/*** 监控任务-任务状态：1-正常*/
	public final static String RWZT_ZC = "1";
	/*** 监控任务-任务状态：2-本身异常*/
	public final static String RWZT_BSYC = "2";
	/*** 监控任务-任务状态：3-依赖异常*/
	public final static String RWZT_YLYC = "3";
	/*** 监控任务-任务状态：4-已知异常*/
	public final static String RWZT_YZYC = "4";
	/**
	 * map<监控任务id,list<依赖任务id>>，将批次号不同的依赖任务id放入list中
	 */
	public static ConcurrentHashMap<String,List<String>> zsMap = new ConcurrentHashMap<String,List<String>>();
	/**
	 * 阻塞任务解除+1，计数标识
	 */
	public static int count = 0;
	/**
	 * 死循环关闭
	 */
	public static boolean flag = true;
	
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
            init();
        }
        //创建输出记录
        Object[] outputRow = RowDataUtil.createResizedCopy( r, data.outputRowMeta.size() );
        disposeRow(outputRow);
        //将该记录设置到下一步骤的读取序列中
        //ku.putRow(data.outputRowMeta, outputRow); // copy row to possible alternate rowset(s)
        return true;
    }
    
    /**
     * 初始化工作
     */
    protected void init(){
    	kucopy = ku;
    	datacopy = data;
    	//每次初始化清空阻塞map
		if(zsMap!=null){
			zsMap.clear();
		}
    }
    
    @Override
    protected void end() throws Exception {
    	while(flag&&!(ku.isStopped()||ku.getTrans().isStopped()||!ku.isRunning()||!ku.getTrans().isRunning())){
    		if(zsMap.isEmpty()){
    			return;
    		}else{
    			Thread.sleep(2000l);
    		}
    	}
    	flag = true;
    }
	
	/**
	 *  判断阻塞状态
	 * @param yljkid 依赖监控id
	 * @param ylrw 依赖监控信息
	 * @throws KettleException
	 */
	public static void judgeZszt(String yljkid,JSONObject ylrw) throws KettleException {
		synchronized (zsMap) {
			//遍历map中的所有的阻塞任务id 
			for (String key : zsMap.keySet()) {
				//依赖作业
				List<String> list = zsMap.get(key);
				//依赖返回的监控任务
				if(list.contains(yljkid)){
					//依赖任务异常，此次阻塞任务判定为异常，将依赖任务状态设置为异常，并解除阻塞，推向下一步
					if(RWZT_BSYC.equals(ylrw.getString("rwzt"))||RWZT_YLYC.equals(ylrw.getString("rwzt"))){
						Object[] outputRow = createData(key);
						outputRow[getFieldIndexCopy(JKRW_YLRWZT)] = RWZT_YLYC;
						outputRow[getFieldIndexCopy(JKRW_RWPCH)] = YxjkInit.rwpch;
						outputRow[getFieldIndexCopy(JKRW_YCYLRW)] = ylrw.getString("rwmc");
						kucopy.putRow(datacopy.outputRowMeta, outputRow);
						//解除阻塞
						zsMap.remove(key);
						count--;
					}else{
						//移除此次依赖作业
						list.remove(yljkid);
					}
				}
				//list为空时，依赖任务全部完成，向下一步推送，进行阻塞任务监控
				if(list.isEmpty()){
					Object[] outputRow = createData(key);
					outputRow[getFieldIndexCopy(JKRW_YLRWZT)] = RWZT_ZC;
					outputRow[getFieldIndexCopy(JKRW_RWPCH)] = YxjkInit.rwpch;
					kucopy.putRow(datacopy.outputRowMeta, outputRow);
					//解除阻塞
					zsMap.remove(key);
					count--;
				}
			}
		}
	}
	
	/**
	 * 根据监控任务id生成对象数组，便于后面向下一步推送数据
	 * @param jkrwid
	 * @return
	 */
	public static Object[] createData(String jkrwid){
		//创建输出记录
        Object[] outputRow = RowDataUtil.createResizedCopy(new Object[]{} , datacopy.outputRowMeta.size() );
        //从监控任务缓存中取此次阻塞的监控任务配置数据
        JSONObject jkrwObj = YxjkInit.jkrwMap.get(jkrwid);
        //将阻塞监控数据放入源流数据中重新推向下一步
		for(Entry<String, Object> ent:jkrwObj.entrySet()){
			outputRow[getFieldIndexCopy(ent.getKey())] = jkrwObj.getString(ent.getKey());
		}
		return outputRow;
	}
	
	/**
    * 处理具体每一行数据 <br/>
    * @author jingma
    * @param outputRow
    */
    protected void disposeRow(Object[] outputRow) throws Exception{
    	//任务批次
    	String rwpch = YxjkInit.rwpch;
    	outputRow[getFieldIndex(JKRW_RWPCH)] = rwpch;
    	String ylrw = "";
    	if(null != outputRow[getFieldIndex("ylrw")]){
    		ylrw = outputRow[getFieldIndex("ylrw")].toString();
    	}
    	if(StringUtil.isNotBlank(ylrw)){
    		String ylrwids[] = outputRow[getFieldIndex("ylrw")].toString().split(",");
        	String jkrwid = outputRow[getFieldIndex("id")].toString();
        	int flag = 0;//依赖任务批次号不同标识
    		for(String ylrwid : ylrwids){
        		JSONObject obj = YxjkInit.queryJkrwById(ylrwid);
        		//批次号不同
        		if(!rwpch.equals(obj.getString("rwpch"))){
        			flag++;
        			List<String> list = null;
        			if(zsMap.containsKey(jkrwid)){
        				list = zsMap.get(jkrwid);
        			}else{
        				list = new ArrayList<String>();
        				zsMap.put(jkrwid, list);
        			}
        			list.add(ylrwid);
        		}else{
        			String rwzt = obj.getString("rwzt");
        			//依赖的作业   异常
        			if(RWZT_BSYC.equals(rwzt)||RWZT_YLYC.equals(rwzt)||RWZT_YZYC.equals(rwzt)){
        				outputRow[getFieldIndex(JKRW_YLRWZT)] = RWZT_YLYC;
        			}else{
        				outputRow[getFieldIndex(JKRW_YLRWZT)] = RWZT_ZC;
        			}
        		}
        	}
    		if(flag == 0){//依赖任务都已经同一批次执行完，向下一步推送源流数据
    			ku.putRow(data.outputRowMeta, outputRow);
    		}else{
    			count++;
    			//阻塞此次监控任务
    			return;
    		}
    	}else{
    		outputRow[getFieldIndex(JKRW_YLRWZT)] = RWZT_ZC;
    		//无依赖任务，直接向下一步推送
    		ku.putRow(data.outputRowMeta, outputRow);
    	}
    }
    
    /**
     * 获取输出字段在数组中的下标 <br/>
     * @see org.pentaho.di.core.row.ValueMetaInterface
     * @author jingma
     * @param field 字段名称
     * @return 下标
     */
     public static int getFieldIndexCopy(String field){
         return datacopy.outputRowMeta.indexOfValue(field.toUpperCase());
     }
	
	
	@Override
	public void getFields(RowMetaInterface r, String origin, RowMetaInterface[] info, StepMeta nextStep,
			VariableSpace space) {
		addField(r,JKRW_YLRWZT,ValueMeta.TYPE_STRING,ValueMeta.TRIM_TYPE_BOTH,origin,"依赖任务状态");
		addField(r,JKRW_YCYLRW,ValueMeta.TYPE_STRING,ValueMeta.TRIM_TYPE_BOTH,origin,"异常依赖任务");
	}
}
