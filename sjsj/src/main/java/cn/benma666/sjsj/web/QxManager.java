package cn.benma666.sjsj.web;

import cn.benma666.domain.SysQxYhxx;
import cn.benma666.exception.QxException;
import cn.benma666.iframe.BasicObject;
import cn.benma666.iframe.Conf;
import cn.benma666.iframe.Result;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.JSONPath;

/**
 * 系统权限辅助类
 *
 * @author jingma
 */
public class QxManager extends BasicObject {

    /**
     * 权限过滤 <br/>
     * @param myParams 参数集
     * @param user 用户对象
     * @throws QxException 没有权限将抛出异常
     * @author jingma
     */
    public static void auth(JSONObject myParams,SysQxYhxx user) throws QxException{
        //用户
        if (user==null) {
            //没有用户信息则默认通过，此类都是系统内部调用
            return;
        }
        //处理类型
        String cllx = JSONPath.eval(myParams, LjqInterface.$_SYS_CLLX).toString();
        //权限码
        Object authCode = JSONPath.eval(myParams, LjqInterface.$_SYS_AUTHCODE);
        if ((authCode == null)&& valByDef(Conf.getVal("benma666.xtqx.mrtgxqx"),
                "jcxx,select").contains(cllx)) {
            //没有配置权限，且在允许权限范围内则默认通过
            return;
        }
        //对象权限判断
        if (user.getQxMap().containsKey(authCode + "_" + cllx)) {
            return;
        }
        throw new QxException("没有操作权限");
    }
}
