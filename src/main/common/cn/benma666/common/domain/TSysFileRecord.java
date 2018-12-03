
package cn.benma666.common.domain;

import java.io.Serializable;

import org.beetl.sql.core.annotatoin.AssignID;

import cn.benma666.web.BasicBean;

public class TSysFileRecord extends BasicBean implements Serializable {

	private static final long serialVersionUID = -1L;
	

	/**
	 * 主键
	 */
    @AssignID("uuid")
	private java.lang.String id;

	/**
	 * 创建时间
	 */
	private java.lang.String createdate;

	/**
	 * 更新时间
	 */
	private java.lang.String etldate;

	/**
	 * 删除标记
	 */
	private java.lang.String isdel;

	/**
	 * 业务代码;ZDRY_RYGL
	 */
	private java.lang.String ywdm;

	/**
	 * 关联id;前端传
	 */
	private java.lang.String glid;

	/**
	 * 文件名
	 */
	private java.lang.String wjm;

	/**
	 * 去重码
	 */
	private java.lang.String qcm;

	/**
	 * 上传类别;LOCAL,FASTDFS
	 */
	private java.lang.String sclb;

	/**
	 * 上传路径;ZDRY_RYGL/去重码.wjlx
	 */
	private java.lang.String sclj;

	/**
	 * 文件类型
	 */
	private java.lang.String wjlx;
	
	/**
	 * 文件类别
	 */
	private java.lang.String wjlb;

	public TSysFileRecord() {
	}	
	
	public TSysFileRecord(String ywdm, String wjm, String qcm, String sclb, String sclj, String wjlx, String wjlb) {
		this.ywdm=ywdm;
		this.wjm=wjm;
		this.qcm=qcm;
		this.sclb=sclb;
		this.sclj=sclj;
		this.wjlx=wjlx;
		this.wjlb=wjlb;
	}
	
	public void setId(java.lang.String id) {
		this.id = id;
	}

	public java.lang.String getId() {
		return this.id;
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
	
	
	public void setIsdel(java.lang.String isdel) {
		this.isdel = isdel;
	}

	public java.lang.String getIsdel() {
		return this.isdel;
	}
	
	
	public void setYwdm(java.lang.String ywdm) {
		this.ywdm = ywdm;
	}

	public java.lang.String getYwdm() {
		return this.ywdm;
	}
	
	
	public void setGlid(java.lang.String glid) {
		this.glid = glid;
	}

	public java.lang.String getGlid() {
		return this.glid;
	}
	
	
	public void setWjm(java.lang.String wjm) {
		this.wjm = wjm;
	}

	public java.lang.String getWjm() {
		return this.wjm;
	}
	
	
	public void setQcm(java.lang.String qcm) {
		this.qcm = qcm;
	}

	public java.lang.String getQcm() {
		return this.qcm;
	}
	
	
	public void setSclb(java.lang.String sclb) {
		this.sclb = sclb;
	}

	public java.lang.String getSclb() {
		return this.sclb;
	}
	
	
	public void setSclj(java.lang.String sclj) {
		this.sclj = sclj;
	}

	public java.lang.String getSclj() {
		return this.sclj;
	}
	
	
	public void setWjlx(java.lang.String wjlx) {
		this.wjlx = wjlx;
	}

	public java.lang.String getWjlx() {
		return this.wjlx;
	}

	public java.lang.String getWjlb() {
		return wjlb;
	}

	public void setWjlb(java.lang.String wjlb) {
		this.wjlb = wjlb;
	}

}