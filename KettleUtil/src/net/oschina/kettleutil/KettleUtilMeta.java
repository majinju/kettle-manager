package net.oschina.kettleutil;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.eclipse.swt.widgets.Shell;
import org.pentaho.di.core.CheckResult;
import org.pentaho.di.core.CheckResultInterface;
import org.pentaho.di.core.Const;
import org.pentaho.di.core.Counter;
import org.pentaho.di.core.database.DatabaseMeta;
import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.core.exception.KettleValueException;
import org.pentaho.di.core.exception.KettleXMLException;
import org.pentaho.di.core.row.RowMetaInterface;
import org.pentaho.di.core.variables.VariableSpace;
import org.pentaho.di.core.xml.XMLHandler;
import org.pentaho.di.i18n.BaseMessages;
import org.pentaho.di.repository.ObjectId;
import org.pentaho.di.repository.Repository;
import org.pentaho.di.trans.Trans;
import org.pentaho.di.trans.TransMeta;
import org.pentaho.di.trans.step.BaseStepMeta;
import org.pentaho.di.trans.step.StepDataInterface;
import org.pentaho.di.trans.step.StepDialogInterface;
import org.pentaho.di.trans.step.StepInterface;
import org.pentaho.di.trans.step.StepMeta;
import org.pentaho.di.trans.step.StepMetaInterface;
import org.w3c.dom.Node;

/**
* 元数据 <br/>
* date: 2016年8月18日 <br/>
* @author jingma
* @version 
*/
public class KettleUtilMeta extends BaseStepMeta implements StepMetaInterface {

	private static Class<?> PKG = KettleUtilMeta.class; // for i18n purposes
    /**
    * 类名称
    */
    private String className = "";
	/**
	* 具体配置信息
	*/
	private String configInfo = "{}";

	public KettleUtilMeta() {
		super(); 
	}
    /**
     * @return className 
     */
    public String getClassName() {
        return className;
    }
    /**
     * @param className the className to set
     */
    public void setClassName(String className) {
        this.className = className;
    }
    /**
     * @return configInfo 
     */
    public String getConfigInfo() {
        return configInfo;
    }

    /**
     * @param configInfo the configInfo to set
     */
    public void setConfigInfo(String configInfo) {
        this.configInfo = configInfo;
    }

    public String getXML() throws KettleValueException {
		String retval = "";
		retval += "		<classname>" + getClassName() + "</classname>" + Const.CR;
        retval += "     <configinfo>" + getConfigInfo() + "</configinfo>" + Const.CR;
		return retval;
	}

    public void getFields(RowMetaInterface r, String origin, RowMetaInterface[] info, StepMeta nextStep, VariableSpace space) {
		if(StringUtils.isNotBlank(className)){
		    try {
		        //实例化配置的类，获取输出字段
		        KettleUtilRunBase kui = (KettleUtilRunBase) Class.forName(space.environmentSubstitute(className)).newInstance();
		        kui.setKu(null);
		        kui.setMeta(this,space);
		        kui.getFields(r, origin, info, nextStep, space);
            } catch (Exception e) {
                logError("获取输出字段失败", e);
            }
		}
	}

    public String getDefaultConfigInfo(TransMeta transMeta, String stepName, VariableSpace space) throws Exception {
        if(StringUtils.isNotBlank(getClassName())){
            //实例化配置的类，获取输出字段
            KettleUtilRunBase kui = (KettleUtilRunBase) Class.forName(space.environmentSubstitute(getClassName())).newInstance();
            kui.setKu(null);
            kui.setMeta(this,space);
            return kui.getDefaultConfigInfo(transMeta,stepName);
        }
        return null;
    }
	public Object clone() {
		Object retval = super.clone();
		return retval;
	}

	public void loadXML(Node stepnode, List<DatabaseMeta> databases, Map<String, Counter> counters) throws KettleXMLException {

		try {
			setClassName(XMLHandler.getNodeValue(XMLHandler.getSubNode(stepnode, "classname")));
            setConfigInfo(XMLHandler.getNodeValue(XMLHandler.getSubNode(stepnode, "configinfo")));
		} catch (Exception e) {
			throw new KettleXMLException("Template Plugin Unable to read step info from XML node", e);
		}

	}

	public void setDefault() {
        className = "net.oschina.kettleutil.utilrun.KurDemo";
		configInfo = "{}";
	}

	public void check(List<CheckResultInterface> remarks, TransMeta transmeta, StepMeta stepMeta, RowMetaInterface prev, String input[], String output[], RowMetaInterface info) {
		CheckResult cr;

		// See if we have input streams leading to this step!
		if (input.length > 0) {
			cr = new CheckResult(CheckResult.TYPE_RESULT_OK, "Step is receiving info from other steps.", stepMeta);
			remarks.add(cr);
		} else {
			cr = new CheckResult(CheckResult.TYPE_RESULT_ERROR, "No input received from other steps!", stepMeta);
			remarks.add(cr);
		}	
    	
	}

	public StepDialogInterface getDialog(Shell shell, StepMetaInterface meta, TransMeta transMeta, String name) {
		return new KettleUtilDialog(shell, meta, transMeta, name);
	}

	public StepInterface getStep(StepMeta stepMeta, StepDataInterface stepDataInterface, int cnr, TransMeta transMeta, Trans disp) {
		return new KettleUtil(stepMeta, stepDataInterface, cnr, transMeta, disp);
	}

	public StepDataInterface getStepData() {
		return new KettleUtilData();
	}

	public void readRep(Repository rep, ObjectId id_step, List<DatabaseMeta> databases, Map<String, Counter> counters) throws KettleException {
		try
		{
            className  = rep.getStepAttributeString(id_step, "classname"); //$NON-NLS-1$
			configInfo  = rep.getStepAttributeString(id_step, "configinfo"); //$NON-NLS-1$
		}
		catch(Exception e)
		{
			throw new KettleException(BaseMessages.getString(PKG, "TemplateStep.Exception.UnexpectedErrorInReadingStepInfo"), e);
		}
	}

	public void saveRep(Repository rep, ObjectId id_transformation, ObjectId id_step) throws KettleException
	{
		try
		{
            rep.saveStepAttribute(id_transformation, id_step, "classname", className); //$NON-NLS-1$
			rep.saveStepAttribute(id_transformation, id_step, "configinfo", configInfo); //$NON-NLS-1$
		}
		catch(Exception e)
		{
			throw new KettleException(BaseMessages.getString(PKG, "TemplateStep.Exception.UnableToSaveStepInfoToRepository")+id_step, e); 
		}
	}
}
