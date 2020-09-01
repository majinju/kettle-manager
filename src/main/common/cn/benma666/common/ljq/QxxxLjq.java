/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import cn.benma666.constants.UtilConst;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.web.QxManager;
import cn.benma666.web.UserManager;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 权限信息拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class QxxxLjq extends DefaultLjq{
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult plcl(SysSjglSjdx sjdx, JSONObject params) {
        String cllx = params.getString(KEY_CLLX);
        JSONObject yobj = params.getJSONObject(KEY_YOBJ);
        String dqjs = yobj.getString("dqjs");
        SysQxYhxx user = (SysQxYhxx) params.get(KEY_USER);
        switch (cllx) {
        //保存角色授权信息
        case "saveJsSqxx":
            JSONArray changeNodes = yobj.getJSONArray("changeNodes");
            int count = 0;
            for(JSONObject node:changeNodes.toArray(new JSONObject[]{})){
                if(node.getBooleanValue("checked")){
                    JSONObject jsqx = new JSONObject();
                    QxManager.setCjrInfoMap(user, jsqx);
                    jsqx.put("js", dqjs);
                    jsqx.put("qx", node.getString("dm"));

                    if(node.getBooleanValue("zAsync")){
                        count += db.update("sys.insertJsqx", jsqx);
                    }else{
                        //节点关闭时操作全部子权限
                        count += db.update("sys.insertJsqxHzqx", jsqx);
                    }
                }else{
                    //将取消的授权改为无效
                    if(node.getBooleanValue("zAsync")){
                        count += db.update("update sys_qx_jsqxgl t set t.yxx=?,t.gxsj=to_char(sysdate,'YYYYMMDDHH24MISS') where t.js=? and t.qx=? and t.yxx=?", 
                                UtilConst.WHETHER_FALSE,dqjs,node.getString("dm"),UtilConst.WHETHER_TRUE);
                    }else{
                        //节点关闭时操作全部子权限
                        count += db.update("update sys_qx_jsqxgl t set t.yxx=?,t.gxsj=to_char(sysdate,'YYYYMMDDHH24MISS') where t.js=? and t.qx like ? and t.yxx=?", 
                                UtilConst.WHETHER_FALSE,dqjs,node.getString("dm")+"%",UtilConst.WHETHER_TRUE);
                    }
                }
            }
            UserManager.flushUserQxxx();
            return success("成功修改授权信息数:"+count);
        case "sxyhqx":
            //刷新用户权限信息
            UserManager.flushUserQxxx();
            return success("刷新用户权限成功！");
        case KEY_CLLX_PLSC:
            return super.plcl(sjdx, params);
        default:
            //执行默认操作
            return super.plcl(sjdx, params);
        }
    }
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#saveDb(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    protected JsonResult saveDb(SysSjglSjdx t, JSONObject myparams) {
        String cllx = myparams.getString(KEY_CLLX);
        JSONObject yobj = myparams.getJSONObject(KEY_YOBJ);
        String dm = yobj.getString("dm");
        JSONObject obj = myparams.getJSONObject(KEY_OBJ);
        if(KEY_CLLX_INSERT.equals(cllx)
                &&UtilConst.WHETHER_TRUE.equals(yobj.getString("sczqx"))
                &&StringUtil.isNotBlank(yobj.getString("dz"))){
            //新增权限且类型是连接且地址类型是数据对象则自动生成默认子权限且要求自动生成子权限
            JsonResult r = DefaultLjq.getDefaultSql(t, "sczqx",myparams);
            sqlManager.executeUpdate(r.getMsg(), myparams);
        }else if(StringUtil.isNotBlank(dm)){
            //权限代码调整时，联动调整子权限的代码
            db.update("update sys_qx_qxxx t set t.dm=replace(t.dm,?,?),t.fqx=replace(t.fqx,?,?),"
                    + "t.gxsj=to_char(sysdate,'YYYYMMDDHH24MISS') where t.dm like ?", 
                    obj.getString("dm")+"_",dm+"_",obj.getString("dm"),dm,obj.getString("dm")+"_%");
        }
        JsonResult r = super.saveDb(t, myparams);
        if(r.isStatus()&&StringUtil.isNotBlank(dm)){
            //修改授权信息中的权限代码。
            db.update("update sys_qx_jsqxgl t set t.qx=replace(t.qx,?,?),"
                    + "t.gxsj=to_char(sysdate,'YYYYMMDDHH24MISS') where t.qx like ?", 
                    obj.getString("dm"),dm,obj.getString("dm")+"%");
            UserManager.flushUserQxxx();
        }
        return r;
    }
}
