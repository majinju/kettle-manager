/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.sjsj.ljq.sjgl;

import java.io.File;
import java.sql.SQLException;
import java.util.List;

import cn.benma666.constants.UtilConst;
import cn.benma666.iframe.DictManager;
import cn.benma666.iframe.PageInfo;
import cn.benma666.iframe.Result;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjsj.web.LjqInterface;
import cn.benma666.sjzt.Db;
import cn.benma666.sjzt.Ftp;

import com.alibaba.druid.DbType;
import com.alibaba.druid.util.JdbcUtils;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;
import org.beetl.sql.core.SQLManager;
import org.beetl.sql.core.SqlId;

/**
 * 数据载体拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 0.1
 */
public class SjztLjq extends ScjkrwLjq {
    /**
     * 测试数据载体
     * @return 测试结果
     */
    public Result cszt(JSONObject myParams) {
        log.debug(sqlManager().getSQLResult(SqlId.of("util","getDate14"),null).jdbcSql);
        //测试载体
        if(myParams.get($_SYS_IDS)!=null){
            //TODO 通用查询中需要考虑ids参数
            List<JSONObject> ztList = ((PageInfo<JSONObject>)select(myParams).getData()).getList();
            Result r = success("测试完成,测试了"+ztList.size()+"个数据源，其中如下数据源未通过：");
            for(JSONObject obj:ztList){
                if(!testSjzt(obj,true).isStatus()){
                    r.addMsg(obj.getString("dm"));
                }
            }
            r.setMsg(r.getMsg().replace("：,", "："));
            return r;
        }else{
            JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
            boolean mmjm = StringUtil.isBlank(yobj.getString("mm"));
            return testSjzt(yobj, mmjm);

        }
    }

    @Override
    public Result insert(JSONObject myParams) {
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        String dbdm = yobj.getString("dm");
        if(DbType.of(yobj.getString("lx"))!=null){
            if(StringUtil.isBlank(yobj.getString("sjkqd"))){
                try {
                    yobj.put("sjkqd", JdbcUtils.getDriverClassName(yobj.getString("ljc")));
                } catch (SQLException e) {
                    log.debug(yobj+"驱动获取失败",e);
                }
            }
            if(StringUtil.isBlank(yobj.getString("csyj"))){
                SQLManager sm = SQLManager.newBuilder(yobj.getString("sjkqd"),
                        yobj.getString("ljc"), yobj.getString("yhm"),
                        yobj.getString("mm")).build();
                yobj.put("csyj", sm.getSQLResult(SqlId.of("util","getDate14"),null).jdbcSql);
            }
        }
        Result result = super.insert(myParams);
        if(!result.isStatus()){
            return result;
        }
        DictManager.clearDict(ZD_SYS_COMMON_SJZT);
        JSONObject dbObj = DictManager.zdObjByDmByCache(LjqInterface.ZD_SYS_COMMON_SJZT,dbdm);
        //数据库型数据载体才进行测试
        result = testSjzt(dbObj,true);
        return result;
    }

    @Override
    public Result update(JSONObject myParams) {
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        String dbdm = myParams.getString("$.obj.dm");
        if(UtilConst.DEFAULT.equals(dbdm)){
            return failed("默认数据源不允许修改");
        }
        if(!dbdm.equals(myParams.getString("$.yobj.dm"))){
            return failed("数据载体代码不允许修改");
        }
        String ljc = yobj.getString("ljc");
        if(DbType.of(yobj.getString("lx"))!=null){
            if(Db.isCz(yobj.getString("dm"))){
                //修改已经加载的数据源，此处进行关闭
                Db.use(yobj.getString("dm")).close();
            }
        }
        switch (yobj.getString("lx")) {
            case "bdwj":
                //本地文件都以/结尾
                if(!ljc.endsWith("/")){
                    yobj.put("ljc", ljc+"/");
                }
                break;
            case "ftp":
            default:
                break;
        }
        Result result = super.update(myParams);
        if(!result.isStatus()){
            return result;
        }
        DictManager.clearDict(ZD_SYS_COMMON_SJZT);
        JSONObject dbObj = DictManager.zdObjByDmByCache(LjqInterface.ZD_SYS_COMMON_SJZT, dbdm);
        //数据库型数据载体才进行测试
        result = testSjzt(dbObj,true);
        return result;
    }
    /**
    * 测试数据载体是否可用 <br/>
    * @author jingma
    * @param sjztObj 数据载体对象
    * @param mmjm 是否密码加密
    * @return 测试结果
    */
    public Result testSjzt(JSONObject sjztObj,boolean mmjm) {
        Result result = success("该数据载体可用");
        if(sjztObj==null){
            return failed("数据载体为空");
        }
        try {
            if(DbType.of(sjztObj.getString("lx"))!=null){
                //数据库型数据载体
                result = Db.testDb(sjztObj, mmjm);
            }else if("ftp".equals(sjztObj.getString("lx"))){
                //ftp测试
                JSONObject ftpObj = Ftp.paseFtpUrl(sjztObj);
                new Ftp(sjztObj.getString("dm"), true, ftpObj);
                result = success("测试通过");
            }else if("bdwj".equals(sjztObj.getString("lx"))){
                //本地文件测试
                File f = new File(sjztObj.getString("ljc"));
                if(!f.exists()){
                    result = failed("该文件不存在");
                }
            }else{
                //TODO 其他类型载体后续添加测试功能
            }
        } catch (Exception e) {
            result = failed("该数据载体当前不可用："+sjztObj+","+e.getMessage(),e);
            log.debug(result.getMsg(),e);
        }
        return result;
    }

}
