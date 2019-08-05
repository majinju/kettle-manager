package com.iflytek.qb.yxjk;

import java.util.Arrays;

import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.core.exception.KettleStepException;
import org.pentaho.di.core.row.RowDataUtil;
import org.pentaho.di.core.row.RowMetaInterface;
import org.pentaho.di.core.row.ValueMeta;
import org.pentaho.di.core.variables.VariableSpace;
import org.pentaho.di.trans.step.StepMeta;

import com.iflytek.qb.util.JsonResult;
import com.iflytek.qb.util.StringUtil;

import cn.benma666.kettle.steps.easyexpand.EasyExpandRunBase;

public abstract class YxjkRunBase extends EasyExpandRunBase{
	/**
	 * 监控任务-依赖任务
	 */
	public final static String JKRW_YLRW = "ylrw";
	/**
	 * 监控任务-具体任务
	 */
	public final static String JKRW_JTRW = "jtrw";
	/**
	 * 监控任务-任务状态：0-未知、1-正常、2-本身异常、3-依赖异常、4-已知异常
	 */
	public final static String JKRW_RWZT = "rwzt";
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
	 * 监控任务-异常原因
	 */
	public final static String JKRW_YCYY = "ycyy";
	/**
	 * 监控任务-监测时间
	 */
	public final static String JKRW_JCSJ = "jcsj";
	/**
	 * 监控任务-消息模板
	 */
	public final static String JKRW_XXMB = "xxmb";
	/**
	 * 监控任务-依赖任务状态
	 */
	public final static String JKRW_YLRWZT = "ylrwzt";
	/**
	 * 监控任务-异常依赖任务：如果依赖任务异常的话，将依赖任务名称放入此字段中；如果依赖任务正常，此字段为空
	 */
	public static final String JKRW_YCYLRW = "ycylrw";
	/**
	 * 监控任务-任务等级
	 */
	public static final String JKRW_RWDJ = "rwdj";
	/**
	 * 监控任务-任务名称
	 */
	public static final String JKRW_RWMC = "rwmc";
	/**
	 * 监控任务-任务类型
	 */
	public static final String JKRW_RWLX = "rwlx";
	
	/**
	 * 消息-消息类型
	 */
	public final static String XX_XXLX = "xxlx";
	/*** 消息-消息类型：1-异常消息*/
	public final static String XXLX_YC = "1";
	/*** 消息-消息类型：2-恢复消息*/
	public final static String XXLX_HF = "2";
	/*** 消息-消息类型：3-进度反馈*/
	public final static String XXLX_FK = "3";
	/**
	 * 消息-消息内容
	 */
	public final static String XX_XXNR = "xxnr";
	/**
	 * 消息-监控任务
	 */
	public final static String XX_JKRW = "jkrw";
	/**
	 * 消息-消息等级
	 */
	public final static String XX_XXDJ = "xxdj";
	/**
	 * 其它-是否生成预警：0-否、1-是
	 */
	public final static String QT_SFSCYJ = "sfscyj";
	/**
	 * 其它-是否更新监控：0-否、1-是，主要用来推送额外的消息
	 */
	public final static String QT_SFGXJK = "sfgxjk";
	
	
	
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
    * 处理具体每一行数据 <br/>
    * @author jingma
    * @param outputRow
    */
    protected void disposeRow(Object[] outputRow) throws Exception{
    	//监测时间
    	outputRow[getFieldIndex(JKRW_JCSJ)] = YxjkInit.jkdb.getCurrentDateStr14();
    	outputRow[getFieldIndex(XX_JKRW)] = outputRow[getFieldIndex("id")];
    	//监控默认不生成预警消息
    	outputRow[getFieldIndex(QT_SFSCYJ)] = "0";
    	//默认更新监控
    	outputRow[getFieldIndex(QT_SFGXJK)] = "1";
    	
    	//String jtrwid = outputRow[getFieldIndex(JKRW_JTRW)].toString();
    	//依赖任务是否异常
    	String ylrwzt = outputRow[getFieldIndex(JKRW_YLRWZT)].toString();
    	//依赖任务全部正常
    	if(RWZT_ZC.equals(ylrwzt)){
    		judgeYjzt(outputRow,test(outputRow));
    	}else if(RWZT_YLYC.equals(ylrwzt)){//依赖任务状态为依赖异常
			//依赖任务异常，直接修改此次监测任务的状态。依赖任务有问题，本次主监测作业不再推送预警信息，只修改监控状态及异常原因
			outputRow[getFieldIndex(JKRW_RWZT)] = RWZT_YLYC;
			outputRow[getFieldIndex(JKRW_YCYY)] = "监测到依赖任务异常："+outputRow[getFieldIndex(JKRW_YCYLRW)].toString();
			ku.putRow(data.outputRowMeta, outputRow);
    	}else{
    		//未知状态，待定
    	}
    }
    
    /**
	 * 执行监测任务
	 * @param jtrwid 具体任务id
	 * @return
	 */
	public abstract JsonResult test(Object[] outputRow);
	
