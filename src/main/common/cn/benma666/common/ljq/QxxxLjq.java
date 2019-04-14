/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import cn.benma666.constants.UtilConst;
import cn.benma666.myutils.JsonResult;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.SysSjglSjdx;
import cn.benma666.web.QxManager;
import cn.benma666.web.SysQxYhxx;

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
    * @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.sjgl.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
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
                    QxManager.setCjrInfo(user, jsqx);
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
            return success("成功修改授权信息数:"+count);
        default:
            //执行默认操作
            return super.plcl(sjdx, params);
        }
    }
}
