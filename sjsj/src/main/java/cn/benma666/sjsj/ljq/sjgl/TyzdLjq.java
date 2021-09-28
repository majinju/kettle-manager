/**
 * Project Name:sjgl
 * Date:2018年12月16日
 * Copyright (c) 2018, jingma All Rights Reserved.
 */

package cn.benma666.sjsj.ljq.sjgl;

import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.DictManager;
import cn.benma666.iframe.Result;
import cn.benma666.sjsj.web.DefaultLjq;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;

/**
 * 统一字典拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 0.1
 */
public class TyzdLjq extends DefaultLjq {
    @Override
    public Result insert(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = JSONPath.eval(myParams, $_SYS_CLLX).toString();
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        //先更新
        Result r = super.insert(sjdx, myParams);
        //再清缓存
        if (KEY_CLLX_UPDATE.equals(cllx)) {
            JSONObject obj = myParams.getJSONObject(KEY_OBJ);
            DictManager.clearDict(obj.getString("zdlb"));
        } else {
            DictManager.clearDict(yobj.getString("zdlb"));
        }
        return r;
    }

    @Override
    public Result data(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = JSONPath.eval(myParams, $_SYS_CLLX).toString();
        switch (cllx) {
            case "qchc":
                DictManager.clearDict();
                return success("清除缓存成功");
            default:
                //执行默认操作
                return super.data(sjdx, myParams);
        }
    }
}
