/**
* Project Name:hl_2018
* Date:2018年5月24日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.benma666.constants.UtilConst;
import cn.benma666.domain.SysZdTyzd;
import cn.benma666.iframe.DictManager;
import cn.benma666.myutils.JsonResult;
import cn.benma666.myutils.PageInfo;
import cn.benma666.myutils.StringUtil;
import cn.benma666.web.BasicService;

import com.alibaba.fastjson.JSONObject;
import com.github.stuxuhai.jpinyin.PinyinFormat;
import com.github.stuxuhai.jpinyin.PinyinHelper;

/**
 * 字典服务类 <br/>
 * date: 2018年5月24日 <br/>
 * @author jingma
 * @version 
 */
@Service
public class DictService extends BasicService{

    /**
    * 分页查询 <br/>
    * @author jingma
    * @param t
    * @param page
    * @return
    */
    public PageInfo<JSONObject> queryPage(SysZdTyzd t,
            PageInfo<JSONObject> page) {
        //开始
        List<Object> values = new ArrayList<Object>();
        StringBuffer sql = new StringBuffer("select * from sys_zd_tyzd t where 1=1");
        //加条件
        addEq(sql,values,"and zdlb=?",t.getZdlb());
        addEq(sql,values,"and isdel=?",t.getIsdel());
        addLike(sql,values,"and dm like ?",t.getDm());
        addLike(sql,values,"and mc like ?",t.getMc());
        addLike(sql,values,"and ms like ?",t.getMs());
        //加排序
        addPxField(sql,"px,dm",t);
        //分页查询
        page = db.queryPage(page, sql.toString(),values.toArray());
        return page;
    }

    public JsonResult txSave(SysZdTyzd t) {
        if(!StringUtil.isBlank(t.getMc())&&t.getMc().length()<200){
            //设置名称简拼
            t.setJp(PinyinHelper.getShortPinyin(t.getMc()).toUpperCase());
            //设置名称全拼
            t.setQp(PinyinHelper.convertToPinyinString(t.getMc(), "",PinyinFormat.WITHOUT_TONE).toUpperCase());
        }
        if(StringUtil.isBlank(t.getId())){
            sqlManager.insertTemplate(t);
        }else{
            if("SYS_COMMON_ZDLB".equals(t.getZdlb())){
                SysZdTyzd oldObj = sqlManager.single(SysZdTyzd.class, t.getId());
                if(!oldObj.getDm().equals(t.getDm())){
                    db.update("update sys_zd_tyzd t set t.zdlb=? where t.zdlb=?", 
                            t.getDm(),oldObj.getDm());
                }
            }
            t.setEtldate(db.getCurrentDateStr14());
            sqlManager.updateTemplateById(t);
        }
        DictManager.clearDict(t.getZdlb());
        return success("编辑成功");
    }

    /**
    * 批量删除 <br/>
    * @author jingma
    * @param t
    * @return 
    */
    public JsonResult txBatchDelete(SysZdTyzd t) {
        //逻辑删除相关字典类别的字典项
        db.update("update sys_zd_tyzd t set t.isdel=? where t.zdlb in("
                + "select dm from sys_zd_tyzd t1 where t1.id in ('"
                +t.get("ids").toString().replace(",", "','")+"'))", 
                UtilConst.WHETHER_TRUE);
        //执行逻辑删除
        db.update("update sys_zd_tyzd t set t.isdel=? where t.id in ('"
                +t.get("ids").toString().replace(",", "','")+"')", 
                UtilConst.WHETHER_TRUE);
        return success("批量删除成功");
    }

}
