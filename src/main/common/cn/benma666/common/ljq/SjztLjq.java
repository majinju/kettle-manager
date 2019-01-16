/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import java.util.Map;
import java.util.Map.Entry;

import cn.benma666.constants.UtilConst;
import cn.benma666.db.Db;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.sjgl.SysSjglSjdx;
import cn.benma666.web.QxManager;
import cn.benma666.web.SConf;
import cn.benma666.web.SysQxYhxx;

import com.alibaba.fastjson.JSONObject;

/**
 * 数据载体拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class SjztLjq extends DefaultLjq{
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#save(cn.benma666.sjgl.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult save(SysSjglSjdx sjdx, JSONObject myJsonParams) {
        String cllx = myJsonParams.getString(LjqInterface.KEY_CLLX);
        JSONObject yobj = myJsonParams.getJSONObject(KEY_YOBJ);
        if(StringUtil.isBlank(yobj.getString("csyj"))){
            yobj.put("csyj", SConf.getVal("validationQuery."+yobj.getString("lx")));
        }
        if(KEY_CLLX_UPDATE.equals(cllx)){
            JSONObject obj = myJsonParams.getJSONObject(KEY_OBJ);
            if(UtilConst.DEFAULT.equals(obj.getString("dm"))){
                return error("配置文件中配置的数据库不能编辑");
            }
            Db.use(obj.getString("dm")).close();
        }else{
            SysQxYhxx user = (SysQxYhxx) myJsonParams.get(KEY_USER);
            QxManager.setCjrInfo(user, yobj);
        }
        return super.save(sjdx, myJsonParams);
    }
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.sjgl.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult plcl(SysSjglSjdx sjdx, JSONObject params) {
        String cllx = params.getString(LjqInterface.KEY_CLLX);
        Map<String, JSONObject> fields;
        switch (cllx) {
        case "bzpx":
            SysSjglSjdx obj = new SysSjglSjdx();
            obj.setId(sjdx.get(LjqInterface.KEY_IDS).toString());
            fields = getFields(obj);
            int idx = 0;
            for(Entry<String, JSONObject> field:fields.entrySet()){
                idx+=10;
                db.update("update sys_sjgl_sjzd t set t.px=? where t.id=?", 
                        idx,field.getValue().getString(FIELD_ID));
            }
            return success("成功标准化排序字段数："+fields.size());
        default:
            return super.plcl(sjdx, params);
        }
    }
}
