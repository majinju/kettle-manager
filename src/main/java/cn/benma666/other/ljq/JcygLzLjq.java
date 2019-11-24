/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.other.ljq;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import cn.benma666.constants.UtilConst;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.domain.SysSjglSjdx;
import cn.benma666.exception.ExcelReadException;
import cn.benma666.myutils.JsonResult;
import cn.benma666.sjgl.DefaultLjq;

import com.alibaba.fastjson.JSONObject;

/**
 * 机场员工离职拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 
 */
public class JcygLzLjq extends DefaultLjq{
    private JcygLzExcel er;
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#plcl(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult plcl(SysSjglSjdx sjdx, JSONObject myParams) {
        String cllx = myParams.getString(KEY_CLLX);
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        SysQxYhxx user = (SysQxYhxx) myParams.get(KEY_USER);
        String msg;
        switch (cllx) {
        case "lzygcl":
            //离职员工处理
            er = new JcygLzExcel(sjdx,myParams,yobj.getJSONObject("fileObj"),user);
            try {
                JsonResult r = er.disposeExcel();
                if(!r.isStatus()){
                    return r;
                }
            } catch (ExcelReadException e) {
                return error(e.getMessage());
            } catch (Exception e) {
                log.error("文件处理失败："+myParams+"->"+e.getMessage(), e);
                return error("文件处理失败："+e.getMessage());
            }

            /**
            * 无效人员
            */
            List<String> wxryList = new ArrayList<String>();
            int count = 0;
            for(JSONObject j:er.getResult().toArray(new JSONObject[]{})){
                //查询是否存在
                List<JSONObject> ygList = db.find("select * from JCGA_JCYG_JCXX t where t.gmsfhm=? and t.cjrdwdm=? and t.yxx='1' and zzzt<>'0'", 
                        j.getString("gmsfhm"),user.getJgxx().getId());
                for(JSONObject yg:ygList){
                    if(yg!=null){
                        j.put("id", yg.getString("id"));
                        j.put("zzzt", UtilConst.WHETHER_FALSE);
                        myParams.put(KEY_YOBJ, j);
                        myParams.put(KEY_CLLX, KEY_CLLX_UPDATE);
                        save(sjdx,myParams);
                        count++;
                    }else{
                        wxryList.add(j.getString("gmsfhm"));
                    }
                }
            }
            msg = "上传人数："+er.getResult().size()+",成功处理人次（存在一人多条记录的情况）："+count;
            if(wxryList.size()>0){
                msg += "。<br/>如下员工不存在或不处于在职状态，系统已自动忽略："+Arrays.toString(wxryList.toArray());
            }
            return success(msg);
            
        default:
            return super.plcl(sjdx, myParams);
        }
    }
    
    /**
    * 
    * @see cn.benma666.sjgl.DefaultLjq#save(cn.benma666.domain.SysSjglSjdx, com.alibaba.fastjson.JSONObject)
    */
    @Override
    public JsonResult save(SysSjglSjdx sjdx, JSONObject myParams) {
        return super.save(sjdx, myParams);
    }
}
