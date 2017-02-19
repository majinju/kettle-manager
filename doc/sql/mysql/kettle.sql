/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50613
Source Host           : localhost:3306
Source Database       : kettle

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2017-01-18 17:04:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for job_log
-- ----------------------------
DROP TABLE IF EXISTS `job_log`;
CREATE TABLE `job_log` (
  `OID` varchar(32) NOT NULL COMMENT '对象主键',
  `OCODE` varchar(100) DEFAULT NULL COMMENT '对象代码',
  `ONAME` varchar(100) DEFAULT NULL COMMENT '对象名称',
  `ODESCRIBE` text COMMENT '对象描述',
  `OORDER` decimal(65,0) DEFAULT NULL COMMENT '对象排序',
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
  `ID_JOB` decimal(65,30) DEFAULT NULL COMMENT '作业ID',
  `JOB_NAME` varchar(200) DEFAULT NULL COMMENT '作业名称',
  `START_DATE` varchar(14) DEFAULT NULL COMMENT '开始时间',
  `END_DATE` varchar(14) DEFAULT NULL COMMENT '结束时间',
  `RESULT` varchar(200) DEFAULT NULL COMMENT '运行结果',
  `LOG_FILE` text COMMENT '日志文件'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业日志';

-- ----------------------------
-- Records of job_log
-- ----------------------------
INSERT INTO `job_log` VALUES ('F4EDC821F17A4A91A65B6B658E2BE54E', null, null, null, null, null, null, '20161105213524', '20161105213524', null, null, '{}', '0', null, null, '17.000000000000000000000000000000', '执行数据账单任务', '20161105193812', '20161105213524', 'Stopped', 'E:\\temp\\km\\logs\\kettle\\20161105\\执行数据账单任务_193833.txt');
INSERT INTO `job_log` VALUES ('0D6CD5A00155410ABE3AC0C426D95605', null, null, null, null, null, null, '20161105231423', '20161105231423', null, null, '{}', '0', null, null, '17.000000000000000000000000000000', '执行数据账单任务', '20161105231338', '20161105231423', 'Stopped', 'E:\\temp\\km\\logs\\kettle\\20161105\\执行数据账单任务_231353.txt');
INSERT INTO `job_log` VALUES ('517D5A00F79144B7BB996E339D467A80', null, null, null, null, null, null, '20161105033840', '20161105033840', null, null, '{}', '0', null, null, '30.000000000000000000000000000000', 'gdb_metl_kettle_log_testdb (Thread-21)', '20161105033827', '20161105033840', 'StopFailed', null);
INSERT INTO `job_log` VALUES ('78522251FEC24899939235FE9573B121', null, null, null, null, null, null, '20161105034311', '20161105034311', null, null, '{}', '0', null, null, '30.000000000000000000000000000000', 'gdb_metl_kettle_log_testdb (Thread-22)', '20161105034241', '20161105034311', 'StopFailed', 'E:\\temp\\km\\logs\\kettle\\20161105\\gdb_metl_kettle_log_testdb_034311.txt');
INSERT INTO `job_log` VALUES ('0652B66BF4CB4D9491AE5904E56D12B9', null, null, null, null, null, null, '20161105034641', '20161105034641', null, null, '{}', '0', null, null, '30.000000000000000000000000000000', 'gdb_metl_kettle_log_testdb', '20161105034635', '20161105034641', 'StopFailed', 'E:\\temp\\km\\logs\\kettle\\20161105\\gdb_metl_kettle_log_testdb_034641.txt');
INSERT INTO `job_log` VALUES ('13E370F722D34F0BBFDC53852733818F', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1.000000000000000000000000000000', '作业日志记录', '20161111215847', null, null, 'E:\\temp\\km\\logs\\kettle\\20161111\\作业日志记录_215920.txt');
INSERT INTO `job_log` VALUES ('4ABC48662AC441B283F0BB9B1D64640B', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1.000000000000000000000000000000', '作业日志记录', '20161111220556', null, null, 'E:\\temp\\km\\logs\\kettle\\20161111\\作业日志记录_220630.txt');
INSERT INTO `job_log` VALUES ('2CCE801197614896BCBC6629C7CB3F4B', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1.000000000000000000000000000000', '作业日志记录', '20161112004930', null, null, 'E:\\temp\\km\\logs\\kettle\\20161112\\作业日志记录_005003.txt');
INSERT INTO `job_log` VALUES ('B743E1ACCCFA42678CFEA0F4D01F8EF2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1.000000000000000000000000000000', '作业日志记录', '20161112200659', null, null, 'E:\\temp\\km\\logs\\kettle\\20161112\\作业日志记录_200757.txt');
INSERT INTO `job_log` VALUES ('6832605ABDBC40E09DBAAD6EC6B8FC20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1.000000000000000000000000000000', '作业日志记录', '20161112211813', null, null, 'E:\\temp\\km\\logs\\kettle\\20161112\\作业日志记录_211911.txt');
INSERT INTO `job_log` VALUES ('5D6AE4196D5F46A5A3989D598C4B8F78', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1.000000000000000000000000000000', '作业日志记录', '20161113014907', null, null, 'E:\\temp\\km\\logs\\kettle\\20161113\\作业日志记录_014941.txt');

-- ----------------------------
-- Table structure for job_params
-- ----------------------------
DROP TABLE IF EXISTS `job_params`;
CREATE TABLE `job_params` (
  `OID` varchar(32) NOT NULL COMMENT '对象主键',
  `OCODE` varchar(100) DEFAULT NULL COMMENT '对象代码',
  `ONAME` varchar(100) DEFAULT NULL COMMENT '对象名称',
  `ODESCRIBE` text COMMENT '对象描述',
  `OORDER` decimal(65,0) DEFAULT NULL COMMENT '对象排序',
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
  `ID_JOB` decimal(65,30) DEFAULT NULL COMMENT '作业',
  `VALUE` text COMMENT '变量值',
  PRIMARY KEY (`OID`),
  KEY `IDX_JOB_PARAMS_CREATE_DATE` (`CREATE_DATE`),
  KEY `IDX_JOB_PARAMS_ONAME` (`ONAME`),
  KEY `IDX_JOB_PARAMS_UPDATE_DATE` (`UPDATE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作业参数设置';

-- ----------------------------
-- Records of job_params
-- ----------------------------
INSERT INTO `job_params` VALUES ('1303CF9C676C4305B8F4720DCA95A655', 'TEMP_TABLE', '临时表', null, null, 'LSB', 'LINSHIBIAO', '20160801133658', '20160801133658', '超级管理员', null, null, '0', null, null, '22.000000000000000000000000000000', null);
INSERT INTO `job_params` VALUES ('1579900F24C2467DADC9D5FAA2AA7900', 'KETTLE_LOG_OID', 'kettle日志主键', null, null, 'KETTLERZZJ', 'KETTLERIZHIZHUJIAN', '20160801173500', '20160801173500', '超级管理员', null, null, '0', null, null, '27.000000000000000000000000000000', '222222222222');
INSERT INTO `job_params` VALUES ('28BA9E30D0D1473080008310C8C245E5', 'JOB_ROOT', 'JOB根路径', null, null, 'JOBGLJ', 'JOBGENLUJING', '20160801133658', '20160801133658', '超级管理员', null, null, '0', null, null, '23.000000000000000000000000000000', null);
INSERT INTO `job_params` VALUES ('DF03A23A89D94FF7B51D0CEB32182D15', 'DATA_BILL_OID', '数据账单主键', null, null, 'SJZDZJ', 'SHUJUZHANGDANZHUJIAN', '20160801171411', '20160801171411', '超级管理员', null, null, '0', null, null, '27.000000000000000000000000000000', '11111111111111111111111111');

-- ----------------------------
-- Table structure for r_cluster
-- ----------------------------
DROP TABLE IF EXISTS `r_cluster`;
CREATE TABLE `r_cluster` (
  `ID_CLUSTER` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `BASE_PORT` varchar(255) DEFAULT NULL,
  `SOCKETS_BUFFER_SIZE` varchar(255) DEFAULT NULL,
  `SOCKETS_FLUSH_INTERVAL` varchar(255) DEFAULT NULL,
  `SOCKETS_COMPRESSED` tinyint(1) DEFAULT NULL,
  `DYNAMIC_CLUSTER` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_CLUSTER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_cluster
-- ----------------------------

-- ----------------------------
-- Table structure for r_cluster_slave
-- ----------------------------
DROP TABLE IF EXISTS `r_cluster_slave`;
CREATE TABLE `r_cluster_slave` (
  `ID_CLUSTER_SLAVE` bigint(20) NOT NULL,
  `ID_CLUSTER` int(11) DEFAULT NULL,
  `ID_SLAVE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_CLUSTER_SLAVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_cluster_slave
-- ----------------------------

-- ----------------------------
-- Table structure for r_condition
-- ----------------------------
DROP TABLE IF EXISTS `r_condition`;
CREATE TABLE `r_condition` (
  `ID_CONDITION` bigint(20) NOT NULL,
  `ID_CONDITION_PARENT` int(11) DEFAULT NULL,
  `NEGATED` tinyint(1) DEFAULT NULL,
  `OPERATOR` varchar(255) DEFAULT NULL,
  `LEFT_NAME` varchar(255) DEFAULT NULL,
  `CONDITION_FUNCTION` varchar(255) DEFAULT NULL,
  `RIGHT_NAME` varchar(255) DEFAULT NULL,
  `ID_VALUE_RIGHT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_CONDITION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_condition
-- ----------------------------

-- ----------------------------
-- Table structure for r_database
-- ----------------------------
DROP TABLE IF EXISTS `r_database`;
CREATE TABLE `r_database` (
  `ID_DATABASE` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `ID_DATABASE_TYPE` int(11) DEFAULT NULL,
  `ID_DATABASE_CONTYPE` int(11) DEFAULT NULL,
  `HOST_NAME` varchar(255) DEFAULT NULL,
  `DATABASE_NAME` mediumtext,
  `PORT` int(11) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `SERVERNAME` varchar(255) DEFAULT NULL,
  `DATA_TBS` varchar(255) DEFAULT NULL,
  `INDEX_TBS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_DATABASE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_database
-- ----------------------------
INSERT INTO `r_database` VALUES ('1', 'myweb', '31', '1', '127.0.0.1', 'myweb', '3306', 'root', 'Encrypted 2be98afc86aa7f2e4cb79ce10bec3fd89', null, null, null);
INSERT INTO `r_database` VALUES ('2', 'AgileBI', '27', '1', 'localhost', 'pentaho-instaview', '50000', 'monetdb', 'Encrypted 2be98afc86aa7f2e4cb14a17edb86abd8', null, null, null);
INSERT INTO `r_database` VALUES ('3', 'eova', '36', '5', null, 'eova', '1521', null, 'Encrypted ', null, null, null);
INSERT INTO `r_database` VALUES ('4', 'kettle', '36', '5', null, 'kettle', '1521', null, 'Encrypted ', null, null, null);
INSERT INTO `r_database` VALUES ('5', 'main', '36', '5', null, 'main', '1521', null, 'Encrypted ', null, null, null);
INSERT INTO `r_database` VALUES ('6', 'metl', '36', '5', null, 'metl', '1521', null, 'Encrypted ', null, null, null);
INSERT INTO `r_database` VALUES ('7', 'metl_temp', '36', '5', null, 'metl_temp', '1521', null, 'Encrypted ', null, null, null);

-- ----------------------------
-- Table structure for r_database_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_database_attribute`;
CREATE TABLE `r_database_attribute` (
  `ID_DATABASE_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_DATABASE` int(11) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `VALUE_STR` mediumtext,
  PRIMARY KEY (`ID_DATABASE_ATTRIBUTE`),
  UNIQUE KEY `IDX_R_DATABASE_ATTRIBUTE_AK` (`ID_DATABASE`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_database_attribute
-- ----------------------------
INSERT INTO `r_database_attribute` VALUES ('1', '2', 'EXTRA_OPTION_MYSQL.defaultFetchSize', '500');
INSERT INTO `r_database_attribute` VALUES ('2', '2', 'EXTRA_OPTION_MYSQL.useCursorFetch', 'true');
INSERT INTO `r_database_attribute` VALUES ('3', '2', 'EXTRA_OPTION_INFOBRIGHT.characterEncoding', 'UTF-8');
INSERT INTO `r_database_attribute` VALUES ('4', '2', 'PORT_NUMBER', '50000');
INSERT INTO `r_database_attribute` VALUES ('5', '3', 'USE_POOLING', 'N');
INSERT INTO `r_database_attribute` VALUES ('6', '3', 'PRESERVE_RESERVED_WORD_CASE', 'N');
INSERT INTO `r_database_attribute` VALUES ('7', '3', 'IS_CLUSTERED', 'N');
INSERT INTO `r_database_attribute` VALUES ('8', '3', 'SUPPORTS_TIMESTAMP_DATA_TYPE', 'Y');
INSERT INTO `r_database_attribute` VALUES ('9', '3', 'SUPPORTS_BOOLEAN_DATA_TYPE', 'Y');
INSERT INTO `r_database_attribute` VALUES ('10', '3', 'PORT_NUMBER', '1521');
INSERT INTO `r_database_attribute` VALUES ('11', '3', 'FORCE_IDENTIFIERS_TO_UPPERCASE', 'N');
INSERT INTO `r_database_attribute` VALUES ('12', '3', 'FORCE_IDENTIFIERS_TO_LOWERCASE', 'N');
INSERT INTO `r_database_attribute` VALUES ('13', '3', 'QUOTE_ALL_FIELDS', 'N');
INSERT INTO `r_database_attribute` VALUES ('14', '4', 'USE_POOLING', 'N');
INSERT INTO `r_database_attribute` VALUES ('15', '4', 'PRESERVE_RESERVED_WORD_CASE', 'N');
INSERT INTO `r_database_attribute` VALUES ('16', '4', 'IS_CLUSTERED', 'N');
INSERT INTO `r_database_attribute` VALUES ('17', '4', 'SUPPORTS_TIMESTAMP_DATA_TYPE', 'Y');
INSERT INTO `r_database_attribute` VALUES ('18', '4', 'SUPPORTS_BOOLEAN_DATA_TYPE', 'Y');
INSERT INTO `r_database_attribute` VALUES ('19', '4', 'PORT_NUMBER', '1521');
INSERT INTO `r_database_attribute` VALUES ('20', '4', 'FORCE_IDENTIFIERS_TO_UPPERCASE', 'N');
INSERT INTO `r_database_attribute` VALUES ('21', '4', 'FORCE_IDENTIFIERS_TO_LOWERCASE', 'N');
INSERT INTO `r_database_attribute` VALUES ('22', '4', 'QUOTE_ALL_FIELDS', 'N');
INSERT INTO `r_database_attribute` VALUES ('23', '5', 'USE_POOLING', 'N');
INSERT INTO `r_database_attribute` VALUES ('24', '5', 'PRESERVE_RESERVED_WORD_CASE', 'N');
INSERT INTO `r_database_attribute` VALUES ('25', '5', 'IS_CLUSTERED', 'N');
INSERT INTO `r_database_attribute` VALUES ('26', '5', 'SUPPORTS_TIMESTAMP_DATA_TYPE', 'Y');
INSERT INTO `r_database_attribute` VALUES ('27', '5', 'SUPPORTS_BOOLEAN_DATA_TYPE', 'Y');
INSERT INTO `r_database_attribute` VALUES ('28', '5', 'PORT_NUMBER', '1521');
INSERT INTO `r_database_attribute` VALUES ('29', '5', 'FORCE_IDENTIFIERS_TO_UPPERCASE', 'N');
INSERT INTO `r_database_attribute` VALUES ('30', '5', 'FORCE_IDENTIFIERS_TO_LOWERCASE', 'N');
INSERT INTO `r_database_attribute` VALUES ('31', '5', 'QUOTE_ALL_FIELDS', 'N');
INSERT INTO `r_database_attribute` VALUES ('32', '6', 'USE_POOLING', 'N');
INSERT INTO `r_database_attribute` VALUES ('33', '6', 'PRESERVE_RESERVED_WORD_CASE', 'N');
INSERT INTO `r_database_attribute` VALUES ('34', '6', 'IS_CLUSTERED', 'N');
INSERT INTO `r_database_attribute` VALUES ('35', '6', 'SUPPORTS_TIMESTAMP_DATA_TYPE', 'Y');
INSERT INTO `r_database_attribute` VALUES ('36', '6', 'SUPPORTS_BOOLEAN_DATA_TYPE', 'Y');
INSERT INTO `r_database_attribute` VALUES ('37', '6', 'PORT_NUMBER', '1521');
INSERT INTO `r_database_attribute` VALUES ('38', '6', 'FORCE_IDENTIFIERS_TO_UPPERCASE', 'N');
INSERT INTO `r_database_attribute` VALUES ('39', '6', 'FORCE_IDENTIFIERS_TO_LOWERCASE', 'N');
INSERT INTO `r_database_attribute` VALUES ('40', '6', 'QUOTE_ALL_FIELDS', 'N');
INSERT INTO `r_database_attribute` VALUES ('41', '7', 'USE_POOLING', 'N');
INSERT INTO `r_database_attribute` VALUES ('42', '7', 'PRESERVE_RESERVED_WORD_CASE', 'N');
INSERT INTO `r_database_attribute` VALUES ('43', '7', 'IS_CLUSTERED', 'N');
INSERT INTO `r_database_attribute` VALUES ('44', '7', 'SUPPORTS_TIMESTAMP_DATA_TYPE', 'Y');
INSERT INTO `r_database_attribute` VALUES ('45', '7', 'SUPPORTS_BOOLEAN_DATA_TYPE', 'Y');
INSERT INTO `r_database_attribute` VALUES ('46', '7', 'PORT_NUMBER', '1521');
INSERT INTO `r_database_attribute` VALUES ('47', '7', 'FORCE_IDENTIFIERS_TO_UPPERCASE', 'N');
INSERT INTO `r_database_attribute` VALUES ('48', '7', 'FORCE_IDENTIFIERS_TO_LOWERCASE', 'N');
INSERT INTO `r_database_attribute` VALUES ('49', '7', 'QUOTE_ALL_FIELDS', 'N');

-- ----------------------------
-- Table structure for r_database_contype
-- ----------------------------
DROP TABLE IF EXISTS `r_database_contype`;
CREATE TABLE `r_database_contype` (
  `ID_DATABASE_CONTYPE` bigint(20) NOT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_DATABASE_CONTYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_database_contype
-- ----------------------------
INSERT INTO `r_database_contype` VALUES ('1', 'Native', 'Native (JDBC)');
INSERT INTO `r_database_contype` VALUES ('2', 'ODBC', 'ODBC');
INSERT INTO `r_database_contype` VALUES ('3', 'OCI', 'OCI');
INSERT INTO `r_database_contype` VALUES ('4', 'Plugin', 'Plugin specific access method');
INSERT INTO `r_database_contype` VALUES ('5', 'JNDI', 'JNDI');
INSERT INTO `r_database_contype` VALUES ('6', ',', 'Custom');

-- ----------------------------
-- Table structure for r_database_type
-- ----------------------------
DROP TABLE IF EXISTS `r_database_type`;
CREATE TABLE `r_database_type` (
  `ID_DATABASE_TYPE` bigint(20) NOT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_DATABASE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_database_type
-- ----------------------------
INSERT INTO `r_database_type` VALUES ('1', 'DERBY', 'Apache Derby');
INSERT INTO `r_database_type` VALUES ('2', 'AS/400', 'AS/400');
INSERT INTO `r_database_type` VALUES ('3', 'INTERBASE', 'Borland Interbase');
INSERT INTO `r_database_type` VALUES ('4', 'INFINIDB', 'Calpont InfiniDB');
INSERT INTO `r_database_type` VALUES ('5', 'DBASE', 'dBase III, IV or 5');
INSERT INTO `r_database_type` VALUES ('6', 'EXASOL4', 'Exasol 4');
INSERT INTO `r_database_type` VALUES ('7', 'EXTENDB', 'ExtenDB');
INSERT INTO `r_database_type` VALUES ('8', 'FIREBIRD', 'Firebird SQL');
INSERT INTO `r_database_type` VALUES ('9', 'GENERIC', 'Generic database');
INSERT INTO `r_database_type` VALUES ('10', 'GREENPLUM', 'Greenplum');
INSERT INTO `r_database_type` VALUES ('11', 'SQLBASE', 'Gupta SQL Base');
INSERT INTO `r_database_type` VALUES ('12', 'H2', 'H2');
INSERT INTO `r_database_type` VALUES ('13', 'HIVE', 'Hadoop Hive');
INSERT INTO `r_database_type` VALUES ('14', 'HIVE2', 'Hadoop Hive 2');
INSERT INTO `r_database_type` VALUES ('15', 'HYPERSONIC', 'Hypersonic');
INSERT INTO `r_database_type` VALUES ('16', 'DB2', 'IBM DB2');
INSERT INTO `r_database_type` VALUES ('17', 'IMPALA', 'Impala');
INSERT INTO `r_database_type` VALUES ('18', 'INFOBRIGHT', 'Infobright');
INSERT INTO `r_database_type` VALUES ('19', 'INFORMIX', 'Informix');
INSERT INTO `r_database_type` VALUES ('20', 'INGRES', 'Ingres');
INSERT INTO `r_database_type` VALUES ('21', 'VECTORWISE', 'Ingres VectorWise');
INSERT INTO `r_database_type` VALUES ('22', 'CACHE', 'Intersystems Cache');
INSERT INTO `r_database_type` VALUES ('23', 'KettleThin', 'Kettle thin JDBC driver');
INSERT INTO `r_database_type` VALUES ('24', 'KINGBASEES', 'KingbaseES');
INSERT INTO `r_database_type` VALUES ('25', 'LucidDB', 'LucidDB');
INSERT INTO `r_database_type` VALUES ('26', 'SAPDB', 'MaxDB (SAP DB)');
INSERT INTO `r_database_type` VALUES ('27', 'MONETDB', 'MonetDB');
INSERT INTO `r_database_type` VALUES ('28', 'MSACCESS', 'MS Access');
INSERT INTO `r_database_type` VALUES ('29', 'MSSQL', 'MS SQL Server');
INSERT INTO `r_database_type` VALUES ('30', 'MSSQLNATIVE', 'MS SQL Server (Native)');
INSERT INTO `r_database_type` VALUES ('31', 'MYSQL', 'MySQL');
INSERT INTO `r_database_type` VALUES ('32', 'MONDRIAN', 'Native Mondrian');
INSERT INTO `r_database_type` VALUES ('33', 'NEOVIEW', 'Neoview');
INSERT INTO `r_database_type` VALUES ('34', 'NETEZZA', 'Netezza');
INSERT INTO `r_database_type` VALUES ('35', 'OpenERPDatabaseMeta', 'OpenERP Server');
INSERT INTO `r_database_type` VALUES ('36', 'ORACLE', 'Oracle');
INSERT INTO `r_database_type` VALUES ('37', 'ORACLERDB', 'Oracle RDB');
INSERT INTO `r_database_type` VALUES ('38', 'PALO', 'Palo MOLAP Server');
INSERT INTO `r_database_type` VALUES ('39', 'POSTGRESQL', 'PostgreSQL');
INSERT INTO `r_database_type` VALUES ('40', 'REMEDY-AR-SYSTEM', 'Remedy Action Request System');
INSERT INTO `r_database_type` VALUES ('41', 'SAPR3', 'SAP ERP System');
INSERT INTO `r_database_type` VALUES ('42', 'SQLITE', 'SQLite');
INSERT INTO `r_database_type` VALUES ('43', 'SYBASE', 'Sybase');
INSERT INTO `r_database_type` VALUES ('44', 'SYBASEIQ', 'SybaseIQ');
INSERT INTO `r_database_type` VALUES ('45', 'TERADATA', 'Teradata');
INSERT INTO `r_database_type` VALUES ('46', 'UNIVERSE', 'UniVerse database');
INSERT INTO `r_database_type` VALUES ('47', 'VERTICA', 'Vertica');
INSERT INTO `r_database_type` VALUES ('48', 'VERTICA5', 'Vertica 5+');

-- ----------------------------
-- Table structure for r_dependency
-- ----------------------------
DROP TABLE IF EXISTS `r_dependency`;
CREATE TABLE `r_dependency` (
  `ID_DEPENDENCY` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_DATABASE` int(11) DEFAULT NULL,
  `TABLE_NAME` varchar(255) DEFAULT NULL,
  `FIELD_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_DEPENDENCY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_dependency
-- ----------------------------

-- ----------------------------
-- Table structure for r_directory
-- ----------------------------
DROP TABLE IF EXISTS `r_directory`;
CREATE TABLE `r_directory` (
  `ID_DIRECTORY` bigint(20) NOT NULL,
  `ID_DIRECTORY_PARENT` int(11) DEFAULT NULL,
  `DIRECTORY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_DIRECTORY`),
  UNIQUE KEY `IDX_R_DIRECTORY_AK` (`ID_DIRECTORY_PARENT`,`DIRECTORY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_directory
-- ----------------------------
INSERT INTO `r_directory` VALUES ('1', '0', 'km');

-- ----------------------------
-- Table structure for r_element
-- ----------------------------
DROP TABLE IF EXISTS `r_element`;
CREATE TABLE `r_element` (
  `ID_ELEMENT` bigint(20) NOT NULL,
  `ID_ELEMENT_TYPE` int(11) DEFAULT NULL,
  `NAME` mediumtext,
  PRIMARY KEY (`ID_ELEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_element
-- ----------------------------

-- ----------------------------
-- Table structure for r_element_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_element_attribute`;
CREATE TABLE `r_element_attribute` (
  `ID_ELEMENT_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_ELEMENT` int(11) DEFAULT NULL,
  `ID_ELEMENT_ATTRIBUTE_PARENT` int(11) DEFAULT NULL,
  `ATTR_KEY` varchar(255) DEFAULT NULL,
  `ATTR_VALUE` mediumtext,
  PRIMARY KEY (`ID_ELEMENT_ATTRIBUTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_element_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for r_element_type
-- ----------------------------
DROP TABLE IF EXISTS `r_element_type`;
CREATE TABLE `r_element_type` (
  `ID_ELEMENT_TYPE` bigint(20) NOT NULL,
  `ID_NAMESPACE` int(11) DEFAULT NULL,
  `NAME` mediumtext,
  `DESCRIPTION` mediumtext,
  PRIMARY KEY (`ID_ELEMENT_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_element_type
-- ----------------------------

-- ----------------------------
-- Table structure for r_job
-- ----------------------------
DROP TABLE IF EXISTS `r_job`;
CREATE TABLE `r_job` (
  `ID_JOB` bigint(20) NOT NULL,
  `ID_DIRECTORY` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` mediumtext,
  `EXTENDED_DESCRIPTION` mediumtext,
  `JOB_VERSION` varchar(255) DEFAULT NULL,
  `JOB_STATUS` int(11) DEFAULT NULL,
  `ID_DATABASE_LOG` int(11) DEFAULT NULL,
  `TABLE_NAME_LOG` varchar(255) DEFAULT NULL,
  `CREATED_USER` varchar(255) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `MODIFIED_USER` varchar(255) DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT NULL,
  `USE_BATCH_ID` tinyint(1) DEFAULT NULL,
  `PASS_BATCH_ID` tinyint(1) DEFAULT NULL,
  `USE_LOGFIELD` tinyint(1) DEFAULT NULL,
  `SHARED_FILE` varchar(255) DEFAULT NULL,
  `RUN_STATUS` varchar(255) DEFAULT 'Stopped',
  `LAST_UPDATE` varchar(14) DEFAULT NULL COMMENT '最后更新时间',
  `AUTO_RESTART_NUM` varchar(10) DEFAULT NULL COMMENT '自动重启次数',
  PRIMARY KEY (`ID_JOB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_job
-- ----------------------------
INSERT INTO `r_job` VALUES ('1', '1', '作业日志记录', '作业日志记录，按设定时间间隔记录日志到文件', null, null, '2', '-1', null, '-', '2016-06-28 16:22:47', 'admin', '2016-11-08 15:20:28', '1', '0', '1', null, 'Running', '20161113015555', null);

-- ----------------------------
-- Table structure for r_jobentry
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry`;
CREATE TABLE `r_jobentry` (
  `ID_JOBENTRY` bigint(20) NOT NULL,
  `ID_JOB` int(11) DEFAULT NULL,
  `ID_JOBENTRY_TYPE` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` mediumtext,
  PRIMARY KEY (`ID_JOBENTRY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_jobentry
-- ----------------------------
INSERT INTO `r_jobentry` VALUES ('1', '1', '73', 'START', null);
INSERT INTO `r_jobentry` VALUES ('2', '1', '56', '成功', null);
INSERT INTO `r_jobentry` VALUES ('3', '1', '89', '定时记录运行日志', null);

-- ----------------------------
-- Table structure for r_jobentry_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry_attribute`;
CREATE TABLE `r_jobentry_attribute` (
  `ID_JOBENTRY_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_JOB` int(11) DEFAULT NULL,
  `ID_JOBENTRY` int(11) DEFAULT NULL,
  `NR` int(11) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `VALUE_NUM` double DEFAULT NULL,
  `VALUE_STR` mediumtext,
  PRIMARY KEY (`ID_JOBENTRY_ATTRIBUTE`),
  UNIQUE KEY `IDX_R_JOBENTRY_ATTRIBUTE_LOOKUP` (`ID_JOBENTRY_ATTRIBUTE`,`CODE`,`NR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_jobentry_attribute
-- ----------------------------
INSERT INTO `r_jobentry_attribute` VALUES ('1', '1', '1', '0', 'start', '0', 'Y');
INSERT INTO `r_jobentry_attribute` VALUES ('2', '1', '1', '0', 'dummy', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('3', '1', '1', '0', 'repeat', '0', 'Y');
INSERT INTO `r_jobentry_attribute` VALUES ('4', '1', '1', '0', 'schedulerType', '1', null);
INSERT INTO `r_jobentry_attribute` VALUES ('5', '1', '1', '0', 'intervalSeconds', '31', null);
INSERT INTO `r_jobentry_attribute` VALUES ('6', '1', '1', '0', 'intervalMinutes', '0', null);
INSERT INTO `r_jobentry_attribute` VALUES ('7', '1', '1', '0', 'hour', '12', null);
INSERT INTO `r_jobentry_attribute` VALUES ('8', '1', '1', '0', 'minutes', '0', null);
INSERT INTO `r_jobentry_attribute` VALUES ('9', '1', '1', '0', 'weekDay', '1', null);
INSERT INTO `r_jobentry_attribute` VALUES ('10', '1', '1', '0', 'dayOfMonth', '1', null);
INSERT INTO `r_jobentry_attribute` VALUES ('11', '1', '3', '0', 'configInfo', '0', '{\n	\"是否写日志文件\":\"${IS_WRITE_LOG_FILE}\",\n	\"获取运行日志行数\":\"${RUN_LOG_LINE}\",\n	\"日志文件大小(M)\":\"${LOG_FILE_SIZE}\",\n	\"日志文件路径\":\"${LOG_FILE_ROOT}\"\n}');
INSERT INTO `r_jobentry_attribute` VALUES ('12', '1', '3', '0', 'className', '0', 'net.oschina.kettlemanager.JobManager');

-- ----------------------------
-- Table structure for r_jobentry_copy
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry_copy`;
CREATE TABLE `r_jobentry_copy` (
  `ID_JOBENTRY_COPY` bigint(20) NOT NULL,
  `ID_JOBENTRY` int(11) DEFAULT NULL,
  `ID_JOB` int(11) DEFAULT NULL,
  `ID_JOBENTRY_TYPE` int(11) DEFAULT NULL,
  `NR` int(11) DEFAULT NULL,
  `GUI_LOCATION_X` int(11) DEFAULT NULL,
  `GUI_LOCATION_Y` int(11) DEFAULT NULL,
  `GUI_DRAW` tinyint(1) DEFAULT NULL,
  `PARALLEL` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_JOBENTRY_COPY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_jobentry_copy
-- ----------------------------
INSERT INTO `r_jobentry_copy` VALUES ('1', '1', '1', '73', '0', '153', '114', '1', '0');
INSERT INTO `r_jobentry_copy` VALUES ('2', '2', '1', '56', '0', '389', '114', '1', '0');
INSERT INTO `r_jobentry_copy` VALUES ('3', '3', '1', '89', '0', '270', '117', '1', '0');

-- ----------------------------
-- Table structure for r_jobentry_database
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry_database`;
CREATE TABLE `r_jobentry_database` (
  `ID_JOB` int(11) DEFAULT NULL,
  `ID_JOBENTRY` int(11) DEFAULT NULL,
  `ID_DATABASE` int(11) DEFAULT NULL,
  KEY `IDX_R_JOBENTRY_DATABASE_LU1` (`ID_JOB`),
  KEY `IDX_R_JOBENTRY_DATABASE_LU2` (`ID_DATABASE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_jobentry_database
-- ----------------------------

-- ----------------------------
-- Table structure for r_jobentry_type
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry_type`;
CREATE TABLE `r_jobentry_type` (
  `ID_JOBENTRY_TYPE` bigint(20) NOT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_JOBENTRY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_jobentry_type
-- ----------------------------
INSERT INTO `r_jobentry_type` VALUES ('1', 'EMRJobExecutorPlugin', 'Amazon EMR Job Executor');
INSERT INTO `r_jobentry_type` VALUES ('2', 'HiveJobExecutorPlugin', 'Amazon Hive Job Executor');
INSERT INTO `r_jobentry_type` VALUES ('3', 'DOS_UNIX_CONVERTER', 'DOS和UNIX之间的文本转换');
INSERT INTO `r_jobentry_type` VALUES ('4', 'DTD_VALIDATOR', 'DTD 验证');
INSERT INTO `r_jobentry_type` VALUES ('5', 'DummyJob', 'Example plugin');
INSERT INTO `r_jobentry_type` VALUES ('6', 'FTP_PUT', 'FTP 上传');
INSERT INTO `r_jobentry_type` VALUES ('7', 'FTP', 'FTP 下载');
INSERT INTO `r_jobentry_type` VALUES ('8', 'FTP_DELETE', 'FTP 删除');
INSERT INTO `r_jobentry_type` VALUES ('9', 'FTPS_PUT', 'FTPS 上传');
INSERT INTO `r_jobentry_type` VALUES ('10', 'FTPS_GET', 'FTPS 下载');
INSERT INTO `r_jobentry_type` VALUES ('11', 'HadoopCopyFilesPlugin', 'Hadoop Copy Files');
INSERT INTO `r_jobentry_type` VALUES ('12', 'HadoopJobExecutorPlugin', 'Hadoop Job Executor ');
INSERT INTO `r_jobentry_type` VALUES ('13', 'HL7MLLPAcknowledge', 'HL7 MLLP Acknowledge');
INSERT INTO `r_jobentry_type` VALUES ('14', 'HL7MLLPInput', 'HL7 MLLP Input');
INSERT INTO `r_jobentry_type` VALUES ('15', 'HTTP', 'HTTP');
INSERT INTO `r_jobentry_type` VALUES ('16', 'MS_ACCESS_BULK_LOAD', 'MS Access 批量加载');
INSERT INTO `r_jobentry_type` VALUES ('17', 'MYSQL_BULK_LOAD', 'Mysql 批量加载');
INSERT INTO `r_jobentry_type` VALUES ('18', 'OozieJobExecutor', 'Oozie Job Executor');
INSERT INTO `r_jobentry_type` VALUES ('19', 'PALO_CUBE_CREATE', 'Palo Cube Create');
INSERT INTO `r_jobentry_type` VALUES ('20', 'PALO_CUBE_DELETE', 'Palo Cube Delete');
INSERT INTO `r_jobentry_type` VALUES ('21', 'HadoopTransJobExecutorPlugin', 'Pentaho MapReduce');
INSERT INTO `r_jobentry_type` VALUES ('22', 'HadoopPigScriptExecutorPlugin', 'Pig Script Executor');
INSERT INTO `r_jobentry_type` VALUES ('23', 'PING', 'Ping 一台主机');
INSERT INTO `r_jobentry_type` VALUES ('24', 'GET_POP', 'POP 收信');
INSERT INTO `r_jobentry_type` VALUES ('25', 'SFTPPUT', 'SFTP 上传');
INSERT INTO `r_jobentry_type` VALUES ('26', 'SFTP', 'SFTP 下载');
INSERT INTO `r_jobentry_type` VALUES ('27', 'SHELL', 'Shell');
INSERT INTO `r_jobentry_type` VALUES ('28', 'SQL', 'SQL');
INSERT INTO `r_jobentry_type` VALUES ('29', 'MSSQL_BULK_LOAD', 'SQLServer 批量加载');
INSERT INTO `r_jobentry_type` VALUES ('30', 'SqoopExport', 'Sqoop Export');
INSERT INTO `r_jobentry_type` VALUES ('31', 'SqoopImport', 'Sqoop Import');
INSERT INTO `r_jobentry_type` VALUES ('32', 'SSH2_PUT', 'SSH2 上传');
INSERT INTO `r_jobentry_type` VALUES ('33', 'SSH2_GET', 'SSH2 下载');
INSERT INTO `r_jobentry_type` VALUES ('34', 'TALEND_JOB_EXEC', 'Talend 作业执行');
INSERT INTO `r_jobentry_type` VALUES ('35', 'XSD_VALIDATOR', 'XSD 验证器');
INSERT INTO `r_jobentry_type` VALUES ('36', 'XSLT', 'XSL 转换');
INSERT INTO `r_jobentry_type` VALUES ('37', 'ZIP_FILE', 'Zip 压缩文件');
INSERT INTO `r_jobentry_type` VALUES ('38', 'ABORT', '中止作业');
INSERT INTO `r_jobentry_type` VALUES ('39', 'MYSQL_BULK_FILE', '从 Mysql 批量导出到文件');
INSERT INTO `r_jobentry_type` VALUES ('40', 'DELETE_RESULT_FILENAMES', '从结果文件中删除文件');
INSERT INTO `r_jobentry_type` VALUES ('41', 'JOB', '作业');
INSERT INTO `r_jobentry_type` VALUES ('42', 'EVAL', '使用 JavaScript 脚本验证');
INSERT INTO `r_jobentry_type` VALUES ('43', 'WRITE_TO_FILE', '写入文件');
INSERT INTO `r_jobentry_type` VALUES ('44', 'WRITE_TO_LOG', '写日志');
INSERT INTO `r_jobentry_type` VALUES ('45', 'CREATE_FOLDER', '创建一个目录');
INSERT INTO `r_jobentry_type` VALUES ('46', 'CREATE_FILE', '创建文件');
INSERT INTO `r_jobentry_type` VALUES ('47', 'DELETE_FILE', '删除一个文件');
INSERT INTO `r_jobentry_type` VALUES ('48', 'DELETE_FILES', '删除多个文件');
INSERT INTO `r_jobentry_type` VALUES ('49', 'DELETE_FOLDERS', '删除目录');
INSERT INTO `r_jobentry_type` VALUES ('50', 'SNMP_TRAP', '发送 SNMP 自陷');
INSERT INTO `r_jobentry_type` VALUES ('51', 'SEND_NAGIOS_PASSIVE_CHECK', '发送Nagios 被动检查');
INSERT INTO `r_jobentry_type` VALUES ('52', 'MAIL', '发送邮件');
INSERT INTO `r_jobentry_type` VALUES ('53', 'COPY_MOVE_RESULT_FILENAMES', '复制/移动结果文件');
INSERT INTO `r_jobentry_type` VALUES ('54', 'COPY_FILES', '复制文件');
INSERT INTO `r_jobentry_type` VALUES ('55', 'EXPORT_REPOSITORY', '导出资源库到XML文件');
INSERT INTO `r_jobentry_type` VALUES ('56', 'SUCCESS', '成功');
INSERT INTO `r_jobentry_type` VALUES ('57', 'MSGBOX_INFO', '显示消息对话框');
INSERT INTO `r_jobentry_type` VALUES ('58', 'XML_WELL_FORMED', '检查 XML 文件格式');
INSERT INTO `r_jobentry_type` VALUES ('59', 'WEBSERVICE_AVAILABLE', '检查web服务是否可用');
INSERT INTO `r_jobentry_type` VALUES ('60', 'FILE_EXISTS', '检查一个文件是否存在');
INSERT INTO `r_jobentry_type` VALUES ('61', 'COLUMNS_EXIST', '检查列是否存在');
INSERT INTO `r_jobentry_type` VALUES ('62', 'FILES_EXIST', '检查多个文件是否存在');
INSERT INTO `r_jobentry_type` VALUES ('63', 'CHECK_DB_CONNECTIONS', '检查数据库连接');
INSERT INTO `r_jobentry_type` VALUES ('64', 'CHECK_FILES_LOCKED', '检查文件是否被锁');
INSERT INTO `r_jobentry_type` VALUES ('65', 'CONNECTED_TO_REPOSITORY', '检查是否连接到资源库');
INSERT INTO `r_jobentry_type` VALUES ('66', 'FOLDER_IS_EMPTY', '检查目录是否为空');
INSERT INTO `r_jobentry_type` VALUES ('67', 'TABLE_EXISTS', '检查表是否存在');
INSERT INTO `r_jobentry_type` VALUES ('68', 'SIMPLE_EVAL', '检验字段的值');
INSERT INTO `r_jobentry_type` VALUES ('69', 'FILE_COMPARE', '比较文件');
INSERT INTO `r_jobentry_type` VALUES ('70', 'FOLDERS_COMPARE', '比较目录');
INSERT INTO `r_jobentry_type` VALUES ('71', 'ADD_RESULT_FILENAMES', '添加文件到结果文件中');
INSERT INTO `r_jobentry_type` VALUES ('72', 'TRUNCATE_TABLES', '清空表');
INSERT INTO `r_jobentry_type` VALUES ('73', 'SPECIAL', '特殊作业项');
INSERT INTO `r_jobentry_type` VALUES ('74', 'SYSLOG', '用 Syslog 发送信息');
INSERT INTO `r_jobentry_type` VALUES ('75', 'PGP_ENCRYPT_FILES', '用PGP加密文件');
INSERT INTO `r_jobentry_type` VALUES ('76', 'PGP_DECRYPT_FILES', '用PGP解密文件');
INSERT INTO `r_jobentry_type` VALUES ('77', 'PGP_VERIFY_FILES', '用PGP验证文件签名');
INSERT INTO `r_jobentry_type` VALUES ('78', 'MOVE_FILES', '移动文件');
INSERT INTO `r_jobentry_type` VALUES ('79', 'DELAY', '等待');
INSERT INTO `r_jobentry_type` VALUES ('80', 'WAIT_FOR_SQL', '等待SQL');
INSERT INTO `r_jobentry_type` VALUES ('81', 'WAIT_FOR_FILE', '等待文件');
INSERT INTO `r_jobentry_type` VALUES ('82', 'UNZIP', '解压缩文件');
INSERT INTO `r_jobentry_type` VALUES ('83', 'EVAL_FILES_METRICS', '计算文件大小或个数');
INSERT INTO `r_jobentry_type` VALUES ('84', 'EVAL_TABLE_CONTENT', '计算表中的记录数');
INSERT INTO `r_jobentry_type` VALUES ('85', 'SET_VARIABLES', '设置变量');
INSERT INTO `r_jobentry_type` VALUES ('86', 'TRANS', '转换');
INSERT INTO `r_jobentry_type` VALUES ('87', 'TELNET', '远程登录一台主机');
INSERT INTO `r_jobentry_type` VALUES ('88', 'MAIL_VALIDATOR', '邮件验证');
INSERT INTO `r_jobentry_type` VALUES ('89', 'JobEntryKettleUtil', 'kettle工具');
INSERT INTO `r_jobentry_type` VALUES ('90', 'SparkSubmit', 'Spark Submit');

-- ----------------------------
-- Table structure for r_job_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_job_attribute`;
CREATE TABLE `r_job_attribute` (
  `ID_JOB_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_JOB` int(11) DEFAULT NULL,
  `NR` int(11) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `VALUE_NUM` bigint(20) DEFAULT NULL,
  `VALUE_STR` mediumtext,
  PRIMARY KEY (`ID_JOB_ATTRIBUTE`),
  UNIQUE KEY `IDX_JOB_ATTRIBUTE_LOOKUP` (`ID_JOB`,`CODE`,`NR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_job_attribute
-- ----------------------------
INSERT INTO `r_job_attribute` VALUES ('1', '1', '0', 'LOG_SIZE_LIMIT', '0', null);
INSERT INTO `r_job_attribute` VALUES ('2', '1', '0', 'JOB_LOG_TABLE_CONNECTION_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('3', '1', '0', 'JOB_LOG_TABLE_SCHEMA_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('4', '1', '0', 'JOB_LOG_TABLE_TABLE_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('5', '1', '0', 'JOB_LOG_TABLE_TIMEOUT_IN_DAYS', '0', null);
INSERT INTO `r_job_attribute` VALUES ('6', '1', '0', 'JOB_LOG_TABLE_FIELD_ID0', '0', 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES ('7', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME0', '0', 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES ('8', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED0', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('9', '1', '0', 'JOB_LOG_TABLE_FIELD_ID1', '0', 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('10', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME1', '0', 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('11', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED1', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('12', '1', '0', 'JOB_LOG_TABLE_FIELD_ID2', '0', 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES ('13', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME2', '0', 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES ('14', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED2', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('15', '1', '0', 'JOB_LOG_TABLE_FIELD_ID3', '0', 'STATUS');
INSERT INTO `r_job_attribute` VALUES ('16', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME3', '0', 'STATUS');
INSERT INTO `r_job_attribute` VALUES ('17', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED3', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('18', '1', '0', 'JOB_LOG_TABLE_FIELD_ID4', '0', 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES ('19', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME4', '0', 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES ('20', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED4', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('21', '1', '0', 'JOB_LOG_TABLE_FIELD_ID5', '0', 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES ('22', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME5', '0', 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES ('23', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED5', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('24', '1', '0', 'JOB_LOG_TABLE_FIELD_ID6', '0', 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES ('25', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME6', '0', 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES ('26', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED6', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('27', '1', '0', 'JOB_LOG_TABLE_FIELD_ID7', '0', 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES ('28', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME7', '0', 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES ('29', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED7', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('30', '1', '0', 'JOB_LOG_TABLE_FIELD_ID8', '0', 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES ('31', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME8', '0', 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES ('32', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED8', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('33', '1', '0', 'JOB_LOG_TABLE_FIELD_ID9', '0', 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES ('34', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME9', '0', 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES ('35', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED9', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('36', '1', '0', 'JOB_LOG_TABLE_FIELD_ID10', '0', 'ERRORS');
INSERT INTO `r_job_attribute` VALUES ('37', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME10', '0', 'ERRORS');
INSERT INTO `r_job_attribute` VALUES ('38', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED10', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('39', '1', '0', 'JOB_LOG_TABLE_FIELD_ID11', '0', 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES ('40', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME11', '0', 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES ('41', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED11', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('42', '1', '0', 'JOB_LOG_TABLE_FIELD_ID12', '0', 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES ('43', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME12', '0', 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES ('44', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED12', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('45', '1', '0', 'JOB_LOG_TABLE_FIELD_ID13', '0', 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES ('46', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME13', '0', 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES ('47', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED13', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('48', '1', '0', 'JOB_LOG_TABLE_FIELD_ID14', '0', 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES ('49', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME14', '0', 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES ('50', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED14', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('51', '1', '0', 'JOB_LOG_TABLE_FIELD_ID15', '0', 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES ('52', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME15', '0', 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES ('53', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED15', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('54', '1', '0', 'JOB_LOG_TABLE_FIELD_ID16', '0', 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES ('55', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME16', '0', 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES ('56', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED16', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('57', '1', '0', 'JOB_LOG_TABLE_FIELD_ID17', '0', 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES ('58', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME17', '0', 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES ('59', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED17', '0', 'N');
INSERT INTO `r_job_attribute` VALUES ('60', '1', '0', 'JOB_LOG_TABLE_FIELD_ID18', '0', 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES ('61', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME18', '0', 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES ('62', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED18', '0', 'N');
INSERT INTO `r_job_attribute` VALUES ('63', '1', '0', 'JOB_LOG_TABLE_FIELD_ID19', '0', 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES ('64', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME19', '0', 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES ('65', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED19', '0', 'N');
INSERT INTO `r_job_attribute` VALUES ('66', '1', '0', 'JOB_LOG_TABLE_FIELD_ID20', '0', 'CLIENT');
INSERT INTO `r_job_attribute` VALUES ('67', '1', '0', 'JOB_LOG_TABLE_FIELD_NAME20', '0', 'CLIENT');
INSERT INTO `r_job_attribute` VALUES ('68', '1', '0', 'JOB_LOG_TABLE_FIELD_ENABLED20', '0', 'N');
INSERT INTO `r_job_attribute` VALUES ('69', '1', '0', 'JOBLOG_TABLE_INTERVAL', '0', null);
INSERT INTO `r_job_attribute` VALUES ('70', '1', '0', 'JOBLOG_TABLE_SIZE_LIMIT', '0', null);
INSERT INTO `r_job_attribute` VALUES ('71', '1', '0', 'JOB_ENTRY_LOG_TABLE_CONNECTION_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('72', '1', '0', 'JOB_ENTRY_LOG_TABLE_SCHEMA_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('73', '1', '0', 'JOB_ENTRY_LOG_TABLE_TABLE_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('74', '1', '0', 'JOB_ENTRY_LOG_TABLE_TIMEOUT_IN_DAYS', '0', null);
INSERT INTO `r_job_attribute` VALUES ('75', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID0', '0', 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES ('76', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME0', '0', 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES ('77', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED0', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('78', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID1', '0', 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('79', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME1', '0', 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('80', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED1', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('81', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID2', '0', 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES ('82', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME2', '0', 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES ('83', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED2', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('84', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID3', '0', 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES ('85', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME3', '0', 'TRANSNAME');
INSERT INTO `r_job_attribute` VALUES ('86', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED3', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('87', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID4', '0', 'JOBENTRYNAME');
INSERT INTO `r_job_attribute` VALUES ('88', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME4', '0', 'STEPNAME');
INSERT INTO `r_job_attribute` VALUES ('89', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED4', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('90', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID5', '0', 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES ('91', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME5', '0', 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES ('92', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED5', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('93', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID6', '0', 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES ('94', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME6', '0', 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES ('95', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED6', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('96', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID7', '0', 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES ('97', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME7', '0', 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES ('98', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED7', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('99', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID8', '0', 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES ('100', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME8', '0', 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES ('101', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED8', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('102', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID9', '0', 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES ('103', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME9', '0', 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES ('104', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED9', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('105', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID10', '0', 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES ('106', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME10', '0', 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES ('107', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED10', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('108', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID11', '0', 'ERRORS');
INSERT INTO `r_job_attribute` VALUES ('109', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME11', '0', 'ERRORS');
INSERT INTO `r_job_attribute` VALUES ('110', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED11', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('111', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID12', '0', 'RESULT');
INSERT INTO `r_job_attribute` VALUES ('112', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME12', '0', 'RESULT');
INSERT INTO `r_job_attribute` VALUES ('113', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED12', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('114', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID13', '0', 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES ('115', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME13', '0', 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES ('116', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED13', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('117', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID14', '0', 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES ('118', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME14', '0', 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES ('119', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED14', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('120', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID15', '0', 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES ('121', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME15', '0', 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES ('122', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED15', '0', 'N');
INSERT INTO `r_job_attribute` VALUES ('123', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ID16', '0', 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES ('124', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_NAME16', '0', 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES ('125', '1', '0', 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED16', '0', 'N');
INSERT INTO `r_job_attribute` VALUES ('126', '1', '0', 'CHANNEL_LOG_TABLE_CONNECTION_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('127', '1', '0', 'CHANNEL_LOG_TABLE_SCHEMA_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('128', '1', '0', 'CHANNEL_LOG_TABLE_TABLE_NAME', '0', null);
INSERT INTO `r_job_attribute` VALUES ('129', '1', '0', 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', '0', null);
INSERT INTO `r_job_attribute` VALUES ('130', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID0', '0', 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES ('131', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME0', '0', 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES ('132', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('133', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID1', '0', 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('134', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME1', '0', 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('135', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('136', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID2', '0', 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES ('137', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME2', '0', 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES ('138', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('139', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID3', '0', 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES ('140', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME3', '0', 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES ('141', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('142', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID4', '0', 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES ('143', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME4', '0', 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES ('144', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('145', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID5', '0', 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES ('146', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME5', '0', 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES ('147', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('148', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID6', '0', 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES ('149', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME6', '0', 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES ('150', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('151', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID7', '0', 'FILENAME');
INSERT INTO `r_job_attribute` VALUES ('152', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME7', '0', 'FILENAME');
INSERT INTO `r_job_attribute` VALUES ('153', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('154', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID8', '0', 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES ('155', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME8', '0', 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES ('156', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('157', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID9', '0', 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES ('158', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME9', '0', 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES ('159', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('160', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID10', '0', 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('161', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME10', '0', 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('162', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('163', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ID11', '0', 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('164', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_NAME11', '0', 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES ('165', '1', '0', 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', '0', 'Y');
INSERT INTO `r_job_attribute` VALUES ('166', '1', '0', 'PARAM_KEY', '0', 'IS_WRITE_LOG_FILE');
INSERT INTO `r_job_attribute` VALUES ('167', '1', '0', 'PARAM_DEFAULT', '0', 'true');
INSERT INTO `r_job_attribute` VALUES ('168', '1', '0', 'PARAM_DESC', '0', '是否写日志文件');
INSERT INTO `r_job_attribute` VALUES ('169', '1', '1', 'PARAM_KEY', '0', 'LOG_FILE_ROOT');
INSERT INTO `r_job_attribute` VALUES ('170', '1', '1', 'PARAM_DEFAULT', '0', '/temp/km/logs/kettle');
INSERT INTO `r_job_attribute` VALUES ('171', '1', '1', 'PARAM_DESC', '0', '日志文件路径');
INSERT INTO `r_job_attribute` VALUES ('172', '1', '2', 'PARAM_KEY', '0', 'LOG_FILE_SIZE');
INSERT INTO `r_job_attribute` VALUES ('173', '1', '2', 'PARAM_DEFAULT', '0', '20');
INSERT INTO `r_job_attribute` VALUES ('174', '1', '2', 'PARAM_DESC', '0', '日志文件大小(M)');
INSERT INTO `r_job_attribute` VALUES ('175', '1', '3', 'PARAM_KEY', '0', 'RUN_LOG_LINE');
INSERT INTO `r_job_attribute` VALUES ('176', '1', '3', 'PARAM_DEFAULT', '0', '10000');
INSERT INTO `r_job_attribute` VALUES ('177', '1', '3', 'PARAM_DESC', '0', '获取运行日志行数');

-- ----------------------------
-- Table structure for r_job_hop
-- ----------------------------
DROP TABLE IF EXISTS `r_job_hop`;
CREATE TABLE `r_job_hop` (
  `ID_JOB_HOP` bigint(20) NOT NULL,
  `ID_JOB` int(11) DEFAULT NULL,
  `ID_JOBENTRY_COPY_FROM` int(11) DEFAULT NULL,
  `ID_JOBENTRY_COPY_TO` int(11) DEFAULT NULL,
  `ENABLED` tinyint(1) DEFAULT NULL,
  `EVALUATION` tinyint(1) DEFAULT NULL,
  `UNCONDITIONAL` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_JOB_HOP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_job_hop
-- ----------------------------
INSERT INTO `r_job_hop` VALUES ('1', '1', '1', '3', '1', '1', '1');
INSERT INTO `r_job_hop` VALUES ('2', '1', '3', '2', '1', '1', '1');

-- ----------------------------
-- Table structure for r_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `r_job_lock`;
CREATE TABLE `r_job_lock` (
  `ID_JOB_LOCK` bigint(20) NOT NULL,
  `ID_JOB` int(11) DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `LOCK_MESSAGE` mediumtext,
  `LOCK_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_JOB_LOCK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_job_lock
-- ----------------------------

-- ----------------------------
-- Table structure for r_job_note
-- ----------------------------
DROP TABLE IF EXISTS `r_job_note`;
CREATE TABLE `r_job_note` (
  `ID_JOB` int(11) DEFAULT NULL,
  `ID_NOTE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_job_note
-- ----------------------------

-- ----------------------------
-- Table structure for r_log
-- ----------------------------
DROP TABLE IF EXISTS `r_log`;
CREATE TABLE `r_log` (
  `ID_LOG` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `ID_LOGLEVEL` int(11) DEFAULT NULL,
  `LOGTYPE` varchar(255) DEFAULT NULL,
  `FILENAME` varchar(255) DEFAULT NULL,
  `FILEEXTENTION` varchar(255) DEFAULT NULL,
  `ADD_DATE` tinyint(1) DEFAULT NULL,
  `ADD_TIME` tinyint(1) DEFAULT NULL,
  `ID_DATABASE_LOG` int(11) DEFAULT NULL,
  `TABLE_NAME_LOG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_LOG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_log
-- ----------------------------

-- ----------------------------
-- Table structure for r_loglevel
-- ----------------------------
DROP TABLE IF EXISTS `r_loglevel`;
CREATE TABLE `r_loglevel` (
  `ID_LOGLEVEL` bigint(20) NOT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_LOGLEVEL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_loglevel
-- ----------------------------
INSERT INTO `r_loglevel` VALUES ('1', 'Error', '错误日志');
INSERT INTO `r_loglevel` VALUES ('2', 'Minimal', '最小日志');
INSERT INTO `r_loglevel` VALUES ('3', 'Basic', '基本日志');
INSERT INTO `r_loglevel` VALUES ('4', 'Detailed', '详细日志');
INSERT INTO `r_loglevel` VALUES ('5', 'Debug', '调试');
INSERT INTO `r_loglevel` VALUES ('6', 'Rowlevel', '行级日志(非常详细)');

-- ----------------------------
-- Table structure for r_namespace
-- ----------------------------
DROP TABLE IF EXISTS `r_namespace`;
CREATE TABLE `r_namespace` (
  `ID_NAMESPACE` bigint(20) NOT NULL,
  `NAME` mediumtext,
  PRIMARY KEY (`ID_NAMESPACE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_namespace
-- ----------------------------

-- ----------------------------
-- Table structure for r_note
-- ----------------------------
DROP TABLE IF EXISTS `r_note`;
CREATE TABLE `r_note` (
  `ID_NOTE` bigint(20) NOT NULL,
  `VALUE_STR` mediumtext,
  `GUI_LOCATION_X` int(11) DEFAULT NULL,
  `GUI_LOCATION_Y` int(11) DEFAULT NULL,
  `GUI_LOCATION_WIDTH` int(11) DEFAULT NULL,
  `GUI_LOCATION_HEIGHT` int(11) DEFAULT NULL,
  `FONT_NAME` mediumtext,
  `FONT_SIZE` int(11) DEFAULT NULL,
  `FONT_BOLD` tinyint(1) DEFAULT NULL,
  `FONT_ITALIC` tinyint(1) DEFAULT NULL,
  `FONT_COLOR_RED` int(11) DEFAULT NULL,
  `FONT_COLOR_GREEN` int(11) DEFAULT NULL,
  `FONT_COLOR_BLUE` int(11) DEFAULT NULL,
  `FONT_BACK_GROUND_COLOR_RED` int(11) DEFAULT NULL,
  `FONT_BACK_GROUND_COLOR_GREEN` int(11) DEFAULT NULL,
  `FONT_BACK_GROUND_COLOR_BLUE` int(11) DEFAULT NULL,
  `FONT_BORDER_COLOR_RED` int(11) DEFAULT NULL,
  `FONT_BORDER_COLOR_GREEN` int(11) DEFAULT NULL,
  `FONT_BORDER_COLOR_BLUE` int(11) DEFAULT NULL,
  `DRAW_SHADOW` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_NOTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_note
-- ----------------------------

-- ----------------------------
-- Table structure for r_partition
-- ----------------------------
DROP TABLE IF EXISTS `r_partition`;
CREATE TABLE `r_partition` (
  `ID_PARTITION` bigint(20) NOT NULL,
  `ID_PARTITION_SCHEMA` int(11) DEFAULT NULL,
  `PARTITION_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_PARTITION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_partition
-- ----------------------------

-- ----------------------------
-- Table structure for r_partition_schema
-- ----------------------------
DROP TABLE IF EXISTS `r_partition_schema`;
CREATE TABLE `r_partition_schema` (
  `ID_PARTITION_SCHEMA` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `DYNAMIC_DEFINITION` tinyint(1) DEFAULT NULL,
  `PARTITIONS_PER_SLAVE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_PARTITION_SCHEMA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_partition_schema
-- ----------------------------

-- ----------------------------
-- Table structure for r_repository_log
-- ----------------------------
DROP TABLE IF EXISTS `r_repository_log`;
CREATE TABLE `r_repository_log` (
  `ID_REPOSITORY_LOG` bigint(20) NOT NULL,
  `REP_VERSION` varchar(255) DEFAULT NULL,
  `LOG_DATE` datetime DEFAULT NULL,
  `LOG_USER` varchar(255) DEFAULT NULL,
  `OPERATION_DESC` mediumtext,
  PRIMARY KEY (`ID_REPOSITORY_LOG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_repository_log
-- ----------------------------
INSERT INTO `r_repository_log` VALUES ('1', '5.0', '2014-10-23 15:15:08', 'admin', 'save transformation \'test\'');
INSERT INTO `r_repository_log` VALUES ('2', '5.0', '2014-10-23 15:15:21', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('3', '5.0', '2014-10-23 15:15:28', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('4', '5.0', '2014-10-23 15:15:32', 'admin', 'save transformation \'test\'');
INSERT INTO `r_repository_log` VALUES ('5', '5.0', '2014-10-23 15:17:06', 'admin', 'save transformation \'test\'');
INSERT INTO `r_repository_log` VALUES ('6', '5.0', '2014-10-23 15:17:09', 'admin', 'save transformation \'test\'');
INSERT INTO `r_repository_log` VALUES ('7', '5.0', '2014-10-23 15:17:17', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('8', '5.0', '2014-10-28 00:09:28', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('9', '5.0', '2014-10-28 00:10:03', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('10', '5.0', '2014-10-28 00:10:33', 'admin', 'save transformation \'插入考试人员\'');
INSERT INTO `r_repository_log` VALUES ('11', '5.0', '2014-10-28 00:10:36', 'admin', 'save transformation \'插入考试人员\'');
INSERT INTO `r_repository_log` VALUES ('12', '5.0', '2014-10-28 00:11:44', 'admin', 'save transformation \'设置变量异常示例\'');
INSERT INTO `r_repository_log` VALUES ('13', '5.0', '2014-10-28 00:11:49', 'admin', 'save transformation \'设置变量异常示例\'');
INSERT INTO `r_repository_log` VALUES ('14', '5.0', '2014-10-28 00:13:00', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('15', '5.0', '2014-10-28 00:13:26', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('16', '5.0', '2014-10-28 00:14:25', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('17', '5.0', '2014-10-28 00:22:13', 'admin', 'save transformation \'插入考试人员\'');
INSERT INTO `r_repository_log` VALUES ('18', '5.0', '2014-10-28 00:22:35', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('19', '5.0', '2014-10-28 00:25:58', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('20', '5.0', '2014-10-28 00:27:27', 'admin', 'save transformation \'设置变量异常示例\'');
INSERT INTO `r_repository_log` VALUES ('21', '5.0', '2014-10-28 00:27:50', 'admin', 'save transformation \'设置变量异常示例\'');
INSERT INTO `r_repository_log` VALUES ('22', '5.0', '2014-10-28 00:30:34', 'admin', 'save transformation \'插入考试人员\'');
INSERT INTO `r_repository_log` VALUES ('23', '5.0', '2014-10-28 00:30:47', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('24', '5.0', '2014-10-28 00:33:51', 'admin', 'save transformation \'插入考试人员\'');
INSERT INTO `r_repository_log` VALUES ('25', '5.0', '2014-10-28 00:33:57', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('26', '5.0', '2014-10-28 00:39:56', 'admin', 'Creation of initial version');
INSERT INTO `r_repository_log` VALUES ('27', '5.0', '2014-10-28 00:40:38', 'admin', 'save transformation \'插入考试人员\'');
INSERT INTO `r_repository_log` VALUES ('28', '5.0', '2014-10-28 00:40:44', 'admin', 'save transformation \'插入考试人员\'');
INSERT INTO `r_repository_log` VALUES ('29', '5.0', '2014-10-28 00:40:58', 'admin', 'save transformation \'插入考试人员\'');
INSERT INTO `r_repository_log` VALUES ('30', '5.0', '2014-10-28 00:41:06', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('31', '5.0', '2014-10-28 00:42:04', 'admin', 'save transformation \'录入考试人员\'');
INSERT INTO `r_repository_log` VALUES ('32', '5.0', '2014-10-28 00:42:19', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('33', '5.0', '2014-10-28 00:43:11', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('34', '5.0', '2014-10-28 00:46:24', 'admin', 'Creation of initial version');
INSERT INTO `r_repository_log` VALUES ('35', '5.0', '2014-10-28 00:46:51', 'admin', 'save transformation \'录入考试人员\'');
INSERT INTO `r_repository_log` VALUES ('36', '5.0', '2014-10-28 00:46:56', 'admin', 'save transformation \'录入考试人员\'');
INSERT INTO `r_repository_log` VALUES ('37', '5.0', '2014-10-28 00:47:04', 'admin', 'save transformation \'录入考试人员\'');
INSERT INTO `r_repository_log` VALUES ('38', '5.0', '2014-10-28 00:47:27', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('39', '5.0', '2014-10-28 00:47:28', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('40', '5.0', '2014-10-28 00:47:45', 'admin', 'save transformation \'录入考试人员\'');
INSERT INTO `r_repository_log` VALUES ('41', '5.0', '2014-10-28 00:48:49', 'admin', '创建数据库: myweb');
INSERT INTO `r_repository_log` VALUES ('42', '5.0', '2014-10-28 00:48:49', 'admin', 'Creation of initial version');
INSERT INTO `r_repository_log` VALUES ('43', '5.0', '2014-10-28 00:49:07', 'admin', 'Updating database connection   {0} ');
INSERT INTO `r_repository_log` VALUES ('44', '5.0', '2014-10-28 00:49:07', 'admin', 'Modification by user');
INSERT INTO `r_repository_log` VALUES ('45', '5.0', '2014-10-28 00:49:38', 'admin', 'Updating database connection   {0} ');
INSERT INTO `r_repository_log` VALUES ('46', '5.0', '2014-10-28 00:49:38', 'admin', 'Modification by user');
INSERT INTO `r_repository_log` VALUES ('47', '5.0', '2014-10-28 00:51:32', 'admin', 'Save database : Modification by user');
INSERT INTO `r_repository_log` VALUES ('48', '5.0', '2014-10-28 00:51:32', 'admin', 'Modification by user');
INSERT INTO `r_repository_log` VALUES ('49', '5.0', '2014-10-28 00:52:35', 'admin', 'save transformation \'录入考试人员\'');
INSERT INTO `r_repository_log` VALUES ('50', '5.0', '2014-10-28 00:53:04', 'admin', 'save transformation \'考试安排\'');
INSERT INTO `r_repository_log` VALUES ('51', '5.0', '2014-10-28 00:54:13', 'admin', 'save transformation \'考试安排\'');
INSERT INTO `r_repository_log` VALUES ('52', '5.0', '2014-10-28 00:54:32', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('53', '5.0', '2014-10-28 00:55:57', 'admin', 'Creation of initial version');
INSERT INTO `r_repository_log` VALUES ('54', '5.0', '2014-10-28 00:58:39', 'admin', 'save transformation \'考试安排\'');
INSERT INTO `r_repository_log` VALUES ('55', '5.0', '2014-10-28 00:59:03', 'admin', 'save transformation \'考试安排\'');
INSERT INTO `r_repository_log` VALUES ('56', '5.0', '2014-10-28 00:59:15', 'admin', 'save transformation \'考试安排\'');
INSERT INTO `r_repository_log` VALUES ('57', '5.0', '2014-10-28 01:01:24', 'admin', 'save transformation \'考试安排\'');
INSERT INTO `r_repository_log` VALUES ('58', '5.0', '2014-10-28 01:01:54', 'admin', 'save transformation \'考试安排\'');
INSERT INTO `r_repository_log` VALUES ('59', '5.0', '2014-10-28 01:02:06', 'admin', 'save transformation \'考试安排\'');
INSERT INTO `r_repository_log` VALUES ('60', '5.0', '2014-10-28 01:02:10', 'admin', 'save transformation \'考试安排\'');
INSERT INTO `r_repository_log` VALUES ('61', '5.0', '2014-10-28 01:02:20', 'admin', 'save transformation \'考试安排1\'');
INSERT INTO `r_repository_log` VALUES ('62', '5.0', '2014-10-28 01:02:41', 'admin', 'save transformation \'转换 1\'');
INSERT INTO `r_repository_log` VALUES ('63', '5.0', '2014-10-28 01:03:05', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('64', '5.0', '2014-10-28 01:03:08', 'admin', 'save transformation \'转换 1\'');
INSERT INTO `r_repository_log` VALUES ('65', '5.0', '2014-10-28 01:05:24', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('66', '5.0', '2014-10-28 01:05:43', 'admin', 'save transformation \'转换 1\'');
INSERT INTO `r_repository_log` VALUES ('67', '5.0', '2014-10-28 01:06:56', 'admin', 'save transformation \'转换 1\'');
INSERT INTO `r_repository_log` VALUES ('68', '5.0', '2014-10-28 01:07:17', 'admin', 'save transformation \'转换 1\'');
INSERT INTO `r_repository_log` VALUES ('69', '5.0', '2014-10-28 01:09:23', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('70', '5.0', '2014-10-28 01:11:35', 'admin', 'Save database : Modification by user');
INSERT INTO `r_repository_log` VALUES ('71', '5.0', '2014-10-28 01:11:35', 'admin', 'Modification by user');
INSERT INTO `r_repository_log` VALUES ('72', '5.0', '2014-10-28 01:11:46', 'admin', 'Save database : Modification by user');
INSERT INTO `r_repository_log` VALUES ('73', '5.0', '2014-10-28 01:11:46', 'admin', 'Modification by user');
INSERT INTO `r_repository_log` VALUES ('74', '5.0', '2014-10-28 01:13:17', 'admin', 'save transformation \'转换 1\'');
INSERT INTO `r_repository_log` VALUES ('75', '5.0', '2014-10-28 01:13:39', 'admin', 'save transformation \'转换 1\'');
INSERT INTO `r_repository_log` VALUES ('76', '5.0', '2014-10-28 01:14:10', 'admin', 'save transformation \'转换 2\'');
INSERT INTO `r_repository_log` VALUES ('77', '5.0', '2014-10-28 01:14:23', 'admin', 'save job \'test\'');
INSERT INTO `r_repository_log` VALUES ('78', '5.0', '2016-11-08 15:24:13', 'admin', 'save job \'作业日志记录\'');

-- ----------------------------
-- Table structure for r_slave
-- ----------------------------
DROP TABLE IF EXISTS `r_slave`;
CREATE TABLE `r_slave` (
  `ID_SLAVE` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `HOST_NAME` varchar(255) DEFAULT NULL,
  `PORT` varchar(255) DEFAULT NULL,
  `WEB_APP_NAME` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `PROXY_HOST_NAME` varchar(255) DEFAULT NULL,
  `PROXY_PORT` varchar(255) DEFAULT NULL,
  `NON_PROXY_HOSTS` varchar(255) DEFAULT NULL,
  `MASTER` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_SLAVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_slave
-- ----------------------------
INSERT INTO `r_slave` VALUES ('1', 'master1', 'localhost', '8080', null, 'cluster', 'Encrypted 2be98afc86aa7f2e4cb1aa265cd86aac8', null, null, null, '1');
INSERT INTO `r_slave` VALUES ('2', 'slave2', 'localhost', '8082', null, 'cluster', 'Encrypted 2be98afc86aa7f2e4cb1aa265cd86aac8', null, null, null, '0');

-- ----------------------------
-- Table structure for r_step
-- ----------------------------
DROP TABLE IF EXISTS `r_step`;
CREATE TABLE `r_step` (
  `ID_STEP` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` mediumtext,
  `ID_STEP_TYPE` int(11) DEFAULT NULL,
  `DISTRIBUTE` tinyint(1) DEFAULT NULL,
  `COPIES` int(11) DEFAULT NULL,
  `GUI_LOCATION_X` int(11) DEFAULT NULL,
  `GUI_LOCATION_Y` int(11) DEFAULT NULL,
  `GUI_DRAW` tinyint(1) DEFAULT NULL,
  `COPIES_STRING` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_STEP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_step
-- ----------------------------

-- ----------------------------
-- Table structure for r_step_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_step_attribute`;
CREATE TABLE `r_step_attribute` (
  `ID_STEP_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_STEP` int(11) DEFAULT NULL,
  `NR` int(11) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `VALUE_NUM` bigint(20) DEFAULT NULL,
  `VALUE_STR` mediumtext,
  PRIMARY KEY (`ID_STEP_ATTRIBUTE`),
  UNIQUE KEY `IDX_R_STEP_ATTRIBUTE_LOOKUP` (`ID_STEP`,`CODE`,`NR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_step_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for r_step_database
-- ----------------------------
DROP TABLE IF EXISTS `r_step_database`;
CREATE TABLE `r_step_database` (
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_STEP` int(11) DEFAULT NULL,
  `ID_DATABASE` int(11) DEFAULT NULL,
  KEY `IDX_R_STEP_DATABASE_LU1` (`ID_TRANSFORMATION`),
  KEY `IDX_R_STEP_DATABASE_LU2` (`ID_DATABASE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_step_database
-- ----------------------------

-- ----------------------------
-- Table structure for r_step_type
-- ----------------------------
DROP TABLE IF EXISTS `r_step_type`;
CREATE TABLE `r_step_type` (
  `ID_STEP_TYPE` bigint(20) NOT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `HELPTEXT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_STEP_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_step_type
-- ----------------------------
INSERT INTO `r_step_type` VALUES ('1', 'AccessInput', 'Access 输入', 'Read data from a Microsoft Access file');
INSERT INTO `r_step_type` VALUES ('2', 'AccessOutput', 'Access 输出', 'Stores records into an MS-Access database table.');
INSERT INTO `r_step_type` VALUES ('3', 'AvroInput', 'Avro Input', 'Reads data from an Avro file');
INSERT INTO `r_step_type` VALUES ('4', 'CassandraInput', 'Cassandra Input', 'Reads data from a Cassandra table');
INSERT INTO `r_step_type` VALUES ('5', 'CassandraOutput', 'Cassandra Output', 'Writes to a Cassandra table');
INSERT INTO `r_step_type` VALUES ('6', 'ClosureGenerator', 'Closure Generator', 'This step allows you to generates a closure table using parent-child relationships.');
INSERT INTO `r_step_type` VALUES ('7', 'ConcatFields', 'Concat Fields', 'Concat fields together into a new field (similar to the Text File Output step)');
INSERT INTO `r_step_type` VALUES ('8', 'CouchDbInput', 'CouchDb Input', 'Reads from a Couch DB view');
INSERT INTO `r_step_type` VALUES ('9', 'CsvInput', 'CSV文件输入', 'Simple CSV file input');
INSERT INTO `r_step_type` VALUES ('10', 'CubeInput', 'Cube 文件输入', '从一个cube读取记录.');
INSERT INTO `r_step_type` VALUES ('11', 'CubeOutput', 'Cube输出', '把数据写入一个cube');
INSERT INTO `r_step_type` VALUES ('12', 'TypeExitEdi2XmlStep', 'Edi to XML', 'Converts Edi text to generic XML');
INSERT INTO `r_step_type` VALUES ('13', 'ElasticSearchBulk', 'ElasticSearch 批量加载', 'Performs bulk inserts into ElasticSearch');
INSERT INTO `r_step_type` VALUES ('14', 'ShapeFileReader', 'ESRI Shapefile Reader', 'Reads shape file data from an ESRI shape file and linked DBF file');
INSERT INTO `r_step_type` VALUES ('15', 'MetaInject', 'ETL元数据注入', 'This step allows you to inject metadata into an existing transformation prior to execution.  This allows for the creation of dynamic and highly flexible data integration solutions.');
INSERT INTO `r_step_type` VALUES ('16', 'DummyPlugin', 'Example plugin', 'This is an example for a plugin test step');
INSERT INTO `r_step_type` VALUES ('17', 'ExcelInput', 'Excel输入', '从一个微软的Excel文件里读取数据. 兼容Excel 95, 97 and 2000.');
INSERT INTO `r_step_type` VALUES ('18', 'ExcelOutput', 'Excel输出', 'Stores records into an Excel (XLS) document with formatting information.');
INSERT INTO `r_step_type` VALUES ('19', 'GetSlaveSequence', 'Get ID from slave server', 'Retrieves unique IDs in blocks from a slave server.  The referenced sequence needs to be configured on the slave server in the XML configuration file.');
INSERT INTO `r_step_type` VALUES ('20', 'TypeExitGoogleAnalyticsInputStep', 'Google Analytics 输入', 'Fetches data from google analytics account');
INSERT INTO `r_step_type` VALUES ('21', 'GPLoad', 'Greenplum Load', 'Greenplum Load');
INSERT INTO `r_step_type` VALUES ('22', 'GPBulkLoader', 'Greenplum 批量加载', 'Greenplum Bulk Loader');
INSERT INTO `r_step_type` VALUES ('23', 'ParallelGzipCsvInput', 'GZIP CSV Input', 'Parallel GZIP CSV file input reader');
INSERT INTO `r_step_type` VALUES ('24', 'HadoopFileInputPlugin', 'Hadoop File Input', 'Process files from an HDFS location');
INSERT INTO `r_step_type` VALUES ('25', 'HadoopFileOutputPlugin', 'Hadoop File Output', 'Create files in an HDFS location ');
INSERT INTO `r_step_type` VALUES ('26', 'HBaseInput', 'HBase Input', 'Reads data from a HBase table according to a mapping ');
INSERT INTO `r_step_type` VALUES ('27', 'HBaseOutput', 'HBase Output', 'Writes data to an HBase table according to a mapping');
INSERT INTO `r_step_type` VALUES ('28', 'HBaseRowDecoder', 'HBase Row Decoder', 'Decodes an incoming key and HBase result object according to a mapping ');
INSERT INTO `r_step_type` VALUES ('29', 'HL7Input', 'HL7 Input', 'Reads and parses HL7 messages and outputs a series of values from the messages');
INSERT INTO `r_step_type` VALUES ('30', 'HTTP', 'HTTP client', 'Call a web service over HTTP by supplying a base URL by allowing parameters to be set dynamically');
INSERT INTO `r_step_type` VALUES ('31', 'HTTPPOST', 'HTTP Post', 'Call a web service request over HTTP by supplying a base URL by allowing parameters to be set dynamically');
INSERT INTO `r_step_type` VALUES ('32', 'InfobrightOutput', 'Infobright 批量加载', 'Load data to an Infobright database table');
INSERT INTO `r_step_type` VALUES ('33', 'VectorWiseBulkLoader', 'Ingres VectorWise 批量加载', 'This step interfaces with the Ingres VectorWise Bulk Loader \"COPY TABLE\" command.');
INSERT INTO `r_step_type` VALUES ('34', 'UserDefinedJavaClass', 'Java 代码', 'This step allows you to program a step using Java code');
INSERT INTO `r_step_type` VALUES ('35', 'ScriptValueMod', 'JavaScript代码', 'This is a modified plugin for the Scripting Values with improved interface and performance.\nWritten & donated to open source by Martin Lange, Proconis : http://www.proconis.de');
INSERT INTO `r_step_type` VALUES ('36', 'JsonInput', 'Json 输入', 'Extract relevant portions out of JSON structures (file or incoming field) and output rows');
INSERT INTO `r_step_type` VALUES ('37', 'JsonOutput', 'Json 输出', 'Create Json bloc and output it in a field ou a file.');
INSERT INTO `r_step_type` VALUES ('38', 'LDAPInput', 'LDAP 输入', 'Read data from LDAP host');
INSERT INTO `r_step_type` VALUES ('39', 'LDAPOutput', 'LDAP 输出', 'Perform Insert, upsert, update, add or delete operations on records based on their DN (Distinguished  Name).');
INSERT INTO `r_step_type` VALUES ('40', 'LDIFInput', 'LDIF 输入', 'Read data from LDIF files');
INSERT INTO `r_step_type` VALUES ('41', 'LucidDBBulkLoader', 'LucidDB 批量加载', 'Load data into LucidDB by using their bulk load command in streaming mode. (Doesnt work on Windows!)');
INSERT INTO `r_step_type` VALUES ('42', 'LucidDBStreamingLoader', 'LucidDB 流加载', 'Load data into LucidDB by using Remote Rows UDX.');
INSERT INTO `r_step_type` VALUES ('43', 'HadoopEnterPlugin', 'MapReduce Input', 'Enter a Hadoop Mapper or Reducer transformation');
INSERT INTO `r_step_type` VALUES ('44', 'HadoopExitPlugin', 'MapReduce Output', 'Exit a Hadoop Mapper or Reducer transformation ');
INSERT INTO `r_step_type` VALUES ('45', 'TypeExitExcelWriterStep', 'Microsoft Excel 输出', 'Writes or appends data to an Excel file');
INSERT INTO `r_step_type` VALUES ('46', 'MondrianInput', 'Mondrian 输入', 'Execute and retrieve data using an MDX query against a Pentaho Analyses OLAP server (Mondrian)');
INSERT INTO `r_step_type` VALUES ('47', 'MonetDBAgileMart', 'MonetDB Agile Mart', 'Load data into MonetDB for Agile BI use cases');
INSERT INTO `r_step_type` VALUES ('48', 'MonetDBBulkLoader', 'MonetDB 批量加载', 'Load data into MonetDB by using their bulk load command in streaming mode.');
INSERT INTO `r_step_type` VALUES ('49', 'MongoDbInput', 'MongoDB Input', 'Reads from a Mongo DB collection');
INSERT INTO `r_step_type` VALUES ('50', 'MongoDbOutput', 'MongoDB Output', 'Writes to a Mongo DB collection');
INSERT INTO `r_step_type` VALUES ('51', 'MultiwayMergeJoin', 'Multiway Merge Join', 'Multiway Merge Join');
INSERT INTO `r_step_type` VALUES ('52', 'MySQLBulkLoader', 'MySQL 批量加载', 'MySQL bulk loader step, loading data over a named pipe (not available on MS Windows)');
INSERT INTO `r_step_type` VALUES ('53', 'OlapInput', 'OLAP 输入', 'Execute and retrieve data using an MDX query against any XML/A OLAP datasource using olap4j');
INSERT INTO `r_step_type` VALUES ('54', 'OpenERPObjectDelete', 'OpenERP Object Delete', 'Deletes OpenERP objects');
INSERT INTO `r_step_type` VALUES ('55', 'OpenERPObjectInput', 'OpenERP Object Input', 'Reads data from OpenERP objects');
INSERT INTO `r_step_type` VALUES ('56', 'OpenERPObjectOutputImport', 'OpenERP Object Output', 'Writes data into OpenERP objects using the object import procedure');
INSERT INTO `r_step_type` VALUES ('57', 'OraBulkLoader', 'Oracle 批量加载', 'Use Oracle Bulk Loader to load data');
INSERT INTO `r_step_type` VALUES ('58', 'PaloCellInput', 'Palo Cell Input', 'Reads data from a defined Palo Cube ');
INSERT INTO `r_step_type` VALUES ('59', 'PaloCellOutput', 'Palo Cell Output', 'Writes data to a defined Palo Cube');
INSERT INTO `r_step_type` VALUES ('60', 'PaloDimInput', 'Palo Dim Input', 'Reads data from a defined Palo Dimension');
INSERT INTO `r_step_type` VALUES ('61', 'PaloDimOutput', 'Palo Dim Output', 'Writes data to defined Palo Dimension');
INSERT INTO `r_step_type` VALUES ('62', 'PentahoReportingOutput', 'Pentaho 报表输出', 'Executes an existing report (PRPT)');
INSERT INTO `r_step_type` VALUES ('63', 'PGPDecryptStream', 'PGP Decrypt stream', 'Decrypt data stream with PGP');
INSERT INTO `r_step_type` VALUES ('64', 'PGPEncryptStream', 'PGP Encrypt stream', 'Encrypt data stream with PGP');
INSERT INTO `r_step_type` VALUES ('65', 'PGBulkLoader', 'PostgreSQL 批量加载', 'PostgreSQL Bulk Loader');
INSERT INTO `r_step_type` VALUES ('66', 'Rest', 'REST Client', 'Consume RESTfull services.\nREpresentational State Transfer (REST) is a key design idiom that embraces a stateless client-server\narchitecture in which the web services are viewed as resources and can be identified by their URLs');
INSERT INTO `r_step_type` VALUES ('67', 'RssInput', 'RSS 输入', 'Read RSS feeds');
INSERT INTO `r_step_type` VALUES ('68', 'RssOutput', 'RSS 输出', 'Read RSS stream.');
INSERT INTO `r_step_type` VALUES ('69', 'RuleAccumulator', 'Rule Accumulator', 'Execute a rule against a set of all incoming rows');
INSERT INTO `r_step_type` VALUES ('70', 'RuleExecutor', 'Rule Executor', 'Execute a rule against each row or a set of rows');
INSERT INTO `r_step_type` VALUES ('71', 'S3CSVINPUT', 'S3 CSV 输入', 'S3 CSV 输入');
INSERT INTO `r_step_type` VALUES ('72', 'S3FileOutputPlugin', 'S3 File Output', 'Create files in an S3 location');
INSERT INTO `r_step_type` VALUES ('73', 'SalesforceUpsert', 'Salesforce Upsert', 'Insert or update records in Salesforce module.');
INSERT INTO `r_step_type` VALUES ('74', 'SalesforceDelete', 'Salesforce 删除', 'Delete records in Salesforce module.');
INSERT INTO `r_step_type` VALUES ('75', 'SalesforceInsert', 'Salesforce 插入', 'Insert records in Salesforce module.');
INSERT INTO `r_step_type` VALUES ('76', 'SalesforceUpdate', 'Salesforce 更新', 'Update records in Salesforce module.');
INSERT INTO `r_step_type` VALUES ('77', 'SalesforceInput', 'Salesforce 输入', '!BaseStep.TypeTooltipDesc.SalesforceInput!');
INSERT INTO `r_step_type` VALUES ('78', 'SapInput', 'SAP 输入', 'Read data from SAP ERP, optionally with parameters');
INSERT INTO `r_step_type` VALUES ('79', 'SASInput', 'SAS 输入', 'This step reads files in sas7bdat (SAS) native format');
INSERT INTO `r_step_type` VALUES ('80', 'Script', 'Script', 'Calculate values by scripting in Ruby, Python, Groovy, JavaScript, ... (JSR-223)');
INSERT INTO `r_step_type` VALUES ('81', 'SFTPPut', 'SFTP Put', 'Upload a file or a stream file to remote host via SFTP');
INSERT INTO `r_step_type` VALUES ('82', 'SimpleMapping', 'Simple Mapping (sub-transformation)', 'Run a mapping (sub-transformation), use MappingInput and MappingOutput to specify the fields interface.  This is the simplified version only allowing one input and one output data set.');
INSERT INTO `r_step_type` VALUES ('83', 'SingleThreader', 'Single Threader', 'Executes a transformation snippet in a single thread.  You need a standard mapping or a transformation with an Injector step where data from the parent transformation will arive in blocks.');
INSERT INTO `r_step_type` VALUES ('84', 'SocketWriter', 'Socket 写', 'Socket writer.  A socket server that can send rows of data to a socket reader.');
INSERT INTO `r_step_type` VALUES ('85', 'SocketReader', 'Socket 读', 'Socket reader.  A socket client that connects to a server (Socket Writer step).');
INSERT INTO `r_step_type` VALUES ('86', 'SQLFileOutput', 'SQL 文件输出', 'Output SQL INSERT statements to file');
INSERT INTO `r_step_type` VALUES ('87', 'SSTableOutput', 'SSTable Output', 'Writes to a filesystem directory as a Cassandra SSTable');
INSERT INTO `r_step_type` VALUES ('88', 'SwitchCase', 'Switch / Case', 'Switch a row to a certain target step based on the case value in a field.');
INSERT INTO `r_step_type` VALUES ('89', 'TableAgileMart', 'Table Agile Mart', 'Load data into a table for Agile BI use cases');
INSERT INTO `r_step_type` VALUES ('90', 'TeraFast', 'Teradata Fastload 批量加载', 'The Teradata Fastload Bulk loader');
INSERT INTO `r_step_type` VALUES ('91', 'TeraDataBulkLoader', 'Teradata TPT Bulk Loader', 'Teradata TPT bulkloader, using tbuild command');
INSERT INTO `r_step_type` VALUES ('92', 'TransExecutor', 'Transformation Executor', 'This step executes a Pentaho Data Integration transformation, sets parameters and passes rows.');
INSERT INTO `r_step_type` VALUES ('93', 'WebServiceLookup', 'Web 服务查询', '使用 Web 服务查询信息');
INSERT INTO `r_step_type` VALUES ('94', 'XBaseInput', 'XBase输入', '从一个XBase类型的文件(DBF)读取记录');
INSERT INTO `r_step_type` VALUES ('95', 'getXMLData', 'XML 文件输入', 'Get data from XML file by using XPath.\n This step also allows you to parse XML defined in a previous field.');
INSERT INTO `r_step_type` VALUES ('96', 'XMLInputStream', 'XML 文件输入 (StAX解析)', 'This step is capable of processing very large and complex XML files very fast.');
INSERT INTO `r_step_type` VALUES ('97', 'XMLInputSax', 'XML 流输入', 'Read data from an XML file in a streaming fashing, working faster and consuming less memory');
INSERT INTO `r_step_type` VALUES ('98', 'XMLJoin', 'XML 连接', 'Joins a stream of XML-Tags into a target XML string');
INSERT INTO `r_step_type` VALUES ('99', 'XMLInput', 'XML输入', '从一个XML读取数据');
INSERT INTO `r_step_type` VALUES ('100', 'XMLOutput', 'XML输出', '写数据到一个XML文件');
INSERT INTO `r_step_type` VALUES ('101', 'XSLT', 'XSL 转换', 'Transform XML stream using XSL (eXtensible Stylesheet Language).');
INSERT INTO `r_step_type` VALUES ('102', 'YamlInput', 'Yaml 输入', 'Read YAML source (file or stream) parse them and convert them to rows and writes these to one or more output. ');
INSERT INTO `r_step_type` VALUES ('103', 'ZipFile', 'Zip 文件', 'Zip a file.\nFilename will be extracted from incoming stream.');
INSERT INTO `r_step_type` VALUES ('104', 'Abort', '中止', 'Abort a transformation');
INSERT INTO `r_step_type` VALUES ('105', 'FilesFromResult', '从结果获取文件', 'This step allows you to read filenames used or generated in a previous entry in a job.');
INSERT INTO `r_step_type` VALUES ('106', 'RowsFromResult', '从结果获取记录', '这个允许你从同一个任务的前一个条目里读取记录.');
INSERT INTO `r_step_type` VALUES ('107', 'XSDValidator', '使用 XSD 检验 XML 文件', 'Validate XML source (files or streams) against XML Schema Definition.');
INSERT INTO `r_step_type` VALUES ('108', 'ValueMapper', '值映射', 'Maps values of a certain field from one value to another');
INSERT INTO `r_step_type` VALUES ('109', 'CloneRow', '克隆行', 'Clone a row as many times as needed');
INSERT INTO `r_step_type` VALUES ('110', 'Formula', '公式', '使用 Pentaho 的公式库来计算公式');
INSERT INTO `r_step_type` VALUES ('111', 'WriteToLog', '写日志', 'Write data to log');
INSERT INTO `r_step_type` VALUES ('112', 'AnalyticQuery', '分析查询', 'Execute analytic queries over a sorted dataset (LEAD/LAG/FIRST/LAST)');
INSERT INTO `r_step_type` VALUES ('113', 'GroupBy', '分组', '以分组的形式创建聚合.{0}这个仅仅在一个已经排好序的输入有效.{1}如果输入没有排序, 仅仅两个连续的记录行被正确处理.');
INSERT INTO `r_step_type` VALUES ('114', 'SplitFieldToRows3', '列拆分为多行', 'Splits a single string field by delimiter and creates a new row for each split term');
INSERT INTO `r_step_type` VALUES ('115', 'Denormaliser', '列转行', 'Denormalises rows by looking up key-value pairs and by assigning them to new fields in the输出 rows.{0}This method aggregates and needs the输入 rows to be sorted on the grouping fields');
INSERT INTO `r_step_type` VALUES ('116', 'Delete', '删除', '基于关键字删除记录');
INSERT INTO `r_step_type` VALUES ('117', 'Janino', '利用Janino计算Java表达式', 'Calculate the result of a Java Expression using Janino');
INSERT INTO `r_step_type` VALUES ('118', 'StringCut', '剪切字符串', 'Strings cut (substring).');
INSERT INTO `r_step_type` VALUES ('119', 'UnivariateStats', '单变量统计', 'This step computes some simple stats based on a single input field');
INSERT INTO `r_step_type` VALUES ('120', 'Unique', '去除重复记录', '去除重复的记录行，保持记录唯一{0}这个仅仅基于一个已经排好序的输入.{1}如果输入没有排序, 仅仅两个连续的记录行被正确处理.');
INSERT INTO `r_step_type` VALUES ('121', 'SyslogMessage', '发送信息至Syslog', 'Send message to Syslog server');
INSERT INTO `r_step_type` VALUES ('122', 'Mail', '发送邮件', 'Send eMail.');
INSERT INTO `r_step_type` VALUES ('123', 'MergeRows', '合并记录', '合并两个数据流, 并根据某个关键字排序.  这两个数据流被比较，以标识相等的、变更的、删除的和新建的记录.');
INSERT INTO `r_step_type` VALUES ('124', 'ExecProcess', '启动一个进程', 'Execute a process and return the result');
INSERT INTO `r_step_type` VALUES ('125', 'UniqueRowsByHashSet', '唯一行 (哈希值)', 'Remove double rows and leave only unique occurrences by using a HashSet.');
INSERT INTO `r_step_type` VALUES ('126', 'FixedInput', '固定宽度文件输入', 'Fixed file input');
INSERT INTO `r_step_type` VALUES ('127', 'MemoryGroupBy', '在内存中分组', 'Builds aggregates in a group by fashion.\nThis step doesn\'t require sorted input.');
INSERT INTO `r_step_type` VALUES ('128', 'AddXML', '增加XML列', 'Encode several fields into an XML fragment');
INSERT INTO `r_step_type` VALUES ('129', 'Constant', '增加常量', '给记录增加一到多个常量');
INSERT INTO `r_step_type` VALUES ('130', 'Sequence', '增加序列', '从序列获取下一个值');
INSERT INTO `r_step_type` VALUES ('131', 'CheckSum', '增加校验列', 'Add a checksum column for each input row');
INSERT INTO `r_step_type` VALUES ('132', 'ProcessFiles', '处理文件', 'Process one file per row (copy or move or delete).\nThis step only accept filename in input.');
INSERT INTO `r_step_type` VALUES ('133', 'FilesToResult', '复制文件到结果', 'This step allows you to set filenames in the result of this transformation.\nSubsequent job entries can then use this information.');
INSERT INTO `r_step_type` VALUES ('134', 'RowsToResult', '复制记录到结果', '使用这个步骤把记录写到正在执行的任务.{0}信息将会被传递给同一个任务里的下一个条目.');
INSERT INTO `r_step_type` VALUES ('135', 'SelectValues', '字段选择', '选择或移除记录里的字。{0}此外，可以设置字段的元数据: 类型, 长度和精度.');
INSERT INTO `r_step_type` VALUES ('136', 'StringOperations', '字符串操作', 'Apply certain operations like trimming, padding and others to string value.');
INSERT INTO `r_step_type` VALUES ('137', 'ReplaceString', '字符串替换', 'Replace all occurences a word in a string with another word.');
INSERT INTO `r_step_type` VALUES ('138', 'SymmetricCryptoTrans', '对称加密', 'Encrypt or decrypt a string using symmetric encryption.\nAvailable algorithms are DES, AES, TripleDES.');
INSERT INTO `r_step_type` VALUES ('139', 'SetValueConstant', '将字段值设置为常量', 'Set value of a field to a constant');
INSERT INTO `r_step_type` VALUES ('140', 'Delay', '延迟行', 'Output each input row after a delay');
INSERT INTO `r_step_type` VALUES ('141', 'DynamicSQLRow', '执行Dynamic SQL', 'Execute dynamic SQL statement build in a previous field');
INSERT INTO `r_step_type` VALUES ('142', 'ExecSQL', '执行SQL脚本', '执行一个SQL脚本, 另外，可以使用输入的记录作为参数');
INSERT INTO `r_step_type` VALUES ('143', 'ExecSQLRow', '执行SQL脚本(字段流替换)', 'Execute SQL script extracted from a field\ncreated in a previous step.');
INSERT INTO `r_step_type` VALUES ('144', 'JobExecutor', '执行作业', 'This step executes a Pentaho Data Integration job, sets parameters and passes rows.');
INSERT INTO `r_step_type` VALUES ('145', 'FieldSplitter', '拆分字段', '当你想把一个字段拆分成多个时，使用这个类型.');
INSERT INTO `r_step_type` VALUES ('146', 'SortedMerge', '排序合并', 'Sorted Merge');
INSERT INTO `r_step_type` VALUES ('147', 'SortRows', '排序记录', '基于字段值把记录排序(升序或降序)');
INSERT INTO `r_step_type` VALUES ('148', 'InsertUpdate', '插入 / 更新', '基于关键字更新或插入记录到数据库.');
INSERT INTO `r_step_type` VALUES ('149', 'ChangeFileEncoding', '改变文件编码', 'Change file encoding and create a new file');
INSERT INTO `r_step_type` VALUES ('150', 'NumberRange', '数值范围', 'Create ranges based on numeric field');
INSERT INTO `r_step_type` VALUES ('151', 'SynchronizeAfterMerge', '数据同步', 'This step perform insert/update/delete in one go based on the value of a field. ');
INSERT INTO `r_step_type` VALUES ('152', 'DBLookup', '数据库查询', '使用字段值在数据库里查询值');
INSERT INTO `r_step_type` VALUES ('153', 'DBJoin', '数据库连接', '使用数据流里的值作为参数执行一个数据库查询');
INSERT INTO `r_step_type` VALUES ('154', 'Validator', '数据检验', 'Validates passing data based on a set of rules');
INSERT INTO `r_step_type` VALUES ('155', 'PrioritizeStreams', '数据流优先级排序', 'Prioritize streams in an order way.');
INSERT INTO `r_step_type` VALUES ('156', 'ReservoirSampling', '数据采样', '[Transform] Samples a fixed number of rows from the incoming stream');
INSERT INTO `r_step_type` VALUES ('157', 'LoadFileInput', '文件内容加载至内存', 'Load file content in memory');
INSERT INTO `r_step_type` VALUES ('158', 'TextFileInput', '文本文件输入', '从一个文本文件（几种格式）里读取数据{0}这些数据可以被传递到下一个步骤里...');
INSERT INTO `r_step_type` VALUES ('159', 'TextFileOutput', '文本文件输出', '写记录到一个文本文件.');
INSERT INTO `r_step_type` VALUES ('160', 'Mapping', '映射 (子转换)', '运行一个映射 (子转换), 使用MappingInput和MappingOutput来指定接口的字段');
INSERT INTO `r_step_type` VALUES ('161', 'MappingInput', '映射输入规范', '指定一个映射的字段输入');
INSERT INTO `r_step_type` VALUES ('162', 'MappingOutput', '映射输出规范', '指定一个映射的字段输出');
INSERT INTO `r_step_type` VALUES ('163', 'Update', '更新', '基于关键字更新记录到数据库');
INSERT INTO `r_step_type` VALUES ('164', 'IfNull', '替换NULL值', 'Sets a field value to a constant if it is null.');
INSERT INTO `r_step_type` VALUES ('165', 'SampleRows', '样本行', 'Filter rows based on the line number.');
INSERT INTO `r_step_type` VALUES ('166', 'JavaFilter', '根据Java代码过滤记录', 'Filter rows using java code');
INSERT INTO `r_step_type` VALUES ('167', 'FieldsChangeSequence', '根据字段值来改变序列', 'Add sequence depending of fields value change.\nEach time value of at least one field change, PDI will reset sequence. ');
INSERT INTO `r_step_type` VALUES ('168', 'WebServiceAvailable', '检查web服务是否可用', 'Check if a webservice is available');
INSERT INTO `r_step_type` VALUES ('169', 'FileExists', '检查文件是否存在', 'Check if a file exists');
INSERT INTO `r_step_type` VALUES ('170', 'FileLocked', '检查文件是否已被锁定', 'Check if a file is locked by another process');
INSERT INTO `r_step_type` VALUES ('171', 'TableExists', '检查表是否存在', 'Check if a table exists on a specified connection');
INSERT INTO `r_step_type` VALUES ('172', 'ColumnExists', '检查表里的列是否存在', 'Check if a column exists in a table on a specified connection.');
INSERT INTO `r_step_type` VALUES ('173', 'DetectEmptyStream', '检测空流', 'This step will output one empty row if input stream is empty\n(ie when input stream does not contain any row)');
INSERT INTO `r_step_type` VALUES ('174', 'CreditCardValidator', '检验信用卡号码是否有效', 'The Credit card validator step will help you tell:\n(1) if a credit card number is valid (uses LUHN10 (MOD-10) algorithm)\n(2) which credit card vendor handles that number\n(VISA, MasterCard, Diners Club, EnRoute, American Express (AMEX),...)');
INSERT INTO `r_step_type` VALUES ('175', 'MailValidator', '检验邮件地址', 'Check if an email address is valid.');
INSERT INTO `r_step_type` VALUES ('176', 'FuzzyMatch', '模糊匹配', 'Finding approximate matches to a string using matching algorithms.\nRead a field from a main stream and output approximative value from lookup stream.');
INSERT INTO `r_step_type` VALUES ('177', 'RegexEval', '正则表达式', 'Regular expression Evaluation\nThis step uses a regular expression to evaluate a field. It can also extract new fields out of an existing field with capturing groups.');
INSERT INTO `r_step_type` VALUES ('178', 'TableCompare', '比较表', 'Compares 2 tables and gives back a list of differences');
INSERT INTO `r_step_type` VALUES ('179', 'StreamLookup', '流查询', '从转换中的其它流里查询值.');
INSERT INTO `r_step_type` VALUES ('180', 'StepMetastructure', '流的元数据', 'This is a step to read the metadata of the incoming stream.');
INSERT INTO `r_step_type` VALUES ('181', 'SecretKeyGenerator', '生成密钥', 'Generate secret key for algorithms such as DES, AES, TripleDES.');
INSERT INTO `r_step_type` VALUES ('182', 'RowGenerator', '生成记录', '产生一些空记录或相等的行.');
INSERT INTO `r_step_type` VALUES ('183', 'RandomValue', '生成随机数', 'Generate random value');
INSERT INTO `r_step_type` VALUES ('184', 'RandomCCNumberGenerator', '生成随机的信用卡号', 'Generate random valide (luhn check) credit card numbers');
INSERT INTO `r_step_type` VALUES ('185', 'Dummy', '空操作 (什么也不做)', '这个步骤类型什么都不作.{0} 当你想测试或拆分数据流的时候有用.');
INSERT INTO `r_step_type` VALUES ('186', 'DimensionLookup', '维度查询/更新', '在一个数据仓库里更新一个渐变维 {0} 或者在这个维里查询信息.');
INSERT INTO `r_step_type` VALUES ('187', 'CombinationLookup', '联合查询/更新', '更新数据仓库里的一个junk维 {0} 可选的, 科研查询维里的信息.{1}junk维的主键是所有的字段.');
INSERT INTO `r_step_type` VALUES ('188', 'AggregateRows', '聚合记录', '这个步骤类型允许你聚合记录.{0}它不能使用在分组的情况.');
INSERT INTO `r_step_type` VALUES ('189', 'AutoDoc', '自动文档输出', 'This step automatically generates documentation based on input in the form of a list of transformations and jobs');
INSERT INTO `r_step_type` VALUES ('190', 'DataGrid', '自定义常量数据', 'Enter rows of static data in a grid, usually for testing, reference or demo purpose');
INSERT INTO `r_step_type` VALUES ('191', 'GetPreviousRowField', '获取上一次的记录', 'Get fields value of previous row.');
INSERT INTO `r_step_type` VALUES ('192', 'GetVariable', '获取变量', 'Determine the values of certain (environment or Kettle) variables and put them in field values.');
INSERT INTO `r_step_type` VALUES ('193', 'GetSubFolders', '获取子目录名', 'Read a parent folder and return all subfolders');
INSERT INTO `r_step_type` VALUES ('194', 'GetFileNames', '获取文件名', 'Get file names from the operating system and send them to the next step.');
INSERT INTO `r_step_type` VALUES ('195', 'GetFilesRowsCount', '获取文件行数', 'Returns rows count for text files.');
INSERT INTO `r_step_type` VALUES ('196', 'SystemInfo', '获取系统信息', '获取系统信息，例如时间、日期.');
INSERT INTO `r_step_type` VALUES ('197', 'GetTableNames', '获取表名', 'Get table names from database connection and send them to the next step');
INSERT INTO `r_step_type` VALUES ('198', 'GetRepositoryNames', '获取资源库配置', 'Lists detailed information about transformations and/or jobs in a repository');
INSERT INTO `r_step_type` VALUES ('199', 'Flattener', '行扁平化', 'Flattens consequetive rows based on the order in which they appear in the输入 stream');
INSERT INTO `r_step_type` VALUES ('200', 'Normaliser', '行转列', 'De-normalised information can be normalised using this step type.');
INSERT INTO `r_step_type` VALUES ('201', 'TableInput', '表输入', '从数据库表里读取信息.');
INSERT INTO `r_step_type` VALUES ('202', 'TableOutput', '表输出', '写信息到一个数据库表');
INSERT INTO `r_step_type` VALUES ('203', 'Calculator', '计算器', '通过执行简单的计算创建一个新字段');
INSERT INTO `r_step_type` VALUES ('204', 'JoinRows', '记录关联 (笛卡尔输出)', '这个步骤的输出是输入流的笛卡尔的结果.{0} 输出结果的记录数是输入流记录之间的乘积.');
INSERT INTO `r_step_type` VALUES ('205', 'Injector', '记录注射', 'Injector step to allow to inject rows into the transformation through the java API');
INSERT INTO `r_step_type` VALUES ('206', 'MergeJoin', '记录集连接', 'Joins two streams on a given key and outputs a joined set. The input streams must be sorted on the join key');
INSERT INTO `r_step_type` VALUES ('207', 'NullIf', '设置值为NULL', '如果一个字段值等于某个固定值，那么把这个字段值设置成null');
INSERT INTO `r_step_type` VALUES ('208', 'SetVariable', '设置变量', 'Set environment variables based on a single input row.');
INSERT INTO `r_step_type` VALUES ('209', 'SetValueField', '设置字段值', 'Set value of a field with another value field');
INSERT INTO `r_step_type` VALUES ('210', 'DetectLastRow', '识别流的最后一行', 'Last row will be marked');
INSERT INTO `r_step_type` VALUES ('211', 'DBProc', '调用DB存储过程', '通过调用数据库存储过程获得返回值.');
INSERT INTO `r_step_type` VALUES ('212', 'StepsMetrics', '转换步骤信息统计', 'Return metrics for one or several steps');
INSERT INTO `r_step_type` VALUES ('213', 'FilterRows', '过滤记录', '使用简单的相等来过滤记录');
INSERT INTO `r_step_type` VALUES ('214', 'SSH', '运行SSH命令', 'Run SSH commands and returns result.');
INSERT INTO `r_step_type` VALUES ('215', 'Append', '追加流', 'Append 2 streams in an ordered way');
INSERT INTO `r_step_type` VALUES ('216', 'MailInput', '邮件信息输入', 'Read POP3/IMAP server and retrieve messages');
INSERT INTO `r_step_type` VALUES ('217', 'PropertyInput', '配置文件输入', 'Read data (key, value) from properties files.');
INSERT INTO `r_step_type` VALUES ('218', 'PropertyOutput', '配置文件输出', 'Write data to properties file');
INSERT INTO `r_step_type` VALUES ('219', 'BlockingStep', '阻塞数据', 'This step blocks until all incoming rows have been processed.  Subsequent steps only recieve the last input row to this step.');
INSERT INTO `r_step_type` VALUES ('220', 'BlockUntilStepsFinish', '阻塞数据直到步骤都完成', 'Block this step until selected steps finish.');

-- ----------------------------
-- Table structure for r_transformation
-- ----------------------------
DROP TABLE IF EXISTS `r_transformation`;
CREATE TABLE `r_transformation` (
  `ID_TRANSFORMATION` bigint(20) NOT NULL,
  `ID_DIRECTORY` int(11) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` mediumtext,
  `EXTENDED_DESCRIPTION` mediumtext,
  `TRANS_VERSION` varchar(255) DEFAULT NULL,
  `TRANS_STATUS` int(11) DEFAULT NULL,
  `ID_STEP_READ` int(11) DEFAULT NULL,
  `ID_STEP_WRITE` int(11) DEFAULT NULL,
  `ID_STEP_INPUT` int(11) DEFAULT NULL,
  `ID_STEP_OUTPUT` int(11) DEFAULT NULL,
  `ID_STEP_UPDATE` int(11) DEFAULT NULL,
  `ID_DATABASE_LOG` int(11) DEFAULT NULL,
  `TABLE_NAME_LOG` varchar(255) DEFAULT NULL,
  `USE_BATCHID` tinyint(1) DEFAULT NULL,
  `USE_LOGFIELD` tinyint(1) DEFAULT NULL,
  `ID_DATABASE_MAXDATE` int(11) DEFAULT NULL,
  `TABLE_NAME_MAXDATE` varchar(255) DEFAULT NULL,
  `FIELD_NAME_MAXDATE` varchar(255) DEFAULT NULL,
  `OFFSET_MAXDATE` double DEFAULT NULL,
  `DIFF_MAXDATE` double DEFAULT NULL,
  `CREATED_USER` varchar(255) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `MODIFIED_USER` varchar(255) DEFAULT NULL,
  `MODIFIED_DATE` datetime DEFAULT NULL,
  `SIZE_ROWSET` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TRANSFORMATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_transformation
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_attribute`;
CREATE TABLE `r_trans_attribute` (
  `ID_TRANS_ATTRIBUTE` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `NR` int(11) DEFAULT NULL,
  `CODE` varchar(255) DEFAULT NULL,
  `VALUE_NUM` bigint(20) DEFAULT NULL,
  `VALUE_STR` mediumtext,
  PRIMARY KEY (`ID_TRANS_ATTRIBUTE`),
  UNIQUE KEY `IDX_TRANS_ATTRIBUTE_LOOKUP` (`ID_TRANSFORMATION`,`CODE`,`NR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_trans_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_cluster
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_cluster`;
CREATE TABLE `r_trans_cluster` (
  `ID_TRANS_CLUSTER` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_CLUSTER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_CLUSTER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_trans_cluster
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_hop
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_hop`;
CREATE TABLE `r_trans_hop` (
  `ID_TRANS_HOP` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_STEP_FROM` int(11) DEFAULT NULL,
  `ID_STEP_TO` int(11) DEFAULT NULL,
  `ENABLED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_HOP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_trans_hop
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_lock
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_lock`;
CREATE TABLE `r_trans_lock` (
  `ID_TRANS_LOCK` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_USER` int(11) DEFAULT NULL,
  `LOCK_MESSAGE` mediumtext,
  `LOCK_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_LOCK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_trans_lock
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_note
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_note`;
CREATE TABLE `r_trans_note` (
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_NOTE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_trans_note
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_partition_schema
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_partition_schema`;
CREATE TABLE `r_trans_partition_schema` (
  `ID_TRANS_PARTITION_SCHEMA` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_PARTITION_SCHEMA` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_PARTITION_SCHEMA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_trans_partition_schema
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_slave
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_slave`;
CREATE TABLE `r_trans_slave` (
  `ID_TRANS_SLAVE` bigint(20) NOT NULL,
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_SLAVE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_SLAVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_trans_slave
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_step_condition
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_step_condition`;
CREATE TABLE `r_trans_step_condition` (
  `ID_TRANSFORMATION` int(11) DEFAULT NULL,
  `ID_STEP` int(11) DEFAULT NULL,
  `ID_CONDITION` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_trans_step_condition
-- ----------------------------

-- ----------------------------
-- Table structure for r_user
-- ----------------------------
DROP TABLE IF EXISTS `r_user`;
CREATE TABLE `r_user` (
  `ID_USER` bigint(20) NOT NULL,
  `LOGIN` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `ENABLED` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_USER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_user
-- ----------------------------
INSERT INTO `r_user` VALUES ('1', 'admin', '2be98afc86aa7f2e4cb79ce71da9fa6d4', 'Administrator', 'User manager', '0');
INSERT INTO `r_user` VALUES ('2', 'guest', '2be98afc86aa7f2e4cb79ce77cb97bcce', 'Guest account', 'Read-only guest account', '0');
INSERT INTO `r_user` VALUES ('3', 'jingma', '2be98afc86aa7f2e4cb79a3718fcbf68a', 'jingma', '???', '1');

-- ----------------------------
-- Table structure for r_value
-- ----------------------------
DROP TABLE IF EXISTS `r_value`;
CREATE TABLE `r_value` (
  `ID_VALUE` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `VALUE_TYPE` varchar(255) DEFAULT NULL,
  `VALUE_STR` varchar(255) DEFAULT NULL,
  `IS_NULL` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_value
-- ----------------------------

-- ----------------------------
-- Table structure for r_version
-- ----------------------------
DROP TABLE IF EXISTS `r_version`;
CREATE TABLE `r_version` (
  `ID_VERSION` bigint(20) NOT NULL,
  `MAJOR_VERSION` int(11) DEFAULT NULL,
  `MINOR_VERSION` int(11) DEFAULT NULL,
  `UPGRADE_DATE` datetime DEFAULT NULL,
  `IS_UPGRADE` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID_VERSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_version
-- ----------------------------
INSERT INTO `r_version` VALUES ('1', '5', '0', '2014-10-23 15:06:17', '0');

-- ----------------------------
-- View structure for v_job
-- ----------------------------
DROP VIEW IF EXISTS `v_job`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `v_job` AS select id_job,
       id_directory,
       id_job as timing,
       name,
       description,
       extended_description,
       job_version,
       job_status,
       id_database_log,
       table_name_log,
       created_user,
       created_date,
       modified_user,
       modified_date,
       use_batch_id,
       pass_batch_id,
       use_logfield,
       shared_file,
       run_status,
       last_update
  from r_job j
  where j.job_status=2
  /*
  作业视图，默认只显示处于发布状态的作业，可以根据需要自行修改
  */ ;

-- ----------------------------
-- View structure for v_job_params
-- ----------------------------
DROP VIEW IF EXISTS `v_job_params`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `v_job_params` AS select ja.id_job,
ja.value_str as ocode,
ja1.value_str as oname,
ja2.value_str as PARAM_DEFAULT,
p.value,p.simple_spell,p.full_spell
from r_job_attribute ja
inner join r_job_attribute ja1 on ja1.id_job=ja.id_job and ja1.nr=ja.nr and ja1.code='PARAM_DESC'
inner join r_job_attribute ja2 on ja2.id_job=ja.id_job and ja2.nr=ja.nr and ja2.code='PARAM_DEFAULT'
inner join r_job j on j.job_status=2 and j.id_job=ja.id_job
left join job_params p on p.id_job=ja.id_job and ja.value_str=p.ocode
where ja.code = 'PARAM_KEY'
order by ja.nr asc
/*
参数设置
*/ ;
