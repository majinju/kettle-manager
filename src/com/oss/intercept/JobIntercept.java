package com.oss.intercept;

import net.oschina.kettlemanager.JobManager;

import com.eova.aop.AopContext;
import com.eova.aop.MetaObjectIntercept;

/**
 * 
 * 统一字典拦截器
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
}
