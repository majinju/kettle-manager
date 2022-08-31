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
 * 机场公安-机场用工-基础信息
 */
@javax.persistence.Entity
@javax.persistence.Table(name = "JCGA_JCYG_JCXX")
public class JcgaJcygJcxx extends BasicBean{

	/**
	 * 序列化
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 默认构造方法
	 */
	public JcgaJcygJcxx() {
	}

	/**
	 * 主键
	 */
	@Id
	@GeneratedValue(generator="idGenerator")
	@Column(name = "ID")
	private String id;
	/**
	 * 岗位级别
	 */
	@Column(name = "GWJB")
	private String gwjb;
	/**
	 * 员工姓名
	 */
	@Column(name = "YGXM")
	private String ygxm;
	/**
	 * 民族
	 */
	@Column(name = "MZ")
	private String mz;
	/**
	 * 办公电话
	 */
	@Column(name = "BGDH")
	private String bgdh;
	/**
	 * 技术职称
	 */
	@Column(name = "JSZC")
	private String jszc;
	/**
	 * 政治面貌
	 */
	@Column(name = "ZZMM")
	private String zzmm;
	/**
	 * 公民身份号码
	 */
	@Column(name = "GMSFHM")
	private String gmsfhm;
	/**
	 * 户籍地址
	 */
	@Column(name = "HJDZ")
	private String hjdz;
	/**
	 * 出生日期
	 */
	@Column(name = "CSRQ")
	private String csrq;
	/**
	 * 文化程度
	 */
	@Column(name = "WHCD")
	private String whcd;
	/**
	 * 其他特长
	 */
	@Column(name = "QTTC")
	private String qttc;
	/**
	 * 性别
	 */
	@Column(name = "XB")
	private String xb;
	/**
	 * 创建人代码@SYS_COMMON_USER
	 */
	@Column(name = "CJRDM")
	private String cjrdm;
	/**
	 * 考试成绩
	 */
	@Column(name = "KSCJ")
	private String kscj;
	/**
	 * 创建人单位名称
	 */
	@Column(name = "CJRDWMC")
	private String cjrdwmc;
	/**
	 * 创建人单位代码@SYS_COMMON_ORG
	 */
	@Column(name = "CJRDWDM")
	private String cjrdwdm;
	/**
	 * 重点要害部位
	 */
	@Column(name = "CDYHBW")
	private String cdyhbw;
	/**
	 * QQ号码
	 */
	@Column(name = "QQ")
	private String qq;
	/**
	 * 有效性@SYS_COMMON_LJPD
	 */
	@Column(name = "YXX")
	private String yxx;
	/**
	 * 控制区通行证
	 */
	@Column(name = "KZQTXZ")
	private String kzqtxz;
	/**
	 * 隔离区证件有效期
	 */
	@Column(name = "GLQTXZYXQ")
	private String glqtxzyxq;
	/**
	 * 职务
	 */
	@Column(name = "ZW")
	private String zw;
	/**
	 * 对口/外包
	 */
	@Column(name = "DKWB")
	private String dkwb;
	/**
	 * 创建时间
	 */
	@Column(name = "CJSJ")
	private String cjsj;
	/**
	 * 现住地址
	 */
	@Column(name = "XZDZ")
	private String xzdz;
	/**
	 * 执业许可证名称
	 */
	@Column(name = "ZYXKZMC")
	private String zyxkzmc;
	/**
	 * 用工性质
	 */
	@Column(name = "YGXZ")
	private String ygxz;
	/**
	 * 单位
	 */
	@Column(name = "DW")
	private String dw;
	/**
	 * 部门
	 */
	@Column(name = "BM")
	private String bm;
	/**
	 * 隔离区通行证件类型
	 */
	@Column(name = "GLQTXZLX")
	private String glqtxzlx;
	/**
	 * 执业许可证编号
	 */
	@Column(name = "ZYXKZBH")
	private String zyxkzbh;
	/**
	 * 扩展信息;JSON格式
	 */
	@Column(name = "KZXX")
	private String kzxx;
	/**
	 * 控制区通行证类型
	 */
	@Column(name = "KZQTXZLX")
	private String kzqtxzlx;
	/**
	 * 家庭电话
	 */
	@Column(name = "JTDH")
	private String jtdh;
	/**
	 * 排序
	 */
	@Column(name = "PX")
	private BigDecimal px;
	/**
	 * 到本单位时间
	 */
	@Column(name = "DBDWSJ")
	private String dbdwsj;
	/**
	 * 籍贯
	 */
	@Column(name = "JG")
	private String jg;
	/**
	 * 申办隔离区通行证件
	 */
	@Column(name = "SBGLQTXZ")
	private String sbglqtxz;
	/**
	 * MSN登录名
	 */
	@Column(name = "MSN")
	private String msn;
	/**
	 * 年龄
	 */
	@Column(name = "NL")
	private String nl;
	/**
	 * 更新时间
	 */
	@Column(name = "GXSJ")
	private String gxsj;
	/**
	 * 员工编号
	 */
	@Column(name = "YGBH")
	private String ygbh;
	/**
	 * 岗位/工种
	 */
	@Column(name = "GWGZ")
	private String gwgz;
	/**
	 * 证件类型
	 */
	@Column(name = "ZJLX")
	private String zjlx;
	/**
	 * 对口/外包单位名称
	 */
	@Column(name = "DKWBDWMC")
	private String dkwbdwmc;
	/**
	 * 创建人姓名
	 */
	@Column(name = "CJRXM")
	private String cjrxm;
	/**
	 * 手机
	 */
	@Column(name = "SJ")
	private String sj;
	
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
	 * @return 岗位级别
	 */
	public String getGwjb() {
		return gwjb;
	}
	/**
	 * @param gwjb 岗位级别
	 */
	public void setGwjb(String gwjb) {
		this.gwjb = gwjb;
	}
	
