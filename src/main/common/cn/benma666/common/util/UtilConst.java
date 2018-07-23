/**
* Project Name:eova
* Date:2016年5月24日
* Copyright (c) 2016, jingma All Rights Reserved.
*/

package cn.benma666.common.util;

/**
 * 常量 <br/>
 * date: 2016年5月24日 下午7:18:51 <br/>
 * @author jingma
 * @version 
 */
public interface UtilConst {
    /**
    * 空字符串
    */
    String NULL_STR = "";
    /**
    * 反斜杠
    */
    String FXG = "/";
    /**
    * 单引号
    */
    String DYH = "'";
    /**
    * 百分号
    */
    String BFH = "%";
    /**
    * 双竖线
    */
    String SSX = "||";
    /**
    * 特殊连接符，一般不会在常规字符串中出现
    */
    String TSLJF1 = "TSLJF1";
    /**
    * 特殊连接符，一般不会在常规字符串中出现
    */
    String TSLJF2 = "TSLJF2";
    /**
    * 临时对象前缀
    */
    String TEMP_ = "TEMP_";
    /**
    * 临时表变量名称
    */
    String TEMP_TABLE = "TEMP_TABLE";

    /**
    * 缓存-字典
    */
    String CACHE_DICT = "dict";
    
	/**
	* 逻辑判断-是
	*/
	String WHETHER_TRUE="1";
	/**
	* 逻辑判断-否
	*/
	String WHETHER_FALSE="0";
	
	/**
	* 连接状态-未知
	*/
	String LINK_STATUS_UNKNOW="0";
	/**
	* 连接状态-成功
	*/
	String LINK_STATUS_SUCCESS="1";
	/**
	* 连接状态-失败
	*/
	String LINK_STATUS_FAILED="2";
	
    /**
    * 成败-未知
    */
    String SUCCESS_FAILED_NUKNOW = "unknow";
    /**
    * 成败-成功
    */
    String SUCCESS_FAILED_SUCCESS = "success";
    /**
    * 成败-失败
    */
    String SUCCESS_FAILED_FAILED = "failed";


    /**
     * 文件类型
     */
    public static interface FILE_TYPE {
        /**
         *  xls 03版excel
         */
        String EXCEL_03 = "xls";

        /**
         *  xlsx 07版excel
         */
        String EXCEL_07 = "xlsx";

        /**
         *  txt 文本文档
         */
        String TXT = "txt";

        /**
         *  cvs
         */
        String CSV = "csv";

    }

    /**
    * 特殊字符 <br/>
    * date: 2016年9月7日 <br/>
    * @author jingma
    * @version UtilConst
    */
    public static interface SPECIAL_CHARACTER {

        /**
         * 分隔符_逗号
         */
        String SEPARATOR_DH = ",";

        /**
         * 点
         */
        String POINT = ".";

        /**
         * 分隔符_减号
         */
        String SEPARATOR_JH = "-";

        /**
         * 分隔符_下划线
         */
        String SEPARATOR_UNDERLINE = "_";

        /**
         * 分隔符_冒号
         */
        String SEPARATOR_MH = ":";
        /**
         * 分隔符_分号
         */
        String SEPARATOR_FH = ";";

        /**
         * 空字符
         */
        String NULL_STRING = "";

        /**
         * 半角空格
         */
        String BLANK_SPACE = " ";

        /**
         * 全角空格
         */
        String SBC_BLANK_SPACE = " ";

        /**
         * $符号
         */
        String DOLLAR = "$";

        /**
         * "("符号
         */
        String LEFT_SMALL_BRACE = "(";

        /**
         * ")"
         */
        String RIGHT_SMALL_BRACE = ")";
        /**
         * 字符"0"
         */
        String STR_ZERO = "0";

        /**
         * 字符"1"
         */
        String STR_ONE = "1";

        /**
         * 字符"-1"
         */
        String STR_BELOW_ONE = "-1";

        /**
         * 字符"00"
         */
        String DOUBLE_ZERO = "00";

        /**
         * 字符"001"
         */
        String STR_LLY = "001";

        /**
         * 无数据
         */
        String EMPTY_DATA = "无数据";

        /**
         * undefined
         */
        String UNDEFINED = "undefined";
    }

}
