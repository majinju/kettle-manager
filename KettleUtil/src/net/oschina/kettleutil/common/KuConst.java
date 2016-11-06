/**
* Project Name:eova
* Date:2016年5月24日
* Copyright (c) 2016, jingma All Rights Reserved.
*/

package net.oschina.kettleutil.common;


/**
 * 常量 <br/>
 * date: 2016年5月24日 <br/>
 * @author jingma
 * @version 
 */
public interface KuConst {
    /**
    * eova数据源
    */
    String DATASOURCE_EOVA = "eova";
    /**
    * kettle资源库数据源
    */
    String DATASOURCE_KETTLE = "kettle";
    
    /**
    * 数据类型-字符串
    */
    String DATA_TYPE_STRING = "string";
    /**
    * 数据类型-数字
    */
    String DATA_TYPE_NUMBER = "number";
    /**
    * 数据类型-时间
    */
    String DATA_TYPE_DATE = "date";
    /**
    * 数据类型-CLOB
    */
    String DATA_TYPE_CLOB = "clob";
    /**
    * 数据类型-BLOB
    */
    String DATA_TYPE_BLOB = "blob";

    /**
    * 数据库类型-ORACLE
    */
    String DS_TYPE_ORACLE = "oracle";
    /**
    * 数据库类型-PostgreSQL
    */
    String DS_TYPE_POSTGRESQL = "PostgreSQL";
    /**
    * 数据库类型-greenplum
    */
    String DS_TYPE_GREENPLUM = "greenplum";
    /**
    * 数据库类型-mysql
    */
    String DS_TYPE_MYSQL = "mysql";
    
    /**
    * 字段名-对象主键
    */
    String FIELD_OID = "oid";
    /**
    * 字段名-对象名称
    */
    String FIELD_OCODE = "ocode";
    /**
    * 字段名-对象名称
    */
    String FIELD_ONAME = "oname";
    /**
    * 字段名-扩展信息
    */
    String FIELD_EXPAND = "expand";

    /**
    * 字段名-扩展信息-解析为JSON对象
    */
    String FIELD_EXPAND_OBJ = "expand_obj";
    /**
    * 字段名-默认值
    */
    String FIELD_DEFAULT_VALUE = "default_value";
    /**
    * 字段名-验证器
    */
    String FIELD_VALIDATOR = "validator";
    /**
    * 字段名-转换器
    */
    String FIELD_TRANSITION = "transition";
    /**
    * 字段名-字典id
    */
    String FIELD_ID = "id";
    /**
    * 字段名-字典中文
    */
    String FIELD_CN = "cn";

    /**
    * 字典类别-数据库类型
    */
    String DICT_CATEGORY_DATABASE_TYPE = "DATABASE_TYPE";
    /**
    * 字典类别-数据库
    */
    String DICT_CATEGORY_DATABASE = "DATABASE";
    /**
    * 字典类别-星期
    */
    String DICT_CATEGORY_WEEK_DAY = "WEEK_DAY";
    /**
    * 字典类别-一般配置
    */
    String DICT_CATEGORY_GENERAL_CONFIG = "GENERAL_CONFIG";
    
    /**
    * 定时类别-不需要定时
    */
    String SCHEDULER_TYPE_NOT_TIMING = "0";
    /**
    * 定时类别-时间间隔
    */
    String SCHEDULER_TYPE_TIME_INTERVAL = "1";
    /**
    * 定时类别-天
    */
    String SCHEDULER_TYPE_DAY = "2";
    /**
    * 定时类别-周
    */
    String SCHEDULER_TYPE_WEEK = "3";
    /**
    * 定时类别-月
    */
    String SCHEDULER_TYPE_MONTH = "4";
}
