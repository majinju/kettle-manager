/**
* Project Name:KettleUtil
* Date:2016年6月28日
* Copyright (c) 2016, jingma All Rights Reserved.
*/

package com.oss.job;

import net.oschina.kettleutil.common.KuConst;

import org.beetl.sql.core.db.Db;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.PersistJobDataAfterExecution;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * kettle作业运行器 <br/>
 * 支持配置kettle作业一个或多个<br/>
 * date: 2016年6月28日 <br/>
 * @author jingma
 * @version 
 */
@PersistJobDataAfterExecution
@DisallowConcurrentExecution
public class KettleJobRunner extends AbsJob {
    
    ///////////配置参数//////////////////////
    private static final String JOBID_LIST = "作业id列表";
    /**
     * Creates a new instance of GenerateDataBill.
     */
    public KettleJobRunner() {
    }

    /**
    * 
    * @throws Exception 
     * @see com.oss.job.AbsJob#process(org.quartz.JobExecutionContext)
    */
    @Override
    protected void process() throws Exception {
        JSONArray jobIdList = configInfo.getJSONArray(JOBID_LIST);
        String sql = "select * from "+JobManager.getJobViewName()+" j where id_job=?";
        //当前就是依次运行，将来根据需要可以考虑其他运行方式
        for(Integer jobId:jobIdList.toArray(new Integer[]{})){
            JSONObject jobJson = Db.use(KuConst.DATASOURCE_KETTLE).findFirst(sql, jobId);
            if(jobJson != null){
                try {
                    //此处存在一个作业被多处调用的可能，下一层控制了同一个作业同时只能运行一个，可能造成混乱
                    //所以建议一个作业不要多次使用，只能暂时只能靠自觉，瞎搞自己该遭
                    JobManager.startJob(jobJson);
                    JobManager.getJob(jobId).join();
                } catch (Exception e) {
                    error("作业启动失败："+jobJson, e);
                    break;
                }
            }else{
                error("作业不存在："+jobId);
            }
        }
    }

    public String getDefaultConfigInfo() throws Exception {
        JSONObject params = new JSONObject();
        params.put(JOBID_LIST, new JSONArray());
        return JSON.toJSONString(params, true);
    }

    
}
