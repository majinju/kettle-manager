/**
* Project Name:myservice
* Date:2020年7月15日
* Copyright (c) 2020, jingma All Rights Reserved.
*/

package cn.benma666.ljq.znbk;

import cn.benma666.domain.SysSjglFile;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.iframe.Result;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjgl.DefaultLjq;
import cn.benma666.sjgl.LjqInterface;
import cn.benma666.sjgl.LjqManager;

import com.alibaba.fastjson.JSONObject;

/**
 * 任务管理 <br/>
 * date: 2020年7月15日 <br/>
 * @author jingma
 * @version 
 */
public class RwglLjq extends DefaultLjq {
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#saveDb(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    protected Result saveDb(SysSjglSjdx t, JSONObject myParams) {
        Result r = null;
        if(KEY_CLLX_INSERT.equals(myParams.getString(KEY_CLLX))){
            JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
            JSONObject kzxx = myParams.getJSONObject(FIELD_KZXX);
            //本系统为比对核查系统的一个子系统，本系统的数据都属于同一个固定项目
            yobj.put("ssxm", kzxx.getString("rwpz.ssxm"));
            yobj.put("id", StringUtil.getUUIDUpperStr());

            r = getJcxxByDxdm(kzxx.getString("rwpz.hmdx"));
            if(!r.isStatus()){
                return r;
            }
            JSONObject hmParams = (JSONObject) r.getData();
            hmParams.put(LjqInterface.KEY_USER, myParams.get(KEY_USER));
            hmParams.put(KEY_CLLX, KEY_CLLX_SJPLSC);
            hmParams.put(KEY_OBJ, new JSONObject());
            SysSjglSjdx hmSjdx = (SysSjglSjdx) hmParams.get(KEY_SJDX);
            
            //新增时对上传的文件进行解析，修改时不允许修改文件，所以不需要处理
            String sjwj = yobj.getString("sjwj");
            if(StringUtil.isNotBlank(sjwj)){
                //正常页面上传数据文件
                SysSjglFile fileObj = sqlManager().single(SysSjglFile.class, sjwj);
                hmSjdx.set("file", fileObj.toString());
                //需要重写hm的批量上传功能，将所属任务、项目设置进去。
                hmSjdx.set("ssrw", yobj.getString("id"));
                r = LjqManager.plcl(hmSjdx, hmParams);
                if(!r.isStatus()){
                    return r;
                }
            }else{
                //调用接口新增任务
                if(!yobj.containsKey("hmList")){
                    return failed("号码列表必须传");
                }
                try {
                    r = plSave(hmSjdx, hmParams, yobj.getJSONArray("hmList"));
                    if(!r.isStatus()){
                        return r;
                    }
                } catch (Exception e) {
                    log.error("保存号码失败", e);
                    return failed("保存号码失败"+e.getMessage());
                }
            }
        }
        Result r1 = super.saveDb(t, myParams);
        if(r!=null){
            r1.addMsg(r.getMsg());
        }
        return r1;
    }
}
