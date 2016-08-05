/**
* Project Name:KettleUtil
* Date:2016年6月29日下午4:58:19
* Copyright (c) 2016, jingma All Rights Reserved.
*/

package net.oschina.kettleutil.utilrun;

import net.oschina.kettleutil.KettleUtilRunBase;
import net.oschina.mytuils.KettleUtils;

import org.pentaho.di.core.row.RowMetaInterface;
import org.pentaho.di.core.row.ValueMeta;
import org.pentaho.di.core.variables.VariableSpace;
import org.pentaho.di.trans.step.StepMeta;

/**
 * kettle util 运行示例<br/>
 * date: 2016年6月29日 <br/>
 * @author jingma
 * @version 
 */
public class kurDemo extends KettleUtilRunBase{
    /**
    * 
    * @see net.oschina.kettleutil.KettleUtilRunBase#disposeRow(java.lang.Object[])
    */
    @Override
    protected void disposeRow(Object[] outputRow) {
        super.disposeRow(outputRow);
        //设置JOB名称
        outputRow[getFieldIndex("JOB_NAME")] = KettleUtils.getRootJobName(ku);
    }
    
    public void getFields(RowMetaInterface r, String origin, RowMetaInterface[] info, StepMeta nextStep, VariableSpace space) {
        addField(r,"JOB_NAME",ValueMeta.TYPE_STRING,ValueMeta.TRIM_TYPE_BOTH,origin,"JOB名称");
    }
}
