/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.ljq;

import java.security.InvalidKeyException;

import javax.crypto.BadPaddingException;

import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.myutils.DesUtil;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.web.SConf;

import com.alibaba.fastjson.JSONObject;

/**
 * 密码查看拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class MmcxLjq extends DefaultLjq{
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#save(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult save(SysSjglSjdx sjdx, JSONObject myJsonParams) {
        JSONObject yobj = myJsonParams.getJSONObject(KEY_YOBJ);
        try {
            String val = yobj.getString("value");
            if(StringUtil.isNotBlank(yobj.getString("ejmm"))){
                return success(DesUtil.decrypt(val, yobj.getString("ejmm")));
            }else if(SConf.getVal("data.password").equals(yobj.getString("yjmm"))){
                return success(StringUtil.desDeByField(val, yobj.getJSONObject("field")));
            }else{
                return error("一级密码不正确");
            }
        } catch (BadPaddingException e) {
            return error("二级密码不正确");
        } catch (InvalidKeyException e) {
            return error("二级密码不正确");
        } catch (Exception e) {
            return error("获取密码出错："+e.getMessage());
        }
    }
}
