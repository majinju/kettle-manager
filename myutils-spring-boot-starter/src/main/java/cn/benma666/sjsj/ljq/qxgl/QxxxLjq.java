/**
* Project Name:sjgl
* Date:2018年12月16日
* Copyright (c) 2018, jingma All Rights Reserved.
*/

package cn.benma666.sjsj.ljq.qxgl;

import cn.benma666.constants.UtilConst;
import cn.benma666.exception.MyException;
import cn.benma666.iframe.PageInfo;
import cn.benma666.iframe.Result;
import cn.benma666.myutils.DateUtil;
import cn.benma666.myutils.StringUtil;
import cn.benma666.sjsj.web.DefaultLjq;
import cn.benma666.sjsj.web.UserManager;
import com.alibaba.fastjson.JSONObject;
import org.beetl.sql.core.SqlId;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 权限信息拦截器 <br/>
 * date: 2018年12月16日 <br/>
 * @author jingma
 * @version 0.1
 */
@Component
@Scope("prototype")
public class QxxxLjq extends DefaultLjq {
    /**
     * 保存授权
     */
    public Result bcsq(@org.jetbrains.annotations.NotNull JSONObject myParams){
        JSONObject changeCheckData = myParams.getJSONObject("$.sys.changeCheckData");
        String dqjs = myParams.getString("$.yobj.js");
        int count = 0;
        for(String key:changeCheckData.keySet()){
            JSONObject node = changeCheckData.getJSONObject(key);
            myParams.set("$.sql.changeNode",node.get("obj"));
            if(node.getBooleanValue("checked")){
                count += db().update(SqlId.of("sjsj","insertJsqx"), myParams);
            }else{
                //将取消的授权改为无效
                count += db().update("update sys_qx_jsqxgl t set t.yxx=?,t.gxsj=? where t.js=? and t.qx=? and t.yxx=?",
                        UtilConst.WHETHER_FALSE,DateUtil.getGabDate(),dqjs,node.getString("$.obj.dm"),UtilConst.WHETHER_TRUE);
            }
        }
//        UserManager.flushUserQxxx();
        return success("成功修改授权信息数:"+count);
    }

    /**
     * 刷新用户权限
     */
    public Result sxyhqx(JSONObject myParams) {
        //刷新用户权限信息
        UserManager.flushUserQxxx();
        return success("刷新用户权限成功！");
    }

    /**
     * 获取菜单树，完整的菜单
     */
    public Result cds(JSONObject myParams){
        String[] sql = getSql(myParams);
        List<JSONObject> list = db(sql[0]).find(sql[1],myParams);
        return success("获取菜单成功",StringUtil.buildTree(list,"fqx","dm"));
    }
    @Override
    @Transactional
    public Result insert(JSONObject myParams){
        Result r = super.insert(myParams);
        if(!r.isStatus()){
            return swtj(r);
        }
        if(valByDef(myParams.getBoolean("$.yobj.sczqx"),false)){
            if(StringUtil.isBlank(myParams.getString("$.yobj.sjdx"))){
                throw new MyException("要生成子权限，必须选择数据对象");
            }
            //新增权限且类型是连接且地址类型是数据对象则自动生成默认子权限且要求自动生成子权限
            String[] rr = getSql(myParams, "sczqx");
            sqlManager(rr[0]).executeUpdate(rr[1], myParams);
        }
        return swtj(r);
    }
    @Override
    @Transactional
    public Result update(JSONObject myParams){
        JSONObject obj = myParams.getJSONObject(KEY_OBJ);
        Result r = super.update(myParams);
        if(!r.isStatus()||obj==null){
            //批量保存场景没有自动读取数据库对象
            return swtj(r);
        }
        JSONObject yobj = myParams.getJSONObject(KEY_YOBJ);
        String dm = yobj.getString("dm");
        if(StringUtil.isNotBlank(dm)&&!dm.equals(obj.getString("dm"))){
            //权限代码调整时，联动调整子权限的代码
            db().update("update sys_qx_qxxx t set t.dm=replace(t.dm,?,?),t.fqx=replace(t.fqx,?,?),"
                    + "t.gxsj=? where t.dm like ?",
                    obj.getString("dm")+"_",dm+"_",obj.getString("dm"),dm,
                    DateUtil.getGabDate(),obj.getString("dm")+"_%");
            //修改授权信息中的权限代码。
            db().update("update sys_qx_jsqxgl t set t.qx=replace(t.qx,?,?),"
                    + "t.gxsj=? where t.qx like ?",
                    obj.getString("dm"),dm,DateUtil.getGabDate(),obj.getString("dm")+"%");
        }
        return swtj(r);
    }
    @Override
    @Transactional
    public Result plsc(JSONObject myParams){
        //同时逻辑删除对应的子权限
        int countLj = 0;
        int countWl = 0;
        int countLjSq = 0;
        int countWlSq = 0;
        //查询出全部操作记录
        myParams.set("$.page.pageSize",5000);
        boolean wlsc = myParams.getBoolean("$.sys.wlsc");
        List<JSONObject> list = ((PageInfo<JSONObject>) select(myParams).getData()).getList();
        for(JSONObject obj:list){
            if(!obj.getBoolean("myhaschild")){
                //没有子权限跳过
                continue;
            }
            if(!obj.getBoolean("yxx")&&wlsc){
                //无效的数据且允许物理删除，删除对应的子权限
                countWl+=db().update("delete from sys_qx_qxxx t where t.dm like ? and t.yxx=?",
                        obj.getString("dm")+"%",WHETHER_FALSE);
                countWlSq+=db().update("delete from sys_qx_jsqxgl t where t.qx like ? and t.yxx=?",
                        obj.getString("dm")+"%",WHETHER_FALSE);
            }else{
                //有效数据逻辑删除子权限
                countLj+=db().update("update sys_qx_qxxx t set t.yxx=?,t.gxsj=? where t.dm like ? and t.yxx=?",
                        WHETHER_FALSE,DateUtil.getGabDate(),obj.getString("dm")+"%",WHETHER_TRUE);
                countLjSq+=db().update("update sys_qx_jsqxgl t set t.yxx=?,t.gxsj=? where t.qx like ? and t.yxx=?",
                        WHETHER_FALSE,DateUtil.getGabDate(),obj.getString("dm")+"%",WHETHER_TRUE);
            }
        }
        Result r = super.plsc(myParams);
        //同时逻辑删除对应的子权限
        r.addMsg("逻辑删除相关子权限"+countLj+"个，逻辑删除相关授权"+countLjSq+"个");
        if(countWl>0){
            r.addMsg("物理删除相关子权限"+countWl+"个，物理删除相关授权"+countWlSq+"个");
        }
        return swtj(r);
    }

}
