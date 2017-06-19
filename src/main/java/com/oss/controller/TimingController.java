package com.oss.controller;

import net.oschina.kettleutil.common.KuConst;
import cn.benma666.myutils.StringUtil;

import com.eova.common.Easy;
import com.jfinal.core.Controller;
import com.jfinal.log.Log;
import com.oss.model.MetlTaskTiming;

/**
* 定时控件控制器 <br/>
* date: 2016年6月6日 <br/>
* @author jingma
* @version 
*/
public class TimingController extends Controller {

	/**
	* 日志
	*/
	Log log = Log.getLog(getClass()); 
    /**
    * 进入定时设置页面 <br/>
    * @author jingma
    * @throws Exception
    */
    public void toTiming() throws Exception {
        Integer jobId = getParaToInt(0);
        MetlTaskTiming taskTiming = new MetlTaskTiming();
        if(jobId!=null){
            if(taskTiming.getTimingByJobId(jobId)){
                taskTiming.set(KuConst.FIELD_OID, jobId);
            }else{
                renderText("无法设置");
            }
        }else{
            //设置默认值
            taskTiming.set("scheduler_type", KuConst.SCHEDULER_TYPE_NOT_TIMING);
            taskTiming.set("interval_seconds", "0");
            taskTiming.set("interval_minutes", "60");
            taskTiming.set("hour", "12");
            taskTiming.set("minutes", "0");
            taskTiming.set("week_day", "1");
            taskTiming.set("day_of_month", "1");
        }
        setAttr("taskTiming", taskTiming);
        render("/eova/widget/timing/form_task_timing.html");
    }
    /**
    * 保存定时设置 <br/>
    * @author jingma
    * @throws Exception
    */
    public void saveTiming() throws Exception {
        MetlTaskTiming timing = getModel(MetlTaskTiming.class,"");
        timing.set("is_repeat", StringUtil.whether(timing.getStr("is_repeat")));
        int jobId = timing.saveTimingToKettle2();
        renderJson(new Easy(jobId+","+timing.showText(),true));
    }
    /**
    * 根据定时主键，获取该定时设置的显示字符串 <br/>
    * @author jingma
    */
    public void timingShow(){
        Integer jobId = getParaToInt(0);
        MetlTaskTiming tt = new MetlTaskTiming();
        if(tt.getTimingByJobId(jobId)){
            renderText(tt.showText());
        }else{
          renderText("无法设置");
        }
    }
}
