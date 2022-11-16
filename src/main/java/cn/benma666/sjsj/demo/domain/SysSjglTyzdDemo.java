/**
* by jingma 2019-04-18
*/
package cn.benma666.sjsj.demo.domain;

import cn.benma666.domain.BasicBean;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Transient;
import java.math.BigDecimal;

/**
 * 系统-数据管理-统一字典
 */
@javax.persistence.Entity
@javax.persistence.Table(name = "SYS_SJGL_TYZD_DEMO")
@Setter
@Getter
public class SysSjglTyzdDemo extends BasicBean {

	/**
	 * 序列化
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 默认构造方法
	 */
	public SysSjglTyzdDemo() {
	}

	/**
	 * 字典类别
	 */
	@Column(name = "ZDLB")
	private String zdlb;
	/**
	 * 主键
	 */
	@Id
    @GeneratedValue(generator="idGenerator")
	@Column(name = "ID")
	private String id;
	/**
	 * 描述
	 */
	@Column(name = "MS")
	private String ms;
	/**
	 * 简拼
	 */
	@Column(name = "JP")
	private String jp;
	/**
	 * 父节点
	 */
	@Column(name = "UPNODE")
	private String upnode;
	/**
	 * 更新时间
	 */
	@Column(name = "GXSJ")
	private String gxsj;
	/**
	 * 名称
	 */
	@Column(name = "MC")
	private String mc;
	/**
	 * 是否缓存
	 */
	@Column(name = "CACHE")
	private String cache;
	/**
	 * 类别SQL;当次SQL为空时，字典默认在此统一字典表中，有SQL则通过SQL获取字典
	 */
	@Column(name = "LBSQL")
	private String lbsql;
	/**
	 * 创建人姓名
	 */
	@Column(name = "CJRXM")
	private String cjrxm;
	/**
	 * 创建人代码@SYS_COMMON_USER
	 */
	@Column(name = "CJRDM")
	private String cjrdm;
	/**
	 * 代码
	 */
	@Column(name = "DM")
	private String dm;
	/**
	 * 创建人单位代码@SYS_COMMON_ORG
	 */
	@Column(name = "CJRDWDM")
	private String cjrdwdm;
	/**
	 * 创建人单位名称
	 */
	@Column(name = "CJRDWMC")
	private String cjrdwmc;
	/**
	 * 有效性@SYS_COMMON_LJPD
	 */
	@Column(name = "YXX")
	private String yxx;
	/**
	 * 创建时间
	 */
	@Column(name = "CJSJ")
	private String cjsj;
	/**
	 * 标准字典;用于数据标准化等场景，如性别可以有几套字典，然后关联一个标准字典,进一步通过mc关联
	 */
	@Column(name = "BZZD")
	private String bzzd;
	/**
	 * 排序;建议排序都按10、20、30的方式排序，方便修改穿插
	 */
	@Column(name = "PX")
	private BigDecimal px;
	/**
	 * 数据来源
	 */
	@Column(name = "SJLY")
	private String sjly;
	/**
	 * 扩展信息;JSON格式
	 */
	@Column(name = "KZXX")
	private String kzxx;
	/**
	 * 全拼
	 */
	@Column(name = "QP")
	private String qp;

    /**
    * 其他参数
    */
	@Transient
    private String otherParam;

    /**
    * 搜索框需要翻译的值
    */
	@Transient
    private String searchValue;
    /**
    * 搜索关键字
    */
	@Transient
    private String searchKey;

    /**
    * 返回结果是否进行JSON格式化
    */
	@Transient
    private boolean jsongsh;

}