	/**
	 * @return 员工姓名
	 */
	public String getYgxm() {
		return ygxm;
	}
	/**
	 * @param ygxm 员工姓名
	 */
	public void setYgxm(String ygxm) {
		this.ygxm = ygxm;
	}
	
	/**
	 * @return 民族
	 */
	public String getMz() {
		return mz;
	}
	/**
	 * @param mz 民族
	 */
	public void setMz(String mz) {
		this.mz = mz;
	}
	
	/**
	 * @return 办公电话
	 */
	public String getBgdh() {
		return bgdh;
	}
	/**
	 * @param bgdh 办公电话
	 */
	public void setBgdh(String bgdh) {
		this.bgdh = bgdh;
	}
	
	/**
	 * @return 技术职称
	 */
	public String getJszc() {
		return jszc;
	}
	/**
	 * @param jszc 技术职称
	 */
	public void setJszc(String jszc) {
		this.jszc = jszc;
	}
	
	/**
	 * @return 政治面貌
	 */
	public String getZzmm() {
		return zzmm;
	}
	/**
	 * @param zzmm 政治面貌
	 */
	public void setZzmm(String zzmm) {
		this.zzmm = zzmm;
	}
	
	/**
	 * @return 公民身份号码
	 */
	public String getGmsfhm() {
		return gmsfhm;
	}
	/**
	 * @param gmsfhm 公民身份号码
	 */
	public void setGmsfhm(String gmsfhm) {
		this.gmsfhm = gmsfhm;
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
	 * @return 出生日期
	 */
	public String getCsrq() {
		return csrq;
	}
	/**
	 * @param csrq 出生日期
	 */
	public void setCsrq(String csrq) {
		this.csrq = csrq;
	}
	
	/**
	 * @return 文化程度
	 */
	public String getWhcd() {
		return whcd;
	}
	/**
	 * @param whcd 文化程度
	 */
	public void setWhcd(String whcd) {
		this.whcd = whcd;
	}
	
	/**
	 * @return 其他特长
	 */
	public String getQttc() {
		return qttc;
	}
	/**
	 * @param qttc 其他特长
	 */
	public void setQttc(String qttc) {
		this.qttc = qttc;
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
	 * @return 创建人代码@SYS_COMMON_USER
	 */
	public String getCjrdm() {
		return cjrdm;
	}
	/**
	 * @param cjrdm 创建人代码@SYS_COMMON_USER
	 */
	public void setCjrdm(String cjrdm) {
		this.cjrdm = cjrdm;
	}
	
	/**
	 * @return 考试成绩
	 */
	public String getKscj() {
		return kscj;
	}
	/**
	 * @param kscj 考试成绩
	 */
	public void setKscj(String kscj) {
		this.kscj = kscj;
	}
	
	/**
	 * @return 创建人单位名称
	 */
	public String getCjrdwmc() {
		return cjrdwmc;
	}
	/**
	 * @param cjrdwmc 创建人单位名称
	 */
	public void setCjrdwmc(String cjrdwmc) {
		this.cjrdwmc = cjrdwmc;
	}
	
	/**
	 * @return 创建人单位代码@SYS_COMMON_ORG
	 */
	public String getCjrdwdm() {
		return cjrdwdm;
	}
	/**
	 * @param cjrdwdm 创建人单位代码@SYS_COMMON_ORG
	 */
	public void setCjrdwdm(String cjrdwdm) {
		this.cjrdwdm = cjrdwdm;
	}
	
	/**
	 * @return 重点要害部位
	 */
	public String getCdyhbw() {
		return cdyhbw;
	}
	/**
	 * @param cdyhbw 重点要害部位
	 */
	public void setCdyhbw(String cdyhbw) {
		this.cdyhbw = cdyhbw;
	}
	
	/**
	 * @return QQ号码
	 */
	public String getQq() {
		return qq;
	}
	/**
	 * @param qq QQ号码
	 */
	public void setQq(String qq) {
		this.qq = qq;
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
	 * @return 控制区通行证
	 */
	public String getKzqtxz() {
		return kzqtxz;
	}
	/**
	 * @param kzqtxz 控制区通行证
	 */
	public void setKzqtxz(String kzqtxz) {
		this.kzqtxz = kzqtxz;
	}
	
	/**
	 * @return 隔离区证件有效期
	 */
	public String getGlqtxzyxq() {
		return glqtxzyxq;
	}
	/**
	 * @param glqtxzyxq 隔离区证件有效期
	 */
	public void setGlqtxzyxq(String glqtxzyxq) {
		this.glqtxzyxq = glqtxzyxq;
	}
	
	/**
	 * @return 职务
	 */
	public String getZw() {
		return zw;
	}
	/**
	 * @param zw 职务
	 */
	public void setZw(String zw) {
		this.zw = zw;
	}
	
	/**
	 * @return 对口/外包
	 */
	public String getDkwb() {
		return dkwb;
	}
	/**
	 * @param dkwb 对口/外包
	 */
	public void setDkwb(String dkwb) {
		this.dkwb = dkwb;
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
	 * @return 执业许可证名称
	 */
	public String getZyxkzmc() {
		return zyxkzmc;
	}
	/**
	 * @param zyxkzmc 执业许可证名称
	 */
	public void setZyxkzmc(String zyxkzmc) {
		this.zyxkzmc = zyxkzmc;
	}
	
	/**
	 * @return 用工性质
	 */
	public String getYgxz() {
		return ygxz;
	}
	/**
	 * @param ygxz 用工性质
	 */
	public void setYgxz(String ygxz) {
		this.ygxz = ygxz;
	}
	
	/**
	 * @return 单位
	 */
	public String getDw() {
		return dw;
	}
	/**
	 * @param dw 单位
	 */
	public void setDw(String dw) {
		this.dw = dw;
	}
	
	/**
	 * @return 部门
	 */
	public String getBm() {
		return bm;
	}
	/**
	 * @param bm 部门
	 */
	public void setBm(String bm) {
		this.bm = bm;
	}
	
	/**
	 * @return 隔离区通行证件类型
	 */
	public String getGlqtxzlx() {
		return glqtxzlx;
	}
	/**
	 * @param glqtxzlx 隔离区通行证件类型
	 */
	public void setGlqtxzlx(String glqtxzlx) {
		this.glqtxzlx = glqtxzlx;
	}
	
	/**
	 * @return 执业许可证编号
	 */
	public String getZyxkzbh() {
		return zyxkzbh;
	}
	/**
	 * @param zyxkzbh 执业许可证编号
	 */
	public void setZyxkzbh(String zyxkzbh) {
		this.zyxkzbh = zyxkzbh;
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
	 * @return 控制区通行证类型
	 */
	public String getKzqtxzlx() {
		return kzqtxzlx;
	}
	/**
	 * @param kzqtxzlx 控制区通行证类型
	 */
	public void setKzqtxzlx(String kzqtxzlx) {
		this.kzqtxzlx = kzqtxzlx;
	}
	
	/**
	 * @return 家庭电话
	 */
	public String getJtdh() {
		return jtdh;
	}
	/**
	 * @param jtdh 家庭电话
	 */
	public void setJtdh(String jtdh) {
		this.jtdh = jtdh;
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
	 * @return 到本单位时间
	 */
	public String getDbdwsj() {
		return dbdwsj;
	}
	/**
	 * @param dbdwsj 到本单位时间
	 */
	public void setDbdwsj(String dbdwsj) {
		this.dbdwsj = dbdwsj;
	}
	
	/**
	 * @return 籍贯
	 */
	public String getJg() {
		return jg;
	}
	/**
	 * @param jg 籍贯
	 */
	public void setJg(String jg) {
		this.jg = jg;
	}
	
	/**
	 * @return 申办隔离区通行证件
	 */
	public String getSbglqtxz() {
		return sbglqtxz;
	}
	/**
	 * @param sbglqtxz 申办隔离区通行证件
	 */
	public void setSbglqtxz(String sbglqtxz) {
		this.sbglqtxz = sbglqtxz;
	}
	
	/**
	 * @return MSN登录名
	 */
	public String getMsn() {
		return msn;
	}
	/**
	 * @param msn MSN登录名
	 */
	public void setMsn(String msn) {
		this.msn = msn;
	}
	
	/**
	 * @return 年龄
	 */
	public String getNl() {
		return nl;
	}
	/**
	 * @param nl 年龄
	 */
	public void setNl(String nl) {
		this.nl = nl;
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
	 * @return 岗位/工种
	 */
	public String getGwgz() {
		return gwgz;
	}
	/**
	 * @param gwgz 岗位/工种
	 */
	public void setGwgz(String gwgz) {
		this.gwgz = gwgz;
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
	 * @return 对口/外包单位名称
	 */
	public String getDkwbdwmc() {
		return dkwbdwmc;
	}
	/**
	 * @param dkwbdwmc 对口/外包单位名称
	 */
	public void setDkwbdwmc(String dkwbdwmc) {
		this.dkwbdwmc = dkwbdwmc;
	}
	
	/**
	 * @return 创建人姓名
	 */
	public String getCjrxm() {
		return cjrxm;
	}
	/**
	 * @param cjrxm 创建人姓名
	 */
	public void setCjrxm(String cjrxm) {
		this.cjrxm = cjrxm;
	}
	
	/**
	 * @return 手机
	 */
	public String getSj() {
		return sj;
	}
	/**
	 * @param sj 手机
	 */
	public void setSj(String sj) {
		this.sj = sj;
	}
	
}