package com.oss.intercept;

import net.oschina.kettleutil.common.KuConst;

import com.eova.aop.AopContext;
import com.eova.widget.grid.GridController;
import com.jfinal.plugin.activerecord.Db;

/**
 * 
 * 作业参数拦截器
 * 
 * @author Jieven
 * 
 */
public class JobParamsIntercept extends MetlMOIntercept {
    /**
    * 
    * @see com.oss.intercept.MetlMOIntercept#addBefore(com.eova.aop.AopContext)
    */
    @Override
    public String addBefore(AopContext ac) throws Exception {
        return null;
    }
	/**
	* 
	* @see com.oss.intercept.MetlMOIntercept#updateBefore(com.eova.aop.AopContext)
	*/
	@Override
	public String updateBefore(AopContext ac) throws Exception {
	    //移除默认值
        ac.record.remove("param_default");
        if(ac.record.get("id_job")!=null){
            //删除已有记录
            Db.use(KuConst.DATASOURCE_KETTLE).delete("job_params", "id_job,ocode", ac.record);
            //调用通用拦截器
            super.addBefore(ac);
            Db.use(KuConst.DATASOURCE_KETTLE).save("job_params",KuConst.FIELD_OID,ac.record);
        }
	    return GridController.CONTINUE;
	}
}
