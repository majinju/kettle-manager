/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.jcga;

import cn.benma666.constants.UtilConst;
import cn.benma666.domain.SysQxYhxx;
import cn.benma666.exception.ExcelReadException;
import cn.benma666.iframe.Result;
import cn.benma666.sjsj.web.DefaultLjq;
import cn.benma666.sjsj.web.SjdxExcelReader;
import com.alibaba.fastjson.JSONObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * 机场员工离职拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 0.1
 */
@Component
@Scope("prototype")
public class JcygLzLjq extends DefaultLjq {
    public Result lzygcl(JSONObject myParams) {
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        SysQxYhxx user = (SysQxYhxx) myParams.get(KEY_USER);
        String msg;
        //批量时不进行身份证查重
        myParams.remove("$.yzgz['yobj.gmsfhm'].zdpd");
        //离职员工处理
        SjdxExcelReader er = new SjdxExcelReader(sjdx, myParams, myParams.getJSONObject("$.sys.files"));
        try {
            Result r = er.disposeExcel();
            if(!r.isStatus()){
                return r;
            }
        } catch (ExcelReadException e) {
            return failed(e.getMessage());
        } catch (Exception e) {
            log.error("文件处理失败："+myParams+"->"+e.getMessage(), e);
            return failed("文件处理失败："+e.getMessage());
        }

        /**
        * 无效人员
        */
        List<String> wxryList = new ArrayList<>();
        int count = 0;
        myParams.set("$.sys.yzdjl", true);
        for(JSONObject j: er.getResult().toArray(new JSONObject[]{})){
            j.put("zzzt", UtilConst.WHETHER_FALSE);
            //查询是否存在
            List<JSONObject> ygList = db().find("select * from JCGA_JCYG_JCXX t where t.gmsfhm=? and t.cjrdwdm=? and t.yxx='1' and zzzt<>'0'",
                    j.getString("gmsfhm"),user.getJgxx().getId());
            for(JSONObject yg:ygList){
                j.put("id", yg.getString("id"));
                j.remove("gmsfhm");
                myParams.put(KEY_YOBJ, j);
                Result r = update(myParams);
                if(!r.isStatus()){
                    r.setMsg("已成功处理："+count+"人后遇到错误："+r.getMsg());
                    return r;
                }
                count++;
            }
            if(ygList.size()==0){
                wxryList.add(j.getString("gmsfhm"));
            }
        }
        msg = "上传人数："+ er.getResult().size()+",成功处理人次（存在一人多条记录的情况）："+count;
        if(wxryList.size()>0){
            msg += "。<br/>如下员工不存在或不处于在职状态，系统已自动忽略："+Arrays.toString(wxryList.toArray());
        }
        return success(msg);
    }

    @Override
    public Result save(JSONObject myParams) {
        String cllx = getCllx(myParams);
        if(KEY_CLLX_INSERT.equals(cllx)){
            //列表选择进行批量离职操作
            myParams.put(KEY_CLLX, KEY_CLLX_UPDATE);
            JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
            int count = 0;
            for(String id:myParams.getJSONArray($_SYS_IDS).toArray(new String[]{})){
                yobj.put(FIELD_ID, id);
                yobj.put("zzzt", UtilConst.WHETHER_FALSE);
                Result r = super.save(myParams);
                if(!r.isStatus()){
                    r.setMsg("已成功处理："+count+"人后遇到错误："+r.getMsg());
                    return r;
                }
                count++;
            }
            return success("成功离职人数："+count);
        }else{
            //模板批量上传进行离职
            return super.save(myParams);
        }
    }
}
