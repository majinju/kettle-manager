package cn.benma666.sjsj.ljq.sjgl;

import cn.benma666.crypt.DesUtil;
import cn.benma666.exception.MyException;
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
            String dataPwd = Conf.getVal("benma666.data.password");
            JSONObject field = yobj.getJSONObject("field");
            String pwd = field.getString("$.kzxx.kjkz.mm");
            String jmsf = valByDef(field.getString("$.kzxx.kjkz.jmsf"),"des");
            String ejmm;
            switch (jmsf){
                case "md5":
                    return failed("md5算法不支持解密");
                case "des":
                    ejmm = DesUtil.encrypt(pwd,dataPwd);
                    break;
                case "sm3":
                    //国产加密算法
                default:
                    throw new MyException("暂不支持的算法："+jmsf);
            }
            if((StringUtil.isNotBlank(yobj.getString("ejmm"))&&yobj.getString("ejmm")
                    .equals(ejmm))||dataPwd.equals(yobj.getString("yjmm"))){
                //输入的二级密码正确或一级密码正确
                return success(StringUtil.desDeByField(val,field));
            }else{
                return failed("密码不正确");
            }
        } catch (MyException e) {
            return failed("获取密码出错："+e.getMessage());
        } catch (Exception e) {
            log.error("获取密码失败："+myParams,e);
            return failed("获取密码出错："+e.getMessage());
        }
    }
}
