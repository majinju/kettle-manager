/**
 * Copyright (c) 2013-2016, Jieven. All rights reserved.
 *
 * Licensed under the GPL license: http://www.gnu.org/licenses/gpl.txt
 * To use it on other terms please contact us at 1623736450@qq.com
 */
package com.oss.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.oschina.kettleutil.common.KuConst;
import net.oschina.mytuils.Dict;
import net.oschina.mytuils.KettleUtils;
import net.oschina.mytuils.StringUtil;
import net.oschina.mytuils.constants.UtilConst;

import org.pentaho.di.core.exception.KettleException;
import org.pentaho.di.job.JobMeta;
import org.pentaho.di.job.entries.special.JobEntrySpecial;
import org.pentaho.di.repository.LongObjectId;

import com.eova.common.base.BaseModel;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.DbPro;
import com.jfinal.plugin.activerecord.Record;

/**
* 任务定时 <br/>
* date: 2016年5月24日 <br/>
* @author jingma
* @version 
*/
public class MetlTaskTiming extends BaseModel<MetlTaskTiming> {

	/**
	* 序列化ID
	*/
	private static final long serialVersionUID = 92801552218632615L;
	/**
	* 开始控件参数与timing参数名称对应
	*/
	private static Map<String,String> startTimingMap = new HashMap<String, String>();
	/**
	* 便于数据操作
	*/
	public static final MetlTaskTiming dao = new MetlTaskTiming();
	public static int startTypeId = 0;
    static {
        startTimingMap.put("start", "start");
        startTimingMap.put("dummy", "dummy");
        startTimingMap.put("repeat", "is_repeat");
        startTimingMap.put("schedulerType", "scheduler_type");
        startTimingMap.put("intervalSeconds", "interval_seconds");
        startTimingMap.put("intervalSeconds", "interval_seconds");
        startTimingMap.put("intervalMinutes", "interval_minutes");
        startTimingMap.put("hour", "hour");
        startTimingMap.put("minutes", "minutes");
        startTimingMap.put("weekDay", "week_day");
        startTimingMap.put("dayOfMonth", "day_of_month");
    }
	
	public String showText(){
        //是否重复
        String isRepeat = getStr("is_repeat");
        //定时类别
        String schedulerType = get("scheduler_type").toString();
        String hour = get("hour").toString();
        String minutes = get("minutes").toString();
        String result = "";
        if(KuConst.SCHEDULER_TYPE_NOT_TIMING.equals(schedulerType)){
            result = "不需要定时";
        }else if(KuConst.SCHEDULER_TYPE_TIME_INTERVAL.equals(schedulerType)){
            String intervalSeconds = get("interval_seconds").toString();
            String intervalMinutes = get("interval_minutes").toString();
            if(intervalMinutes.equals("0")){
                result = "等"+intervalSeconds+"秒执行一次";
            }else{
                result = "等"+intervalMinutes+"分"+intervalSeconds+"秒执行一次";
            }
        }else if(KuConst.SCHEDULER_TYPE_DAY.equals(schedulerType)){
            result = "一天的"+hour+"点"+minutes+"分执行一次";
        }else if(KuConst.SCHEDULER_TYPE_WEEK.equals(schedulerType)){
            String weekDay = get("week_day").toString();
            String week = Dict.dictValue(KuConst.DICT_CATEGORY_WEEK_DAY, weekDay);
            result = week + "的"+hour+"点"+minutes+"分执行一次";
        }else if(KuConst.SCHEDULER_TYPE_MONTH.equals(schedulerType)){
            String dayOfMonth = get("day_of_month").toString();
            result = "一个月的"+dayOfMonth+"日"+hour+"点"+minutes+"分执行一次";
        }
        if(UtilConst.WHETHER_TRUE.equals(isRepeat)){
            result+="/重复执行";
        }
	    String msg=result;
        return msg;
	}

