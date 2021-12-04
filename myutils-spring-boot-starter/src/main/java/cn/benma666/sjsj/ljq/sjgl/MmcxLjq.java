package cn.benma666.sjsj.ljq.sjgl;

import cn.benma666.crypt.DesUtil;
import cn.benma666.iframe.Conf;
import cn.benma666.iframe.Result;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjsj.web.DefaultLjq;
import com.alibaba.fastjson.JSONObject;

/**
 * 密码查看拦截器
 */
public class MmcxLjq extends DefaultLjq {
    public Result insert(JSONObject myParams) {
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        try {
            String val = yobj.getString("value");
            if(StringUtil.isNotBlank(yobj.getString("ejmm"))){
                return success(DesUtil.decrypt(val, yobj.getString("ejmm")));
            }else if(Conf.getVal("benma666.data.password").equals(yobj.getString("yjmm"))){
                return success(DesUtil.decrypt(val, DesUtil.encrypt(yobj.getString("kjmm"),
                        yobj.getString("yjmm"))));
            }else{
                return failed("一级密码不正确");
            }
        } catch (Exception e) {
            return failed("获取密码出错："+e.getMessage());
        }
    }
}
