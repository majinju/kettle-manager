package com.oss.intercept;

import net.oschina.kettleutil.common.KuConst;

import org.beetl.sql.core.db.Db;

import cn.benma666.constants.UtilConst;
import cn.benma666.myutils.StringUtil;

import com.eova.aop.AopContext;
import com.eova.aop.MetaObjectIntercept;
import com.eova.config.PageConst;
import com.jfinal.plugin.activerecord.Record;

/**
* METL通用拦截器 <br/>
* date: 2016年5月24日 <br/>
* @author jingma
* @version 
*/
public class MetlMOIntercept extends MetaObjectIntercept {
	
	/**
	* 增加METL项目基本表新增通用处理
	* @see com.eova.aop.MetaObjectIntercept#addBefore(com.eova.aop.AopContext)
	*/
	@Override
	public String addBefore(AopContext ac) throws Exception {
		Record record = ac.record;
		record.set(KuConst.FIELD_OID, StringUtil.getUUIDUpperStr());
		record.set("create_date", Db.use(KuConst.DATASOURCE_EOVA).getCurrentDateStr14());
		record.set("update_date", record.get("create_date"));
		record.set("create_user", ac.user.getStr("nickname"));
		String oname = record.getStr(KuConst.FIELD_ONAME);
		//若对象名称不为空，则自动填充名称简拼和全拼
		setOnameSpell(record, oname);
		return super.addBefore(ac);
	}
	/**
	* 增加METL项目基本表更新通用处理
	* @see com.eova.aop.MetaObjectIntercept#updateBefore(com.eova.aop.AopContext)
	*/
	@Override
	public String updateBefore(AopContext ac) throws Exception {
		Record record = ac.record;
		record.set("update_date", Db.use(KuConst.DATASOURCE_EOVA).getCurrentDateStr14());
		record.set("update_user", ac.user.getStr("nickname"));
		String oname = record.getStr(KuConst.FIELD_ONAME);
		//若对象名称不为空，则自动填充名称简拼和全拼
		setOnameSpell(record, oname);
		return super.updateBefore(ac);
	}
	/**
	* 根据对象名称设置对象 <br/>
	* @author jingma
	* @param record 记录
	* @param oname 对象名称
	*/
	public void setOnameSpell(Record record, String oname) {
		if(StringUtil.isNotEmpty(oname)){
			record.set("simple_spell", StringUtil.getSimpleSpell(oname));
			record.set("full_spell", StringUtil.getFullSpell(oname));
		}else{
			record.set("simple_spell", UtilConst.NULL_STR);
			record.set("full_spell", UtilConst.NULL_STR);
		}
	}
	/**
	* 
	* @see com.eova.aop.MetaObjectIntercept#queryBefore(com.eova.aop.AopContext)
	*/
	@Override
	public void queryBefore(AopContext ac) throws Exception {
		//使支持对象简拼和全拼搜索
		String oname = ac.ctrl.getPara(PageConst.QUERY + KuConst.FIELD_ONAME, "").trim();
		if(StringUtil.isNotBlank(oname)){
			//从已有条件中移除对象名称搜索
			ac.where = ac.where.replace(" and oname like ?", "");
			//改为：支持对象简拼和全拼搜索
			ac.where += " and (oname like ? or simple_spell like ? or full_spell like ?)";
			//移除原有条件中对象名称参数
			ac.params.remove("%" + oname + "%");
			ac.params.add("%" + oname + "%");
			ac.params.add("%" + oname.toUpperCase() + "%");
			ac.params.add("%" + oname.toUpperCase() + "%");
		}
		super.queryBefore(ac);
	}

}
