package cn.benma666.sjsj.web;

import cn.benma666.constants.UtilConstInstance;

/**
 * 拦截器相关的常量
 */
public interface LjqConstant extends UtilConstInstance {

    /**
     * 处理类型
     */
    String KEY_CLLX = "cllx";
    /**
     * 处理类型-系统基础信息
     */
    String KEY_CLLX_XTJCXX = "xtjcxx";
    /**
     * 处理类型-对象基础信息
     */
    String KEY_CLLX_DXJCXX = "dxjcxx";
    /**
     * 处理类型-新增
     */
    String KEY_CLLX_INSERT = "insert";
    /**
     * 处理类型-更新
     */
    String KEY_CLLX_UPDATE = "update";
    /**
     * 处理类型-分页查询
     */
    String KEY_CLLX_SELECT = "select";
    /**
     * 处理类型-删除
     */
    String KEY_CLLX_DELETE = "delete";
    /**
     * 处理类型-批量删除
     */
    String KEY_CLLX_PLSC = "plsc";
    /**
     * 处理类型-数据批量上传
     */
    String KEY_CLLX_SJPLSC = "sjplsc";
    /**
     * 处理类型-获取文件
     */
    String KEY_CLLX_GETFILE = "getfile";
    /**
     * 处理类型-批量处理
     */
    String KEY_CLLX_PLCL = "plcl";
    /**
     * 处理类型-获取数据
     */
    String KEY_CLLX_GETDATA = "getdata";
    /**
     * 处理类型-导出当前页数据
     */
    String KEY_CLLX_DCDQYSJ = "dcdqysj";
    /**
     * 处理类型-导出数据
     */
    String KEY_CLLX_DCSJ = "dcsj";
    /**
     * 处理类型-导出模板
     */
    String KEY_CLLX_DCMB = "dcmb";

    /**
     * jsonpath路径-处理类型的key
     */
    String $_SYS_CLLX = "$.sys.cllx";
    /**
     * jsonpath路径-客户端ip
     */
    String $_SYS_CLIENT_IP = "$.sys.clientIp";
    /**
     * jsonpath路径-内部调用
     */
    String $_SYS_NBDY = "$.sys.nbdy";
    /**
     * jsonpath路径-用户权限key
     */
    String $_SYS_TOKEN = "$.sys.token";
    /**
     * jsonpath路径-权限代码
     */
    String $_SYS_AUTHCODE = "$.sys.authCode";
    /**
     * jsonpath路径-已找到记录
     */
    String $_SYS_YZDJL = "$.sys.yzdjl";
    /**
     * jsonpath路径-页面批量操作选择的记录id列表
     */
    String $_SYS_IDS = "$.sys.ids";

    /**
     * 字典-系统-通用-数据载体
     */
    String ZD_SYS_COMMON_SJZT = "SYS_COMMON_SJZT";
    /**
     * 字典-系统-权限-应用
     */
    String ZD_SYS_QX_APP = "SYS_QX_APP";

    /**
     * 字典-数据载体类型-ftp
     */
    String ZD_SJZTLX_FTP = "ftp";
    /**
     * 字典-数据载体类型-本地文件
     */
    String ZD_SJZTLX_BDWJ = "bdwj";

    /**
     * 权限码-平台-管理员
     */
    String KEY_AUTH_KFZFW_GLY = "KFZFW_GLY";
    /**
     * 权限码-平台-系统管理员
     */
    String KEY_AUTH_KFZFW_SYS = "KFZFW_SYS";

    /**
     * 字典-数据对象-字段业务类别-虚拟字段
     */
    String ZD_SJDX_ZDYWLB_XNZD = "99";

    /**
     * 权限码
     */
    String KEY_AUTH_CODE = "authCode";

    /**
     * 文件-字节组
     */
    String KEY_FILE_BYTES = "fileBytes";
    /**
     * 文件-文件对象
     */
    String KEY_FILE_OBJ = "fileObj";
}