    /**
    * 转换为cron格式的定时配置 ，不需要重复执行的任务不适应与此表达式<br/>
    * @author jingma
    * @return 不重复执行：null，重复执行：6位的定时表达式
    */
    public String getCron(){
        //是否重复
        String isRepeat = getStr("is_repeat");
        //不需要重复执行的任务需要额外处理
        if(UtilConst.WHETHER_FALSE.equals(isRepeat)){
            return null;
        }
        //定时类别
        String schedulerType = get("scheduler_type").toString();
        String hour = get("hour").toString();
        String minutes = get("minutes").toString();
        String result = "";
        if(KuConst.SCHEDULER_TYPE_NOT_TIMING.equals(schedulerType)){
            result = "* * * * * *";
        }else if(KuConst.SCHEDULER_TYPE_TIME_INTERVAL.equals(schedulerType)){
            String intervalMinutes = get("interval_minutes").toString();
            String intervalSeconds = get("interval_seconds").toString();
            if(intervalMinutes.equals("0")){
                result = "*/"+intervalSeconds+" * * * * *";
            }else{
                result = "0 */"+intervalMinutes+" * * * *";
            }
        }else if(KuConst.SCHEDULER_TYPE_DAY.equals(schedulerType)){
            result = "0 "+minutes+" "+hour+" * * *";
        }else if(KuConst.SCHEDULER_TYPE_WEEK.equals(schedulerType)){
            String weekDay = getStr("week_day");
            String week = Dict.dictValue(KuConst.DICT_CATEGORY_WEEK_DAY, weekDay);
            result = "0 "+minutes+" "+hour+" * * "+week+" ";
        }else if(KuConst.SCHEDULER_TYPE_MONTH.equals(schedulerType)){
            String dayOfMonth = get("day_of_month").toString();
            result = "0 "+minutes+" "+hour+" "+dayOfMonth+" * * ";
        }
        return result;
    }

    /**
    * 通过作业ID获取作业定时信息<br/>
    * @author jingma
    * @param dbCode 所在资源库代码
    * @param jobId 作业ID
    * @return SATRT控件实体
    */
    public boolean getTimingByJobId(int jobId) {
        Integer startId = getStartIdByJobId(KuConst.DATASOURCE_KETTLE, jobId);
        if(startId==null){
            return false;
        }
        String sql = "select ja.value_num,ja.value_str,ja.code from r_jobentry_attribute ja "
                + "where ja.id_jobentry=?";
        List<Record> records = Db.use(KuConst.DATASOURCE_KETTLE).find(sql, startId);
        for(Record record:records){
            if(StringUtil.isNotBlank(record.getStr("value_str"))){
                put(startTimingMap.get(record.getStr("code")), record.getStr("value_str"));
            }else{
                put(startTimingMap.get(record.getStr("code")), record.getInt("value_num"));
            }
        }
        set("is_repeat", StringUtil.whether(getStr("is_repeat")));
        return true;
    }

    /**
    * 通过作业ID获取对应的START控件 <br/>
    * @author jingma
    * @param dbCode 所在资源库代码
    * @param jobId 作业ID
    * @return SATRT控件实体
    */
    public JobEntrySpecial getStartEntryByJobId(int jobId) {
        return getStartEntryByJobId(KuConst.DATASOURCE_KETTLE, jobId);
    }
    /**
    * 通过作业ID获取对应的START控件 <br/>
    * @author jingma
    * @param dbCode 所在资源库代码
    * @param jobId 作业ID
    * @return SATRT控件实体
    */
    public JobEntrySpecial getStartEntryByJobId(String dbCode,int jobId) {
        Integer startId = getStartIdByJobId(dbCode, jobId);
        if(startId==null){
            return null;
        }
        LongObjectId id = new LongObjectId(startId);
        return KettleUtils.loadJobEntry(id, new JobEntrySpecial());
    }

