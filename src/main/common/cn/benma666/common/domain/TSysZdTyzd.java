
package cn.benma666.common.domain;

import java.io.Serializable;

import org.beetl.sql.core.annotatoin.AssignID;
import org.beetl.sql.core.annotatoin.Table;

import com.alibaba.fastjson.JSON;

@Table(name="t_sys_zd_tyzd")
public class TSysZdTyzd extends BasicBean implements Serializable {

	private static final long serialVersionUID = -1L;
	

	/**
	 * 主键
	 */
	@AssignID("uuid")
	private java.lang.String id;

	/**
	 * 代码
	 */
	private java.lang.String dm;

	/**
	 * 名称
	 */
	private java.lang.String mc;

	/**
	 * 描述
	 */
	private java.lang.String ms;

	/**
	 * 排序;建议排序都按10、20、30的方式排序，方便修改穿插
	 */
	private java.lang.Long px;

	/**
	 * 简拼
	 */
	private java.lang.String jp;

	/**
	 * 全拼
	 */
	private java.lang.String qp;

	/**
	 * 字典类别
	 */
	private java.lang.String zdlb;

	/**
	 * 标准字典类别;用于数据标准化等场景，如性别可以有几套字典，然后关联一个标准字典,进一步通过mc关联
	 */
	private java.lang.String bzzdlb;

	/**
	 * 类别SQL;当次SQL为空时，字典默认在此统一字典表中，有SQL则通过SQL获取字典
	 */
	private java.lang.String lbsql;

	/**
	 * 创建时间
	 */
	private java.lang.String createdate;

	/**
	 * 更新时间
	 */
	private java.lang.String etldate;

	/**
	 * 数据来源
	 */
	private java.lang.String sjly;
	/**
	 * 上级节点
	 */
	private java.lang.String upnode;

	/**
	 * 是否删除;与共享平台一致，所以这里没有采用中文简拼命名
	 */
	private java.lang.String isdel;

    /**
     * 缓存
     */
    private java.lang.String cache;

	public TSysZdTyzd() {
	}
	
	public TSysZdTyzd(String id) {
		this.id = id;
	}

	
	public void setId(java.lang.String id) {
		this.id = id;
	}

	public java.lang.String getId() {
		return this.id;
	}
	
	
	public void setDm(java.lang.String dm) {
		this.dm = dm;
	}

	public java.lang.String getDm() {
		return this.dm;
	}
	
	
	public void setMc(java.lang.String mc) {
		this.mc = mc;
	}

	public java.lang.String getMc() {
		return this.mc;
	}
	
	
	public void setMs(java.lang.String ms) {
		this.ms = ms;
	}

	public java.lang.String getMs() {
		return this.ms;
	}
	
	
	public void setPx(java.lang.Long px) {
		this.px = px;
	}

	public java.lang.Long getPx() {
		return this.px;
	}
	
	
	public void setJp(java.lang.String jp) {
		this.jp = jp;
	}

	public java.lang.String getJp() {
		return this.jp;
	}
	
	
	public void setQp(java.lang.String qp) {
		this.qp = qp;
	}

	public java.lang.String getQp() {
		return this.qp;
	}
	
	
	public void setZdlb(java.lang.String zdlb) {
		this.zdlb = zdlb;
	}

	public java.lang.String getZdlb() {
		return this.zdlb;
	}
	
	
	public void setBzzdlb(java.lang.String bzzdlb) {
		this.bzzdlb = bzzdlb;
	}

	public java.lang.String getBzzdlb() {
		return this.bzzdlb;
	}
	
	
	public void setLbsql(java.lang.String lbsql) {
		this.lbsql = lbsql;
	}

	public java.lang.String getLbsql() {
		return this.lbsql;
	}
	
	
	public void setCreatedate(java.lang.String createdate) {
		this.createdate = createdate;
	}

	public java.lang.String getCreatedate() {
		return this.createdate;
	}
	
	
	public void setEtldate(java.lang.String etldate) {
		this.etldate = etldate;
	}

	public java.lang.String getEtldate() {
		return this.etldate;
	}
	
	
	public void setSjly(java.lang.String sjly) {
		this.sjly = sjly;
	}

	public java.lang.String getSjly() {
		return this.sjly;
	}
	
	
	public void setIsdel(java.lang.String isdel) {
		this.isdel = isdel;
	}

	public java.lang.String getIsdel() {
		return this.isdel;
	}

	public java.lang.String getUpnode() {
		return upnode;
	}

	public void setUpnode(java.lang.String upnode) {
		this.upnode = upnode;
	}
	
	/**
     * @return cache 
     */
    public java.lang.String getCache() {
        return cache;
    }

    /**
     * @param cache the cache to set
     */
    public void setCache(java.lang.String cache) {
        this.cache = cache;
    }

    /**
	* 
	* @see java.lang.Object#toString()
	*/
	@Override
	public String toString() {
	    return JSON.toJSONString(this);
	}
}