	/**
     * 判断预警状态，及是否推送预警
     * @param outputRow
     * @param jczt 本次数据库监测状态：true-正常，false-异常
	 * @throws KettleStepException 
     */
    public void judgeYjzt(Object[] outputRow,JsonResult result) throws KettleStepException{
    	//上次监控任务状态：来判断是否生成预警消息
		String rwzt = outputRow[getFieldIndex(JKRW_RWZT)].toString();
		//任务类型，用于更新具体任务的任务状态
		String rwlx = outputRow[getFieldIndex(JKRW_RWLX)].toString();
		//具体任务
		String jtrw = outputRow[getFieldIndex(JKRW_JTRW)].toString();
    	if(result.isStatus()){//此次监控状态正常
			//上次监控任务状态正常
			if(RWZT_ZC.equals(rwzt)){
				//do nothing
			//上次监控任务状态本身异常，生成恢复消息
			}else if(RWZT_BSYC.equals(rwzt)||RWZT_YZYC.equals(rwzt)){
				outputRow[getFieldIndex(QT_SFSCYJ)] = "1";
				//修改此次监测任务的状态
				outputRow[getFieldIndex(JKRW_RWZT)] = RWZT_ZC;
				//异常原因置空
				outputRow[getFieldIndex(JKRW_YCYY)] = result.getMsg();
				//推送恢复消息
				outputRow[getFieldIndex(XX_XXLX)] = XXLX_HF;
				//消息等级
				outputRow[getFieldIndex(XX_XXDJ)] = result.getCode();
				updateJtrw(rwlx, jtrw, RWZT_ZC);
			}else if(RWZT_YLYC.equals(rwzt)){//上次监控任务状态为依赖异常：不生成恢复消息、只修改任务状态
				//修改此次监测任务的状态
				outputRow[getFieldIndex(JKRW_RWZT)] = RWZT_ZC;
				//异常原因置空
				outputRow[getFieldIndex(JKRW_YCYY)] = result.getMsg();
			}
			ku.putRow(data.outputRowMeta, outputRow);
    	}else{//此次监控状态异常
			//上次监控任务状态正常或者依赖异常，生成异常消息
			if(RWZT_ZC.equals(rwzt)||RWZT_YLYC.equals(rwzt)){
				outputRow[getFieldIndex(QT_SFSCYJ)] = "1";
				//修改此次监测任务的状态
				outputRow[getFieldIndex(JKRW_RWZT)] = RWZT_BSYC;
				outputRow[getFieldIndex(JKRW_YCYY)] = result.getMsg();
				//推送异常消息
				outputRow[getFieldIndex(XX_XXLX)] = XXLX_YC;
				//消息等级
				outputRow[getFieldIndex(XX_XXDJ)] = result.getCode();
				updateJtrw(rwlx, jtrw, RWZT_BSYC);
			//上次监控任务状态本身异常或已知异常：依旧处于异常状态	
			}else if(RWZT_BSYC.equals(rwzt)||RWZT_YZYC.equals(rwzt)){
				//do nothing
			}
			ku.putRow(data.outputRowMeta, outputRow);
    	}
    	//推送附属消息
    	if(StringUtil.isNotBlank(result.getMsg())&&result.isStatus()){
    		Object[] outputRow2 = Arrays.copyOf(outputRow, outputRow.length);
    		outputRow2[getFieldIndex(QT_SFSCYJ)] = "1";
    		outputRow2[getFieldIndex(JKRW_YCYY)] = result.getMsg();
			//推送异常消息
    		outputRow2[getFieldIndex(XX_XXLX)] = XXLX_YC;
    		//消息等级
			outputRow2[getFieldIndex(XX_XXDJ)] = result.getCode();
			outputRow2[getFieldIndex(QT_SFGXJK)] = "0";
    		ku.putRow(data.outputRowMeta, outputRow2);
    	}
    }
    
    /**
     * 当数据载体和应用的监控任务 任务状态发生变化时，修改其相应的状态
     * @param rwlx
     * @param jtrw
     * @param zt
     */
    public void updateJtrw(String rwlx,String jtrw,String zt){
    	//数据载体
		if("1".equals(rwlx)){
			YxjkInit.updateSjztById(jtrw,zt);
		//应用
		}else if("2".equals(rwlx)){
			YxjkInit.updateAppById(jtrw,zt);
		}
    }
    
    @Override
	public void getFields(RowMetaInterface r, String origin, RowMetaInterface[] info, StepMeta nextStep,
			VariableSpace space) {
		addField(r,XX_XXLX,ValueMeta.TYPE_STRING,ValueMeta.TRIM_TYPE_BOTH,origin,"消息类型");
		addField(r,XX_XXNR,ValueMeta.TYPE_STRING,ValueMeta.TRIM_TYPE_BOTH,origin,"消息内容");
		addField(r,XX_XXDJ,ValueMeta.TYPE_STRING,ValueMeta.TRIM_TYPE_BOTH,origin,"消息等级");
		addField(r,XX_JKRW,ValueMeta.TYPE_STRING,ValueMeta.TRIM_TYPE_BOTH,origin,"监控任务");
		addField(r,QT_SFSCYJ,ValueMeta.TYPE_STRING,ValueMeta.TRIM_TYPE_BOTH,origin,"是否生成预警");
		addField(r,QT_SFGXJK,ValueMeta.TYPE_STRING,ValueMeta.TRIM_TYPE_BOTH,origin,"是否更新监控任务");
	}
}
