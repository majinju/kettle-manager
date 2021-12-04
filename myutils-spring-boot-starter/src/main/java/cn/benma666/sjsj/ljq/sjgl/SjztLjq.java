/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.sjsj.ljq.sjgl;

import cn.benma666.constants.UtilConst;
import cn.benma666.iframe.DictManager;
import cn.benma666.iframe.PageInfo;
import cn.benma666.iframe.Result;
import cn.benma666.sjzt.Db;
import cn.benma666.sjzt.Ftp;
import com.alibaba.druid.DbType;
import com.alibaba.fastjson.JSONObject;

import java.io.File;
import java.util.List;

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
        myParams.set("$.page.totalRequired",false);
        List<JSONObject> ztList = ((PageInfo<JSONObject>)select(myParams).getData()).getList();
        int tgs = 0;
        StringBuilder wtg = new StringBuilder();
        for(JSONObject obj:ztList){
            if(testSjzt(obj,true).isStatus()) {
                tgs++;
            } else {
                wtg.append(obj.getString("mc")).append(",");
            }
        }
        Result r = success("测试了"+ztList.size()+"个数据源，测试成功"+tgs+"个");
        if(wtg.length()>0){
            r.addMsg("未通过载体如下："+wtg.substring(0,wtg.length()-1));
        }
        return r;
    }

    @Override
    public Result insert(JSONObject myParams) {
        yclSjzt(myParams);
        Result result = super.insert(myParams);
        if(!result.isStatus()){
            return result;
        }
        DictManager.clearDict(ZD_SYS_COMMON_SJZT);
        return result;
    }

    /**
     * 预处理数据载体
     * @param myParams 相关参数
     */
    private Result yclSjzt(JSONObject myParams) {
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        String ljc = yobj.getString("ljc");
        switch (yobj.getString("lx")) {
            case "bdwj":
                //本地文件都以/结尾
                if (!ljc.endsWith("/")) {
                    yobj.put("ljc", ljc + "/");
                }
                break;
            case "ftp":
            default:
                break;
        }
        return success("预处理成功",yobj);
    }

    @Override
    public Result update(JSONObject myParams) {
        yclSjzt(myParams);
        String dbdm = myParams.getString("$.obj.dm");
        if(UtilConst.DEFAULT.equals(dbdm)){
            return failed("默认数据源不允许修改");
        }
        if(!dbdm.equals(myParams.getString("$.yobj.dm"))){
            return failed("数据载体代码不允许修改");
        }
        if(DbType.of(myParams.getString("$.yobj.lx"))!=null){
            if(Db.isCz(dbdm)){
                //修改已经加载的数据源，此处进行关闭
                Db.use(dbdm).close();
            }
        }
        Result result = super.update(myParams);
        if(!result.isStatus()){
            return result;
        }
        DictManager.clearDict(ZD_SYS_COMMON_SJZT);
        return result;
    }
    /**
    * 测试数据载体是否可用 <br/>
    * @author jingma
    * @param yobj 数据载体对象
    * @param mmjm 是否密码加密
    * @return 测试结果
    */
    public Result testSjzt(JSONObject yobj,boolean mmjm) {
        Result result = success("该数据载体可用");
        if(yobj==null){
            return failed("数据载体为空");
        }
        try {
            if(DbType.of(yobj.getString("lx"))!=null){
                //数据库型数据载体
                result = Db.testDb(yobj, mmjm);
            }else if("ftp".equals(yobj.getString("lx"))){
                //ftp测试
                JSONObject ftpObj = Ftp.paseFtpUrl(yobj);
                new Ftp(yobj.getString("dm"), true, ftpObj);
                result = success("测试通过");
            }else if("bdwj".equals(yobj.getString("lx"))){
                //本地文件测试
                File f = new File(yobj.getString("ljc"));
                if(!f.exists()){
                    result = failed("该文件不存在");
                }
            }
        } catch (Exception e) {
            result = failed("该数据载体当前不可用："+yobj+","+e.getMessage(),e);
            log.debug(result.getMsg(),e);
        }
        return result;
    }

}
