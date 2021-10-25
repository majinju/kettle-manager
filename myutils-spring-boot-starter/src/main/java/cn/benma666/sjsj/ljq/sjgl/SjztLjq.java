/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.sjsj.ljq.sjgl;

import java.io.File;
import java.util.List;

import cn.benma666.constants.UtilConst;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.DictManager;
import cn.benma666.iframe.PageInfo;
import cn.benma666.iframe.Result;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjsj.web.LjqInterface;
import cn.benma666.sjzt.Db;
import cn.benma666.sjzt.Ftp;

import com.alibaba.druid.DbType;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;

/**
 * 数据载体拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 0.1
 */
public class SjztLjq extends ScjkrwLjq {
    @Override
    public Result data(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = getCllx(myParams);
        switch (cllx) {
        case "cszt":
            //测试载体
            if(JSONPath.eval(myParams,$_SYS_IDS)!=null){
                //TODO 通用查询中需要考虑ids参数
                List<JSONObject> ztList = ((PageInfo<JSONObject>)select(sjdx,myParams).getData()).getList();
                Result r = success("测试完成,测试了"+ztList.size()+"个数据源，其中如下数据源未通过：");
                for(JSONObject obj:ztList){
                    if(!testSjzt(obj,true).isStatus()){
                        r.addMsg(obj.getString("dm"));
                    }
                }
                r.setMsg(r.getMsg().replace("：,", "："));
                return r;
            }else{
                JSONObject obj = myParams.getJSONObject(KEY_OBJ);
                JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
                boolean mmjm = true;
                if(StringUtil.isNotBlank(yobj.getString("mm"))){
                    mmjm = false;
                }
                obj.putAll(yobj);
                return testSjzt(obj, mmjm);
                
            }
        default:
            //执行默认操作
            return super.data(sjdx, myParams);
        }
    }

    @Override
    public Result insert(SysSjglSjdx sjdx, JSONObject myJsonParams) {
        String cllx = myJsonParams.getString(LjqInterface.KEY_CLLX);
        JSONObject yobj = myJsonParams.getJSONObject(KEY_YOBJ);
        JSONObject obj = myJsonParams.getJSONObject(KEY_OBJ);
        String dbdm = obj.getString("dm");
        if(UtilConst.DEFAULT.equals(dbdm)){
            return failed("默认数据源不允许修改");
        }
        obj.putAll(yobj);
        String ljc = obj.getString("ljc");
        if(DbType.of(obj.getString("lx"))!=null){
            if(KEY_CLLX_UPDATE.equals(cllx)){
                if(Db.isCz(obj.getString("dm"))){
                    Db.use(obj.getString("dm")).close();
                }
            }else{
                dbdm = yobj.getString("dm");
                yobj.put("csyj", yobj.getString("csyj"));
                //处理驱动
                yobj.put("sjkqd", yobj.getString("sjkqd"));
            }
        }
        switch (obj.getString("lx")) {
        case "ftp":
            break;
        case "bdwj":
            //本地文件都以/结尾
            if(!ljc.endsWith("/")){
                yobj.put("ljc", ljc+"/");
            }
            break;
        default:
            break;
        }
        Result result = super.insert(sjdx, myJsonParams);
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
    * @return
    */
    public Result testSjzt(JSONObject sjztObj,boolean mmjm) {
        Result result = success("该数据载体可用");
        if(sjztObj==null){
            return failed("数据载体为空");
        }
        String zt = "1";
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
            zt = "2";
            result = failed("该数据载体当前不可用："+sjztObj+","+e.getMessage(),e);
            log.debug(result.getMsg(),e);
        }
        if(!result.isStatus()){
            zt = "2";
        }
        //更新数据源状态
        db().update("update SYS_SJGL_SJZT t set t.zt=?,t.gxsj=to_char(sysdate,'yyyymmddhh24miss') where t.id=?", 
                zt,sjztObj.getString("id"));
        return result;
    }

}
