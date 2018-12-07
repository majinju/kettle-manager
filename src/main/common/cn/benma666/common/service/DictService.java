/**
* Project Name:hl_2018
* Date:2018年5月24日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.common.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import cn.benma666.common.domain.SysZdTyzd;
import cn.benma666.constants.UtilConst;
import cn.benma666.myutils.PageInfo;
import cn.benma666.web.BasicService;

import com.alibaba.fastjson.JSONObject;

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

    /**
    * 批量删除 <br/>
    * @author jingma
    * @param t
    */
    public void batchDelete(SysZdTyzd t) {
        db.update("update sys_zd_tyzd t set t.isdel=? where t.id in ('"
                +t.get("ids").toString().replace(",", "','")+"')", 
                UtilConst.WHETHER_TRUE);
    }

}
