/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.jcga;

import cn.benma666.iframe.Result;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjsj.web.DefaultLjq;
import com.alibaba.fastjson.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * 机场员工-社会关系拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 0.1
 */
@Component
@Scope("prototype")
public class JcygShgxLjq extends DefaultLjq {
    @Override
    @Transactional
    protected Result saveDb(JSONObject myparams) {
        JSONObject yobj = myparams.getJSONObject(KEY_YOBJ);
        String ygbh = yobj.getString("ygbh");
        if(StringUtil.isBlank(ygbh)){
            JSONObject obj = myparams.getJSONObject(KEY_OBJ);
            ygbh = obj.getString("ygbh");
        }
        db().update("update jcga_jcyg_jcxx t set t.gxsj=to_char(sysdate,'yyyymmddhh24miss') where t.ygbh=?",ygbh);
        Result r = super.saveDb(myparams);
        return swtj(r);
    }
    @Override
    @Transactional
    public Result plsc(JSONObject myParams) {
        db().update("update jcga_jcyg_jcxx t set t.gxsj=to_char(sysdate,'yyyymmddhh24miss') where t.ygbh in ("
                + "select ygbh from jcga_jcyg_shgx where id in (#{join(sys.ids)}))",myParams);
        Result r = super.plcl(myParams);
        return swtj(r);
    }
}