    /**
    * 根据作业id获取该作业的开始控件id <br/>
    * @author jingma
    * @param dbCode
    * @param jobId
    * @return
    */
    public Integer getStartIdByJobId(String dbCode, int jobId) {
        //START控件的类型编号是74，每个JOB只有一个START控件，所有可以唯一确定
        String sql = "select je.id_jobentry from r_jobentry je where "
                + "je.id_job=? and je.id_jobentry_type=?";
        Record startIdRecord = Db.use(dbCode).findFirst(sql, jobId,startTypeId);
        if(startIdRecord == null){
            return null;
        }
        Integer startId = startIdRecord.getInt("id_jobentry");
        return startId;
    }

    /**
    * 从kettle的start控件中获取定时信息 <br/>
    * @author jingma
    * @param start
    */
    public void getFromStart(JobEntrySpecial start) {
        if(start==null){
            return;
        }
        set("is_repeat", StringUtil.whether(start.isRepeat()));
        set("scheduler_type", ""+start.getSchedulerType());
        set("interval_minutes", start.getIntervalMinutes());
        set("interval_seconds", start.getIntervalSeconds());
        set("hour", start.getHour());
        set("minutes", start.getMinutes());
        set("week_day", start.getWeekDay());
        set("day_of_month", start.getDayOfMonth());
    }

    /**
    * 将定时信息设置到kettle的start控件中 <br/>
    * @author jingma
    * @param start
    */
    public void setStart(JobEntrySpecial start) {
        start.setRepeat(UtilConst.WHETHER_TRUE.equals(getStr("is_repeat")));
        start.setSchedulerType(Integer.parseInt(getStr("scheduler_type")));
        start.setIntervalMinutes(getBigDecimal("interval_minutes").intValue());
        start.setIntervalSeconds(getBigDecimal("interval_seconds").intValue());
        start.setHour(getBigDecimal("hour").intValue());
        start.setMinutes(getBigDecimal("minutes").intValue());
        start.setWeekDay(Integer.parseInt(getStr("week_day")));
        start.setDayOfMonth(getBigDecimal("day_of_month").intValue());
    }
    /**
    * 保存定时到kettle的表中方式1 <br/>
    * 这时最正规的方式，但效率低<br/>
    * @author jingma
    * @return
    * @throws KettleException
    */
    public int saveTimingToKettle1() throws KettleException {
        int jobId = Integer.parseInt(getStr(KuConst.FIELD_OID));
        JobMeta jobMeta = KettleUtils.loadJob(jobId);
        JobEntrySpecial start = KettleUtils.findStart(jobMeta);
        setStart(start);
        KettleUtils.saveJob(jobMeta);
        return jobId;
    }
    /**
    * 保存定时到kettle的表中方式1 <br/>
    * 直接修改相关表数据，效率高，存在风险<br/>
    * @author jingma
    * @return
    * @throws KettleException
    */
    public int saveTimingToKettle2() throws KettleException {
        int jobId = Integer.parseInt(getStr(KuConst.FIELD_OID));
        Integer startId = getStartIdByJobId(KuConst.DATASOURCE_KETTLE, jobId);
        if(startId==null){
            return 0;
        }
        String sql = "update r_jobentry_attribute ja "
                + "set ja.VALUE_NUM=?,ja.VALUE_STR=? "
                + "where ja.id_jobentry="+startId
                + " and ja.code=?";
        DbPro db = Db.use(KuConst.DATASOURCE_KETTLE);
        db.update(sql, 0,UtilConst.WHETHER_TRUE.equals(getStr("is_repeat"))?"Y":"N",
                "repeat");
        db.update(sql, Integer.parseInt(getStr("scheduler_type")),
                null,"schedulerType");
        db.update(sql, getBigDecimal("interval_seconds").intValue(),
                null,"intervalSeconds");
        db.update(sql, getBigDecimal("interval_minutes").intValue(),
                null,"intervalMinutes");
        db.update(sql, getBigDecimal("hour").intValue(),null,"hour");
        db.update(sql, getBigDecimal("minutes").intValue(),null,"minutes");
        db.update(sql, Integer.parseInt(getStr("week_day")),null,"weekDay");
        db.update(sql, getBigDecimal("day_of_month").intValue(),
                null,"dayOfMonth");
        return jobId;
    }
}
