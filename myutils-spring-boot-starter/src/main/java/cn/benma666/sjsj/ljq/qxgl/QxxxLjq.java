/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.sjsj.ljq.qxgl;

import cn.benma666.constants.UtilConst;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;

import cn.benma666.iframe.Result;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjsj.web.DefaultLjq;
import cn.benma666.sjsj.web.QxManager;
import cn.benma666.sjsj.web.UserManager;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 权限信息拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 0.1
 */
public class QxxxLjq extends DefaultLjq {
    /**
     * 保存角色权限信息
     */
    public Result saveJsSqxx(SysSjglSjdx sjdx, JSONObject myParams){
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        String dqjs = yobj.getString("dqjs");
        SysQxYhxx user = (SysQxYhxx) myParams.get(KEY_USER);
        JSONArray changeNodes = yobj.getJSONArray("changeNodes");
        int count = 0;
        for(JSONObject node:changeNodes.toArray(new JSONObject[]{})){
            if(node.getBooleanValue("checked")){
                JSONObject jsqx = new JSONObject();
                jsqx.put("js", dqjs);
                jsqx.put("qx", node.getString("dm"));

                if(node.getBooleanValue("zAsync")){
                    count += db(sjdx).update("sys.insertJsqx", jsqx);
                }else{
                    //节点关闭时操作全部子权限
                    count += db(sjdx).update("sys.insertJsqxHzqx", jsqx);
                }
            }else{
                //将取消的授权改为无效
                if(node.getBooleanValue("zAsync")){
                    count += db(sjdx).update("update sys_qx_jsqxgl t set t.yxx=?,t.gxsj=to_char(sysdate,'YYYYMMDDHH24MISS') where t.js=? and t.qx=? and t.yxx=?",
                            UtilConst.WHETHER_FALSE,dqjs,node.getString("dm"),UtilConst.WHETHER_TRUE);
                }else{
                    //节点关闭时操作全部子权限
                    count += db(sjdx).update("update sys_qx_jsqxgl t set t.yxx=?,t.gxsj=to_char(sysdate,'YYYYMMDDHH24MISS') where t.js=? and t.qx like ? and t.yxx=?",
                            UtilConst.WHETHER_FALSE,dqjs,node.getString("dm")+"%",UtilConst.WHETHER_TRUE);
                }
            }
        }
        UserManager.flushUserQxxx();
        return success("成功修改授权信息数:"+count);
    }

    /**
     * 刷新用户权限
     */
    public Result sxyhqx(SysSjglSjdx sjdx, JSONObject myParams) {
        //刷新用户权限信息
        UserManager.flushUserQxxx();
        return success("刷新用户权限成功！");
    }
    @Override
    protected Result saveDb(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = myParams.getString(KEY_CLLX);
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        String dm = yobj.getString("dm");
        JSONObject obj = myParams.getJSONObject(KEY_OBJ);
        Result r = super.saveDb(sjdx, myParams);
        if(!r.isStatus()){
            return r;
        }else if(KEY_CLLX_INSERT.equals(cllx)&&r.isStatus()
                &&UtilConst.WHETHER_TRUE.equals(yobj.getString("sczqx"))
                && StringUtil.isNotBlank(yobj.getString("dz"))){
            //新增权限且类型是连接且地址类型是数据对象则自动生成默认子权限且要求自动生成子权限
            String[] rr = getSql(sjdx, myParams, "sczqx");
            sqlManager(rr[0]).executeUpdate(rr[1], myParams);
        }else if(KEY_CLLX_UPDATE.equals(cllx)
                &&r.isStatus()&&StringUtil.isNotBlank(dm)){
            //权限代码调整时，联动调整子权限的代码
            db(sjdx).update("update sys_qx_qxxx t set t.dm=replace(t.dm,?,?),t.fqx=replace(t.fqx,?,?),"
                    + "t.gxsj=to_char(sysdate,'YYYYMMDDHH24MISS') where t.dm like ?", 
                    obj.getString("dm")+"_",dm+"_",obj.getString("dm"),dm,obj.getString("dm")+"_%");
            //修改授权信息中的权限代码。
            db(sjdx).update("update sys_qx_jsqxgl t set t.qx=replace(t.qx,?,?),"
                    + "t.gxsj=to_char(sysdate,'YYYYMMDDHH24MISS') where t.qx like ?", 
                    obj.getString("dm"),dm,obj.getString("dm")+"%");
            UserManager.flushUserQxxx();
        }
        return r;
    }
}
