/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50613
Source Host           : localhost:3306
Source Database       : km1

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2016-11-08 18:04:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for eova_button
-- ----------------------------
DROP TABLE IF EXISTS `eova_button`;
CREATE TABLE `eova_button` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `MENU_CODE` varchar(255) NOT NULL COMMENT '菜单Code',
  `NAME` varchar(255) NOT NULL COMMENT '按钮名称',
  `ICON` varchar(255) DEFAULT NULL COMMENT '图标',
  `UI` varchar(255) DEFAULT NULL COMMENT '按钮UI路径',
  `BS` text COMMENT '按钮BS路径',
  `ORDER_NUM` int(10) DEFAULT NULL COMMENT '排序号',
  `GROUP_NUM` int(10) DEFAULT NULL COMMENT '分组号',
  `IS_BASE` tinyint(1) DEFAULT NULL COMMENT '是否基础功能',
  `IS_DEL` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for eova_dict
-- ----------------------------
DROP TABLE IF EXISTS `eova_dict`;
CREATE TABLE `eova_dict` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `VALUE` varchar(50) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `OBJECT` varchar(50) NOT NULL,
  `FIELD` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for eova_field
-- ----------------------------
DROP TABLE IF EXISTS `eova_field`;
CREATE TABLE `eova_field` (
  `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `OBJECT_CODE` varchar(50) NOT NULL,
  `PO_CODE` varchar(255) DEFAULT NULL COMMENT '持久化对象',
  `EN` varchar(50) NOT NULL COMMENT '英文名',
  `CN` varchar(50) NOT NULL COMMENT '中文名',
  `IS_AUTO` tinyint(1) DEFAULT NULL COMMENT '主键是否自增长',
  `DATA_TYPE` varchar(20) DEFAULT NULL COMMENT '数据类型',
  `TYPE` varchar(10) DEFAULT NULL COMMENT '控件类型',
  `ORDER_NUM` int(10) DEFAULT NULL COMMENT '排序索引',
  `EXP` text COMMENT '控件表达式',
  `IS_QUERY` tinyint(1) DEFAULT NULL COMMENT '是否可查询',
  `IS_SHOW` tinyint(1) DEFAULT NULL COMMENT '是否可显示',
  `IS_DISABLE` tinyint(1) DEFAULT NULL COMMENT '是否禁用',
  `IS_ORDER` tinyint(1) DEFAULT NULL COMMENT '是否可排序',
  `IS_ADD` tinyint(1) DEFAULT NULL COMMENT '是否可新增字段',
  `IS_UPDATE` tinyint(1) DEFAULT NULL COMMENT '是否可修改字段',
  `IS_EDIT` tinyint(1) DEFAULT NULL COMMENT '是否可编辑字段',
  `IS_REQUIRED` tinyint(1) DEFAULT NULL COMMENT '是否必填',
  `IS_MULTIPLE` tinyint(1) DEFAULT NULL COMMENT '是否多选项',
  `PLACEHOLDER` varchar(255) DEFAULT NULL COMMENT '输入提示',
  `VALIDATOR` varchar(255) DEFAULT NULL COMMENT 'UI校验表达式',
  `DEFAULTER` varchar(255) DEFAULT NULL COMMENT '默认值表达式',
  `FORMATTER` text COMMENT '格式化器',
  `WIDTH` int(10) DEFAULT NULL COMMENT '控件宽度',
  `HEIGHT` int(10) DEFAULT NULL COMMENT '控件高度',
  `CONFIG` text COMMENT '拓展配置',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for eova_log
-- ----------------------------
DROP TABLE IF EXISTS `eova_log`;
CREATE TABLE `eova_log` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL COMMENT '操作用户',
  `TYPE` int(10) NOT NULL COMMENT '日志类型',
  `IP` varchar(255) NOT NULL COMMENT '操作IP',
  `INFO` text COMMENT '操作详情',
  `CREATE_DATE` varchar(14) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for eova_menu
-- ----------------------------
DROP TABLE IF EXISTS `eova_menu`;
CREATE TABLE `eova_menu` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) NOT NULL COMMENT '编码',
  `NAME` varchar(100) NOT NULL COMMENT '名称',
  `TYPE` varchar(20) NOT NULL COMMENT '菜单类型',
  `ICON` varchar(255) DEFAULT NULL COMMENT '图标',
  `ORDER_NUM` int(10) DEFAULT NULL COMMENT '序号',
  `PARENT_ID` int(10) DEFAULT NULL COMMENT '父节点',
  `IS_COLLAPSE` tinyint(1) DEFAULT NULL COMMENT '是否折叠',
  `BIZ_INTERCEPT` varchar(255) DEFAULT NULL COMMENT '自定义业务拦截器',
  `URL` varchar(255) DEFAULT NULL COMMENT '自定义URL',
  `CONFIG` text COMMENT '菜单配置JSON',
  `DIY_JS` varchar(255) DEFAULT NULL COMMENT '依赖JS文件',
  `IS_DEL` tinyint(1) DEFAULT NULL COMMENT '是否隐藏',
  `FILTER` text COMMENT '初始数据过滤条件',
  `IS_NEW_TAB` tinyint(1) DEFAULT NULL COMMENT '新标签打开',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for eova_menu_object
-- ----------------------------
DROP TABLE IF EXISTS `eova_menu_object`;
CREATE TABLE `eova_menu_object` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `MENU_CODE` varchar(50) NOT NULL COMMENT '菜单编码',
  `OBJECT_CODE` varchar(50) NOT NULL COMMENT '对象编码',
  `INDEXS` int(10) DEFAULT NULL COMMENT '对象索引',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for eova_object
-- ----------------------------
DROP TABLE IF EXISTS `eova_object`;
CREATE TABLE `eova_object` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(100) NOT NULL COMMENT '对象编码',
  `NAME` varchar(100) NOT NULL COMMENT '对象名称',
  `VIEW_NAME` varchar(255) DEFAULT NULL COMMENT '查询数据视图',
  `TABLE_NAME` varchar(255) DEFAULT NULL COMMENT '保存数据主表',
  `PK_NAME` varchar(50) NOT NULL COMMENT '主键',
  `DATA_SOURCE` varchar(50) DEFAULT NULL COMMENT '数据源',
  `IS_SINGLE` tinyint(1) DEFAULT NULL COMMENT '是否单选',
  `IS_CELLEDIT` tinyint(1) DEFAULT NULL COMMENT '是否可行内编辑',
  `IS_SHOW_NUM` tinyint(1) DEFAULT NULL COMMENT '是否显示行号',
  `IS_FIRST_LOAD` tinyint(1) DEFAULT NULL COMMENT '是否初始加载数据',
  `FILTER` text COMMENT '初始数据过滤条件',
  `DEFAULT_ORDER` varchar(255) DEFAULT NULL COMMENT '默认排序字段(desc)',
  `DIY_CARD` varchar(255) DEFAULT NULL COMMENT '自定义卡片面板',
  `DIY_JS` varchar(255) DEFAULT NULL COMMENT '依赖JS文件',
  `BIZ_INTERCEPT` varchar(255) DEFAULT NULL COMMENT '自定义业务拦截器',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for eova_role
-- ----------------------------
DROP TABLE IF EXISTS `eova_role`;
CREATE TABLE `eova_role` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL COMMENT '角色名',
  `INFO` varchar(255) DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for eova_role_btn
-- ----------------------------
DROP TABLE IF EXISTS `eova_role_btn`;
CREATE TABLE `eova_role_btn` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `RID` int(10) NOT NULL COMMENT '角色',
  `BID` int(10) NOT NULL COMMENT '功能',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for eova_task
-- ----------------------------
DROP TABLE IF EXISTS `eova_task`;
CREATE TABLE `eova_task` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `STATE` int(10) NOT NULL COMMENT '状态：0=停止，1=启动',
  `NAME` varchar(255) NOT NULL COMMENT '名称',
  `EXP` varchar(50) NOT NULL COMMENT '表达式',
  `CLASS` varchar(255) NOT NULL COMMENT '实现类',
  `INFO` varchar(255) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for eova_user
-- ----------------------------
DROP TABLE IF EXISTS `eova_user`;
CREATE TABLE `eova_user` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `LOGIN_ID` varchar(30) NOT NULL COMMENT '帐号',
  `LOGIN_PWD` varchar(50) NOT NULL COMMENT '密码',
  `NICKNAME` varchar(255) DEFAULT NULL COMMENT '中文名',
  `RID` int(10) DEFAULT NULL COMMENT '角色ID',
  `HOTEL_ID` int(10) DEFAULT NULL COMMENT '所属酒店',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for eova_widget
-- ----------------------------
DROP TABLE IF EXISTS `eova_widget`;
CREATE TABLE `eova_widget` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `TYPE` int(10) NOT NULL COMMENT '控件类型：1=EOVA控件，2=DIY控件',
  `VALUE` varchar(50) NOT NULL COMMENT '控件值',
  `NAME` varchar(50) NOT NULL COMMENT '名称',
  `VERSION` varchar(5) DEFAULT NULL COMMENT '版本号',
  `PATH` varchar(50) DEFAULT NULL COMMENT '路径',
  `DESCRIPTION` text COMMENT '介绍',
  `CONFIG` text COMMENT '控件配置信息JSON',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for metl_chinese_spell
-- ----------------------------
DROP TABLE IF EXISTS `metl_chinese_spell`;
CREATE TABLE `metl_chinese_spell` (
  `OID` varchar(32) NOT NULL COMMENT '对象主键',
  `OCODE` varchar(100) DEFAULT NULL COMMENT '对象代码',
  `ONAME` varchar(100) DEFAULT NULL COMMENT '对象名称',
  `ODESCRIBE` text COMMENT '对象描述',
  `OORDER` int(65) DEFAULT NULL COMMENT '对象排序',
  `SIMPLE_SPELL` varchar(200) DEFAULT NULL COMMENT '对象简拼',
  `FULL_SPELL` text COMMENT '对象全拼',
  `CREATE_DATE` varchar(14) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_DATE` varchar(14) DEFAULT NULL COMMENT '更新时间',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '创建人',
  `UPDATE_USER` varchar(100) DEFAULT NULL COMMENT '更新人',
  `EXPAND` text COMMENT '扩展信息',
  `IS_DISABLE` varchar(10) DEFAULT NULL COMMENT '是否禁用',
  `FLAG1` varchar(200) DEFAULT NULL COMMENT '备用1',
  `FLAG2` varchar(200) DEFAULT NULL COMMENT '备用2',
  PRIMARY KEY (`OID`),
  KEY `IDX_M_C_SPELL_CREATE_DATE` (`CREATE_DATE`),
  KEY `IDX_M_C_SPELL_ONAME` (`ONAME`),
  KEY `IDX_M_C_SPELL_UPDATE_DATE` (`UPDATE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据库';

-- ----------------------------
-- Table structure for metl_database
-- ----------------------------
DROP TABLE IF EXISTS `metl_database`;
CREATE TABLE `metl_database` (
  `OID` varchar(32) NOT NULL COMMENT '对象主键',
  `OCODE` varchar(100) DEFAULT NULL COMMENT '对象代码',
  `ONAME` varchar(100) DEFAULT NULL COMMENT '对象名称',
  `ODESCRIBE` text COMMENT '对象描述',
  `OORDER` int(65) DEFAULT NULL COMMENT '对象排序',
  `SIMPLE_SPELL` varchar(200) DEFAULT NULL COMMENT '对象简拼',
  `FULL_SPELL` text COMMENT '对象全拼',
  `CREATE_DATE` varchar(14) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_DATE` varchar(14) DEFAULT NULL COMMENT '更新时间',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '创建人',
  `UPDATE_USER` varchar(100) DEFAULT NULL COMMENT '更新人',
  `EXPAND` text COMMENT '扩展信息',
  `IS_DISABLE` varchar(10) DEFAULT NULL COMMENT '是否禁用',
  `FLAG1` varchar(200) DEFAULT NULL COMMENT '备用1',
  `FLAG2` varchar(200) DEFAULT NULL COMMENT '备用2',
  `ORGANIZATION_NAME` text COMMENT '机构名称',
  `ORGANIZATION_CODE` varchar(100) DEFAULT NULL COMMENT '机构代码',
  `TYPE` varchar(100) DEFAULT NULL COMMENT '数据库类型',
  `ACCESS_WAY` varchar(100) DEFAULT NULL COMMENT '访问方式',
  `JNDI` varchar(100) DEFAULT NULL COMMENT 'JNDI名称',
  `URL` text COMMENT '连接串',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `PASSWORD` varchar(32) DEFAULT NULL COMMENT '密码',
  `STATUS` varchar(100) DEFAULT NULL COMMENT '状态',
  `VALIDATION_QUERY` varchar(100) DEFAULT NULL COMMENT '测试语句',
  PRIMARY KEY (`OID`),
  KEY `IDX_M_DATABASE_CREATE_DATE` (`CREATE_DATE`),
  KEY `IDX_M_DATABASE_UPDATE_DATE` (`UPDATE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据库';

-- ----------------------------
-- Table structure for metl_task_timing
-- ----------------------------
DROP TABLE IF EXISTS `metl_task_timing`;
CREATE TABLE `metl_task_timing` (
  `OID` varchar(32) NOT NULL COMMENT '对象主键',
  `OCODE` varchar(100) DEFAULT NULL COMMENT '对象代码',
  `ONAME` varchar(100) DEFAULT NULL COMMENT '对象名称',
  `ODESCRIBE` text COMMENT '对象描述',
  `OORDER` int(65) DEFAULT NULL COMMENT '对象排序',
  `SIMPLE_SPELL` varchar(200) DEFAULT NULL COMMENT '对象简拼',
  `FULL_SPELL` text COMMENT '对象全拼',
  `CREATE_DATE` varchar(14) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_DATE` varchar(14) DEFAULT NULL COMMENT '更新时间',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '创建人',
  `UPDATE_USER` varchar(100) DEFAULT NULL COMMENT '更新人',
  `EXPAND` text COMMENT '扩展信息',
  `IS_DISABLE` varchar(10) DEFAULT NULL COMMENT '是否禁用',
  `FLAG1` varchar(200) DEFAULT NULL COMMENT '备用1',
  `FLAG2` varchar(200) DEFAULT NULL COMMENT '备用2',
  `IS_REPEAT` varchar(10) DEFAULT NULL COMMENT '允许重复',
  `SCHEDULER_TYPE` varchar(100) DEFAULT NULL COMMENT '定时类型',
  `INTERVAL_SECONDS` int(65) DEFAULT NULL COMMENT '秒间隔',
  `INTERVAL_MINUTES` int(65) DEFAULT NULL COMMENT '分间隔',
  `HOUR` int(65) DEFAULT NULL COMMENT '每天几时',
  `MINUTES` int(65) DEFAULT NULL COMMENT '每天几分',
  `WEEK_DAY` varchar(100) DEFAULT NULL COMMENT '每周周几',
  `DAY_OF_MONTH` int(65) DEFAULT NULL COMMENT '每月几号',
  PRIMARY KEY (`OID`),
  KEY `IDX_M_T_TIMING_CREATE_DATE` (`CREATE_DATE`),
  KEY `IDX_M_T_TIMING_UPDATE_DATE` (`UPDATE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务定时';

-- ----------------------------
-- Table structure for metl_unify_dict
-- ----------------------------
DROP TABLE IF EXISTS `metl_unify_dict`;
CREATE TABLE `metl_unify_dict` (
  `OID` varchar(32) NOT NULL COMMENT '对象主键',
  `OCODE` varchar(100) DEFAULT NULL COMMENT '对象代码',
  `ONAME` varchar(100) DEFAULT NULL COMMENT '对象名称',
  `ODESCRIBE` text COMMENT '对象描述',
  `OORDER` int(65) DEFAULT NULL COMMENT '对象排序',
  `SIMPLE_SPELL` varchar(200) DEFAULT NULL COMMENT '对象简拼',
  `FULL_SPELL` text COMMENT '对象全拼',
  `CREATE_DATE` varchar(14) DEFAULT NULL COMMENT '创建时间',
  `UPDATE_DATE` varchar(14) DEFAULT NULL COMMENT '更新时间',
  `CREATE_USER` varchar(100) DEFAULT NULL COMMENT '创建人',
  `UPDATE_USER` varchar(100) DEFAULT NULL COMMENT '更新人',
  `EXPAND` text COMMENT '扩展信息',
  `IS_DISABLE` varchar(10) DEFAULT NULL COMMENT '是否禁用',
  `FLAG1` varchar(200) DEFAULT NULL COMMENT '备用1',
  `FLAG2` varchar(200) DEFAULT NULL COMMENT '备用2',
  `DICT_CATEGORY` varchar(100) DEFAULT NULL COMMENT '字典类别',
  `BELONG_OBJ` varchar(100) DEFAULT NULL COMMENT '所属对象',
  PRIMARY KEY (`OID`),
  KEY `IDX_M_U_DICT_CREATE_DATE` (`CREATE_DATE`),
  KEY `IDX_M_U_DICT_UPDATE_DATE` (`UPDATE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统一字典';
