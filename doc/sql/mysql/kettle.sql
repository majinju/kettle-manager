/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50613
Source Host           : localhost:3306
Source Database       : kettle1

Target Server Type    : MYSQL
Target Server Version : 50613
File Encoding         : 65001

Date: 2017-06-15 14:49:47
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
INSERT INTO `job_log` VALUES ('70B31953C21A4E6DB7E62CCC1EAA468C', null, null, null, null, null, null, null, '20170615144510', null, null, null, null, null, null, '1.000000000000000000000000000000', 'xxx', '20170615144435', '20170615144510', 'Finished', 'D:\\tmp\\kettle-manager\\logs\\kettle\\20170615\\xxx_144440.txt');

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

-- ----------------------------
-- Table structure for r_cluster
-- ----------------------------
DROP TABLE IF EXISTS `r_cluster`;
CREATE TABLE `r_cluster` (
  `id_cluster` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `base_port` varchar(255) DEFAULT NULL,
  `sockets_buffer_size` varchar(255) DEFAULT NULL,
  `sockets_flush_interval` varchar(255) DEFAULT NULL,
  `sockets_compressed` char(1) DEFAULT NULL,
  `dynamic_cluster` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_cluster`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_cluster
-- ----------------------------

-- ----------------------------
-- Table structure for r_cluster_slave
-- ----------------------------
DROP TABLE IF EXISTS `r_cluster_slave`;
CREATE TABLE `r_cluster_slave` (
  `id_cluster_slave` bigint(20) NOT NULL,
  `id_cluster` int(11) DEFAULT NULL,
  `id_slave` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cluster_slave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_cluster_slave
-- ----------------------------

-- ----------------------------
-- Table structure for r_condition
-- ----------------------------
DROP TABLE IF EXISTS `r_condition`;
CREATE TABLE `r_condition` (
  `id_condition` bigint(20) NOT NULL,
  `id_condition_parent` int(11) DEFAULT NULL,
  `negated` char(1) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `left_name` varchar(255) DEFAULT NULL,
  `condition_function` varchar(255) DEFAULT NULL,
  `right_name` varchar(255) DEFAULT NULL,
  `id_value_right` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_condition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_condition
-- ----------------------------

-- ----------------------------
-- Table structure for r_database
-- ----------------------------
DROP TABLE IF EXISTS `r_database`;
CREATE TABLE `r_database` (
  `id_database` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_database_type` int(11) DEFAULT NULL,
  `id_database_contype` int(11) DEFAULT NULL,
  `host_name` varchar(255) DEFAULT NULL,
  `database_name` mediumtext,
  `port` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `servername` varchar(255) DEFAULT NULL,
  `data_tbs` varchar(255) DEFAULT NULL,
  `index_tbs` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_database`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_database
-- ----------------------------
INSERT INTO `r_database` VALUES ('1', 'AgileBI', '27', '1', 'localhost', 'pentaho-instaview', '50000', 'monetdb', 'Encrypted 2be98afc86aa7f2e4cb14a17edb86abd8', null, null, null);

-- ----------------------------
-- Table structure for r_database_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_database_attribute`;
CREATE TABLE `r_database_attribute` (
  `id_database_attribute` bigint(20) NOT NULL,
  `id_database` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `value_str` mediumtext,
  PRIMARY KEY (`id_database_attribute`),
  UNIQUE KEY `idx_rdat` (`id_database`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_database_attribute
-- ----------------------------
INSERT INTO `r_database_attribute` VALUES ('1', '1', 'EXTRA_OPTION_MYSQL.defaultFetchSize', '500');
INSERT INTO `r_database_attribute` VALUES ('2', '1', 'EXTRA_OPTION_MYSQL.useCursorFetch', 'true');
INSERT INTO `r_database_attribute` VALUES ('3', '1', 'EXTRA_OPTION_INFOBRIGHT.characterEncoding', 'UTF-8');
INSERT INTO `r_database_attribute` VALUES ('4', '1', 'PORT_NUMBER', '50000');

-- ----------------------------
-- Table structure for r_database_contype
-- ----------------------------
DROP TABLE IF EXISTS `r_database_contype`;
CREATE TABLE `r_database_contype` (
  `id_database_contype` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_database_contype`)
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
  `id_database_type` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_database_type`)
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
INSERT INTO `r_database_type` VALUES ('40', 'REDSHIFT', 'Redshift');
INSERT INTO `r_database_type` VALUES ('41', 'REMEDY-AR-SYSTEM', 'Remedy Action Request System');
INSERT INTO `r_database_type` VALUES ('42', 'SAPR3', 'SAP ERP System');
INSERT INTO `r_database_type` VALUES ('43', 'SQLITE', 'SQLite');
INSERT INTO `r_database_type` VALUES ('44', 'SYBASE', 'Sybase');
INSERT INTO `r_database_type` VALUES ('45', 'SYBASEIQ', 'SybaseIQ');
INSERT INTO `r_database_type` VALUES ('46', 'TERADATA', 'Teradata');
INSERT INTO `r_database_type` VALUES ('47', 'UNIVERSE', 'UniVerse database');
INSERT INTO `r_database_type` VALUES ('48', 'VERTICA', 'Vertica');
INSERT INTO `r_database_type` VALUES ('49', 'VERTICA5', 'Vertica 5+');

-- ----------------------------
-- Table structure for r_dependency
-- ----------------------------
DROP TABLE IF EXISTS `r_dependency`;
CREATE TABLE `r_dependency` (
  `id_dependency` bigint(20) NOT NULL,
  `id_transformation` int(11) DEFAULT NULL,
  `id_database` int(11) DEFAULT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_dependency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_dependency
-- ----------------------------

-- ----------------------------
-- Table structure for r_directory
-- ----------------------------
DROP TABLE IF EXISTS `r_directory`;
CREATE TABLE `r_directory` (
  `id_directory` bigint(20) NOT NULL,
  `id_directory_parent` int(11) DEFAULT NULL,
  `directory_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_directory`),
  UNIQUE KEY `idx_rdir` (`id_directory_parent`,`directory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_directory
-- ----------------------------
INSERT INTO `r_directory` VALUES ('1', '0', 'km_auto_gen');

-- ----------------------------
-- Table structure for r_element
-- ----------------------------
DROP TABLE IF EXISTS `r_element`;
CREATE TABLE `r_element` (
  `id_element` bigint(20) NOT NULL,
  `id_element_type` int(11) DEFAULT NULL,
  `name` mediumtext,
  PRIMARY KEY (`id_element`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_element
-- ----------------------------

-- ----------------------------
-- Table structure for r_element_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_element_attribute`;
CREATE TABLE `r_element_attribute` (
  `id_element_attribute` bigint(20) NOT NULL,
  `id_element` int(11) DEFAULT NULL,
  `id_element_attribute_parent` int(11) DEFAULT NULL,
  `attr_key` varchar(255) DEFAULT NULL,
  `attr_value` mediumtext,
  PRIMARY KEY (`id_element_attribute`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_element_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for r_element_type
-- ----------------------------
DROP TABLE IF EXISTS `r_element_type`;
CREATE TABLE `r_element_type` (
  `id_element_type` bigint(20) NOT NULL,
  `id_namespace` int(11) DEFAULT NULL,
  `name` mediumtext,
  `description` mediumtext,
  PRIMARY KEY (`id_element_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_element_type
-- ----------------------------

-- ----------------------------
-- Table structure for r_job
-- ----------------------------
DROP TABLE IF EXISTS `r_job`;
CREATE TABLE `r_job` (
  `id_job` bigint(20) NOT NULL,
  `id_directory` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `extended_description` mediumtext,
  `job_version` varchar(255) DEFAULT NULL,
  `job_status` int(11) DEFAULT NULL,
  `id_database_log` int(11) DEFAULT NULL,
  `table_name_log` varchar(255) DEFAULT NULL,
  `created_user` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_user` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `use_batch_id` char(1) DEFAULT NULL,
  `pass_batch_id` char(1) DEFAULT NULL,
  `use_logfield` char(1) DEFAULT NULL,
  `shared_file` varchar(255) DEFAULT NULL,
  `RUN_STATUS` varchar(100) DEFAULT 'Stopped' COMMENT '运行状态',
  `LAST_UPDATE` varchar(14) DEFAULT NULL COMMENT '最后更新时间',
  `AUTO_RESTART_NUM` varchar(10) DEFAULT '0' COMMENT '自动重启次数',
  `REPOSITORY_CODE` varchar(200) DEFAULT 'KETTLE_DEFAULT' COMMENT '资源库代码',
  `PROJECT_CODE` varchar(200) DEFAULT 'KM_LOCALHOST_82' COMMENT '运行在',
  PRIMARY KEY (`id_job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_job
-- ----------------------------
INSERT INTO `r_job` VALUES ('1', '1', 'xxx', null, null, 'shell', '2', '-1', null, '-', '2017-06-13 21:55:57', '-', '2017-06-13 21:55:57', '1', '0', '1', null, 'Finished', '20170615144510', '0', 'KETTLE_DEFAULT', 'KM_LOCALHOST_82');

-- ----------------------------
-- Table structure for r_jobentry
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry`;
CREATE TABLE `r_jobentry` (
  `id_jobentry` bigint(20) NOT NULL,
  `id_job` int(11) DEFAULT NULL,
  `id_jobentry_type` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  PRIMARY KEY (`id_jobentry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_jobentry
-- ----------------------------
INSERT INTO `r_jobentry` VALUES ('1', '1', '75', 'START', null);
INSERT INTO `r_jobentry` VALUES ('2', '1', '28', 'shell', null);
INSERT INTO `r_jobentry` VALUES ('3', '1', '58', '??', null);

-- ----------------------------
-- Table structure for r_jobentry_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry_attribute`;
CREATE TABLE `r_jobentry_attribute` (
  `id_jobentry_attribute` bigint(20) NOT NULL,
  `id_job` int(11) DEFAULT NULL,
  `id_jobentry` int(11) DEFAULT NULL,
  `nr` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `value_num` double DEFAULT NULL,
  `value_str` mediumtext,
  PRIMARY KEY (`id_jobentry_attribute`),
  UNIQUE KEY `idx_rjea` (`id_jobentry_attribute`,`code`,`nr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_jobentry_attribute
-- ----------------------------
INSERT INTO `r_jobentry_attribute` VALUES ('1', '1', '1', '0', 'start', '0', 'Y');
INSERT INTO `r_jobentry_attribute` VALUES ('2', '1', '1', '0', 'dummy', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('3', '1', '1', '0', 'repeat', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('4', '1', '1', '0', 'schedulerType', '0', null);
INSERT INTO `r_jobentry_attribute` VALUES ('5', '1', '1', '0', 'intervalSeconds', '0', null);
INSERT INTO `r_jobentry_attribute` VALUES ('6', '1', '1', '0', 'intervalMinutes', '60', null);
INSERT INTO `r_jobentry_attribute` VALUES ('7', '1', '1', '0', 'hour', '12', null);
INSERT INTO `r_jobentry_attribute` VALUES ('8', '1', '1', '0', 'minutes', '0', null);
INSERT INTO `r_jobentry_attribute` VALUES ('9', '1', '1', '0', 'weekDay', '1', null);
INSERT INTO `r_jobentry_attribute` VALUES ('10', '1', '1', '0', 'dayOfMonth', '1', null);
INSERT INTO `r_jobentry_attribute` VALUES ('11', '1', '2', '0', 'file_name', '0', null);
INSERT INTO `r_jobentry_attribute` VALUES ('12', '1', '2', '0', 'work_directory', '0', '/tmp');
INSERT INTO `r_jobentry_attribute` VALUES ('13', '1', '2', '0', 'arg_from_previous', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('14', '1', '2', '0', 'exec_per_row', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('15', '1', '2', '0', 'set_logfile', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('16', '1', '2', '0', 'set_append_logfile', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('17', '1', '2', '0', 'add_date', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('18', '1', '2', '0', 'add_time', '0', 'N');
INSERT INTO `r_jobentry_attribute` VALUES ('19', '1', '2', '0', 'logfile', '0', null);
INSERT INTO `r_jobentry_attribute` VALUES ('20', '1', '2', '0', 'logext', '0', null);
INSERT INTO `r_jobentry_attribute` VALUES ('21', '1', '2', '0', 'loglevel', '0', 'Basic');
INSERT INTO `r_jobentry_attribute` VALUES ('22', '1', '2', '0', 'insertScript', '0', 'Y');
INSERT INTO `r_jobentry_attribute` VALUES ('23', '1', '2', '0', 'script', '0', 'dir');

-- ----------------------------
-- Table structure for r_jobentry_copy
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry_copy`;
CREATE TABLE `r_jobentry_copy` (
  `id_jobentry_copy` bigint(20) NOT NULL,
  `id_jobentry` int(11) DEFAULT NULL,
  `id_job` int(11) DEFAULT NULL,
  `id_jobentry_type` int(11) DEFAULT NULL,
  `nr` int(11) DEFAULT NULL,
  `gui_location_x` int(11) DEFAULT NULL,
  `gui_location_y` int(11) DEFAULT NULL,
  `gui_draw` char(1) DEFAULT NULL,
  `parallel` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_jobentry_copy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_jobentry_copy
-- ----------------------------
INSERT INTO `r_jobentry_copy` VALUES ('1', '1', '1', '75', '0', '121', '183', '1', '0');
INSERT INTO `r_jobentry_copy` VALUES ('2', '2', '1', '28', '0', '265', '183', '1', '0');
INSERT INTO `r_jobentry_copy` VALUES ('3', '3', '1', '58', '0', '409', '183', '1', '0');

-- ----------------------------
-- Table structure for r_jobentry_database
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry_database`;
CREATE TABLE `r_jobentry_database` (
  `id_job` int(11) DEFAULT NULL,
  `id_jobentry` int(11) DEFAULT NULL,
  `id_database` int(11) DEFAULT NULL,
  KEY `idx_rjd1` (`id_job`),
  KEY `idx_rjd2` (`id_database`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_jobentry_database
-- ----------------------------

-- ----------------------------
-- Table structure for r_jobentry_type
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry_type`;
CREATE TABLE `r_jobentry_type` (
  `id_jobentry_type` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_jobentry_type`)
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
INSERT INTO `r_jobentry_type` VALUES ('16', 'JobEntryKettleUtil', 'kettle工具');
INSERT INTO `r_jobentry_type` VALUES ('17', 'MS_ACCESS_BULK_LOAD', 'MS Access 批量加载');
INSERT INTO `r_jobentry_type` VALUES ('18', 'MYSQL_BULK_LOAD', 'Mysql 批量加载');
INSERT INTO `r_jobentry_type` VALUES ('19', 'OozieJobExecutor', 'Oozie Job Executor');
INSERT INTO `r_jobentry_type` VALUES ('20', 'PALO_CUBE_CREATE', 'Palo Cube Create');
INSERT INTO `r_jobentry_type` VALUES ('21', 'PALO_CUBE_DELETE', 'Palo Cube Delete');
INSERT INTO `r_jobentry_type` VALUES ('22', 'HadoopTransJobExecutorPlugin', 'Pentaho MapReduce');
INSERT INTO `r_jobentry_type` VALUES ('23', 'HadoopPigScriptExecutorPlugin', 'Pig Script Executor');
INSERT INTO `r_jobentry_type` VALUES ('24', 'PING', 'Ping 一台主机');
INSERT INTO `r_jobentry_type` VALUES ('25', 'GET_POP', 'POP 收信');
INSERT INTO `r_jobentry_type` VALUES ('26', 'SFTPPUT', 'SFTP 上传');
INSERT INTO `r_jobentry_type` VALUES ('27', 'SFTP', 'SFTP 下载');
INSERT INTO `r_jobentry_type` VALUES ('28', 'SHELL', 'Shell');
INSERT INTO `r_jobentry_type` VALUES ('29', 'SparkSubmit', 'Spark Submit');
INSERT INTO `r_jobentry_type` VALUES ('30', 'SQL', 'SQL');
INSERT INTO `r_jobentry_type` VALUES ('31', 'MSSQL_BULK_LOAD', 'SQLServer 批量加载');
INSERT INTO `r_jobentry_type` VALUES ('32', 'SqoopExport', 'Sqoop Export');
INSERT INTO `r_jobentry_type` VALUES ('33', 'SqoopImport', 'Sqoop Import');
INSERT INTO `r_jobentry_type` VALUES ('34', 'SSH2_PUT', 'SSH2 上传');
INSERT INTO `r_jobentry_type` VALUES ('35', 'SSH2_GET', 'SSH2 下载');
INSERT INTO `r_jobentry_type` VALUES ('36', 'TALEND_JOB_EXEC', 'Talend 作业执行');
INSERT INTO `r_jobentry_type` VALUES ('37', 'XSD_VALIDATOR', 'XSD 验证器');
INSERT INTO `r_jobentry_type` VALUES ('38', 'XSLT', 'XSL 转换');
INSERT INTO `r_jobentry_type` VALUES ('39', 'ZIP_FILE', 'Zip 压缩文件');
INSERT INTO `r_jobentry_type` VALUES ('40', 'ABORT', '中止作业');
INSERT INTO `r_jobentry_type` VALUES ('41', 'MYSQL_BULK_FILE', '从 Mysql 批量导出到文件');
INSERT INTO `r_jobentry_type` VALUES ('42', 'DELETE_RESULT_FILENAMES', '从结果文件中删除文件');
INSERT INTO `r_jobentry_type` VALUES ('43', 'JOB', '作业');
INSERT INTO `r_jobentry_type` VALUES ('44', 'EVAL', '使用 JavaScript 脚本验证');
INSERT INTO `r_jobentry_type` VALUES ('45', 'WRITE_TO_FILE', '写入文件');
INSERT INTO `r_jobentry_type` VALUES ('46', 'WRITE_TO_LOG', '写日志');
INSERT INTO `r_jobentry_type` VALUES ('47', 'CREATE_FOLDER', '创建一个目录');
INSERT INTO `r_jobentry_type` VALUES ('48', 'CREATE_FILE', '创建文件');
INSERT INTO `r_jobentry_type` VALUES ('49', 'DELETE_FILE', '删除一个文件');
INSERT INTO `r_jobentry_type` VALUES ('50', 'DELETE_FILES', '删除多个文件');
INSERT INTO `r_jobentry_type` VALUES ('51', 'DELETE_FOLDERS', '删除目录');
INSERT INTO `r_jobentry_type` VALUES ('52', 'SNMP_TRAP', '发送 SNMP 自陷');
INSERT INTO `r_jobentry_type` VALUES ('53', 'SEND_NAGIOS_PASSIVE_CHECK', '发送Nagios 被动检查');
INSERT INTO `r_jobentry_type` VALUES ('54', 'MAIL', '发送邮件');
INSERT INTO `r_jobentry_type` VALUES ('55', 'COPY_MOVE_RESULT_FILENAMES', '复制/移动结果文件');
INSERT INTO `r_jobentry_type` VALUES ('56', 'COPY_FILES', '复制文件');
INSERT INTO `r_jobentry_type` VALUES ('57', 'EXPORT_REPOSITORY', '导出资源库到XML文件');
INSERT INTO `r_jobentry_type` VALUES ('58', 'SUCCESS', '成功');
INSERT INTO `r_jobentry_type` VALUES ('59', 'MSGBOX_INFO', '显示消息对话框');
INSERT INTO `r_jobentry_type` VALUES ('60', 'XML_WELL_FORMED', '检查 XML 文件格式');
INSERT INTO `r_jobentry_type` VALUES ('61', 'WEBSERVICE_AVAILABLE', '检查web服务是否可用');
INSERT INTO `r_jobentry_type` VALUES ('62', 'FILE_EXISTS', '检查一个文件是否存在');
INSERT INTO `r_jobentry_type` VALUES ('63', 'COLUMNS_EXIST', '检查列是否存在');
INSERT INTO `r_jobentry_type` VALUES ('64', 'FILES_EXIST', '检查多个文件是否存在');
INSERT INTO `r_jobentry_type` VALUES ('65', 'CHECK_DB_CONNECTIONS', '检查数据库连接');
INSERT INTO `r_jobentry_type` VALUES ('66', 'CHECK_FILES_LOCKED', '检查文件是否被锁');
INSERT INTO `r_jobentry_type` VALUES ('67', 'CONNECTED_TO_REPOSITORY', '检查是否连接到资源库');
INSERT INTO `r_jobentry_type` VALUES ('68', 'FOLDER_IS_EMPTY', '检查目录是否为空');
INSERT INTO `r_jobentry_type` VALUES ('69', 'TABLE_EXISTS', '检查表是否存在');
INSERT INTO `r_jobentry_type` VALUES ('70', 'SIMPLE_EVAL', '检验字段的值');
INSERT INTO `r_jobentry_type` VALUES ('71', 'FILE_COMPARE', '比较文件');
INSERT INTO `r_jobentry_type` VALUES ('72', 'FOLDERS_COMPARE', '比较目录');
INSERT INTO `r_jobentry_type` VALUES ('73', 'ADD_RESULT_FILENAMES', '添加文件到结果文件中');
INSERT INTO `r_jobentry_type` VALUES ('74', 'TRUNCATE_TABLES', '清空表');
INSERT INTO `r_jobentry_type` VALUES ('75', 'SPECIAL', '特殊作业项');
INSERT INTO `r_jobentry_type` VALUES ('76', 'SYSLOG', '用 Syslog 发送信息');
INSERT INTO `r_jobentry_type` VALUES ('77', 'PGP_ENCRYPT_FILES', '用PGP加密文件');
INSERT INTO `r_jobentry_type` VALUES ('78', 'PGP_DECRYPT_FILES', '用PGP解密文件');
INSERT INTO `r_jobentry_type` VALUES ('79', 'PGP_VERIFY_FILES', '用PGP验证文件签名');
INSERT INTO `r_jobentry_type` VALUES ('80', 'MOVE_FILES', '移动文件');
INSERT INTO `r_jobentry_type` VALUES ('81', 'DELAY', '等待');
INSERT INTO `r_jobentry_type` VALUES ('82', 'WAIT_FOR_SQL', '等待SQL');
INSERT INTO `r_jobentry_type` VALUES ('83', 'WAIT_FOR_FILE', '等待文件');
INSERT INTO `r_jobentry_type` VALUES ('84', 'UNZIP', '解压缩文件');
INSERT INTO `r_jobentry_type` VALUES ('85', 'EVAL_FILES_METRICS', '计算文件大小或个数');
INSERT INTO `r_jobentry_type` VALUES ('86', 'EVAL_TABLE_CONTENT', '计算表中的记录数');
INSERT INTO `r_jobentry_type` VALUES ('87', 'SET_VARIABLES', '设置变量');
INSERT INTO `r_jobentry_type` VALUES ('88', 'TRANS', '转换');
INSERT INTO `r_jobentry_type` VALUES ('89', 'TELNET', '远程登录一台主机');
INSERT INTO `r_jobentry_type` VALUES ('90', 'MAIL_VALIDATOR', '邮件验证');

-- ----------------------------
-- Table structure for r_job_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_job_attribute`;
CREATE TABLE `r_job_attribute` (
  `id_job_attribute` bigint(20) NOT NULL,
  `id_job` int(11) DEFAULT NULL,
  `nr` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `value_num` bigint(20) DEFAULT NULL,
  `value_str` mediumtext,
  PRIMARY KEY (`id_job_attribute`),
  UNIQUE KEY `idx_jatt` (`id_job`,`code`,`nr`)
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

-- ----------------------------
-- Table structure for r_job_hop
-- ----------------------------
DROP TABLE IF EXISTS `r_job_hop`;
CREATE TABLE `r_job_hop` (
  `id_job_hop` bigint(20) NOT NULL,
  `id_job` int(11) DEFAULT NULL,
  `id_jobentry_copy_from` int(11) DEFAULT NULL,
  `id_jobentry_copy_to` int(11) DEFAULT NULL,
  `enabled` char(1) DEFAULT NULL,
  `evaluation` char(1) DEFAULT NULL,
  `unconditional` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_job_hop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_job_hop
-- ----------------------------
INSERT INTO `r_job_hop` VALUES ('1', '1', '1', '2', '1', '1', '1');
INSERT INTO `r_job_hop` VALUES ('2', '1', '2', '3', '1', '1', '0');

-- ----------------------------
-- Table structure for r_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `r_job_lock`;
CREATE TABLE `r_job_lock` (
  `id_job_lock` bigint(20) NOT NULL,
  `id_job` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `lock_message` mediumtext,
  `lock_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_job_lock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_job_lock
-- ----------------------------

-- ----------------------------
-- Table structure for r_job_note
-- ----------------------------
DROP TABLE IF EXISTS `r_job_note`;
CREATE TABLE `r_job_note` (
  `id_job` int(11) DEFAULT NULL,
  `id_note` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_job_note
-- ----------------------------

-- ----------------------------
-- Table structure for r_log
-- ----------------------------
DROP TABLE IF EXISTS `r_log`;
CREATE TABLE `r_log` (
  `id_log` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id_loglevel` int(11) DEFAULT NULL,
  `logtype` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `fileextention` varchar(255) DEFAULT NULL,
  `add_date` char(1) DEFAULT NULL,
  `add_time` char(1) DEFAULT NULL,
  `id_database_log` int(11) DEFAULT NULL,
  `table_name_log` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_log
-- ----------------------------

-- ----------------------------
-- Table structure for r_loglevel
-- ----------------------------
DROP TABLE IF EXISTS `r_loglevel`;
CREATE TABLE `r_loglevel` (
  `id_loglevel` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_loglevel`)
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
  `id_namespace` bigint(20) NOT NULL,
  `name` mediumtext,
  PRIMARY KEY (`id_namespace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_namespace
-- ----------------------------

-- ----------------------------
-- Table structure for r_note
-- ----------------------------
DROP TABLE IF EXISTS `r_note`;
CREATE TABLE `r_note` (
  `id_note` bigint(20) NOT NULL,
  `value_str` mediumtext,
  `gui_location_x` int(11) DEFAULT NULL,
  `gui_location_y` int(11) DEFAULT NULL,
  `gui_location_width` int(11) DEFAULT NULL,
  `gui_location_height` int(11) DEFAULT NULL,
  `font_name` mediumtext,
  `font_size` int(11) DEFAULT NULL,
  `font_bold` char(1) DEFAULT NULL,
  `font_italic` char(1) DEFAULT NULL,
  `font_color_red` int(11) DEFAULT NULL,
  `font_color_green` int(11) DEFAULT NULL,
  `font_color_blue` int(11) DEFAULT NULL,
  `font_back_ground_color_red` int(11) DEFAULT NULL,
  `font_back_ground_color_green` int(11) DEFAULT NULL,
  `font_back_ground_color_blue` int(11) DEFAULT NULL,
  `font_border_color_red` int(11) DEFAULT NULL,
  `font_border_color_green` int(11) DEFAULT NULL,
  `font_border_color_blue` int(11) DEFAULT NULL,
  `draw_shadow` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_note`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_note
-- ----------------------------

-- ----------------------------
-- Table structure for r_partition
-- ----------------------------
DROP TABLE IF EXISTS `r_partition`;
CREATE TABLE `r_partition` (
  `id_partition` bigint(20) NOT NULL,
  `id_partition_schema` int(11) DEFAULT NULL,
  `partition_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_partition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_partition
-- ----------------------------

-- ----------------------------
-- Table structure for r_partition_schema
-- ----------------------------
DROP TABLE IF EXISTS `r_partition_schema`;
CREATE TABLE `r_partition_schema` (
  `id_partition_schema` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `dynamic_definition` char(1) DEFAULT NULL,
  `partitions_per_slave` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_partition_schema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_partition_schema
-- ----------------------------

-- ----------------------------
-- Table structure for r_repository_log
-- ----------------------------
DROP TABLE IF EXISTS `r_repository_log`;
CREATE TABLE `r_repository_log` (
  `id_repository_log` bigint(20) NOT NULL,
  `rep_version` varchar(255) DEFAULT NULL,
  `log_date` datetime DEFAULT NULL,
  `log_user` varchar(255) DEFAULT NULL,
  `operation_desc` mediumtext,
  PRIMARY KEY (`id_repository_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_repository_log
-- ----------------------------
INSERT INTO `r_repository_log` VALUES ('1', '5.0', '2017-06-15 14:44:16', 'admin', 'save job \'xxx\'');

-- ----------------------------
-- Table structure for r_slave
-- ----------------------------
DROP TABLE IF EXISTS `r_slave`;
CREATE TABLE `r_slave` (
  `id_slave` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `host_name` varchar(255) DEFAULT NULL,
  `port` varchar(255) DEFAULT NULL,
  `web_app_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `proxy_host_name` varchar(255) DEFAULT NULL,
  `proxy_port` varchar(255) DEFAULT NULL,
  `non_proxy_hosts` varchar(255) DEFAULT NULL,
  `master` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_slave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_slave
-- ----------------------------

-- ----------------------------
-- Table structure for r_step
-- ----------------------------
DROP TABLE IF EXISTS `r_step`;
CREATE TABLE `r_step` (
  `id_step` bigint(20) NOT NULL,
  `id_transformation` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `id_step_type` int(11) DEFAULT NULL,
  `distribute` char(1) DEFAULT NULL,
  `copies` int(11) DEFAULT NULL,
  `gui_location_x` int(11) DEFAULT NULL,
  `gui_location_y` int(11) DEFAULT NULL,
  `gui_draw` char(1) DEFAULT NULL,
  `copies_string` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_step`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_step
-- ----------------------------

-- ----------------------------
-- Table structure for r_step_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_step_attribute`;
CREATE TABLE `r_step_attribute` (
  `id_step_attribute` bigint(20) NOT NULL,
  `id_transformation` int(11) DEFAULT NULL,
  `id_step` int(11) DEFAULT NULL,
  `nr` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `value_num` bigint(20) DEFAULT NULL,
  `value_str` mediumtext,
  PRIMARY KEY (`id_step_attribute`),
  UNIQUE KEY `idx_rsat` (`id_step`,`code`,`nr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_step_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for r_step_database
-- ----------------------------
DROP TABLE IF EXISTS `r_step_database`;
CREATE TABLE `r_step_database` (
  `id_transformation` int(11) DEFAULT NULL,
  `id_step` int(11) DEFAULT NULL,
  `id_database` int(11) DEFAULT NULL,
  KEY `idx_rsd1` (`id_transformation`),
  KEY `idx_rsd2` (`id_database`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_step_database
-- ----------------------------

-- ----------------------------
-- Table structure for r_step_type
-- ----------------------------
DROP TABLE IF EXISTS `r_step_type`;
CREATE TABLE `r_step_type` (
  `id_step_type` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `helptext` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_step_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_step_type
-- ----------------------------
INSERT INTO `r_step_type` VALUES ('1', 'AccessInput', 'Access 输入', 'Read data from a Microsoft Access file');
INSERT INTO `r_step_type` VALUES ('2', 'AccessOutput', 'Access 输出', 'Stores records into an MS-Access database table.');
INSERT INTO `r_step_type` VALUES ('3', 'AvroInput', 'Avro Input', 'Reads data from an Avro file');
INSERT INTO `r_step_type` VALUES ('4', 'CallEndpointStep', 'Call endpoint', 'Call an endpoint of the BA Server.');
INSERT INTO `r_step_type` VALUES ('5', 'CassandraInput', 'Cassandra Input', 'Reads data from a Cassandra table');
INSERT INTO `r_step_type` VALUES ('6', 'CassandraOutput', 'Cassandra Output', 'Writes to a Cassandra table');
INSERT INTO `r_step_type` VALUES ('7', 'ClosureGenerator', 'Closure Generator', 'This step allows you to generates a closure table using parent-child relationships.');
INSERT INTO `r_step_type` VALUES ('8', 'ConcatFields', 'Concat Fields', 'Concat fields together into a new field (similar to the Text File Output step)');
INSERT INTO `r_step_type` VALUES ('9', 'CouchDbInput', 'CouchDb Input', 'Reads from a Couch DB view');
INSERT INTO `r_step_type` VALUES ('10', 'CsvInput', 'CSV文件输入', 'Simple CSV file input');
INSERT INTO `r_step_type` VALUES ('11', 'CubeInput', 'Cube 文件输入', '从一个cube读取记录.');
INSERT INTO `r_step_type` VALUES ('12', 'CubeOutput', 'Cube输出', '把数据写入一个cube');
INSERT INTO `r_step_type` VALUES ('13', 'TypeExitEdi2XmlStep', 'Edi to XML', 'Converts Edi text to generic XML');
INSERT INTO `r_step_type` VALUES ('14', 'ElasticSearchBulk', 'ElasticSearch 批量加载', 'Performs bulk inserts into ElasticSearch');
INSERT INTO `r_step_type` VALUES ('15', 'ShapeFileReader', 'ESRI Shapefile Reader', 'Reads shape file data from an ESRI shape file and linked DBF file');
INSERT INTO `r_step_type` VALUES ('16', 'MetaInject', 'ETL元数据注入', 'This step allows you to inject metadata into an existing transformation prior to execution.  This allows for the creation of dynamic and highly flexible data integration solutions.');
INSERT INTO `r_step_type` VALUES ('17', 'DummyPlugin', 'Example plugin', 'This is an example for a plugin test step');
INSERT INTO `r_step_type` VALUES ('18', 'ExcelInput', 'Excel输入', '从一个微软的Excel文件里读取数据. 兼容Excel 95, 97 and 2000.');
INSERT INTO `r_step_type` VALUES ('19', 'ExcelOutput', 'Excel输出', 'Stores records into an Excel (XLS) document with formatting information.');
INSERT INTO `r_step_type` VALUES ('20', 'GetSlaveSequence', 'Get ID from slave server', 'Retrieves unique IDs in blocks from a slave server.  The referenced sequence needs to be configured on the slave server in the XML configuration file.');
INSERT INTO `r_step_type` VALUES ('21', 'GetSessionVariableStep', 'Get session variables', 'Get session variables from the current user session.');
INSERT INTO `r_step_type` VALUES ('22', 'TypeExitGoogleAnalyticsInputStep', 'Google Analytics', 'Fetches data from google analytics account');
INSERT INTO `r_step_type` VALUES ('23', 'GPLoad', 'Greenplum Load', 'Greenplum Load');
INSERT INTO `r_step_type` VALUES ('24', 'GPBulkLoader', 'Greenplum 批量加载', 'Greenplum Bulk Loader');
INSERT INTO `r_step_type` VALUES ('25', 'ParallelGzipCsvInput', 'GZIP CSV Input', 'Parallel GZIP CSV file input reader');
INSERT INTO `r_step_type` VALUES ('26', 'HadoopFileInputPlugin', 'Hadoop File Input', 'Process files from an HDFS location');
INSERT INTO `r_step_type` VALUES ('27', 'HadoopFileOutputPlugin', 'Hadoop File Output', 'Create files in an HDFS location ');
INSERT INTO `r_step_type` VALUES ('28', 'HBaseInput', 'HBase Input', 'Reads data from a HBase table according to a mapping ');
INSERT INTO `r_step_type` VALUES ('29', 'HBaseOutput', 'HBase Output', 'Writes data to an HBase table according to a mapping');
INSERT INTO `r_step_type` VALUES ('30', 'HBaseRowDecoder', 'HBase Row Decoder', 'Decodes an incoming key and HBase result object according to a mapping ');
INSERT INTO `r_step_type` VALUES ('31', 'HL7Input', 'HL7 Input', 'Reads and parses HL7 messages and outputs a series of values from the messages');
INSERT INTO `r_step_type` VALUES ('32', 'HTTP', 'HTTP client', 'Call a web service over HTTP by supplying a base URL by allowing parameters to be set dynamically');
INSERT INTO `r_step_type` VALUES ('33', 'HTTPPOST', 'HTTP Post', 'Call a web service request over HTTP by supplying a base URL by allowing parameters to be set dynamically');
INSERT INTO `r_step_type` VALUES ('34', 'InfobrightOutput', 'Infobright 批量加载', 'Load data to an Infobright database table');
INSERT INTO `r_step_type` VALUES ('35', 'VectorWiseBulkLoader', 'Ingres VectorWise 批量加载', 'This step interfaces with the Ingres VectorWise Bulk Loader \"COPY TABLE\" command.');
INSERT INTO `r_step_type` VALUES ('36', 'UserDefinedJavaClass', 'Java 代码', 'This step allows you to program a step using Java code');
INSERT INTO `r_step_type` VALUES ('37', 'ScriptValueMod', 'JavaScript代码', 'This is a modified plugin for the Scripting Values with improved interface and performance.\nWritten & donated to open source by Martin Lange, Proconis : http://www.proconis.de');
INSERT INTO `r_step_type` VALUES ('38', 'JsonInput', 'Json 输入', 'Extract relevant portions out of JSON structures (file or incoming field) and output rows');
INSERT INTO `r_step_type` VALUES ('39', 'JsonOutput', 'Json 输出', 'Create Json bloc and output it in a field ou a file.');
INSERT INTO `r_step_type` VALUES ('40', 'KafkaConsumer', 'Kafka消费者', '读取kafka指定的topic的消息');
INSERT INTO `r_step_type` VALUES ('41', 'KafkaProducer', 'kafka生产者', '写入消息到kafka指定的topic中');
INSERT INTO `r_step_type` VALUES ('42', 'KettleUtil', 'kettle工具', '用java实现复杂业务逻辑，然后在Kettle的脚本中引用。');
INSERT INTO `r_step_type` VALUES ('43', 'LDAPInput', 'LDAP 输入', 'Read data from LDAP host');
INSERT INTO `r_step_type` VALUES ('44', 'LDAPOutput', 'LDAP 输出', 'Perform Insert, upsert, update, add or delete operations on records based on their DN (Distinguished  Name).');
INSERT INTO `r_step_type` VALUES ('45', 'LDIFInput', 'LDIF 输入', 'Read data from LDIF files');
INSERT INTO `r_step_type` VALUES ('46', 'LucidDBBulkLoader', 'LucidDB 批量加载', 'Load data into LucidDB by using their bulk load command in streaming mode. (Doesnt work on Windows!)');
INSERT INTO `r_step_type` VALUES ('47', 'LucidDBStreamingLoader', 'LucidDB 流加载', 'Load data into LucidDB by using Remote Rows UDX.');
INSERT INTO `r_step_type` VALUES ('48', 'HadoopEnterPlugin', 'MapReduce Input', 'Enter a Hadoop Mapper or Reducer transformation');
INSERT INTO `r_step_type` VALUES ('49', 'HadoopExitPlugin', 'MapReduce Output', 'Exit a Hadoop Mapper or Reducer transformation ');
INSERT INTO `r_step_type` VALUES ('50', 'TypeExitExcelWriterStep', 'Microsoft Excel 输出', 'Writes or appends data to an Excel file');
INSERT INTO `r_step_type` VALUES ('51', 'MondrianInput', 'Mondrian 输入', 'Execute and retrieve data using an MDX query against a Pentaho Analyses OLAP server (Mondrian)');
INSERT INTO `r_step_type` VALUES ('52', 'MonetDBAgileMart', 'MonetDB Agile Mart', 'Load data into MonetDB for Agile BI use cases');
INSERT INTO `r_step_type` VALUES ('53', 'MonetDBBulkLoader', 'MonetDB 批量加载', 'Load data into MonetDB by using their bulk load command in streaming mode.');
INSERT INTO `r_step_type` VALUES ('54', 'MongoDbInput', 'MongoDB Input', 'Reads from a Mongo DB collection');
INSERT INTO `r_step_type` VALUES ('55', 'MongoDbOutput', 'MongoDB Output', 'Writes to a Mongo DB collection');
INSERT INTO `r_step_type` VALUES ('56', 'MultiwayMergeJoin', 'Multiway Merge Join', 'Multiway Merge Join');
INSERT INTO `r_step_type` VALUES ('57', 'MySQLBulkLoader', 'MySQL 批量加载', 'MySQL bulk loader step, loading data over a named pipe (not available on MS Windows)');
INSERT INTO `r_step_type` VALUES ('58', 'OlapInput', 'OLAP 输入', 'Execute and retrieve data using an MDX query against any XML/A OLAP datasource using olap4j');
INSERT INTO `r_step_type` VALUES ('59', 'OpenERPObjectDelete', 'OpenERP Object Delete', 'Deletes OpenERP objects');
INSERT INTO `r_step_type` VALUES ('60', 'OpenERPObjectInput', 'OpenERP Object Input', 'Reads data from OpenERP objects');
INSERT INTO `r_step_type` VALUES ('61', 'OpenERPObjectOutputImport', 'OpenERP Object Output', 'Writes data into OpenERP objects using the object import procedure');
INSERT INTO `r_step_type` VALUES ('62', 'OraBulkLoader', 'Oracle 批量加载', 'Use Oracle Bulk Loader to load data');
INSERT INTO `r_step_type` VALUES ('63', 'PaloCellInput', 'Palo Cell Input', 'Reads data from a defined Palo Cube ');
INSERT INTO `r_step_type` VALUES ('64', 'PaloCellOutput', 'Palo Cell Output', 'Writes data to a defined Palo Cube');
INSERT INTO `r_step_type` VALUES ('65', 'PaloDimInput', 'Palo Dim Input', 'Reads data from a defined Palo Dimension');
INSERT INTO `r_step_type` VALUES ('66', 'PaloDimOutput', 'Palo Dim Output', 'Writes data to defined Palo Dimension');
INSERT INTO `r_step_type` VALUES ('67', 'PentahoReportingOutput', 'Pentaho 报表输出', 'Executes an existing report (PRPT)');
INSERT INTO `r_step_type` VALUES ('68', 'PGPDecryptStream', 'PGP Decrypt stream', 'Decrypt data stream with PGP');
INSERT INTO `r_step_type` VALUES ('69', 'PGPEncryptStream', 'PGP Encrypt stream', 'Encrypt data stream with PGP');
INSERT INTO `r_step_type` VALUES ('70', 'PGBulkLoader', 'PostgreSQL 批量加载', 'PostgreSQL Bulk Loader');
INSERT INTO `r_step_type` VALUES ('71', 'Rest', 'REST Client', 'Consume RESTfull services.\nREpresentational State Transfer (REST) is a key design idiom that embraces a stateless client-server\narchitecture in which the web services are viewed as resources and can be identified by their URLs');
INSERT INTO `r_step_type` VALUES ('72', 'RssInput', 'RSS 输入', 'Read RSS feeds');
INSERT INTO `r_step_type` VALUES ('73', 'RssOutput', 'RSS 输出', 'Read RSS stream.');
INSERT INTO `r_step_type` VALUES ('74', 'RuleAccumulator', 'Rule Accumulator', 'Execute a rule against a set of all incoming rows');
INSERT INTO `r_step_type` VALUES ('75', 'RuleExecutor', 'Rule Executor', 'Execute a rule against each row or a set of rows');
INSERT INTO `r_step_type` VALUES ('76', 'S3CSVINPUT', 'S3 CSV 输入', 'S3 CSV 输入');
INSERT INTO `r_step_type` VALUES ('77', 'S3FileOutputPlugin', 'S3 File Output', 'Create files in an S3 location');
INSERT INTO `r_step_type` VALUES ('78', 'SalesforceUpsert', 'Salesforce Upsert', 'Insert or update records in Salesforce module.');
INSERT INTO `r_step_type` VALUES ('79', 'SalesforceDelete', 'Salesforce 删除', 'Delete records in Salesforce module.');
INSERT INTO `r_step_type` VALUES ('80', 'SalesforceInsert', 'Salesforce 插入', 'Insert records in Salesforce module.');
INSERT INTO `r_step_type` VALUES ('81', 'SalesforceUpdate', 'Salesforce 更新', 'Update records in Salesforce module.');
INSERT INTO `r_step_type` VALUES ('82', 'SalesforceInput', 'Salesforce 输入', '!BaseStep.TypeTooltipDesc.SalesforceInput!');
INSERT INTO `r_step_type` VALUES ('83', 'SapInput', 'SAP 输入', 'Read data from SAP ERP, optionally with parameters');
INSERT INTO `r_step_type` VALUES ('84', 'SASInput', 'SAS 输入', 'This step reads files in sas7bdat (SAS) native format');
INSERT INTO `r_step_type` VALUES ('85', 'Script', 'Script', 'Calculate values by scripting in Ruby, Python, Groovy, JavaScript, ... (JSR-223)');
INSERT INTO `r_step_type` VALUES ('86', 'SetSessionVariableStep', 'Set session variables', 'Set session variables in the current user session.');
INSERT INTO `r_step_type` VALUES ('87', 'SFTPPut', 'SFTP Put', 'Upload a file or a stream file to remote host via SFTP');
INSERT INTO `r_step_type` VALUES ('88', 'SimpleMapping', 'Simple Mapping (sub-transformation)', 'Run a mapping (sub-transformation), use MappingInput and MappingOutput to specify the fields interface.  This is the simplified version only allowing one input and one output data set.');
INSERT INTO `r_step_type` VALUES ('89', 'SingleThreader', 'Single Threader', 'Executes a transformation snippet in a single thread.  You need a standard mapping or a transformation with an Injector step where data from the parent transformation will arive in blocks.');
INSERT INTO `r_step_type` VALUES ('90', 'SocketWriter', 'Socket 写', 'Socket writer.  A socket server that can send rows of data to a socket reader.');
INSERT INTO `r_step_type` VALUES ('91', 'SocketReader', 'Socket 读', 'Socket reader.  A socket client that connects to a server (Socket Writer step).');
INSERT INTO `r_step_type` VALUES ('92', 'SQLFileOutput', 'SQL 文件输出', 'Output SQL INSERT statements to file');
INSERT INTO `r_step_type` VALUES ('93', 'SSTableOutput', 'SSTable Output', 'Writes to a filesystem directory as a Cassandra SSTable');
INSERT INTO `r_step_type` VALUES ('94', 'SwitchCase', 'Switch / Case', 'Switch a row to a certain target step based on the case value in a field.');
INSERT INTO `r_step_type` VALUES ('95', 'TableAgileMart', 'Table Agile Mart', 'Load data into a table for Agile BI use cases');
INSERT INTO `r_step_type` VALUES ('96', 'TeraFast', 'Teradata Fastload 批量加载', 'The Teradata Fastload Bulk loader');
INSERT INTO `r_step_type` VALUES ('97', 'TeraDataBulkLoader', 'Teradata TPT Bulk Loader', 'Teradata TPT bulkloader, using tbuild command');
INSERT INTO `r_step_type` VALUES ('98', 'TransExecutor', 'Transformation Executor', 'This step executes a Pentaho Data Integration transformation, sets parameters and passes rows.');
INSERT INTO `r_step_type` VALUES ('99', 'WebServiceLookup', 'Web 服务查询', '使用 Web 服务查询信息');
INSERT INTO `r_step_type` VALUES ('100', 'XBaseInput', 'XBase输入', '从一个XBase类型的文件(DBF)读取记录');
INSERT INTO `r_step_type` VALUES ('101', 'getXMLData', 'XML 文件输入', 'Get data from XML file by using XPath.\n This step also allows you to parse XML defined in a previous field.');
INSERT INTO `r_step_type` VALUES ('102', 'XMLInputStream', 'XML 文件输入 (StAX解析)', 'This step is capable of processing very large and complex XML files very fast.');
INSERT INTO `r_step_type` VALUES ('103', 'XMLInputSax', 'XML 流输入', 'Read data from an XML file in a streaming fashing, working faster and consuming less memory');
INSERT INTO `r_step_type` VALUES ('104', 'XMLJoin', 'XML 连接', 'Joins a stream of XML-Tags into a target XML string');
INSERT INTO `r_step_type` VALUES ('105', 'XMLInput', 'XML输入', '从一个XML读取数据');
INSERT INTO `r_step_type` VALUES ('106', 'XMLOutput', 'XML输出', '写数据到一个XML文件');
INSERT INTO `r_step_type` VALUES ('107', 'XSLT', 'XSL 转换', 'Transform XML stream using XSL (eXtensible Stylesheet Language).');
INSERT INTO `r_step_type` VALUES ('108', 'YamlInput', 'Yaml 输入', 'Read YAML source (file or stream) parse them and convert them to rows and writes these to one or more output. ');
INSERT INTO `r_step_type` VALUES ('109', 'ZipFile', 'Zip 文件', 'Zip a file.\nFilename will be extracted from incoming stream.');
INSERT INTO `r_step_type` VALUES ('110', 'Abort', '中止', 'Abort a transformation');
INSERT INTO `r_step_type` VALUES ('111', 'FilesFromResult', '从结果获取文件', 'This step allows you to read filenames used or generated in a previous entry in a job.');
INSERT INTO `r_step_type` VALUES ('112', 'RowsFromResult', '从结果获取记录', '这个允许你从同一个任务的前一个条目里读取记录.');
INSERT INTO `r_step_type` VALUES ('113', 'XSDValidator', '使用 XSD 检验 XML 文件', 'Validate XML source (files or streams) against XML Schema Definition.');
INSERT INTO `r_step_type` VALUES ('114', 'ValueMapper', '值映射', 'Maps values of a certain field from one value to another');
INSERT INTO `r_step_type` VALUES ('115', 'CloneRow', '克隆行', 'Clone a row as many times as needed');
INSERT INTO `r_step_type` VALUES ('116', 'Formula', '公式', '使用 Pentaho 的公式库来计算公式');
INSERT INTO `r_step_type` VALUES ('117', 'WriteToLog', '写日志', 'Write data to log');
INSERT INTO `r_step_type` VALUES ('118', 'AnalyticQuery', '分析查询', 'Execute analytic queries over a sorted dataset (LEAD/LAG/FIRST/LAST)');
INSERT INTO `r_step_type` VALUES ('119', 'GroupBy', '分组', '以分组的形式创建聚合.{0}这个仅仅在一个已经排好序的输入有效.{1}如果输入没有排序, 仅仅两个连续的记录行被正确处理.');
INSERT INTO `r_step_type` VALUES ('120', 'SplitFieldToRows3', '列拆分为多行', 'Splits a single string field by delimiter and creates a new row for each split term');
INSERT INTO `r_step_type` VALUES ('121', 'Denormaliser', '列转行', 'Denormalises rows by looking up key-value pairs and by assigning them to new fields in the输出 rows.{0}This method aggregates and needs the输入 rows to be sorted on the grouping fields');
INSERT INTO `r_step_type` VALUES ('122', 'Delete', '删除', '基于关键字删除记录');
INSERT INTO `r_step_type` VALUES ('123', 'Janino', '利用Janino计算Java表达式', 'Calculate the result of a Java Expression using Janino');
INSERT INTO `r_step_type` VALUES ('124', 'StringCut', '剪切字符串', 'Strings cut (substring).');
INSERT INTO `r_step_type` VALUES ('125', 'UnivariateStats', '单变量统计', 'This step computes some simple stats based on a single input field');
INSERT INTO `r_step_type` VALUES ('126', 'Unique', '去除重复记录', '去除重复的记录行，保持记录唯一{0}这个仅仅基于一个已经排好序的输入.{1}如果输入没有排序, 仅仅两个连续的记录行被正确处理.');
INSERT INTO `r_step_type` VALUES ('127', 'SyslogMessage', '发送信息至Syslog', 'Send message to Syslog server');
INSERT INTO `r_step_type` VALUES ('128', 'Mail', '发送邮件', 'Send eMail.');
INSERT INTO `r_step_type` VALUES ('129', 'MergeRows', '合并记录', '合并两个数据流, 并根据某个关键字排序.  这两个数据流被比较，以标识相等的、变更的、删除的和新建的记录.');
INSERT INTO `r_step_type` VALUES ('130', 'ExecProcess', '启动一个进程', 'Execute a process and return the result');
INSERT INTO `r_step_type` VALUES ('131', 'UniqueRowsByHashSet', '唯一行 (哈希值)', 'Remove double rows and leave only unique occurrences by using a HashSet.');
INSERT INTO `r_step_type` VALUES ('132', 'FixedInput', '固定宽度文件输入', 'Fixed file input');
INSERT INTO `r_step_type` VALUES ('133', 'MemoryGroupBy', '在内存中分组', 'Builds aggregates in a group by fashion.\nThis step doesn\'t require sorted input.');
INSERT INTO `r_step_type` VALUES ('134', 'AddXML', '增加XML列', 'Encode several fields into an XML fragment');
INSERT INTO `r_step_type` VALUES ('135', 'Constant', '增加常量', '给记录增加一到多个常量');
INSERT INTO `r_step_type` VALUES ('136', 'Sequence', '增加序列', '从序列获取下一个值');
INSERT INTO `r_step_type` VALUES ('137', 'CheckSum', '增加校验列', 'Add a checksum column for each input row');
INSERT INTO `r_step_type` VALUES ('138', 'ProcessFiles', '处理文件', 'Process one file per row (copy or move or delete).\nThis step only accept filename in input.');
INSERT INTO `r_step_type` VALUES ('139', 'FilesToResult', '复制文件到结果', 'This step allows you to set filenames in the result of this transformation.\nSubsequent job entries can then use this information.');
INSERT INTO `r_step_type` VALUES ('140', 'RowsToResult', '复制记录到结果', '使用这个步骤把记录写到正在执行的任务.{0}信息将会被传递给同一个任务里的下一个条目.');
INSERT INTO `r_step_type` VALUES ('141', 'SelectValues', '字段选择', '选择或移除记录里的字。{0}此外，可以设置字段的元数据: 类型, 长度和精度.');
INSERT INTO `r_step_type` VALUES ('142', 'StringOperations', '字符串操作', 'Apply certain operations like trimming, padding and others to string value.');
INSERT INTO `r_step_type` VALUES ('143', 'ReplaceString', '字符串替换', 'Replace all occurences a word in a string with another word.');
INSERT INTO `r_step_type` VALUES ('144', 'SymmetricCryptoTrans', '对称加密', 'Encrypt or decrypt a string using symmetric encryption.\nAvailable algorithms are DES, AES, TripleDES.');
INSERT INTO `r_step_type` VALUES ('145', 'SetValueConstant', '将字段值设置为常量', 'Set value of a field to a constant');
INSERT INTO `r_step_type` VALUES ('146', 'Delay', '延迟行', 'Output each input row after a delay');
INSERT INTO `r_step_type` VALUES ('147', 'DynamicSQLRow', '执行Dynamic SQL', 'Execute dynamic SQL statement build in a previous field');
INSERT INTO `r_step_type` VALUES ('148', 'ExecSQL', '执行SQL脚本', '执行一个SQL脚本, 另外，可以使用输入的记录作为参数');
INSERT INTO `r_step_type` VALUES ('149', 'ExecSQLRow', '执行SQL脚本(字段流替换)', 'Execute SQL script extracted from a field\ncreated in a previous step.');
INSERT INTO `r_step_type` VALUES ('150', 'JobExecutor', '执行作业', 'This step executes a Pentaho Data Integration job, sets parameters and passes rows.');
INSERT INTO `r_step_type` VALUES ('151', 'FieldSplitter', '拆分字段', '当你想把一个字段拆分成多个时，使用这个类型.');
INSERT INTO `r_step_type` VALUES ('152', 'SortedMerge', '排序合并', 'Sorted Merge');
INSERT INTO `r_step_type` VALUES ('153', 'SortRows', '排序记录', '基于字段值把记录排序(升序或降序)');
INSERT INTO `r_step_type` VALUES ('154', 'InsertUpdate', '插入 / 更新', '基于关键字更新或插入记录到数据库.');
INSERT INTO `r_step_type` VALUES ('155', 'ChangeFileEncoding', '改变文件编码', 'Change file encoding and create a new file');
INSERT INTO `r_step_type` VALUES ('156', 'NumberRange', '数值范围', 'Create ranges based on numeric field');
INSERT INTO `r_step_type` VALUES ('157', 'SynchronizeAfterMerge', '数据同步', 'This step perform insert/update/delete in one go based on the value of a field. ');
INSERT INTO `r_step_type` VALUES ('158', 'DBLookup', '数据库查询', '使用字段值在数据库里查询值');
INSERT INTO `r_step_type` VALUES ('159', 'DBJoin', '数据库连接', '使用数据流里的值作为参数执行一个数据库查询');
INSERT INTO `r_step_type` VALUES ('160', 'Validator', '数据检验', 'Validates passing data based on a set of rules');
INSERT INTO `r_step_type` VALUES ('161', 'PrioritizeStreams', '数据流优先级排序', 'Prioritize streams in an order way.');
INSERT INTO `r_step_type` VALUES ('162', 'ReservoirSampling', '数据采样', '[Transform] Samples a fixed number of rows from the incoming stream');
INSERT INTO `r_step_type` VALUES ('163', 'LoadFileInput', '文件内容加载至内存', 'Load file content in memory');
INSERT INTO `r_step_type` VALUES ('164', 'TextFileInput', '文本文件输入', '从一个文本文件（几种格式）里读取数据{0}这些数据可以被传递到下一个步骤里...');
INSERT INTO `r_step_type` VALUES ('165', 'TextFileOutput', '文本文件输出', '写记录到一个文本文件.');
INSERT INTO `r_step_type` VALUES ('166', 'Mapping', '映射 (子转换)', '运行一个映射 (子转换), 使用MappingInput和MappingOutput来指定接口的字段');
INSERT INTO `r_step_type` VALUES ('167', 'MappingInput', '映射输入规范', '指定一个映射的字段输入');
INSERT INTO `r_step_type` VALUES ('168', 'MappingOutput', '映射输出规范', '指定一个映射的字段输出');
INSERT INTO `r_step_type` VALUES ('169', 'Update', '更新', '基于关键字更新记录到数据库');
INSERT INTO `r_step_type` VALUES ('170', 'IfNull', '替换NULL值', 'Sets a field value to a constant if it is null.');
INSERT INTO `r_step_type` VALUES ('171', 'SampleRows', '样本行', 'Filter rows based on the line number.');
INSERT INTO `r_step_type` VALUES ('172', 'JavaFilter', '根据Java代码过滤记录', 'Filter rows using java code');
INSERT INTO `r_step_type` VALUES ('173', 'FieldsChangeSequence', '根据字段值来改变序列', 'Add sequence depending of fields value change.\nEach time value of at least one field change, PDI will reset sequence. ');
INSERT INTO `r_step_type` VALUES ('174', 'WebServiceAvailable', '检查web服务是否可用', 'Check if a webservice is available');
INSERT INTO `r_step_type` VALUES ('175', 'FileExists', '检查文件是否存在', 'Check if a file exists');
INSERT INTO `r_step_type` VALUES ('176', 'FileLocked', '检查文件是否已被锁定', 'Check if a file is locked by another process');
INSERT INTO `r_step_type` VALUES ('177', 'TableExists', '检查表是否存在', 'Check if a table exists on a specified connection');
INSERT INTO `r_step_type` VALUES ('178', 'ColumnExists', '检查表里的列是否存在', 'Check if a column exists in a table on a specified connection.');
INSERT INTO `r_step_type` VALUES ('179', 'DetectEmptyStream', '检测空流', 'This step will output one empty row if input stream is empty\n(ie when input stream does not contain any row)');
INSERT INTO `r_step_type` VALUES ('180', 'CreditCardValidator', '检验信用卡号码是否有效', 'The Credit card validator step will help you tell:\n(1) if a credit card number is valid (uses LUHN10 (MOD-10) algorithm)\n(2) which credit card vendor handles that number\n(VISA, MasterCard, Diners Club, EnRoute, American Express (AMEX),...)');
INSERT INTO `r_step_type` VALUES ('181', 'MailValidator', '检验邮件地址', 'Check if an email address is valid.');
INSERT INTO `r_step_type` VALUES ('182', 'FuzzyMatch', '模糊匹配', 'Finding approximate matches to a string using matching algorithms.\nRead a field from a main stream and output approximative value from lookup stream.');
INSERT INTO `r_step_type` VALUES ('183', 'RegexEval', '正则表达式', 'Regular expression Evaluation\nThis step uses a regular expression to evaluate a field. It can also extract new fields out of an existing field with capturing groups.');
INSERT INTO `r_step_type` VALUES ('184', 'TableCompare', '比较表', 'Compares 2 tables and gives back a list of differences');
INSERT INTO `r_step_type` VALUES ('185', 'StreamLookup', '流查询', '从转换中的其它流里查询值.');
INSERT INTO `r_step_type` VALUES ('186', 'StepMetastructure', '流的元数据', 'This is a step to read the metadata of the incoming stream.');
INSERT INTO `r_step_type` VALUES ('187', 'SecretKeyGenerator', '生成密钥', 'Generate secret key for algorithms such as DES, AES, TripleDES.');
INSERT INTO `r_step_type` VALUES ('188', 'RowGenerator', '生成记录', '产生一些空记录或相等的行.');
INSERT INTO `r_step_type` VALUES ('189', 'RandomValue', '生成随机数', 'Generate random value');
INSERT INTO `r_step_type` VALUES ('190', 'RandomCCNumberGenerator', '生成随机的信用卡号', 'Generate random valide (luhn check) credit card numbers');
INSERT INTO `r_step_type` VALUES ('191', 'Dummy', '空操作 (什么也不做)', '这个步骤类型什么都不作.{0} 当你想测试或拆分数据流的时候有用.');
INSERT INTO `r_step_type` VALUES ('192', 'DimensionLookup', '维度查询/更新', '在一个数据仓库里更新一个渐变维 {0} 或者在这个维里查询信息.');
INSERT INTO `r_step_type` VALUES ('193', 'CombinationLookup', '联合查询/更新', '更新数据仓库里的一个junk维 {0} 可选的, 科研查询维里的信息.{1}junk维的主键是所有的字段.');
INSERT INTO `r_step_type` VALUES ('194', 'AggregateRows', '聚合记录', '这个步骤类型允许你聚合记录.{0}它不能使用在分组的情况.');
INSERT INTO `r_step_type` VALUES ('195', 'AutoDoc', '自动文档输出', 'This step automatically generates documentation based on input in the form of a list of transformations and jobs');
INSERT INTO `r_step_type` VALUES ('196', 'DataGrid', '自定义常量数据', 'Enter rows of static data in a grid, usually for testing, reference or demo purpose');
INSERT INTO `r_step_type` VALUES ('197', 'GetPreviousRowField', '获取上一次的记录', 'Get fields value of previous row.');
INSERT INTO `r_step_type` VALUES ('198', 'GetVariable', '获取变量', 'Determine the values of certain (environment or Kettle) variables and put them in field values.');
INSERT INTO `r_step_type` VALUES ('199', 'GetSubFolders', '获取子目录名', 'Read a parent folder and return all subfolders');
INSERT INTO `r_step_type` VALUES ('200', 'GetFileNames', '获取文件名', 'Get file names from the operating system and send them to the next step.');
INSERT INTO `r_step_type` VALUES ('201', 'GetFilesRowsCount', '获取文件行数', 'Returns rows count for text files.');
INSERT INTO `r_step_type` VALUES ('202', 'SystemInfo', '获取系统信息', '获取系统信息，例如时间、日期.');
INSERT INTO `r_step_type` VALUES ('203', 'GetTableNames', '获取表名', 'Get table names from database connection and send them to the next step');
INSERT INTO `r_step_type` VALUES ('204', 'GetRepositoryNames', '获取资源库配置', 'Lists detailed information about transformations and/or jobs in a repository');
INSERT INTO `r_step_type` VALUES ('205', 'Flattener', '行扁平化', 'Flattens consequetive rows based on the order in which they appear in the输入 stream');
INSERT INTO `r_step_type` VALUES ('206', 'Normaliser', '行转列', 'De-normalised information can be normalised using this step type.');
INSERT INTO `r_step_type` VALUES ('207', 'TableInput', '表输入', '从数据库表里读取信息.');
INSERT INTO `r_step_type` VALUES ('208', 'TableOutput', '表输出', '写信息到一个数据库表');
INSERT INTO `r_step_type` VALUES ('209', 'Calculator', '计算器', '通过执行简单的计算创建一个新字段');
INSERT INTO `r_step_type` VALUES ('210', 'JoinRows', '记录关联 (笛卡尔输出)', '这个步骤的输出是输入流的笛卡尔的结果.{0} 输出结果的记录数是输入流记录之间的乘积.');
INSERT INTO `r_step_type` VALUES ('211', 'Injector', '记录注射', 'Injector step to allow to inject rows into the transformation through the java API');
INSERT INTO `r_step_type` VALUES ('212', 'MergeJoin', '记录集连接', 'Joins two streams on a given key and outputs a joined set. The input streams must be sorted on the join key');
INSERT INTO `r_step_type` VALUES ('213', 'NullIf', '设置值为NULL', '如果一个字段值等于某个固定值，那么把这个字段值设置成null');
INSERT INTO `r_step_type` VALUES ('214', 'SetVariable', '设置变量', 'Set environment variables based on a single input row.');
INSERT INTO `r_step_type` VALUES ('215', 'SetValueField', '设置字段值', 'Set value of a field with another value field');
INSERT INTO `r_step_type` VALUES ('216', 'DetectLastRow', '识别流的最后一行', 'Last row will be marked');
INSERT INTO `r_step_type` VALUES ('217', 'DBProc', '调用DB存储过程', '通过调用数据库存储过程获得返回值.');
INSERT INTO `r_step_type` VALUES ('218', 'StepsMetrics', '转换步骤信息统计', 'Return metrics for one or several steps');
INSERT INTO `r_step_type` VALUES ('219', 'FilterRows', '过滤记录', '使用简单的相等来过滤记录');
INSERT INTO `r_step_type` VALUES ('220', 'SSH', '运行SSH命令', 'Run SSH commands and returns result.');
INSERT INTO `r_step_type` VALUES ('221', 'Append', '追加流', 'Append 2 streams in an ordered way');
INSERT INTO `r_step_type` VALUES ('222', 'MailInput', '邮件信息输入', 'Read POP3/IMAP server and retrieve messages');
INSERT INTO `r_step_type` VALUES ('223', 'PropertyInput', '配置文件输入', 'Read data (key, value) from properties files.');
INSERT INTO `r_step_type` VALUES ('224', 'PropertyOutput', '配置文件输出', 'Write data to properties file');
INSERT INTO `r_step_type` VALUES ('225', 'BlockingStep', '阻塞数据', 'This step blocks until all incoming rows have been processed.  Subsequent steps only recieve the last input row to this step.');
INSERT INTO `r_step_type` VALUES ('226', 'BlockUntilStepsFinish', '阻塞数据直到步骤都完成', 'Block this step until selected steps finish.');

-- ----------------------------
-- Table structure for r_transformation
-- ----------------------------
DROP TABLE IF EXISTS `r_transformation`;
CREATE TABLE `r_transformation` (
  `id_transformation` bigint(20) NOT NULL,
  `id_directory` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` mediumtext,
  `extended_description` mediumtext,
  `trans_version` varchar(255) DEFAULT NULL,
  `trans_status` int(11) DEFAULT NULL,
  `id_step_read` int(11) DEFAULT NULL,
  `id_step_write` int(11) DEFAULT NULL,
  `id_step_input` int(11) DEFAULT NULL,
  `id_step_output` int(11) DEFAULT NULL,
  `id_step_update` int(11) DEFAULT NULL,
  `id_database_log` int(11) DEFAULT NULL,
  `table_name_log` varchar(255) DEFAULT NULL,
  `use_batchid` char(1) DEFAULT NULL,
  `use_logfield` char(1) DEFAULT NULL,
  `id_database_maxdate` int(11) DEFAULT NULL,
  `table_name_maxdate` varchar(255) DEFAULT NULL,
  `field_name_maxdate` varchar(255) DEFAULT NULL,
  `offset_maxdate` double DEFAULT NULL,
  `diff_maxdate` double DEFAULT NULL,
  `created_user` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_user` varchar(255) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `size_rowset` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_transformation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_transformation
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_attribute`;
CREATE TABLE `r_trans_attribute` (
  `id_trans_attribute` bigint(20) NOT NULL,
  `id_transformation` int(11) DEFAULT NULL,
  `nr` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `value_num` bigint(20) DEFAULT NULL,
  `value_str` mediumtext,
  PRIMARY KEY (`id_trans_attribute`),
  UNIQUE KEY `idx_tatt` (`id_transformation`,`code`,`nr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_trans_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_cluster
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_cluster`;
CREATE TABLE `r_trans_cluster` (
  `id_trans_cluster` bigint(20) NOT NULL,
  `id_transformation` int(11) DEFAULT NULL,
  `id_cluster` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_trans_cluster`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_trans_cluster
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_hop
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_hop`;
CREATE TABLE `r_trans_hop` (
  `id_trans_hop` bigint(20) NOT NULL,
  `id_transformation` int(11) DEFAULT NULL,
  `id_step_from` int(11) DEFAULT NULL,
  `id_step_to` int(11) DEFAULT NULL,
  `enabled` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_trans_hop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_trans_hop
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_lock
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_lock`;
CREATE TABLE `r_trans_lock` (
  `id_trans_lock` bigint(20) NOT NULL,
  `id_transformation` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `lock_message` mediumtext,
  `lock_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_trans_lock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_trans_lock
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_note
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_note`;
CREATE TABLE `r_trans_note` (
  `id_transformation` int(11) DEFAULT NULL,
  `id_note` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_trans_note
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_partition_schema
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_partition_schema`;
CREATE TABLE `r_trans_partition_schema` (
  `id_trans_partition_schema` bigint(20) NOT NULL,
  `id_transformation` int(11) DEFAULT NULL,
  `id_partition_schema` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_trans_partition_schema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_trans_partition_schema
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_slave
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_slave`;
CREATE TABLE `r_trans_slave` (
  `id_trans_slave` bigint(20) NOT NULL,
  `id_transformation` int(11) DEFAULT NULL,
  `id_slave` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_trans_slave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_trans_slave
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_step_condition
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_step_condition`;
CREATE TABLE `r_trans_step_condition` (
  `id_transformation` int(11) DEFAULT NULL,
  `id_step` int(11) DEFAULT NULL,
  `id_condition` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_trans_step_condition
-- ----------------------------

-- ----------------------------
-- Table structure for r_user
-- ----------------------------
DROP TABLE IF EXISTS `r_user`;
CREATE TABLE `r_user` (
  `id_user` bigint(20) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `enabled` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_user
-- ----------------------------
INSERT INTO `r_user` VALUES ('1', 'admin', '2be98afc86aa7f2e4cb79ce71da9fa6d4', 'Administrator', 'User manager', 'Y');
INSERT INTO `r_user` VALUES ('2', 'guest', '2be98afc86aa7f2e4cb79ce77cb97bcce', 'Guest account', 'Read-only guest account', 'Y');

-- ----------------------------
-- Table structure for r_value
-- ----------------------------
DROP TABLE IF EXISTS `r_value`;
CREATE TABLE `r_value` (
  `id_value` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value_type` varchar(255) DEFAULT NULL,
  `value_str` varchar(255) DEFAULT NULL,
  `is_null` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_value
-- ----------------------------

-- ----------------------------
-- Table structure for r_version
-- ----------------------------
DROP TABLE IF EXISTS `r_version`;
CREATE TABLE `r_version` (
  `id_version` bigint(20) NOT NULL,
  `major_version` int(11) DEFAULT NULL,
  `minor_version` int(11) DEFAULT NULL,
  `upgrade_date` datetime DEFAULT NULL,
  `is_upgrade` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_version
-- ----------------------------
INSERT INTO `r_version` VALUES ('1', '5', '0', '2017-06-15 14:40:40', 'N');

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
       last_update,
       auto_restart_num,
       repository_code,
       project_code
  from r_job j
--  where j.job_status=2
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
