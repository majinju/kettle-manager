/**
* by jingma 2019-04-20
*/
package cn.benma666.jcga.domain;

import cn.benma666.domain.BasicBean;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.math.BigDecimal;

/**
 * 机场公安-机场用工-社会关系
 */
@javax.persistence.Entity
@javax.persistence.Table(name = "JCGA_JCYG_SHGX")
public class JcgaJcygShgx extends BasicBean{

	/**
	 * 序列化
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 默认构造方法
	 */
	public JcgaJcygShgx() {
	}

    /**
	 * 主键
	 */
	@Id
	@GeneratedValue(generator="idGenerator")
	@Column(name = "ID")
	private String id;
	/**
	 * 排序
	 */
	@Column(name = "PX")
	private BigDecimal px;
	/**
	 * 证件类型
	 */
	@Column(name = "ZJLX")
	private String zjlx;
	/**
	 * 户籍地址
	 */
	@Column(name = "HJDZ")
	private String hjdz;
	/**
	 * 创建时间
	 */
	@Column(name = "CJSJ")
	private String cjsj;
	/**
	 * 联系电话
	 */
	@Column(name = "LXDH")
	private String lxdh;
	/**
	 * 社会关系
	 */
	@Column(name = "SHGX")
	private String shgx;
	/**
	 * 有效性@SYS_COMMON_LJPD
	 */
	@Column(name = "YXX")
	private String yxx;
	/**
	 * 姓名
	 */
	@Column(name = "XM")
	private String xm;
	/**
	 * 更新时间
	 */
	@Column(name = "GXSJ")
	private String gxsj;
	/**
	 * 备注
	 */
	@Column(name = "BZ")
	private String bz;
	/**
	 * 扩展信息;JSON格式
	 */
	@Column(name = "KZXX")
	private String kzxx;
	/**
	 * 身份号码
	 */
	@Column(name = "ZJHM")
	private String zjhm;
	/**
	 * 员工编号
	 */
	@Column(name = "YGBH")
	private String ygbh;
	/**
	 * 现住地址
	 */
	@Column(name = "XZDZ")
	private String xzdz;
	/**
	 * 性别
	 */
	@Column(name = "XB")
	private String xb;
	/**
	 * 背景核查
	 */
	@Column(name = "BJHC")
	private String bjhc;
	
	/**
	 * @return 主键
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id 主键
	 */
	public void setId(String id) {
		this.id = id;
	}
	
	/**
	 * @return 排序
	 */
	public BigDecimal getPx() {
		return px;
	}
	/**
	 * @param px 排序
	 */
	public void setPx(BigDecimal px) {
		this.px = px;
	}
	
	/**
	 * @return 证件类型
	 */
	public String getZjlx() {
		return zjlx;
	}
	/**
	 * @param zjlx 证件类型
	 */
	public void setZjlx(String zjlx) {
		this.zjlx = zjlx;
	}
	
	/**
	 * @return 户籍地址
	 */
	public String getHjdz() {
		return hjdz;
	}
	/**
	 * @param hjdz 户籍地址
	 */
	public void setHjdz(String hjdz) {
		this.hjdz = hjdz;
	}
	
	/**
	 * @return 创建时间
	 */
	public String getCjsj() {
		return cjsj;
	}
	/**
	 * @param cjsj 创建时间
	 */
	public void setCjsj(String cjsj) {
		this.cjsj = cjsj;
	}
	
	/**
	 * @return 联系电话
	 */
	public String getLxdh() {
		return lxdh;
	}
	/**
	 * @param lxdh 联系电话
	 */
	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}
	
	/**
	 * @return 社会关系
	 */
	public String getShgx() {
		return shgx;
	}
	/**
	 * @param shgx 社会关系
	 */
	public void setShgx(String shgx) {
		this.shgx = shgx;
	}
	
	/**
	 * @return 有效性@SYS_COMMON_LJPD
	 */
	public String getYxx() {
		return yxx;
	}
	/**
	 * @param yxx 有效性@SYS_COMMON_LJPD
	 */
	public void setYxx(String yxx) {
		this.yxx = yxx;
	}
	
	/**
	 * @return 姓名
	 */
	public String getXm() {
		return xm;
	}
	/**
	 * @param xm 姓名
	 */
	public void setXm(String xm) {
		this.xm = xm;
	}
	
	/**
	 * @return 更新时间
	 */
	public String getGxsj() {
		return gxsj;
	}
	/**
	 * @param gxsj 更新时间
	 */
	public void setGxsj(String gxsj) {
		this.gxsj = gxsj;
	}
	
	/**
	 * @return 备注
	 */
	public String getBz() {
		return bz;
	}
	/**
	 * @param bz 备注
	 */
	public void setBz(String bz) {
		this.bz = bz;
	}
	
	/**
	 * @return 扩展信息;JSON格式
	 */
	public String getKzxx() {
		return kzxx;
	}
	/**
	 * @param kzxx 扩展信息;JSON格式
	 */
	public void setKzxx(String kzxx) {
		this.kzxx = kzxx;
	}
	
	/**
	 * @return 身份号码
	 */
	public String getZjhm() {
		return zjhm;
	}
	/**
	 * @param zjhm 身份号码
	 */
	public void setZjhm(String zjhm) {
		this.zjhm = zjhm;
	}
	
	/**
	 * @return 员工编号
	 */
	public String getYgbh() {
		return ygbh;
	}
	/**
	 * @param ygbh 员工编号
	 */
	public void setYgbh(String ygbh) {
		this.ygbh = ygbh;
	}
	
	/**
	 * @return 现住地址
	 */
	public String getXzdz() {
		return xzdz;
	}
	/**
	 * @param xzdz 现住地址
	 */
	public void setXzdz(String xzdz) {
		this.xzdz = xzdz;
	}
	
	/**
	 * @return 性别
	 */
	public String getXb() {
		return xb;
	}
	/**
	 * @param xb 性别
	 */
	public void setXb(String xb) {
		this.xb = xb;
	}
	
	/**
	 * @return 背景核查
	 */
	public String getBjhc() {
		return bjhc;
	}
	/**
	 * @param bjhc 背景核查
	 */
	public void setBjhc(String bjhc) {
		this.bjhc = bjhc;
	}
	
}