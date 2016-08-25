/*! ******************************************************************************
 *
 * Pentaho Data Integration
 *
 * Copyright (C) 2002-2013 by Pentaho : http://www.pentaho.com
 *
 *******************************************************************************
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 ******************************************************************************/

package net.oschina.kettleutil.jobentry;

import static org.pentaho.di.job.entry.validator.AndValidator.putValidators;
import static org.pentaho.di.job.entry.validator.JobEntryValidatorUtils.andValidator;
import static org.pentaho.di.job.entry.validator.JobEntryValidatorUtils.notBlankValidator;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.pentaho.di.cluster.SlaveServer;
import org.pentaho.di.core.CheckResultInterface;
import org.pentaho.di.core.Result;
import org.pentaho.di.core.database.DatabaseMeta;
import org.pentaho.di.core.exception.KettleDatabaseException;
import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.core.exception.KettleXMLException;
import org.pentaho.di.core.variables.VariableSpace;
import org.pentaho.di.core.xml.XMLHandler;
import org.pentaho.di.i18n.BaseMessages;
import org.pentaho.di.job.JobMeta;
import org.pentaho.di.job.entry.JobEntryBase;
import org.pentaho.di.job.entry.JobEntryInterface;
import org.pentaho.di.repository.ObjectId;
import org.pentaho.di.repository.Repository;
import org.pentaho.metastore.api.IMetaStore;
import org.w3c.dom.Node;

/**
* kettle util作业组件 <br/>
* date: 2016年8月18日 <br/>
* @author jingma
* @version 
*/
public class JobEntryKettleUtil extends JobEntryBase implements Cloneable,
        JobEntryInterface {
    private static Class<?> PKG = JobEntryKettleUtil.class; // for i18n
                                                            // purposes, needed
                                                            // by Translator2!!
    private String className = "net.oschina.kettleutil.utilrun.JeurDemo";
    private String configInfo = "{}";

    public JobEntryKettleUtil() {
        super("", "");
    }

    public Object clone() {
        JobEntryKettleUtil je = (JobEntryKettleUtil) super.clone();
        return je;
    }

    public String getXML() {
        StringBuffer retval = new StringBuffer();

        retval.append(super.getXML());
        retval.append("      ").append(
                XMLHandler.addTagValue("configInfo", configInfo));
        retval.append("      ").append(
                XMLHandler.addTagValue("className", className));

        return retval.toString();
    }

    public void loadXML(Node entrynode, List<DatabaseMeta> databases,
            List<SlaveServer> slaveServers, Repository rep, IMetaStore metaStore)
            throws KettleXMLException {
        try {
            super.loadXML(entrynode, databases, slaveServers);
            configInfo = XMLHandler.getTagValue(entrynode, "configInfo");
            className = XMLHandler.getTagValue(entrynode, "className");
        } catch (Exception e) {
            throw new KettleXMLException(BaseMessages.getString(PKG,
                    "JobEntryKettleUtil.UnableToLoadFromXml"), e);
        }
    }

    public void loadRep(Repository rep, IMetaStore metaStore,
            ObjectId id_jobentry, List<DatabaseMeta> databases,
            List<SlaveServer> slaveServers) throws KettleException {
        try {
            configInfo = rep.getJobEntryAttributeString(id_jobentry,
                    "configInfo");
            className = rep
                    .getJobEntryAttributeString(id_jobentry, "className");
        } catch (KettleDatabaseException dbe) {
            throw new KettleException(BaseMessages.getString(PKG,
                    "JobEntryKettleUtil.UnableToLoadFromRepo",
                    String.valueOf(id_jobentry)), dbe);
        }
    }

    // Save the attributes of this job entry
    //
    public void saveRep(Repository rep, IMetaStore metaStore, ObjectId id_job)
            throws KettleException {
        try {
            rep.saveJobEntryAttribute(id_job, getObjectId(), "configInfo",
                    configInfo);
            rep.saveJobEntryAttribute(id_job, getObjectId(), "className",
                    className);
        } catch (KettleDatabaseException dbe) {
            throw new KettleException(BaseMessages.getString(PKG,
                    "JobEntryKettleUtil.UnableToSaveToRepo",
                    String.valueOf(id_job)), dbe);
        }
    }

    /**
     * @return className
     */
    public String getClassName() {
        return className;
    }

    /**
     * @param className
     *            the className to set
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
     * @param configInfo
     *            the configInfo to set
     */
    public void setConfigInfo(String configInfo) {
        this.configInfo = configInfo;
    }

    /**
     * Execute this job entry and return the result. In this case it means, just
     * set the result boolean in the Result class.
     * 
     * @param prev_result
     *            The result of the previous execution
     * @return The Result of the execution.
     */
    public Result execute(Result prev_result, int nr) {
        boolean result = true;
        if(StringUtils.isNotBlank(className)){
            try {
                //实例化配置的类
                JobEntryKettleUtilRunBase kui = (JobEntryKettleUtilRunBase) Class.forName(
                        environmentSubstitute(className)).newInstance();
                kui.setJeku(this);
                result = kui.run();
            } catch (Exception e) {
                prev_result.setNrErrors(1);
                result = false;
                logError("运行失败,"+className+","+configInfo, e);
            }
        }
        prev_result.setResult(result);
        return prev_result;
    }
    /**
    * 获取格式化后的默认JSON配置参数，供使用者方便快捷的修改配置 <br/>
    * @author jingma
    */
    public String getDefaultConfigInfo() throws Exception{
        if(StringUtils.isNotBlank(getClassName())){
            //实例化配置的类，获取输出字段
            JobEntryKettleUtilRunBase kui = (JobEntryKettleUtilRunBase) Class.forName(this.environmentSubstitute(getClassName())).newInstance();
            kui.setJeku(this);
            return kui.getDefaultConfigInfo();
        }
        return null;
    }

    public boolean evaluates() {
      return true;
    }

    public boolean isUnconditional() {
      return false;
    }

    public void check( List<CheckResultInterface> remarks, JobMeta jobMeta, VariableSpace space,
      Repository repository, IMetaStore metaStore ) {
      andValidator().validate( this, "KettleUtil", remarks, putValidators( notBlankValidator() ) );
    }
}
