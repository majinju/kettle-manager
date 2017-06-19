package com.oss.intercept;

import com.eova.aop.AopContext;
import com.eova.aop.MetaObjectIntercept;
import com.jfinal.plugin.activerecord.Record;
import com.oss.job.JobManager;

/**
 * 作业管理拦截器
 */
public class JobIntercept extends MetaObjectIntercept {
    /**
    * 
    * @see com.oss.intercept.MetlMOIntercept#queryBefore(com.eova.aop.AopContext)
    */
    @Override
    public void queryBefore(AopContext ac) throws Exception {
        ac.view = JobManager.getJobViewName();
    }
    /**
    * 
    * @see com.eova.aop.MetaObjectIntercept#updateBefore(com.eova.aop.AopContext)
    */
    @Override
    public String updateBefore(AopContext ac) throws Exception {
        Record record = new Record();
        record.set("id_job", ac.record.getBigDecimal("id_job"));
        record.set("auto_restart_num", ac.record.getBigDecimal("auto_restart_num"));
        record.set("project_code", ac.record.getStr("project_code"));
        record.set("job_version", ac.record.getStr("job_version"));
        ac.record.clear();
        ac.record.setColumns(record);
        return super.updateBefore(ac);
    }
}
