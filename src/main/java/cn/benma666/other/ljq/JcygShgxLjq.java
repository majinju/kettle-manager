/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.other.ljq;

import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;

import com.alibaba.fastjson.JSONObject;

/**
 * 机场员工-社会关系拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class JcygShgxLjq extends DefaultLjq{
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#saveDb(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    protected JsonResult saveDb(SysSjglSjdx t, JSONObject myparams) {
        JSONObject yobj = myparams.getJSONObject(KEY_YOBJ);
        String ygbh = yobj.getString("ygbh");
        if(StringUtil.isBlank(ygbh)){
            JSONObject obj = myparams.getJSONObject(KEY_OBJ);
            ygbh = obj.getString("ygbh");
        }
        db.update("update jcga_jcyg_jcxx t set t.gxsj=to_char(sysdate,'yyyymmddhh24miss') where t.ygbh=?",ygbh);
        return super.saveDb(t, myparams);
    }
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult plcl(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = myParams.getString(KEY_CLLX);
        switch (cllx) {
        case KEY_CLLX_PLSC:
            String in = myParams.getString(KEY_IDS_IN);
            db.update("update jcga_jcyg_jcxx t set t.gxsj=to_char(sysdate,'yyyymmddhh24miss') where t.ygbh in ("
                    + "select ygbh from jcga_jcyg_shgx where id "+in+")");
            break;
        }
        return super.plcl(sjdx, myParams);
    }
}
