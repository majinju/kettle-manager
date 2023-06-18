/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.1.22-mysql
 Source Server Type    : MySQL
 Source Server Version : 80024
 Source Host           : 192.168.1.22:3306
 Source Schema         : kettle_default

 Target Server Type    : MySQL
 Target Server Version : 80024
 File Encoding         : 65001

 Date: 04/06/2023 01:16:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for kettle_kz_log
-- ----------------------------
DROP TABLE IF EXISTS `kettle_kz_log`;
CREATE TABLE `kettle_kz_log`  (
  `cjsj` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT (date_format(now(), '%Y%m%d%H%i%S')) COMMENT '创建时间;',
  `gxsj` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT (date_format(now(), '%Y%m%d%H%i%S')) COMMENT '更新时间;',
  `yxx` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '有效性@SYS_COMMON_LJPD;',
  `px` bigint NOT NULL DEFAULT 99999 COMMENT '排序;',
  `kzxx` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '{}' COMMENT '扩展信息;JSON格式',
  `cjrxm` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人姓名;',
  `cjrdm` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人代码@SYS_COMMON_USER;',
  `cjrdwmc` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人单位名称;',
  `cjrdwdm` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人单位代码@SYS_COMMON_ORG;',
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT (REPLACE(UUID(),'-','')) COMMENT '主键;',
  `id_job` bigint NULL DEFAULT NULL COMMENT '作业主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业名称',
  `kssj` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `jssj` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结束时间',
  `yxjg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行结果',
  `rzwj` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志文件',
  `ddjd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调度节点@KETTLE_GLPT_ZYGL_DDJD',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_kz_log_kssj`(`kssj`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'kettle-扩展-作业日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kettle_kz_log
-- ----------------------------
INSERT INTO `kettle_kz_log` VALUES ('20230602160501', '20230602160501', '1', 99999, '{}', NULL, NULL, NULL, NULL, '04A3F785E7394E92AA70F6B555C047A4', 7, '记录本机ip', '20230602160501', NULL, NULL, 'D:\\benma666\\logs\\kettle\\20230602\\记录本机ip_160501.txt', NULL);
INSERT INTO `kettle_kz_log` VALUES ('20230604003052', '20230604003052', '1', 99999, '{}', NULL, NULL, NULL, NULL, '05825DC47B4B4D70BFA9F96762674B0D', 6, 'JobManager', '20230604003052', NULL, NULL, 'F:\\benma666\\logs\\20230604\\JobManager_003052.txt', 'sjsj');
INSERT INTO `kettle_kz_log` VALUES ('20230604004522', '20230604004522', '1', 99999, '{}', NULL, NULL, NULL, NULL, '08B18903B052475DBB6943786A718F04', 7, '记录本机ip', '20230604004522', NULL, NULL, 'D:\\benma666\\logs\\20230604\\记录本机ip_004522.txt', 'sjds');
INSERT INTO `kettle_kz_log` VALUES ('20230603221949', '20230603221949', '1', 99999, '{}', NULL, NULL, NULL, NULL, '11283316FC324D379D2A9D0329124BB4', 6, 'JobManager', '20230603221949', NULL, NULL, 'F:\\benma666\\logs\\20230603\\JobManager_221949.txt', 'sjsj');
INSERT INTO `kettle_kz_log` VALUES ('20230602080824', '20230602080824', '1', 99999, '{}', NULL, NULL, NULL, NULL, '16EB6D2215284D71B1B0CAE8A75AE490', 6, 'JobManager', '20230602080824', NULL, NULL, 'F:\\benma666\\logs\\kettle\\20230602\\JobManager_080824.txt', 'sjsj');
INSERT INTO `kettle_kz_log` VALUES ('20230603224958', '20230603224958', '1', 99999, '{}', NULL, NULL, NULL, NULL, '2088C7AE5421454E9F00ABB4BE88E20C', 7, '记录本机ip', '20230603224958', NULL, NULL, 'D:\\benma666\\logs\\20230603\\记录本机ip_224958.txt', 'sjds');
INSERT INTO `kettle_kz_log` VALUES ('20230604010833', '20230604010833', '1', 99999, '{}', NULL, NULL, NULL, NULL, '28406A40597B496082BD7D2B15847B3F', 7, '记录本机ip', '20230604010833', NULL, NULL, 'D:\\benma666\\logs\\20230604\\记录本机ip_010833.txt', 'sjds');
INSERT INTO `kettle_kz_log` VALUES ('20230603212356', '20230603212356', '1', 99999, '{}', NULL, NULL, NULL, NULL, '29FAF51BFED04503A8A70E194941037C', 6, 'JobManager', '20230603212356', NULL, NULL, 'F:\\benma666\\logs\\20230603\\JobManager_212356.txt', 'sjsj');
INSERT INTO `kettle_kz_log` VALUES ('20230601234832', '20230601234832', '1', 99999, '{}', NULL, NULL, NULL, NULL, '3D591D06CB7B4A14802C7B7D04002C2F', 6, 'JobManager', '20230601234832', NULL, NULL, 'F:\\benma666\\logs\\kettle\\20230601\\JobManager_234832.txt', 'sjsj');
INSERT INTO `kettle_kz_log` VALUES ('20230603222453', '20230603222453', '1', 99999, '{}', NULL, NULL, NULL, NULL, '48C94B61A62A4B95B9D2AE0950A46983', 6, 'JobManager', '20230603222453', NULL, NULL, 'F:\\benma666\\logs\\20230603\\JobManager_222453.txt', 'sjsj');
INSERT INTO `kettle_kz_log` VALUES ('20230603212039', '20230603212039', '1', 99999, '{}', NULL, NULL, NULL, NULL, '53403452B0FA4B72AC94A7F7C437898B', 6, 'JobManager', '20230603212039', NULL, NULL, 'F:\\benma666\\logs\\20230603\\JobManager_212039.txt', 'sjsj');
INSERT INTO `kettle_kz_log` VALUES ('20230602174709', '20230602174709', '1', 99999, '{}', NULL, NULL, NULL, NULL, '58895C69395D49A8A8D73F8E6EDD78C2', 7, '记录本机ip', '20230602174709', NULL, NULL, 'D:\\benma666\\logs\\kettle\\20230602\\记录本机ip_174709.txt', 'sjds');
INSERT INTO `kettle_kz_log` VALUES ('20230603224141', '20230603224141', '1', 99999, '{}', NULL, NULL, NULL, NULL, '59F454AA4DEA44E9978F5822E1D335CF', 7, '记录本机ip', '20230603224141', NULL, NULL, 'D:\\benma666\\logs\\20230603\\记录本机ip_224141.txt', 'sjds');
INSERT INTO `kettle_kz_log` VALUES ('20230602160850', '20230602160850', '1', 99999, '{}', NULL, NULL, NULL, NULL, '5F56471EE23B4D5E826B941FDC5A3DDE', 7, '记录本机ip', '20230602160850', NULL, NULL, 'D:\\benma666\\logs\\kettle\\20230602\\记录本机ip_160850.txt', NULL);
INSERT INTO `kettle_kz_log` VALUES ('20230602160630', '20230602160630', '1', 99999, '{}', NULL, NULL, NULL, NULL, '63D40BC6CBE441D2A06B9AA95CD3C076', 7, '记录本机ip', '20230602160630', NULL, NULL, 'D:\\benma666\\logs\\kettle\\20230602\\记录本机ip_160630.txt', NULL);
INSERT INTO `kettle_kz_log` VALUES ('20230604005416', '20230604005416', '1', 99999, '{}', NULL, NULL, NULL, NULL, '7173702191E145FBA492D8A3E8AA8C24', 7, '记录本机ip', '20230604005416', NULL, NULL, 'D:\\benma666\\logs\\20230604\\记录本机ip_005416.txt', 'sjds');
INSERT INTO `kettle_kz_log` VALUES ('20230602161701', '20230602161701', '1', 99999, '{}', NULL, NULL, NULL, NULL, '71A8093CFC3041EEB6B480733357B953', 7, '记录本机ip', '20230602161701', NULL, NULL, 'D:\\benma666\\logs\\kettle\\20230602\\记录本机ip_161701.txt', NULL);
INSERT INTO `kettle_kz_log` VALUES ('20230603222113', '20230603222113', '1', 99999, '{}', NULL, NULL, NULL, NULL, '982351DB4F0F4B8A9D5F40E07A2F27B3', 6, 'JobManager', '20230603222113', NULL, NULL, 'F:\\benma666\\logs\\20230603\\JobManager_222113.txt', 'sjsj');
INSERT INTO `kettle_kz_log` VALUES ('20230603223759', '20230603223759', '1', 99999, '{}', NULL, NULL, NULL, NULL, 'A953FEE7C05F4050A8B76C01CC60CB8A', 6, 'JobManager', '20230603223759', NULL, NULL, 'F:\\benma666\\logs\\20230603\\JobManager_223759.txt', 'sjsj');
INSERT INTO `kettle_kz_log` VALUES ('20230603235350', '20230603235350', '1', 99999, '{}', NULL, NULL, NULL, NULL, 'ABD1F833B7764441917BA1FCC1380FB4', 6, 'JobManager', '20230603235350', NULL, NULL, 'F:\\benma666\\logs\\20230603\\JobManager_235350.txt', 'sjsj');
INSERT INTO `kettle_kz_log` VALUES ('20230603223537', '20230603223537', '1', 99999, '{}', NULL, NULL, NULL, NULL, 'AEFEBDEAC2C14147815536DF53CCC344', 7, '记录本机ip', '20230603223537', NULL, NULL, 'D:\\benma666\\logs\\20230603\\记录本机ip_223537.txt', 'sjds');
INSERT INTO `kettle_kz_log` VALUES ('20230604001556', '20230604001556', '1', 99999, '{}', NULL, NULL, NULL, NULL, 'B22EDBB385FE48B6A5B8771F79D3FCBE', 7, '记录本机ip', '20230604001556', NULL, NULL, 'D:\\benma666\\logs\\20230604\\记录本机ip_001556.txt', 'sjds');
INSERT INTO `kettle_kz_log` VALUES ('20230603174631', '20230603174631', '1', 99999, '{}', NULL, NULL, NULL, NULL, 'B3D8779B9C734B4AACE83F4B8055D958', 6, 'JobManager', '20230603174631', NULL, NULL, 'F:\\benma666\\logs\\kettle\\20230603\\JobManager_174631.txt', 'sjsj');
INSERT INTO `kettle_kz_log` VALUES ('20230602154614', '20230602154614', '1', 99999, '{}', NULL, NULL, NULL, NULL, 'C522A99C44DB421FB14A88B0C919B90E', 7, '记录本机ip', '20230602154614', NULL, NULL, 'D:\\benma666\\logs\\kettle\\20230602\\记录本机ip_154614.txt', NULL);
INSERT INTO `kettle_kz_log` VALUES ('20230602161206', '20230602161206', '1', 99999, '{}', NULL, NULL, NULL, NULL, 'D06E9B4E85DC4B58932ECD9C0E5435E0', 6, 'JobManager', '20230602161206', NULL, NULL, 'F:\\benma666\\logs\\kettle\\20230602\\JobManager_161206.txt', 'sjsj');
INSERT INTO `kettle_kz_log` VALUES ('20230603234602', '20230603234602', '1', 99999, '{}', NULL, NULL, NULL, NULL, 'EB43A9FF1E9F49C5BDD47D229B8F9A21', 7, '记录本机ip', '20230603234602', NULL, NULL, 'D:\\benma666\\logs\\20230603\\记录本机ip_234602.txt', 'sjds');

-- ----------------------------
-- Table structure for kettle_kz_zycs
-- ----------------------------
DROP TABLE IF EXISTS `kettle_kz_zycs`;
CREATE TABLE `kettle_kz_zycs`  (
  `cjsj` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT (date_format(now(), '%Y%m%d%H%i%S')) COMMENT '创建时间;',
  `gxsj` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT (date_format(now(), '%Y%m%d%H%i%S')) COMMENT '更新时间;',
  `yxx` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '有效性@SYS_COMMON_LJPD;',
  `px` bigint NOT NULL DEFAULT 99999 COMMENT '排序;',
  `kzxx` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '{}' COMMENT '扩展信息;JSON格式',
  `cjrxm` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人姓名;',
  `cjrdm` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人代码@SYS_COMMON_USER;',
  `cjrdwmc` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人单位名称;',
  `cjrdwdm` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人单位代码@SYS_COMMON_ORG;',
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT (REPLACE(UUID(),'-','')) COMMENT '主键;',
  `id_job` bigint NULL DEFAULT NULL COMMENT '作业主键',
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '键',
  `value` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'kettle-扩展-作业参数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kettle_kz_zycs
-- ----------------------------
INSERT INTO `kettle_kz_zycs` VALUES ('20230531235544', '20230531235903', '1', 99999, '{}', NULL, NULL, NULL, NULL, '9a358abfffcb11ed8ef3000c29f304ac', 6, 'code', '234234543s\nfsdfsdfsddf\n\n\n现场111');

-- ----------------------------
-- Table structure for kettle_kz_zykz
-- ----------------------------
DROP TABLE IF EXISTS `kettle_kz_zykz`;
CREATE TABLE `kettle_kz_zykz`  (
  `cjsj` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT (date_format(now(), '%Y%m%d%H%i%S')) COMMENT '创建时间;',
  `gxsj` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT (date_format(now(), '%Y%m%d%H%i%S')) COMMENT '更新时间;',
  `yxx` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '有效性@SYS_COMMON_LJPD;',
  `px` bigint NOT NULL DEFAULT 99999 COMMENT '排序;',
  `kzxx` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '{}' COMMENT '扩展信息;JSON格式',
  `cjrxm` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人姓名;',
  `cjrdm` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人代码@SYS_COMMON_USER;',
  `cjrdwmc` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人单位名称;',
  `cjrdwdm` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人单位代码@SYS_COMMON_ORG;',
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT (REPLACE(UUID(),'-','')) COMMENT '主键;',
  `id_job` bigint NULL DEFAULT NULL COMMENT '作业主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业名称',
  `yxzt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运行状态',
  `zhgxsj` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后更新时间',
  `zdcqcs` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自动重启次数',
  `ddjd` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ddjd',
  `dsms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定时描述',
  `rzjb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '日志级别',
  `zylx` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'cgzy' COMMENT '作业类型@OTHER_KETTLE_ZYLX',
  `gzlj` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作路径',
  `shell` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'shell脚本',
  `sjzt` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据载体',
  `sql` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'sql脚本',
  `js` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'js脚本',
  `kmlm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'KM类名',
  `kmpz` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'KM配置',
  `lydx` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源对象',
  `mbdx` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目标对象',
  `lzmb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '流转模板',
  `gdpz` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '更多配置',
  `srzj` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '输入组件',
  `sczj` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '输出组件',
  `bz` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'kettle-扩展-作业扩展' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kettle_kz_zykz
-- ----------------------------
INSERT INTO `kettle_kz_zykz` VALUES ('20230531141141', '20230531141440', '0', 99999, '{}', NULL, NULL, NULL, NULL, '027525bfff7a11ed8ef3000c29f304ac', 17, NULL, NULL, NULL, NULL, NULL, NULL, '3', 'cgzy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `kettle_kz_zykz` VALUES ('20230531141141', '20230531141440', '0', 99999, '{}', NULL, NULL, NULL, NULL, '02f61446ff7a11ed8ef3000c29f304ac', 18, NULL, NULL, NULL, NULL, NULL, NULL, '3', 'cgzy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `kettle_kz_zykz` VALUES ('20230526142454', '20230601223230', '0', 99999, '{}', NULL, NULL, NULL, NULL, '0768de1bfb8e11ed8ef3000c29f304ac', 15, 'km测试', NULL, NULL, NULL, NULL, NULL, '3', 'KM作业', NULL, NULL, NULL, NULL, NULL, 'cn.benma666.kettle.job.JobManager', '{\n  \n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `kettle_kz_zykz` VALUES ('20230526125920', '20230601223230', '0', 99999, '{}', NULL, NULL, NULL, NULL, '133907fcfb8211ed8ef3000c29f304ac', 13, 'sql测试', NULL, NULL, NULL, NULL, NULL, '3', 'sql作业', NULL, NULL, 'default', 'select 3', NULL, NULL, '{\n  \n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `kettle_kz_zykz` VALUES ('20230521214807', '20230604011638', '1', 99999, '{}', NULL, NULL, NULL, NULL, '1db052f3f7de11edb4ad000c29f304ac', 6, NULL, 'Running', '20230604011638', '0', 'sjsj', '等15秒/重/初', '3', '常规作业', NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \n}', '912769435779405698B51852FB4277DB', '912769435779405698B51852FB4277DB', NULL, NULL, NULL, NULL, '作业运行状态管理任务，会更新所有作业的状态');
INSERT INTO `kettle_kz_zykz` VALUES ('20230601223257', '20230601223322', '1', 99999, '{}', NULL, NULL, NULL, NULL, '33a30f0e008911ee8ef3000c29f304ac', 3, NULL, NULL, NULL, '0', NULL, NULL, '3', '常规作业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `kettle_kz_zykz` VALUES ('20230601223258', '20230601223323', '1', 99999, '{}', NULL, NULL, NULL, NULL, '3439370a008911ee8ef3000c29f304ac', 5, NULL, NULL, NULL, '0', NULL, NULL, '3', '常规作业', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `kettle_kz_zykz` VALUES ('20230526112007', '20230601223301', '1', 99999, '{}', NULL, NULL, NULL, NULL, '36d489eafb7411ed8ef3000c29f304ac', 11, NULL, NULL, NULL, '0', NULL, NULL, '3', '常规作业', NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `kettle_kz_zykz` VALUES ('20230531141318', '20230531141440', '0', 99999, '{}', NULL, NULL, NULL, NULL, '3cc8c3acff7a11ed8ef3000c29f304ac', 19, NULL, NULL, NULL, NULL, NULL, NULL, '3', 'cgzy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `kettle_kz_zykz` VALUES ('20230531141345', '20230531141440', '0', 99999, '{}', NULL, NULL, NULL, NULL, '4cb5ff1bff7a11ed8ef3000c29f304ac', 20, NULL, NULL, NULL, NULL, NULL, NULL, '3', 'sql', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `kettle_kz_zykz` VALUES ('20230524233344', '20230601223259', '0', 99999, '{}', NULL, NULL, NULL, NULL, '5e08eec7fa4811ed8ef3000c29f304ac', 9, '测试js', NULL, NULL, '0', NULL, NULL, '3', '常规作业', NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `kettle_kz_zykz` VALUES ('20230521215024', '20230531151510', '1', 99999, '{}', NULL, NULL, NULL, NULL, '6f5fa061f7de11edb4ad000c29f304ac', 1, NULL, 'Stopped', '20230525231032', NULL, NULL, '等5分0秒/重/初', '3', '常规作业', NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `kettle_kz_zykz` VALUES ('20230521215024', '20230604010833', '1', 99999, '{}', NULL, NULL, NULL, NULL, '6f64261ff7de11edb4ad000c29f304ac', 7, NULL, 'Waiting', '20230604010833', '0', 'sjds', '等1分0秒/重/初', '3', '常规作业', NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \n}', 'SYS_SJGL_SJDX', 'SYS_SJGL_SJDX', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `kettle_kz_zykz` VALUES ('20230531142929', '20230531154719', '0', 99999, '{}', NULL, NULL, NULL, NULL, '7f0aa6faff7c11ed8ef3000c29f304ac', 16, 'shell测试1', NULL, NULL, NULL, NULL, NULL, '3', 'shell作业', '/tmp', 'll', NULL, NULL, NULL, NULL, '{\n  \n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `kettle_kz_zykz` VALUES ('20230526142148', '20230601223230', '0', 99999, '{}', NULL, NULL, NULL, NULL, '989b36b8fb8d11ed8ef3000c29f304ac', 14, 'shell测试', NULL, NULL, NULL, NULL, NULL, '3', 'shell作业', '/tmp', 'll', NULL, NULL, NULL, NULL, '{\n  \n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `kettle_kz_zykz` VALUES ('20230524235009', '20230601223324', '0', 99999, '{}', NULL, NULL, NULL, NULL, 'a9534530fa4a11ed8ef3000c29f304ac', 8, 'jsces1', NULL, NULL, '0', NULL, NULL, '3', '常规作业', NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `kettle_kz_zykz` VALUES ('20230523005803', '20230531151511', '1', 99999, '{}', NULL, NULL, NULL, NULL, 'd0ecef2df8c111edb4ad000c29f304ac', 2, NULL, 'Stopped', '20230523080817', NULL, NULL, '不需要定时', '3', '常规作业', NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `kettle_kz_zykz` VALUES ('20230524233729', '20230601223325', '1', 99999, '{}', NULL, NULL, NULL, NULL, 'e4aa5c29fa4811ed8ef3000c29f304ac', 10, 'sssss', NULL, NULL, '0', NULL, NULL, '3', '常规作业', NULL, NULL, NULL, NULL, NULL, NULL, '{\n  \n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `kettle_kz_zykz` VALUES ('20230526125809', '20230601223230', '0', 99999, '{}', NULL, NULL, NULL, NULL, 'e8d709d0fb8111ed8ef3000c29f304ac', 12, 'js测试2', 'Finished', '20230526173340', NULL, NULL, '不需要定时', '3', 'JS作业', NULL, NULL, NULL, NULL, 'var a;\ntrue;', NULL, '{\n  \n}', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `kettle_kz_zykz` VALUES ('20230531234414', '20230601000922', '1', 99999, '{}', NULL, NULL, NULL, NULL, 'fea43e0affc911ed8ef3000c29f304ac', 22, NULL, 'Waiting', '20230604003051', NULL, 'sjsj', '等15秒/重/初', '3', 'cgzy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for kettle_kz_zyyj
-- ----------------------------
DROP TABLE IF EXISTS `kettle_kz_zyyj`;
CREATE TABLE `kettle_kz_zyyj`  (
  `cjsj` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT (date_format(now(), '%Y%m%d%H%i%S')) COMMENT '创建时间;',
  `gxsj` varchar(14) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT (date_format(now(), '%Y%m%d%H%i%S')) COMMENT '更新时间;',
  `yxx` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '有效性@SYS_COMMON_LJPD;',
  `px` bigint NOT NULL DEFAULT 99999 COMMENT '排序;',
  `kzxx` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '{}' COMMENT '扩展信息;JSON格式',
  `cjrxm` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人姓名;',
  `cjrdm` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人代码@SYS_COMMON_USER;',
  `cjrdwmc` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人单位名称;',
  `cjrdwdm` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人单位代码@SYS_COMMON_ORG;',
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT (REPLACE(UUID(),'-','')) COMMENT '主键;',
  `id_job` bigint NULL DEFAULT NULL COMMENT '作业主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作业名称',
  `rzwj` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志文件',
  `xx` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息',
  `rzjb` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志级别',
  `sz` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属主',
  `rztd` varchar(248) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志通道',
  `sfcw` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否错误',
  `ddjd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调度节点@KETTLE_GLPT_ZYGL_DDJD',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'kettle-扩展-作业预警' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kettle_kz_zyyj
-- ----------------------------

-- ----------------------------
-- Table structure for r_cluster
-- ----------------------------
DROP TABLE IF EXISTS `r_cluster`;
CREATE TABLE `r_cluster`  (
  `ID_CLUSTER` bigint NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BASE_PORT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SOCKETS_BUFFER_SIZE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SOCKETS_FLUSH_INTERVAL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SOCKETS_COMPRESSED` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DYNAMIC_CLUSTER` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_CLUSTER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_cluster
-- ----------------------------

-- ----------------------------
-- Table structure for r_cluster_slave
-- ----------------------------
DROP TABLE IF EXISTS `r_cluster_slave`;
CREATE TABLE `r_cluster_slave`  (
  `ID_CLUSTER_SLAVE` bigint NOT NULL,
  `ID_CLUSTER` int NULL DEFAULT NULL,
  `ID_SLAVE` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID_CLUSTER_SLAVE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_cluster_slave
-- ----------------------------

-- ----------------------------
-- Table structure for r_condition
-- ----------------------------
DROP TABLE IF EXISTS `r_condition`;
CREATE TABLE `r_condition`  (
  `ID_CONDITION` bigint NOT NULL,
  `ID_CONDITION_PARENT` int NULL DEFAULT NULL,
  `NEGATED` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OPERATOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LEFT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CONDITION_FUNCTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RIGHT_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ID_VALUE_RIGHT` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID_CONDITION`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_condition
-- ----------------------------

-- ----------------------------
-- Table structure for r_database
-- ----------------------------
DROP TABLE IF EXISTS `r_database`;
CREATE TABLE `r_database`  (
  `ID_DATABASE` bigint NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ID_DATABASE_TYPE` int NULL DEFAULT NULL,
  `ID_DATABASE_CONTYPE` int NULL DEFAULT NULL,
  `HOST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DATABASE_NAME` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `PORT` int NULL DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SERVERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DATA_TBS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INDEX_TBS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_DATABASE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_database
-- ----------------------------
INSERT INTO `r_database` VALUES (1, 'kettle_default', 37, 5, NULL, 'kettle_default', 1521, NULL, 'Encrypted ', NULL, NULL, NULL);
INSERT INTO `r_database` VALUES (2, 'default', 37, 5, NULL, 'default', -1, NULL, 'Encrypted ', NULL, NULL, NULL);
INSERT INTO `r_database` VALUES (3, 'AgileBI', 29, 1, 'localhost', 'pentaho-instaview', 50000, 'monetdb', 'Encrypted 2be98afc86aa7f2e4cb14a17edb86abd8', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for r_database_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_database_attribute`;
CREATE TABLE `r_database_attribute`  (
  `ID_DATABASE_ATTRIBUTE` bigint NOT NULL,
  `ID_DATABASE` int NULL DEFAULT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VALUE_STR` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_DATABASE_ATTRIBUTE`) USING BTREE,
  UNIQUE INDEX `IDX_RDAT`(`ID_DATABASE`, `CODE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_database_attribute
-- ----------------------------
INSERT INTO `r_database_attribute` VALUES (1748, 3, 'EXTRA_OPTION_MYSQL.defaultFetchSize', '500');
INSERT INTO `r_database_attribute` VALUES (1749, 3, 'EXTRA_OPTION_MYSQL.useCursorFetch', 'true');
INSERT INTO `r_database_attribute` VALUES (1750, 3, 'EXTRA_OPTION_INFOBRIGHT.characterEncoding', 'UTF-8');
INSERT INTO `r_database_attribute` VALUES (1751, 3, 'PORT_NUMBER', '50000');
INSERT INTO `r_database_attribute` VALUES (1752, 2, 'EXTRA_OPTION_MYSQL.useCursorFetch', 'true');
INSERT INTO `r_database_attribute` VALUES (1753, 2, 'EXTRA_OPTION_INFOBRIGHT.characterEncoding', 'UTF-8');
INSERT INTO `r_database_attribute` VALUES (1754, 2, 'INITIAL_POOL_SIZE', '2');
INSERT INTO `r_database_attribute` VALUES (1755, 2, 'USE_POOLING', 'Y');
INSERT INTO `r_database_attribute` VALUES (1756, 2, 'MAXIMUM_POOL_SIZE', '5');
INSERT INTO `r_database_attribute` VALUES (1757, 2, 'POOLING_characterEncoding', 'utf-8');
INSERT INTO `r_database_attribute` VALUES (1758, 2, 'SUPPORTS_TIMESTAMP_DATA_TYPE', 'Y');
INSERT INTO `r_database_attribute` VALUES (1759, 2, 'SUPPORTS_BOOLEAN_DATA_TYPE', 'Y');
INSERT INTO `r_database_attribute` VALUES (1760, 2, 'EXTRA_OPTION_MYSQL.defaultFetchSize', '500');
INSERT INTO `r_database_attribute` VALUES (1761, 2, 'PORT_NUMBER', '-1');
INSERT INTO `r_database_attribute` VALUES (1762, 2, 'POOLING_testWhileIdle', 'true');
INSERT INTO `r_database_attribute` VALUES (1763, 2, 'FORCE_IDENTIFIERS_TO_LOWERCASE', 'Y');
INSERT INTO `r_database_attribute` VALUES (1764, 2, 'POOLING_validationQuery', 'select 1 from dual');
INSERT INTO `r_database_attribute` VALUES (1765, 1, 'USE_POOLING', 'N');
INSERT INTO `r_database_attribute` VALUES (1766, 1, 'PRESERVE_RESERVED_WORD_CASE', 'N');
INSERT INTO `r_database_attribute` VALUES (1767, 1, 'IS_CLUSTERED', 'N');
INSERT INTO `r_database_attribute` VALUES (1768, 1, 'SUPPORTS_TIMESTAMP_DATA_TYPE', 'Y');
INSERT INTO `r_database_attribute` VALUES (1769, 1, 'SUPPORTS_BOOLEAN_DATA_TYPE', 'Y');
INSERT INTO `r_database_attribute` VALUES (1770, 1, 'PORT_NUMBER', '1521');
INSERT INTO `r_database_attribute` VALUES (1771, 1, 'FORCE_IDENTIFIERS_TO_UPPERCASE', 'N');
INSERT INTO `r_database_attribute` VALUES (1772, 1, 'FORCE_IDENTIFIERS_TO_LOWERCASE', 'N');
INSERT INTO `r_database_attribute` VALUES (1773, 1, 'QUOTE_ALL_FIELDS', 'N');

-- ----------------------------
-- Table structure for r_database_contype
-- ----------------------------
DROP TABLE IF EXISTS `r_database_contype`;
CREATE TABLE `r_database_contype`  (
  `ID_DATABASE_CONTYPE` bigint NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_DATABASE_CONTYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_database_contype
-- ----------------------------
INSERT INTO `r_database_contype` VALUES (1, 'Native', 'Native (JDBC)');
INSERT INTO `r_database_contype` VALUES (2, 'ODBC', 'ODBC');
INSERT INTO `r_database_contype` VALUES (3, 'OCI', 'OCI');
INSERT INTO `r_database_contype` VALUES (4, 'Plugin', 'Plugin specific access method');
INSERT INTO `r_database_contype` VALUES (5, 'JNDI', 'JNDI');
INSERT INTO `r_database_contype` VALUES (6, ',', 'Custom');

-- ----------------------------
-- Table structure for r_database_type
-- ----------------------------
DROP TABLE IF EXISTS `r_database_type`;
CREATE TABLE `r_database_type`  (
  `ID_DATABASE_TYPE` bigint NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_DATABASE_TYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_database_type
-- ----------------------------
INSERT INTO `r_database_type` VALUES (1, 'DERBY', 'Apache Derby');
INSERT INTO `r_database_type` VALUES (2, 'AS/400', 'AS/400');
INSERT INTO `r_database_type` VALUES (3, 'INTERBASE', 'Borland Interbase');
INSERT INTO `r_database_type` VALUES (4, 'INFINIDB', 'Calpont InfiniDB');
INSERT INTO `r_database_type` VALUES (5, 'IMPALASIMBA', 'Cloudera Impala');
INSERT INTO `r_database_type` VALUES (6, 'DBASE', 'dBase III, IV or 5');
INSERT INTO `r_database_type` VALUES (7, 'EXASOL4', 'Exasol 4');
INSERT INTO `r_database_type` VALUES (8, 'EXTENDB', 'ExtenDB');
INSERT INTO `r_database_type` VALUES (9, 'FIREBIRD', 'Firebird SQL');
INSERT INTO `r_database_type` VALUES (10, 'GENERIC', 'Generic database');
INSERT INTO `r_database_type` VALUES (11, 'GOOGLEBIGQUERY', 'Google BigQuery');
INSERT INTO `r_database_type` VALUES (12, 'GREENPLUM', 'Greenplum');
INSERT INTO `r_database_type` VALUES (13, 'SQLBASE', 'Gupta SQL Base');
INSERT INTO `r_database_type` VALUES (14, 'H2', 'H2');
INSERT INTO `r_database_type` VALUES (15, 'HIVE', 'Hadoop Hive');
INSERT INTO `r_database_type` VALUES (16, 'HIVE2', 'Hadoop Hive 2/3');
INSERT INTO `r_database_type` VALUES (17, 'HYPERSONIC', 'Hypersonic');
INSERT INTO `r_database_type` VALUES (18, 'DB2', 'IBM DB2');
INSERT INTO `r_database_type` VALUES (19, 'IMPALA', 'Impala');
INSERT INTO `r_database_type` VALUES (20, 'INFOBRIGHT', 'Infobright');
INSERT INTO `r_database_type` VALUES (21, 'INFORMIX', 'Informix');
INSERT INTO `r_database_type` VALUES (22, 'INGRES', 'Ingres');
INSERT INTO `r_database_type` VALUES (23, 'VECTORWISE', 'Ingres VectorWise');
INSERT INTO `r_database_type` VALUES (24, 'CACHE', 'Intersystems Cache');
INSERT INTO `r_database_type` VALUES (25, 'KINGBASEES', 'KingbaseES');
INSERT INTO `r_database_type` VALUES (26, 'LucidDB', 'LucidDB');
INSERT INTO `r_database_type` VALUES (27, 'MARIADB', 'MariaDB');
INSERT INTO `r_database_type` VALUES (28, 'SAPDB', 'MaxDB (SAP DB)');
INSERT INTO `r_database_type` VALUES (29, 'MONETDB', 'MonetDB');
INSERT INTO `r_database_type` VALUES (30, 'MSACCESS', 'MS Access');
INSERT INTO `r_database_type` VALUES (31, 'MSSQL', 'MS SQL Server');
INSERT INTO `r_database_type` VALUES (32, 'MSSQLNATIVE', 'MS SQL Server (Native)');
INSERT INTO `r_database_type` VALUES (33, 'MYSQL', 'MySQL');
INSERT INTO `r_database_type` VALUES (34, 'MONDRIAN', 'Native Mondrian');
INSERT INTO `r_database_type` VALUES (35, 'NEOVIEW', 'Neoview');
INSERT INTO `r_database_type` VALUES (36, 'NETEZZA', 'Netezza');
INSERT INTO `r_database_type` VALUES (37, 'ORACLE', 'Oracle');
INSERT INTO `r_database_type` VALUES (38, 'ORACLERDB', 'Oracle RDB');
INSERT INTO `r_database_type` VALUES (39, 'PALO', 'Palo MOLAP Server');
INSERT INTO `r_database_type` VALUES (40, 'KettleThin', 'Pentaho Data Services');
INSERT INTO `r_database_type` VALUES (41, 'POSTGRESQL', 'PostgreSQL');
INSERT INTO `r_database_type` VALUES (42, 'REDSHIFT', 'Redshift');
INSERT INTO `r_database_type` VALUES (43, 'REMEDY-AR-SYSTEM', 'Remedy Action Request System');
INSERT INTO `r_database_type` VALUES (44, 'SAPR3', 'SAP ERP System');
INSERT INTO `r_database_type` VALUES (45, 'SNOWFLAKEHV', 'Snowflake');
INSERT INTO `r_database_type` VALUES (46, 'SPARKSIMBA', 'SparkSQL');
INSERT INTO `r_database_type` VALUES (47, 'SQLITE', 'SQLite');
INSERT INTO `r_database_type` VALUES (48, 'SYBASE', 'Sybase');
INSERT INTO `r_database_type` VALUES (49, 'SYBASEIQ', 'SybaseIQ');
INSERT INTO `r_database_type` VALUES (50, 'TERADATA', 'Teradata');
INSERT INTO `r_database_type` VALUES (51, 'UNIVERSE', 'UniVerse database');
INSERT INTO `r_database_type` VALUES (52, 'VERTICA', 'Vertica');
INSERT INTO `r_database_type` VALUES (53, 'VERTICA5', 'Vertica 5+');

-- ----------------------------
-- Table structure for r_dependency
-- ----------------------------
DROP TABLE IF EXISTS `r_dependency`;
CREATE TABLE `r_dependency`  (
  `ID_DEPENDENCY` bigint NOT NULL,
  `ID_TRANSFORMATION` int NULL DEFAULT NULL,
  `ID_DATABASE` int NULL DEFAULT NULL,
  `TABLE_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FIELD_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_DEPENDENCY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_dependency
-- ----------------------------

-- ----------------------------
-- Table structure for r_directory
-- ----------------------------
DROP TABLE IF EXISTS `r_directory`;
CREATE TABLE `r_directory`  (
  `ID_DIRECTORY` bigint NOT NULL,
  `ID_DIRECTORY_PARENT` int NULL DEFAULT NULL,
  `DIRECTORY_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_DIRECTORY`) USING BTREE,
  UNIQUE INDEX `IDX_RDIR`(`ID_DIRECTORY_PARENT`, `DIRECTORY_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_directory
-- ----------------------------
INSERT INTO `r_directory` VALUES (3, 0, 'common');
INSERT INTO `r_directory` VALUES (1, 0, 'other');
INSERT INTO `r_directory` VALUES (7, 0, 'sys');
INSERT INTO `r_directory` VALUES (5, 0, 'template');
INSERT INTO `r_directory` VALUES (10, 0, 'test');
INSERT INTO `r_directory` VALUES (9, 1, 'shell');
INSERT INTO `r_directory` VALUES (2, 1, '获取公网ip');
INSERT INTO `r_directory` VALUES (6, 5, '对象流转');
INSERT INTO `r_directory` VALUES (8, 7, '记录本机ip');

-- ----------------------------
-- Table structure for r_element
-- ----------------------------
DROP TABLE IF EXISTS `r_element`;
CREATE TABLE `r_element`  (
  `ID_ELEMENT` bigint NOT NULL,
  `ID_ELEMENT_TYPE` int NULL DEFAULT NULL,
  `NAME` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_ELEMENT`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_element
-- ----------------------------

-- ----------------------------
-- Table structure for r_element_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_element_attribute`;
CREATE TABLE `r_element_attribute`  (
  `ID_ELEMENT_ATTRIBUTE` bigint NOT NULL,
  `ID_ELEMENT` int NULL DEFAULT NULL,
  `ID_ELEMENT_ATTRIBUTE_PARENT` int NULL DEFAULT NULL,
  `ATTR_KEY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ATTR_VALUE` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_ELEMENT_ATTRIBUTE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_element_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for r_element_type
-- ----------------------------
DROP TABLE IF EXISTS `r_element_type`;
CREATE TABLE `r_element_type`  (
  `ID_ELEMENT_TYPE` bigint NOT NULL,
  `ID_NAMESPACE` int NULL DEFAULT NULL,
  `NAME` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_ELEMENT_TYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_element_type
-- ----------------------------

-- ----------------------------
-- Table structure for r_job
-- ----------------------------
DROP TABLE IF EXISTS `r_job`;
CREATE TABLE `r_job`  (
  `ID_JOB` bigint NOT NULL,
  `ID_DIRECTORY` int NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `EXTENDED_DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `JOB_VERSION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `JOB_STATUS` int NULL DEFAULT NULL,
  `ID_DATABASE_LOG` int NULL DEFAULT NULL,
  `TABLE_NAME_LOG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATED_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATED_DATE` datetime NULL DEFAULT NULL,
  `MODIFIED_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime NULL DEFAULT NULL,
  `USE_BATCH_ID` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASS_BATCH_ID` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USE_LOGFIELD` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SHARED_FILE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_JOB`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_job
-- ----------------------------
INSERT INTO `r_job` VALUES (1, 2, '获取公网ip', '获取公网ip', '{\n  \n}', '99', 2, -1, NULL, 'admin', '2020-08-21 09:50:53', '系统管理员', '2023-05-31 15:15:10', '1', '0', '1', NULL);
INSERT INTO `r_job` VALUES (2, 9, '启动frpc', '启动frpc', '{\n  \n}', '99', 2, -1, NULL, 'BC5D77315CA84C6C807988E3CD17E70D', '2021-06-11 14:00:47', '系统管理员', '2023-05-31 15:15:11', '1', '0', '1', NULL);
INSERT INTO `r_job` VALUES (3, 3, '流转公用作业', NULL, NULL, '01', 0, -1, NULL, 'admin', '2019-12-07 21:01:36', '系统管理员', '2023-06-01 22:33:22', '1', '0', '1', NULL);
INSERT INTO `r_job` VALUES (5, 6, '模板作业', NULL, NULL, '01', 1, -1, NULL, 'admin', '2019-12-07 21:01:39', '系统管理员', '2023-06-01 22:33:23', '1', '0', '1', NULL);
INSERT INTO `r_job` VALUES (6, 7, 'JobManager', '作业管理器', '{\r\n  \r\n}', '01', 2, -1, NULL, '管理员', '2020-08-20 11:35:35', '系统管理员', '2023-05-31 15:15:08', '1', '0', '1', NULL);
INSERT INTO `r_job` VALUES (7, 8, '记录本机ip', '记录本机ip', '{\n  \n}', '99', 2, -1, NULL, 'admin', '2023-05-19 11:33:35', '系统管理员', '2023-05-31 15:48:26', '1', '0', '1', NULL);
INSERT INTO `r_job` VALUES (8, 5, 'km', 'km模板', '{\n  \n}', '01', 1, -1, NULL, '-', '2017-06-14 09:33:19', '系统管理员', '2023-06-01 22:33:24', '1', '0', '1', NULL);
INSERT INTO `r_job` VALUES (9, 5, 'javascript', 'js模板', '{\n  \n}', '01', 1, -1, NULL, '-', '2017-06-14 09:28:51', '系统管理员', '2023-06-01 22:32:59', '1', '0', '1', NULL);
INSERT INTO `r_job` VALUES (10, 5, 'shell', 'shell模板', '{\n  \n}', '01', 1, -1, NULL, '-', '2017-06-13 21:55:57', '系统管理员', '2023-06-01 22:33:25', '1', '0', '1', NULL);
INSERT INTO `r_job` VALUES (11, 5, 'sql', 'sql模板', '{\n  \n}', '01', 1, -1, NULL, '-', '2017-06-14 09:27:34', '系统管理员', '2023-06-01 22:33:01', '1', '0', '1', NULL);

-- ----------------------------
-- Table structure for r_job_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_job_attribute`;
CREATE TABLE `r_job_attribute`  (
  `ID_JOB_ATTRIBUTE` bigint NOT NULL,
  `ID_JOB` int NULL DEFAULT NULL,
  `NR` int NULL DEFAULT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VALUE_NUM` bigint NULL DEFAULT NULL,
  `VALUE_STR` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_JOB_ATTRIBUTE`) USING BTREE,
  UNIQUE INDEX `IDX_JATT`(`ID_JOB`, `CODE`, `NR`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_job_attribute
-- ----------------------------
INSERT INTO `r_job_attribute` VALUES (5404, 6, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5405, 6, 0, 'JOB_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5406, 6, 0, 'JOB_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5407, 6, 0, 'JOB_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5408, 6, 0, 'JOB_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5409, 6, 0, 'JOB_LOG_TABLE_FIELD_ID0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (5410, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (5411, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5412, 6, 0, 'JOB_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (5413, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (5414, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5415, 6, 0, 'JOB_LOG_TABLE_FIELD_ID2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (5416, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (5417, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5418, 6, 0, 'JOB_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (5419, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (5420, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5421, 6, 0, 'JOB_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (5422, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (5423, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5424, 6, 0, 'JOB_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (5425, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (5426, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5427, 6, 0, 'JOB_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (5428, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (5429, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5430, 6, 0, 'JOB_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (5431, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (5432, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5433, 6, 0, 'JOB_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (5434, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (5435, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5436, 6, 0, 'JOB_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (5437, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (5438, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5439, 6, 0, 'JOB_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (5440, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (5441, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5442, 6, 0, 'JOB_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (5443, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (5444, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5445, 6, 0, 'JOB_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (5446, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (5447, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5448, 6, 0, 'JOB_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (5449, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (5450, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5451, 6, 0, 'JOB_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (5452, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (5453, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5454, 6, 0, 'JOB_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (5455, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (5456, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5457, 6, 0, 'JOB_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (5458, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (5459, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5460, 6, 0, 'JOB_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (5461, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (5462, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (5463, 6, 0, 'JOB_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (5464, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (5465, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (5466, 6, 0, 'JOB_LOG_TABLE_FIELD_ID19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (5467, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (5468, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (5469, 6, 0, 'JOB_LOG_TABLE_FIELD_ID20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (5470, 6, 0, 'JOB_LOG_TABLE_FIELD_NAME20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (5471, 6, 0, 'JOB_LOG_TABLE_FIELD_ENABLED20', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (5472, 6, 0, 'JOBLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5473, 6, 0, 'JOBLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5474, 6, 0, 'JOB_ENTRY_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5475, 6, 0, 'JOB_ENTRY_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5476, 6, 0, 'JOB_ENTRY_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5477, 6, 0, 'JOB_ENTRY_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5478, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (5479, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (5480, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5481, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (5482, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (5483, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5484, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (5485, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (5486, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5487, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID3', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (5488, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_job_attribute` VALUES (5489, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5490, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID4', 0, 'JOBENTRYNAME');
INSERT INTO `r_job_attribute` VALUES (5491, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_job_attribute` VALUES (5492, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5493, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (5494, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (5495, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5496, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (5497, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (5498, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5499, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (5500, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (5501, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5502, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (5503, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (5504, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5505, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (5506, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (5507, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5508, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (5509, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (5510, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5511, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (5512, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (5513, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5514, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (5515, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (5516, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5517, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (5518, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (5519, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5520, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (5521, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (5522, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5523, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (5524, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (5525, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED15', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (5526, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (5527, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (5528, 6, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED16', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (5529, 6, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5530, 6, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5531, 6, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5532, 6, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5533, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (5534, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (5535, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5536, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (5537, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (5538, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5539, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (5540, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (5541, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5542, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (5543, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (5544, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5545, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (5546, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (5547, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5548, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (5549, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (5550, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5551, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (5552, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (5553, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5554, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (5555, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (5556, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5557, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (5558, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (5559, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5560, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (5561, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (5562, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5563, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (5564, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (5565, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5566, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (5567, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (5568, 6, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5569, 6, 0, 'PARAM_KEY', 0, 'code');
INSERT INTO `r_job_attribute` VALUES (5570, 6, 0, 'PARAM_DEFAULT', 0, 'mrz');
INSERT INTO `r_job_attribute` VALUES (5571, 6, 0, 'PARAM_DESC', 0, '测试描述');
INSERT INTO `r_job_attribute` VALUES (5902, 1, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5903, 1, 0, 'JOB_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5904, 1, 0, 'JOB_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5905, 1, 0, 'JOB_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5906, 1, 0, 'JOB_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5907, 1, 0, 'JOB_LOG_TABLE_FIELD_ID0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (5908, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (5909, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5910, 1, 0, 'JOB_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (5911, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (5912, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5913, 1, 0, 'JOB_LOG_TABLE_FIELD_ID2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (5914, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (5915, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5916, 1, 0, 'JOB_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (5917, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (5918, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5919, 1, 0, 'JOB_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (5920, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (5921, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5922, 1, 0, 'JOB_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (5923, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (5924, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5925, 1, 0, 'JOB_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (5926, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (5927, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5928, 1, 0, 'JOB_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (5929, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (5930, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5931, 1, 0, 'JOB_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (5932, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (5933, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5934, 1, 0, 'JOB_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (5935, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (5936, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5937, 1, 0, 'JOB_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (5938, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (5939, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5940, 1, 0, 'JOB_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (5941, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (5942, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5943, 1, 0, 'JOB_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (5944, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (5945, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5946, 1, 0, 'JOB_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (5947, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (5948, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5949, 1, 0, 'JOB_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (5950, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (5951, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5952, 1, 0, 'JOB_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (5953, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (5954, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5955, 1, 0, 'JOB_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (5956, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (5957, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5958, 1, 0, 'JOB_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (5959, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (5960, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (5961, 1, 0, 'JOB_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (5962, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (5963, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (5964, 1, 0, 'JOB_LOG_TABLE_FIELD_ID19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (5965, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (5966, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (5967, 1, 0, 'JOB_LOG_TABLE_FIELD_ID20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (5968, 1, 0, 'JOB_LOG_TABLE_FIELD_NAME20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (5969, 1, 0, 'JOB_LOG_TABLE_FIELD_ENABLED20', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (5970, 1, 0, 'JOBLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5971, 1, 0, 'JOBLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5972, 1, 0, 'JOB_ENTRY_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5973, 1, 0, 'JOB_ENTRY_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5974, 1, 0, 'JOB_ENTRY_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5975, 1, 0, 'JOB_ENTRY_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (5976, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (5977, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (5978, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5979, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (5980, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (5981, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5982, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (5983, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (5984, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5985, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID3', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (5986, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_job_attribute` VALUES (5987, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5988, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID4', 0, 'JOBENTRYNAME');
INSERT INTO `r_job_attribute` VALUES (5989, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_job_attribute` VALUES (5990, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5991, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (5992, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (5993, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5994, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (5995, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (5996, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (5997, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (5998, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (5999, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6000, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (6001, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (6002, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6003, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (6004, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (6005, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6006, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (6007, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (6008, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6009, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (6010, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (6011, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6012, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (6013, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (6014, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6015, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (6016, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (6017, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6018, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (6019, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (6020, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6021, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (6022, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (6023, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED15', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (6024, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (6025, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (6026, 1, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED16', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (6027, 1, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6028, 1, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6029, 1, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6030, 1, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6031, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (6032, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (6033, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6034, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (6035, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (6036, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6037, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (6038, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (6039, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6040, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (6041, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (6042, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6043, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (6044, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (6045, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6046, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (6047, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (6048, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6049, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (6050, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (6051, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6052, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (6053, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (6054, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6055, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (6056, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (6057, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6058, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (6059, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (6060, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6061, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (6062, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (6063, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6064, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (6065, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (6066, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6067, 2, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6068, 2, 0, 'JOB_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6069, 2, 0, 'JOB_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6070, 2, 0, 'JOB_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6071, 2, 0, 'JOB_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6072, 2, 0, 'JOB_LOG_TABLE_FIELD_ID0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (6073, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (6074, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6075, 2, 0, 'JOB_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (6076, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (6077, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6078, 2, 0, 'JOB_LOG_TABLE_FIELD_ID2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (6079, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (6080, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6081, 2, 0, 'JOB_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (6082, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (6083, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6084, 2, 0, 'JOB_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (6085, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (6086, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6087, 2, 0, 'JOB_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (6088, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (6089, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6090, 2, 0, 'JOB_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (6091, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (6092, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6093, 2, 0, 'JOB_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (6094, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (6095, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6096, 2, 0, 'JOB_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (6097, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (6098, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6099, 2, 0, 'JOB_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (6100, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (6101, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6102, 2, 0, 'JOB_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (6103, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (6104, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6105, 2, 0, 'JOB_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (6106, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (6107, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6108, 2, 0, 'JOB_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (6109, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (6110, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6111, 2, 0, 'JOB_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (6112, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (6113, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6114, 2, 0, 'JOB_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (6115, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (6116, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6117, 2, 0, 'JOB_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (6118, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (6119, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6120, 2, 0, 'JOB_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (6121, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (6122, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6123, 2, 0, 'JOB_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (6124, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (6125, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (6126, 2, 0, 'JOB_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (6127, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (6128, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (6129, 2, 0, 'JOB_LOG_TABLE_FIELD_ID19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (6130, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (6131, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (6132, 2, 0, 'JOB_LOG_TABLE_FIELD_ID20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (6133, 2, 0, 'JOB_LOG_TABLE_FIELD_NAME20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (6134, 2, 0, 'JOB_LOG_TABLE_FIELD_ENABLED20', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (6135, 2, 0, 'JOBLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6136, 2, 0, 'JOBLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6137, 2, 0, 'JOB_ENTRY_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6138, 2, 0, 'JOB_ENTRY_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6139, 2, 0, 'JOB_ENTRY_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6140, 2, 0, 'JOB_ENTRY_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6141, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (6142, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (6143, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6144, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (6145, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (6146, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6147, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (6148, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (6149, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6150, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID3', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (6151, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_job_attribute` VALUES (6152, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6153, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID4', 0, 'JOBENTRYNAME');
INSERT INTO `r_job_attribute` VALUES (6154, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_job_attribute` VALUES (6155, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6156, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (6157, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (6158, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6159, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (6160, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (6161, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6162, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (6163, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (6164, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6165, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (6166, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (6167, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6168, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (6169, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (6170, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6171, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (6172, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (6173, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6174, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (6175, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (6176, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6177, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (6178, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (6179, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6180, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (6181, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (6182, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6183, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (6184, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (6185, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6186, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (6187, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (6188, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED15', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (6189, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (6190, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (6191, 2, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED16', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (6192, 2, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6193, 2, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6194, 2, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6195, 2, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (6196, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (6197, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (6198, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6199, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (6200, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (6201, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6202, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (6203, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (6204, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6205, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (6206, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (6207, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6208, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (6209, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (6210, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6211, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (6212, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (6213, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6214, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (6215, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (6216, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6217, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (6218, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (6219, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6220, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (6221, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (6222, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6223, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (6224, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (6225, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6226, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (6227, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (6228, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (6229, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (6230, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (6231, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7387, 7, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (7388, 7, 0, 'JOB_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (7389, 7, 0, 'JOB_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (7390, 7, 0, 'JOB_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (7391, 7, 0, 'JOB_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (7392, 7, 0, 'JOB_LOG_TABLE_FIELD_ID0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (7393, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (7394, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7395, 7, 0, 'JOB_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (7396, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (7397, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7398, 7, 0, 'JOB_LOG_TABLE_FIELD_ID2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (7399, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (7400, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7401, 7, 0, 'JOB_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (7402, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (7403, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7404, 7, 0, 'JOB_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (7405, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (7406, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7407, 7, 0, 'JOB_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (7408, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (7409, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7410, 7, 0, 'JOB_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (7411, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (7412, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7413, 7, 0, 'JOB_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (7414, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (7415, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7416, 7, 0, 'JOB_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (7417, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (7418, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7419, 7, 0, 'JOB_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (7420, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (7421, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7422, 7, 0, 'JOB_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (7423, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (7424, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7425, 7, 0, 'JOB_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (7426, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (7427, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7428, 7, 0, 'JOB_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (7429, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (7430, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7431, 7, 0, 'JOB_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (7432, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (7433, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7434, 7, 0, 'JOB_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (7435, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (7436, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7437, 7, 0, 'JOB_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (7438, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (7439, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7440, 7, 0, 'JOB_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (7441, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (7442, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7443, 7, 0, 'JOB_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (7444, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (7445, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (7446, 7, 0, 'JOB_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (7447, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (7448, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (7449, 7, 0, 'JOB_LOG_TABLE_FIELD_ID19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (7450, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (7451, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (7452, 7, 0, 'JOB_LOG_TABLE_FIELD_ID20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (7453, 7, 0, 'JOB_LOG_TABLE_FIELD_NAME20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (7454, 7, 0, 'JOB_LOG_TABLE_FIELD_ENABLED20', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (7455, 7, 0, 'JOBLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (7456, 7, 0, 'JOBLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (7457, 7, 0, 'JOB_ENTRY_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (7458, 7, 0, 'JOB_ENTRY_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (7459, 7, 0, 'JOB_ENTRY_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (7460, 7, 0, 'JOB_ENTRY_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (7461, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (7462, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (7463, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7464, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (7465, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (7466, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7467, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (7468, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (7469, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7470, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID3', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (7471, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_job_attribute` VALUES (7472, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7473, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID4', 0, 'JOBENTRYNAME');
INSERT INTO `r_job_attribute` VALUES (7474, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_job_attribute` VALUES (7475, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7476, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (7477, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (7478, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7479, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (7480, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (7481, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7482, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (7483, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (7484, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7485, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (7486, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (7487, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7488, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (7489, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (7490, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7491, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (7492, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (7493, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7494, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (7495, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (7496, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7497, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (7498, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (7499, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7500, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (7501, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (7502, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7503, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (7504, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (7505, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7506, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (7507, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (7508, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED15', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (7509, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (7510, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (7511, 7, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED16', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (7512, 7, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (7513, 7, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (7514, 7, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (7515, 7, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (7516, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (7517, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (7518, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7519, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (7520, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (7521, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7522, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (7523, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (7524, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7525, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (7526, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (7527, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7528, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (7529, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (7530, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7531, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (7532, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (7533, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7534, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (7535, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (7536, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7537, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (7538, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (7539, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7540, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (7541, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (7542, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7543, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (7544, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (7545, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7546, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (7547, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (7548, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (7549, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (7550, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (7551, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8164, 9, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8165, 9, 0, 'JOB_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8166, 9, 0, 'JOB_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8167, 9, 0, 'JOB_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8168, 9, 0, 'JOB_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8169, 9, 0, 'JOB_LOG_TABLE_FIELD_ID0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (8170, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (8171, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8172, 9, 0, 'JOB_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8173, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8174, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8175, 9, 0, 'JOB_LOG_TABLE_FIELD_ID2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (8176, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (8177, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8178, 9, 0, 'JOB_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (8179, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (8180, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8181, 9, 0, 'JOB_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (8182, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (8183, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8184, 9, 0, 'JOB_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (8185, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (8186, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8187, 9, 0, 'JOB_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (8188, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (8189, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8190, 9, 0, 'JOB_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (8191, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (8192, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8193, 9, 0, 'JOB_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (8194, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (8195, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8196, 9, 0, 'JOB_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (8197, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (8198, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8199, 9, 0, 'JOB_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (8200, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (8201, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8202, 9, 0, 'JOB_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (8203, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (8204, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8205, 9, 0, 'JOB_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (8206, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (8207, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8208, 9, 0, 'JOB_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (8209, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (8210, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8211, 9, 0, 'JOB_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (8212, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (8213, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8214, 9, 0, 'JOB_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (8215, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (8216, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8217, 9, 0, 'JOB_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (8218, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (8219, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8220, 9, 0, 'JOB_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (8221, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (8222, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8223, 9, 0, 'JOB_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (8224, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (8225, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8226, 9, 0, 'JOB_LOG_TABLE_FIELD_ID19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (8227, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (8228, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8229, 9, 0, 'JOB_LOG_TABLE_FIELD_ID20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (8230, 9, 0, 'JOB_LOG_TABLE_FIELD_NAME20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (8231, 9, 0, 'JOB_LOG_TABLE_FIELD_ENABLED20', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8232, 9, 0, 'JOBLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8233, 9, 0, 'JOBLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8234, 9, 0, 'JOB_ENTRY_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8235, 9, 0, 'JOB_ENTRY_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8236, 9, 0, 'JOB_ENTRY_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8237, 9, 0, 'JOB_ENTRY_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8238, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (8239, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (8240, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8241, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8242, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8243, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8244, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (8245, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (8246, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8247, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID3', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (8248, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_job_attribute` VALUES (8249, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8250, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID4', 0, 'JOBENTRYNAME');
INSERT INTO `r_job_attribute` VALUES (8251, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_job_attribute` VALUES (8252, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8253, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (8254, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (8255, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8256, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (8257, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (8258, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8259, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (8260, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (8261, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8262, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (8263, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (8264, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8265, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (8266, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (8267, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8268, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (8269, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (8270, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8271, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (8272, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (8273, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8274, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (8275, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (8276, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8277, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (8278, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (8279, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8280, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (8281, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (8282, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8283, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (8284, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (8285, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED15', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8286, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (8287, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (8288, 9, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED16', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8289, 9, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8290, 9, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8291, 9, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8292, 9, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8293, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (8294, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (8295, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8296, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8297, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8298, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8299, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (8300, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (8301, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8302, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (8303, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (8304, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8305, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (8306, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (8307, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8308, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (8309, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (8310, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8311, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (8312, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (8313, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8314, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (8315, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (8316, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8317, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (8318, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (8319, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8320, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (8321, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (8322, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8323, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8324, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8325, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8326, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8327, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8328, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8494, 11, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8495, 11, 0, 'JOB_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8496, 11, 0, 'JOB_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8497, 11, 0, 'JOB_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8498, 11, 0, 'JOB_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8499, 11, 0, 'JOB_LOG_TABLE_FIELD_ID0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (8500, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (8501, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8502, 11, 0, 'JOB_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8503, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8504, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8505, 11, 0, 'JOB_LOG_TABLE_FIELD_ID2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (8506, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (8507, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8508, 11, 0, 'JOB_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (8509, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (8510, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8511, 11, 0, 'JOB_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (8512, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (8513, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8514, 11, 0, 'JOB_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (8515, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (8516, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8517, 11, 0, 'JOB_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (8518, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (8519, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8520, 11, 0, 'JOB_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (8521, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (8522, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8523, 11, 0, 'JOB_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (8524, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (8525, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8526, 11, 0, 'JOB_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (8527, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (8528, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8529, 11, 0, 'JOB_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (8530, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (8531, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8532, 11, 0, 'JOB_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (8533, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (8534, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8535, 11, 0, 'JOB_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (8536, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (8537, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8538, 11, 0, 'JOB_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (8539, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (8540, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8541, 11, 0, 'JOB_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (8542, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (8543, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8544, 11, 0, 'JOB_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (8545, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (8546, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8547, 11, 0, 'JOB_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (8548, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (8549, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8550, 11, 0, 'JOB_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (8551, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (8552, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8553, 11, 0, 'JOB_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (8554, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (8555, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8556, 11, 0, 'JOB_LOG_TABLE_FIELD_ID19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (8557, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (8558, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8559, 11, 0, 'JOB_LOG_TABLE_FIELD_ID20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (8560, 11, 0, 'JOB_LOG_TABLE_FIELD_NAME20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (8561, 11, 0, 'JOB_LOG_TABLE_FIELD_ENABLED20', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8562, 11, 0, 'JOBLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8563, 11, 0, 'JOBLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8564, 11, 0, 'JOB_ENTRY_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8565, 11, 0, 'JOB_ENTRY_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8566, 11, 0, 'JOB_ENTRY_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8567, 11, 0, 'JOB_ENTRY_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8568, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (8569, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (8570, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8571, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8572, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8573, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8574, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (8575, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (8576, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8577, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID3', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (8578, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_job_attribute` VALUES (8579, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8580, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID4', 0, 'JOBENTRYNAME');
INSERT INTO `r_job_attribute` VALUES (8581, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_job_attribute` VALUES (8582, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8583, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (8584, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (8585, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8586, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (8587, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (8588, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8589, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (8590, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (8591, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8592, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (8593, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (8594, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8595, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (8596, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (8597, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8598, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (8599, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (8600, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8601, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (8602, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (8603, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8604, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (8605, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (8606, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8607, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (8608, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (8609, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8610, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (8611, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (8612, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8613, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (8614, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (8615, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED15', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8616, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (8617, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (8618, 11, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED16', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8619, 11, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8620, 11, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8621, 11, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8622, 11, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8623, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (8624, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (8625, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8626, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8627, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8628, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8629, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (8630, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (8631, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8632, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (8633, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (8634, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8635, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (8636, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (8637, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8638, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (8639, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (8640, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8641, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (8642, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (8643, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8644, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (8645, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (8646, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8647, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (8648, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (8649, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8650, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (8651, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (8652, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8653, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8654, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8655, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8656, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8657, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8658, 11, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8659, 3, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8660, 3, 0, 'JOB_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8661, 3, 0, 'JOB_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8662, 3, 0, 'JOB_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8663, 3, 0, 'JOB_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8664, 3, 0, 'JOB_LOG_TABLE_FIELD_ID0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (8665, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (8666, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8667, 3, 0, 'JOB_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8668, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8669, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8670, 3, 0, 'JOB_LOG_TABLE_FIELD_ID2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (8671, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (8672, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8673, 3, 0, 'JOB_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (8674, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (8675, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8676, 3, 0, 'JOB_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (8677, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (8678, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8679, 3, 0, 'JOB_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (8680, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (8681, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8682, 3, 0, 'JOB_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (8683, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (8684, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8685, 3, 0, 'JOB_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (8686, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (8687, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8688, 3, 0, 'JOB_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (8689, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (8690, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8691, 3, 0, 'JOB_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (8692, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (8693, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8694, 3, 0, 'JOB_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (8695, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (8696, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8697, 3, 0, 'JOB_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (8698, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (8699, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8700, 3, 0, 'JOB_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (8701, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (8702, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8703, 3, 0, 'JOB_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (8704, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (8705, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8706, 3, 0, 'JOB_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (8707, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (8708, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8709, 3, 0, 'JOB_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (8710, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (8711, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8712, 3, 0, 'JOB_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (8713, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (8714, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8715, 3, 0, 'JOB_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (8716, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (8717, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8718, 3, 0, 'JOB_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (8719, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (8720, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8721, 3, 0, 'JOB_LOG_TABLE_FIELD_ID19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (8722, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (8723, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8724, 3, 0, 'JOB_LOG_TABLE_FIELD_ID20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (8725, 3, 0, 'JOB_LOG_TABLE_FIELD_NAME20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (8726, 3, 0, 'JOB_LOG_TABLE_FIELD_ENABLED20', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8727, 3, 0, 'JOBLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8728, 3, 0, 'JOBLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8729, 3, 0, 'JOB_ENTRY_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8730, 3, 0, 'JOB_ENTRY_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8731, 3, 0, 'JOB_ENTRY_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8732, 3, 0, 'JOB_ENTRY_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8733, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (8734, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (8735, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8736, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8737, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8738, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8739, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (8740, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (8741, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8742, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID3', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (8743, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_job_attribute` VALUES (8744, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8745, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID4', 0, 'JOBENTRYNAME');
INSERT INTO `r_job_attribute` VALUES (8746, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_job_attribute` VALUES (8747, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8748, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (8749, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (8750, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8751, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (8752, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (8753, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8754, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (8755, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (8756, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8757, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (8758, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (8759, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8760, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (8761, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (8762, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8763, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (8764, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (8765, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8766, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (8767, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (8768, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8769, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (8770, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (8771, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8772, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (8773, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (8774, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8775, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (8776, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (8777, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8778, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (8779, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (8780, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED15', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8781, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (8782, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (8783, 3, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED16', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8784, 3, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8785, 3, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8786, 3, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8787, 3, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8788, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (8789, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (8790, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8791, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8792, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8793, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8794, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (8795, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (8796, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8797, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (8798, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (8799, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8800, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (8801, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (8802, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8803, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (8804, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (8805, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8806, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (8807, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (8808, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8809, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (8810, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (8811, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8812, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (8813, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (8814, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8815, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (8816, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (8817, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8818, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8819, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8820, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8821, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8822, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8823, 3, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8824, 3, 0, 'PARAM_KEY', 0, 'BDWJ_CLHWJ');
INSERT INTO `r_job_attribute` VALUES (8825, 3, 0, 'PARAM_DEFAULT', 0, '/tmp/sjlzclhwj/');
INSERT INTO `r_job_attribute` VALUES (8826, 3, 0, 'PARAM_DESC', 0, '本地文件-处理后的文件');
INSERT INTO `r_job_attribute` VALUES (8827, 3, 1, 'PARAM_KEY', 0, 'BDWJ_CLSBWJ');
INSERT INTO `r_job_attribute` VALUES (8828, 3, 1, 'PARAM_DEFAULT', 0, '/tmp/sjlzclsbwj/');
INSERT INTO `r_job_attribute` VALUES (8829, 3, 1, 'PARAM_DESC', 0, '本地文件-处理失败的文件');
INSERT INTO `r_job_attribute` VALUES (8830, 3, 2, 'PARAM_KEY', 0, 'CLZH_NAME');
INSERT INTO `r_job_attribute` VALUES (8831, 3, 2, 'PARAM_DEFAULT', 0, '处理转换');
INSERT INTO `r_job_attribute` VALUES (8832, 3, 2, 'PARAM_DESC', 0, '处理转换名称');
INSERT INTO `r_job_attribute` VALUES (8833, 3, 3, 'PARAM_KEY', 0, 'CLZH_PATH');
INSERT INTO `r_job_attribute` VALUES (8834, 3, 3, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8835, 3, 3, 'PARAM_DESC', 0, '处理转换路径');
INSERT INTO `r_job_attribute` VALUES (8836, 3, 4, 'PARAM_KEY', 0, 'DDKETTLE');
INSERT INTO `r_job_attribute` VALUES (8837, 3, 4, 'PARAM_DEFAULT', 0, '123190AB67534D9A93A54BA2114B1D67');
INSERT INTO `r_job_attribute` VALUES (8838, 3, 4, 'PARAM_DESC', 0, '调度kettle');
INSERT INTO `r_job_attribute` VALUES (8839, 3, 5, 'PARAM_KEY', 0, 'FTP_LSGML');
INSERT INTO `r_job_attribute` VALUES (8840, 3, 5, 'PARAM_DEFAULT', 0, '/tmp/sjlzlswj/');
INSERT INTO `r_job_attribute` VALUES (8841, 3, 5, 'PARAM_DESC', 0, 'FTP临时根目录');
INSERT INTO `r_job_attribute` VALUES (8842, 3, 6, 'PARAM_KEY', 0, 'GGZY_CLHGZ');
INSERT INTO `r_job_attribute` VALUES (8843, 3, 6, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8844, 3, 6, 'PARAM_DESC', 0, '公用作业-处理后工作');
INSERT INTO `r_job_attribute` VALUES (8845, 3, 7, 'PARAM_KEY', 0, 'GGZY_CLQGZ');
INSERT INTO `r_job_attribute` VALUES (8846, 3, 7, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8847, 3, 7, 'PARAM_DESC', 0, '公用作业-处理前工作');
INSERT INTO `r_job_attribute` VALUES (8848, 3, 8, 'PARAM_KEY', 0, 'GGZY_CLSBGZ');
INSERT INTO `r_job_attribute` VALUES (8849, 3, 8, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8850, 3, 8, 'PARAM_DESC', 0, '公用作业-处理失败工作');
INSERT INTO `r_job_attribute` VALUES (8851, 3, 9, 'PARAM_KEY', 0, 'NEW_ZLSJC');
INSERT INTO `r_job_attribute` VALUES (8852, 3, 9, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8853, 3, 9, 'PARAM_DESC', 0, '新增量时间戳');
INSERT INTO `r_job_attribute` VALUES (8854, 3, 10, 'PARAM_KEY', 0, 'RUN_START');
INSERT INTO `r_job_attribute` VALUES (8855, 3, 10, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8856, 3, 10, 'PARAM_DESC', 0, '增量最小时间戳');
INSERT INTO `r_job_attribute` VALUES (8857, 3, 11, 'PARAM_KEY', 0, 'SC_FTP_IP');
INSERT INTO `r_job_attribute` VALUES (8858, 3, 11, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8859, 3, 11, 'PARAM_DESC', 0, '上传FTPIP');
INSERT INTO `r_job_attribute` VALUES (8860, 3, 12, 'PARAM_KEY', 0, 'SC_FTP_KZBM');
INSERT INTO `r_job_attribute` VALUES (8861, 3, 12, 'PARAM_DEFAULT', 0, 'UTF-8');
INSERT INTO `r_job_attribute` VALUES (8862, 3, 12, 'PARAM_DESC', 0, '上传FTP控制编码');
INSERT INTO `r_job_attribute` VALUES (8863, 3, 13, 'PARAM_KEY', 0, 'SC_FTP_MM');
INSERT INTO `r_job_attribute` VALUES (8864, 3, 13, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8865, 3, 13, 'PARAM_DESC', 0, '上传FTP密码');
INSERT INTO `r_job_attribute` VALUES (8866, 3, 14, 'PARAM_KEY', 0, 'SC_FTP_TPF');
INSERT INTO `r_job_attribute` VALUES (8867, 3, 14, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8868, 3, 14, 'PARAM_DESC', 0, '上传FTP通配符');
INSERT INTO `r_job_attribute` VALUES (8869, 3, 15, 'PARAM_KEY', 0, 'SC_FTP_YCML');
INSERT INTO `r_job_attribute` VALUES (8870, 3, 15, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8871, 3, 15, 'PARAM_DESC', 0, '上传FTP远程目录');
INSERT INTO `r_job_attribute` VALUES (8872, 3, 16, 'PARAM_KEY', 0, 'SC_FTP_YHM');
INSERT INTO `r_job_attribute` VALUES (8873, 3, 16, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8874, 3, 16, 'PARAM_DESC', 0, '上传FTP用户名');
INSERT INTO `r_job_attribute` VALUES (8875, 3, 17, 'PARAM_KEY', 0, 'SOURCE_SQL');
INSERT INTO `r_job_attribute` VALUES (8876, 3, 17, 'PARAM_DEFAULT', 0, 'select t.*,last_update ZLCQZD FROM r_job t where t.last_update<to_char(sysdate,\'yyyymmddhh24miss\') and t.last_update>\'${ZLSJC}\'');
INSERT INTO `r_job_attribute` VALUES (8877, 3, 17, 'PARAM_DESC', 0, '来源SQL');
INSERT INTO `r_job_attribute` VALUES (8878, 3, 18, 'PARAM_KEY', 0, 'TG_SCHEMA');
INSERT INTO `r_job_attribute` VALUES (8879, 3, 18, 'PARAM_DEFAULT', 0, 'KM');
INSERT INTO `r_job_attribute` VALUES (8880, 3, 18, 'PARAM_DESC', 0, '目标模式');
INSERT INTO `r_job_attribute` VALUES (8881, 3, 19, 'PARAM_KEY', 0, 'TG_TABLE');
INSERT INTO `r_job_attribute` VALUES (8882, 3, 19, 'PARAM_DEFAULT', 0, 'R_JOB');
INSERT INTO `r_job_attribute` VALUES (8883, 3, 19, 'PARAM_DESC', 0, '目标表');
INSERT INTO `r_job_attribute` VALUES (8884, 3, 20, 'PARAM_KEY', 0, 'XZ_FTP_IP');
INSERT INTO `r_job_attribute` VALUES (8885, 3, 20, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8886, 3, 20, 'PARAM_DESC', 0, '下载FTPIP');
INSERT INTO `r_job_attribute` VALUES (8887, 3, 21, 'PARAM_KEY', 0, 'XZ_FTP_KZBM');
INSERT INTO `r_job_attribute` VALUES (8888, 3, 21, 'PARAM_DEFAULT', 0, 'UTF-8');
INSERT INTO `r_job_attribute` VALUES (8889, 3, 21, 'PARAM_DESC', 0, '下载FTP控制编码');
INSERT INTO `r_job_attribute` VALUES (8890, 3, 22, 'PARAM_KEY', 0, 'XZ_FTP_MM');
INSERT INTO `r_job_attribute` VALUES (8891, 3, 22, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8892, 3, 22, 'PARAM_DESC', 0, '下载FTP密码');
INSERT INTO `r_job_attribute` VALUES (8893, 3, 23, 'PARAM_KEY', 0, 'XZ_FTP_TPF');
INSERT INTO `r_job_attribute` VALUES (8894, 3, 23, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8895, 3, 23, 'PARAM_DESC', 0, '下载FTP通配符');
INSERT INTO `r_job_attribute` VALUES (8896, 3, 24, 'PARAM_KEY', 0, 'XZ_FTP_YCML');
INSERT INTO `r_job_attribute` VALUES (8897, 3, 24, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8898, 3, 24, 'PARAM_DESC', 0, '下载FTP远程目录');
INSERT INTO `r_job_attribute` VALUES (8899, 3, 25, 'PARAM_KEY', 0, 'XZ_FTP_YHM');
INSERT INTO `r_job_attribute` VALUES (8900, 3, 25, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8901, 3, 25, 'PARAM_DESC', 0, '下载FTP用户名');
INSERT INTO `r_job_attribute` VALUES (8902, 3, 26, 'PARAM_KEY', 0, 'ZLSJC');
INSERT INTO `r_job_attribute` VALUES (8903, 3, 26, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8904, 3, 26, 'PARAM_DESC', 0, '增量时间戳');
INSERT INTO `r_job_attribute` VALUES (8905, 3, 27, 'PARAM_KEY', 0, 'input');
INSERT INTO `r_job_attribute` VALUES (8906, 3, 27, 'PARAM_DEFAULT', 0, '0');
INSERT INTO `r_job_attribute` VALUES (8907, 3, 27, 'PARAM_DESC', 0, '输入量');
INSERT INTO `r_job_attribute` VALUES (8908, 3, 28, 'PARAM_KEY', 0, 'output');
INSERT INTO `r_job_attribute` VALUES (8909, 3, 28, 'PARAM_DEFAULT', 0, '0');
INSERT INTO `r_job_attribute` VALUES (8910, 3, 28, 'PARAM_DESC', 0, '输出量');
INSERT INTO `r_job_attribute` VALUES (8911, 3, 29, 'PARAM_KEY', 0, 'result');
INSERT INTO `r_job_attribute` VALUES (8912, 3, 29, 'PARAM_DEFAULT', 0, 'failed');
INSERT INTO `r_job_attribute` VALUES (8913, 3, 29, 'PARAM_DESC', 0, '运行结果');
INSERT INTO `r_job_attribute` VALUES (8914, 3, 30, 'PARAM_KEY', 0, 'updated');
INSERT INTO `r_job_attribute` VALUES (8915, 3, 30, 'PARAM_DEFAULT', 0, '0');
INSERT INTO `r_job_attribute` VALUES (8916, 3, 30, 'PARAM_DESC', 0, '更新量');
INSERT INTO `r_job_attribute` VALUES (8917, 3, 31, 'PARAM_KEY', 0, 'written');
INSERT INTO `r_job_attribute` VALUES (8918, 3, 31, 'PARAM_DEFAULT', 0, '0');
INSERT INTO `r_job_attribute` VALUES (8919, 3, 31, 'PARAM_DESC', 0, '写入量');
INSERT INTO `r_job_attribute` VALUES (8920, 5, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8921, 5, 0, 'JOB_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8922, 5, 0, 'JOB_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8923, 5, 0, 'JOB_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8924, 5, 0, 'JOB_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8925, 5, 0, 'JOB_LOG_TABLE_FIELD_ID0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (8926, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (8927, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8928, 5, 0, 'JOB_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8929, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8930, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8931, 5, 0, 'JOB_LOG_TABLE_FIELD_ID2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (8932, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (8933, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8934, 5, 0, 'JOB_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (8935, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (8936, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8937, 5, 0, 'JOB_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (8938, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (8939, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8940, 5, 0, 'JOB_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (8941, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (8942, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8943, 5, 0, 'JOB_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (8944, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (8945, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8946, 5, 0, 'JOB_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (8947, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (8948, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8949, 5, 0, 'JOB_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (8950, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (8951, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8952, 5, 0, 'JOB_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (8953, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (8954, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8955, 5, 0, 'JOB_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (8956, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (8957, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8958, 5, 0, 'JOB_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (8959, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (8960, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8961, 5, 0, 'JOB_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (8962, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (8963, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8964, 5, 0, 'JOB_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (8965, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (8966, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8967, 5, 0, 'JOB_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (8968, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (8969, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8970, 5, 0, 'JOB_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (8971, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (8972, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8973, 5, 0, 'JOB_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (8974, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (8975, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8976, 5, 0, 'JOB_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (8977, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (8978, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8979, 5, 0, 'JOB_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (8980, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (8981, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8982, 5, 0, 'JOB_LOG_TABLE_FIELD_ID19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (8983, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (8984, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8985, 5, 0, 'JOB_LOG_TABLE_FIELD_ID20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (8986, 5, 0, 'JOB_LOG_TABLE_FIELD_NAME20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (8987, 5, 0, 'JOB_LOG_TABLE_FIELD_ENABLED20', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (8988, 5, 0, 'JOBLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8989, 5, 0, 'JOBLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8990, 5, 0, 'JOB_ENTRY_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8991, 5, 0, 'JOB_ENTRY_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8992, 5, 0, 'JOB_ENTRY_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8993, 5, 0, 'JOB_ENTRY_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (8994, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (8995, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (8996, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (8997, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8998, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (8999, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9000, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (9001, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (9002, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9003, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID3', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (9004, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_job_attribute` VALUES (9005, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9006, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID4', 0, 'JOBENTRYNAME');
INSERT INTO `r_job_attribute` VALUES (9007, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_job_attribute` VALUES (9008, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9009, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (9010, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (9011, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9012, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (9013, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (9014, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9015, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (9016, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (9017, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9018, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (9019, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (9020, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9021, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (9022, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (9023, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9024, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (9025, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (9026, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9027, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (9028, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (9029, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9030, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (9031, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (9032, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9033, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (9034, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (9035, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9036, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (9037, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (9038, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9039, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (9040, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (9041, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED15', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (9042, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (9043, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (9044, 5, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED16', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (9045, 5, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9046, 5, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9047, 5, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9048, 5, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9049, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (9050, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (9051, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9052, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9053, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9054, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9055, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (9056, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (9057, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9058, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (9059, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (9060, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9061, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (9062, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (9063, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9064, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (9065, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (9066, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9067, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (9068, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (9069, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9070, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (9071, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (9072, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9073, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (9074, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (9075, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9076, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (9077, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (9078, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9079, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9080, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9081, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9082, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9083, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9084, 5, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9085, 5, 0, 'PARAM_KEY', 0, 'CLZH_NAME');
INSERT INTO `r_job_attribute` VALUES (9086, 5, 0, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9087, 5, 0, 'PARAM_DESC', 0, '处理转换名称');
INSERT INTO `r_job_attribute` VALUES (9088, 5, 1, 'PARAM_KEY', 0, 'CLZH_PATH');
INSERT INTO `r_job_attribute` VALUES (9089, 5, 1, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9090, 5, 1, 'PARAM_DESC', 0, '处理转换路径');
INSERT INTO `r_job_attribute` VALUES (9091, 5, 2, 'PARAM_KEY', 0, 'GGZY_CLHGZ');
INSERT INTO `r_job_attribute` VALUES (9092, 5, 2, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9093, 5, 2, 'PARAM_DESC', 0, '公用作业-处理后工作');
INSERT INTO `r_job_attribute` VALUES (9094, 5, 3, 'PARAM_KEY', 0, 'GGZY_CLQGZ');
INSERT INTO `r_job_attribute` VALUES (9095, 5, 3, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9096, 5, 3, 'PARAM_DESC', 0, '公用作业-处理前工作');
INSERT INTO `r_job_attribute` VALUES (9097, 5, 4, 'PARAM_KEY', 0, 'GGZY_CLSBGZ');
INSERT INTO `r_job_attribute` VALUES (9098, 5, 4, 'PARAM_DEFAULT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9099, 5, 4, 'PARAM_DESC', 0, '公用作业-处理失败工作');
INSERT INTO `r_job_attribute` VALUES (9100, 5, 5, 'PARAM_KEY', 0, 'GGZY_NAME');
INSERT INTO `r_job_attribute` VALUES (9101, 5, 5, 'PARAM_DEFAULT', 0, '流转公用作业');
INSERT INTO `r_job_attribute` VALUES (9102, 5, 5, 'PARAM_DESC', 0, '公共作业名称');
INSERT INTO `r_job_attribute` VALUES (9103, 5, 6, 'PARAM_KEY', 0, 'GGZY_PATH');
INSERT INTO `r_job_attribute` VALUES (9104, 5, 6, 'PARAM_DEFAULT', 0, '/common');
INSERT INTO `r_job_attribute` VALUES (9105, 5, 6, 'PARAM_DESC', 0, '公共作业路径');
INSERT INTO `r_job_attribute` VALUES (9106, 8, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9107, 8, 0, 'JOB_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9108, 8, 0, 'JOB_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9109, 8, 0, 'JOB_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9110, 8, 0, 'JOB_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9111, 8, 0, 'JOB_LOG_TABLE_FIELD_ID0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (9112, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (9113, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9114, 8, 0, 'JOB_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9115, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9116, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9117, 8, 0, 'JOB_LOG_TABLE_FIELD_ID2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (9118, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (9119, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9120, 8, 0, 'JOB_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (9121, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (9122, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9123, 8, 0, 'JOB_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (9124, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (9125, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9126, 8, 0, 'JOB_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (9127, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (9128, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9129, 8, 0, 'JOB_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (9130, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (9131, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9132, 8, 0, 'JOB_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (9133, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (9134, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9135, 8, 0, 'JOB_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (9136, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (9137, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9138, 8, 0, 'JOB_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (9139, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (9140, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9141, 8, 0, 'JOB_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (9142, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (9143, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9144, 8, 0, 'JOB_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (9145, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (9146, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9147, 8, 0, 'JOB_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (9148, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (9149, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9150, 8, 0, 'JOB_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (9151, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (9152, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9153, 8, 0, 'JOB_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (9154, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (9155, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9156, 8, 0, 'JOB_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (9157, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (9158, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9159, 8, 0, 'JOB_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (9160, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (9161, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9162, 8, 0, 'JOB_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (9163, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (9164, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (9165, 8, 0, 'JOB_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (9166, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (9167, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (9168, 8, 0, 'JOB_LOG_TABLE_FIELD_ID19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (9169, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (9170, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (9171, 8, 0, 'JOB_LOG_TABLE_FIELD_ID20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (9172, 8, 0, 'JOB_LOG_TABLE_FIELD_NAME20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (9173, 8, 0, 'JOB_LOG_TABLE_FIELD_ENABLED20', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (9174, 8, 0, 'JOBLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9175, 8, 0, 'JOBLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9176, 8, 0, 'JOB_ENTRY_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9177, 8, 0, 'JOB_ENTRY_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9178, 8, 0, 'JOB_ENTRY_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9179, 8, 0, 'JOB_ENTRY_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9180, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (9181, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (9182, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9183, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9184, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9185, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9186, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (9187, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (9188, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9189, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID3', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (9190, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_job_attribute` VALUES (9191, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9192, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID4', 0, 'JOBENTRYNAME');
INSERT INTO `r_job_attribute` VALUES (9193, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_job_attribute` VALUES (9194, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9195, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (9196, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (9197, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9198, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (9199, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (9200, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9201, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (9202, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (9203, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9204, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (9205, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (9206, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9207, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (9208, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (9209, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9210, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (9211, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (9212, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9213, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (9214, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (9215, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9216, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (9217, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (9218, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9219, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (9220, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (9221, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9222, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (9223, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (9224, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9225, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (9226, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (9227, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED15', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (9228, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (9229, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (9230, 8, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED16', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (9231, 8, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9232, 8, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9233, 8, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9234, 8, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9235, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (9236, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (9237, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9238, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9239, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9240, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9241, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (9242, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (9243, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9244, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (9245, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (9246, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9247, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (9248, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (9249, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9250, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (9251, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (9252, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9253, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (9254, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (9255, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9256, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (9257, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (9258, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9259, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (9260, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (9261, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9262, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (9263, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (9264, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9265, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9266, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9267, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9268, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9269, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9270, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9271, 10, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9272, 10, 0, 'JOB_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9273, 10, 0, 'JOB_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9274, 10, 0, 'JOB_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9275, 10, 0, 'JOB_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9276, 10, 0, 'JOB_LOG_TABLE_FIELD_ID0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (9277, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME0', 0, 'ID_JOB');
INSERT INTO `r_job_attribute` VALUES (9278, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9279, 10, 0, 'JOB_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9280, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9281, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9282, 10, 0, 'JOB_LOG_TABLE_FIELD_ID2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (9283, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME2', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (9284, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9285, 10, 0, 'JOB_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (9286, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_job_attribute` VALUES (9287, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9288, 10, 0, 'JOB_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (9289, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (9290, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9291, 10, 0, 'JOB_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (9292, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (9293, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9294, 10, 0, 'JOB_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (9295, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (9296, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9297, 10, 0, 'JOB_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (9298, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (9299, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9300, 10, 0, 'JOB_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (9301, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (9302, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9303, 10, 0, 'JOB_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (9304, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (9305, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9306, 10, 0, 'JOB_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (9307, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (9308, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9309, 10, 0, 'JOB_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (9310, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_job_attribute` VALUES (9311, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9312, 10, 0, 'JOB_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (9313, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_job_attribute` VALUES (9314, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9315, 10, 0, 'JOB_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (9316, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_job_attribute` VALUES (9317, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9318, 10, 0, 'JOB_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (9319, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_job_attribute` VALUES (9320, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9321, 10, 0, 'JOB_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (9322, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_job_attribute` VALUES (9323, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9324, 10, 0, 'JOB_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (9325, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (9326, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9327, 10, 0, 'JOB_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (9328, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_job_attribute` VALUES (9329, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (9330, 10, 0, 'JOB_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (9331, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_job_attribute` VALUES (9332, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (9333, 10, 0, 'JOB_LOG_TABLE_FIELD_ID19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (9334, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME19', 0, 'START_JOB_ENTRY');
INSERT INTO `r_job_attribute` VALUES (9335, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (9336, 10, 0, 'JOB_LOG_TABLE_FIELD_ID20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (9337, 10, 0, 'JOB_LOG_TABLE_FIELD_NAME20', 0, 'CLIENT');
INSERT INTO `r_job_attribute` VALUES (9338, 10, 0, 'JOB_LOG_TABLE_FIELD_ENABLED20', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (9339, 10, 0, 'JOBLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9340, 10, 0, 'JOBLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9341, 10, 0, 'JOB_ENTRY_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9342, 10, 0, 'JOB_ENTRY_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9343, 10, 0, 'JOB_ENTRY_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9344, 10, 0, 'JOB_ENTRY_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9345, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (9346, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (9347, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9348, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9349, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9350, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9351, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (9352, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (9353, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9354, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID3', 0, 'JOBNAME');
INSERT INTO `r_job_attribute` VALUES (9355, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_job_attribute` VALUES (9356, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9357, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID4', 0, 'JOBENTRYNAME');
INSERT INTO `r_job_attribute` VALUES (9358, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_job_attribute` VALUES (9359, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9360, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (9361, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME5', 0, 'LINES_READ');
INSERT INTO `r_job_attribute` VALUES (9362, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9363, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (9364, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME6', 0, 'LINES_WRITTEN');
INSERT INTO `r_job_attribute` VALUES (9365, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9366, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (9367, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME7', 0, 'LINES_UPDATED');
INSERT INTO `r_job_attribute` VALUES (9368, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9369, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (9370, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME8', 0, 'LINES_INPUT');
INSERT INTO `r_job_attribute` VALUES (9371, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9372, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (9373, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME9', 0, 'LINES_OUTPUT');
INSERT INTO `r_job_attribute` VALUES (9374, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9375, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (9376, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME10', 0, 'LINES_REJECTED');
INSERT INTO `r_job_attribute` VALUES (9377, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9378, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (9379, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME11', 0, 'ERRORS');
INSERT INTO `r_job_attribute` VALUES (9380, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9381, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (9382, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME12', 0, 'RESULT');
INSERT INTO `r_job_attribute` VALUES (9383, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9384, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (9385, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME13', 0, 'NR_RESULT_ROWS');
INSERT INTO `r_job_attribute` VALUES (9386, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9387, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (9388, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME14', 0, 'NR_RESULT_FILES');
INSERT INTO `r_job_attribute` VALUES (9389, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9390, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (9391, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME15', 0, 'LOG_FIELD');
INSERT INTO `r_job_attribute` VALUES (9392, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED15', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (9393, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ID16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (9394, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_NAME16', 0, 'COPY_NR');
INSERT INTO `r_job_attribute` VALUES (9395, 10, 0, 'JOB_ENTRY_LOG_TABLE_FIELD_ENABLED16', 0, 'N');
INSERT INTO `r_job_attribute` VALUES (9396, 10, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9397, 10, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9398, 10, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9399, 10, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_job_attribute` VALUES (9400, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (9401, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_job_attribute` VALUES (9402, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9403, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9404, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9405, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9406, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (9407, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_job_attribute` VALUES (9408, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9409, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (9410, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_job_attribute` VALUES (9411, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9412, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (9413, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_job_attribute` VALUES (9414, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9415, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (9416, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_job_attribute` VALUES (9417, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9418, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (9419, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_job_attribute` VALUES (9420, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9421, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (9422, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_job_attribute` VALUES (9423, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9424, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (9425, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_job_attribute` VALUES (9426, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9427, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (9428, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_job_attribute` VALUES (9429, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9430, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9431, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9432, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_job_attribute` VALUES (9433, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9434, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_job_attribute` VALUES (9435, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');

-- ----------------------------
-- Table structure for r_job_hop
-- ----------------------------
DROP TABLE IF EXISTS `r_job_hop`;
CREATE TABLE `r_job_hop`  (
  `ID_JOB_HOP` bigint NOT NULL,
  `ID_JOB` int NULL DEFAULT NULL,
  `ID_JOBENTRY_COPY_FROM` int NULL DEFAULT NULL,
  `ID_JOBENTRY_COPY_TO` int NULL DEFAULT NULL,
  `ENABLED` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EVALUATION` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `UNCONDITIONAL` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_JOB_HOP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_job_hop
-- ----------------------------
INSERT INTO `r_job_hop` VALUES (114, 6, 126, 128, '1', '1', '1');
INSERT INTO `r_job_hop` VALUES (115, 6, 128, 127, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (120, 1, 135, 137, '1', '1', '1');
INSERT INTO `r_job_hop` VALUES (121, 1, 137, 140, '1', '1', '1');
INSERT INTO `r_job_hop` VALUES (122, 1, 140, 136, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (123, 1, 140, 138, '0', '0', '0');
INSERT INTO `r_job_hop` VALUES (124, 1, 138, 141, '0', '1', '0');
INSERT INTO `r_job_hop` VALUES (125, 1, 141, 139, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (126, 1, 139, 136, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (127, 1, 140, 141, '1', '0', '0');
INSERT INTO `r_job_hop` VALUES (128, 2, 142, 143, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (129, 2, 144, 142, '1', '1', '1');
INSERT INTO `r_job_hop` VALUES (144, 7, 166, 168, '1', '1', '1');
INSERT INTO `r_job_hop` VALUES (145, 7, 168, 167, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (183, 9, 195, 197, '1', '1', '1');
INSERT INTO `r_job_hop` VALUES (184, 9, 197, 196, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (187, 11, 201, 203, '1', '1', '1');
INSERT INTO `r_job_hop` VALUES (188, 11, 203, 202, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (189, 3, 209, 204, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (190, 3, 207, 208, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (191, 3, 205, 204, '1', '0', '0');
INSERT INTO `r_job_hop` VALUES (192, 3, 205, 210, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (193, 3, 210, 206, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (194, 3, 210, 211, '1', '0', '0');
INSERT INTO `r_job_hop` VALUES (195, 3, 208, 213, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (196, 3, 213, 214, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (197, 3, 215, 209, '1', '0', '1');
INSERT INTO `r_job_hop` VALUES (198, 3, 211, 216, '1', '0', '0');
INSERT INTO `r_job_hop` VALUES (199, 3, 216, 207, '1', '0', '0');
INSERT INTO `r_job_hop` VALUES (200, 3, 211, 217, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (201, 3, 217, 212, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (202, 3, 214, 209, '1', '0', '0');
INSERT INTO `r_job_hop` VALUES (203, 3, 213, 219, '1', '0', '0');
INSERT INTO `r_job_hop` VALUES (204, 3, 219, 215, '1', '0', '0');
INSERT INTO `r_job_hop` VALUES (205, 3, 219, 218, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (206, 3, 218, 209, '1', '0', '0');
INSERT INTO `r_job_hop` VALUES (207, 3, 206, 209, '1', '0', '0');
INSERT INTO `r_job_hop` VALUES (208, 3, 206, 211, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (209, 3, 212, 216, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (210, 3, 217, 209, '1', '0', '0');
INSERT INTO `r_job_hop` VALUES (211, 3, 212, 209, '1', '0', '0');
INSERT INTO `r_job_hop` VALUES (212, 3, 214, 219, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (213, 3, 218, 215, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (214, 3, 216, 220, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (215, 3, 220, 207, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (216, 3, 220, 209, '1', '0', '0');
INSERT INTO `r_job_hop` VALUES (217, 3, 207, 222, '1', '0', '0');
INSERT INTO `r_job_hop` VALUES (218, 3, 222, 209, '1', '0', '0');
INSERT INTO `r_job_hop` VALUES (219, 3, 222, 221, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (220, 3, 221, 209, '1', '0', '1');
INSERT INTO `r_job_hop` VALUES (221, 3, 223, 205, '1', '1', '1');
INSERT INTO `r_job_hop` VALUES (222, 5, 224, 225, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (223, 5, 226, 224, '1', '1', '1');
INSERT INTO `r_job_hop` VALUES (224, 8, 228, 227, '1', '1', '1');
INSERT INTO `r_job_hop` VALUES (225, 8, 227, 229, '1', '1', '0');
INSERT INTO `r_job_hop` VALUES (226, 10, 230, 231, '1', '1', '1');
INSERT INTO `r_job_hop` VALUES (227, 10, 231, 232, '1', '1', '0');

-- ----------------------------
-- Table structure for r_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `r_job_lock`;
CREATE TABLE `r_job_lock`  (
  `ID_JOB_LOCK` bigint NOT NULL,
  `ID_JOB` int NULL DEFAULT NULL,
  `ID_USER` int NULL DEFAULT NULL,
  `LOCK_MESSAGE` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `LOCK_DATE` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID_JOB_LOCK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_job_lock
-- ----------------------------

-- ----------------------------
-- Table structure for r_job_note
-- ----------------------------
DROP TABLE IF EXISTS `r_job_note`;
CREATE TABLE `r_job_note`  (
  `ID_JOB` int NULL DEFAULT NULL,
  `ID_NOTE` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_job_note
-- ----------------------------
INSERT INTO `r_job_note` VALUES (3, 1);

-- ----------------------------
-- Table structure for r_jobentry
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry`;
CREATE TABLE `r_jobentry`  (
  `ID_JOBENTRY` bigint NOT NULL,
  `ID_JOB` int NULL DEFAULT NULL,
  `ID_JOBENTRY_TYPE` int NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_JOBENTRY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_jobentry
-- ----------------------------
INSERT INTO `r_jobentry` VALUES (126, 6, 74, 'START', NULL);
INSERT INTO `r_jobentry` VALUES (127, 6, 59, '成功', NULL);
INSERT INTO `r_jobentry` VALUES (128, 6, 91, 'kettle简单扩展作业插件', NULL);
INSERT INTO `r_jobentry` VALUES (135, 1, 74, 'START', NULL);
INSERT INTO `r_jobentry` VALUES (136, 1, 59, '成功', NULL);
INSERT INTO `r_jobentry` VALUES (137, 1, 87, '获取公网ip', NULL);
INSERT INTO `r_jobentry` VALUES (138, 1, 32, 'aliyun-dns.bat', NULL);
INSERT INTO `r_jobentry` VALUES (139, 1, 86, '设置变量', NULL);
INSERT INTO `r_jobentry` VALUES (140, 1, 69, '检验字段的值', NULL);
INSERT INTO `r_jobentry` VALUES (141, 1, 32, 'aliyun-dns.bat 2', NULL);
INSERT INTO `r_jobentry` VALUES (142, 2, 32, 'shell', NULL);
INSERT INTO `r_jobentry` VALUES (143, 2, 59, '成功', NULL);
INSERT INTO `r_jobentry` VALUES (144, 2, 74, 'START', NULL);
INSERT INTO `r_jobentry` VALUES (166, 7, 74, 'START', NULL);
INSERT INTO `r_jobentry` VALUES (167, 7, 59, '成功', NULL);
INSERT INTO `r_jobentry` VALUES (168, 7, 87, '处理转换', NULL);
INSERT INTO `r_jobentry` VALUES (195, 9, 74, 'START', NULL);
INSERT INTO `r_jobentry` VALUES (196, 9, 59, '成功', NULL);
INSERT INTO `r_jobentry` VALUES (197, 9, 19, 'javascript', NULL);
INSERT INTO `r_jobentry` VALUES (201, 11, 74, 'START', NULL);
INSERT INTO `r_jobentry` VALUES (202, 11, 59, '成功', NULL);
INSERT INTO `r_jobentry` VALUES (203, 11, 34, 'sql', NULL);
INSERT INTO `r_jobentry` VALUES (204, 3, 59, '成功', NULL);
INSERT INTO `r_jobentry` VALUES (205, 3, 87, '作业初始化', NULL);
INSERT INTO `r_jobentry` VALUES (206, 3, 87, '获取增量时间戳', NULL);
INSERT INTO `r_jobentry` VALUES (207, 3, 87, '处理转换', NULL);
INSERT INTO `r_jobentry` VALUES (208, 3, 19, '统计数据量', NULL);
INSERT INTO `r_jobentry` VALUES (209, 3, 87, '写日志', NULL);
INSERT INTO `r_jobentry` VALUES (210, 3, 69, '处理前工作-增量判断', NULL);
INSERT INTO `r_jobentry` VALUES (211, 3, 69, '处理前工作-ftp判断', NULL);
INSERT INTO `r_jobentry` VALUES (212, 3, 10, 'FTP 下载', NULL);
INSERT INTO `r_jobentry` VALUES (213, 3, 69, '处理后工作-ftp判断', NULL);
INSERT INTO `r_jobentry` VALUES (214, 3, 9, 'FTP 上传', NULL);
INSERT INTO `r_jobentry` VALUES (215, 3, 69, '处理后工作-无', NULL);
INSERT INTO `r_jobentry` VALUES (216, 3, 69, '处理前工作-创建上传临时目录', NULL);
INSERT INTO `r_jobentry` VALUES (217, 3, 48, '创建FTP下载临时目录', NULL);
INSERT INTO `r_jobentry` VALUES (218, 3, 79, '移动处理完成的文件', NULL);
INSERT INTO `r_jobentry` VALUES (219, 3, 69, '处理后工作-本地文件判断', NULL);
INSERT INTO `r_jobentry` VALUES (220, 3, 48, '创建上传临时目录', NULL);
INSERT INTO `r_jobentry` VALUES (221, 3, 79, '移动处理失败的文件', NULL);
INSERT INTO `r_jobentry` VALUES (222, 3, 69, '处理失败工作-本地文件判断', NULL);
INSERT INTO `r_jobentry` VALUES (223, 3, 74, 'START', NULL);
INSERT INTO `r_jobentry` VALUES (224, 5, 45, '公共作业', NULL);
INSERT INTO `r_jobentry` VALUES (225, 5, 59, '成功', NULL);
INSERT INTO `r_jobentry` VALUES (226, 5, 74, 'START', NULL);
INSERT INTO `r_jobentry` VALUES (227, 8, 91, 'km', NULL);
INSERT INTO `r_jobentry` VALUES (228, 8, 74, 'START', NULL);
INSERT INTO `r_jobentry` VALUES (229, 8, 59, '成功', NULL);
INSERT INTO `r_jobentry` VALUES (230, 10, 74, 'START', NULL);
INSERT INTO `r_jobentry` VALUES (231, 10, 32, 'shell', NULL);
INSERT INTO `r_jobentry` VALUES (232, 10, 59, '成功', NULL);

-- ----------------------------
-- Table structure for r_jobentry_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry_attribute`;
CREATE TABLE `r_jobentry_attribute`  (
  `ID_JOBENTRY_ATTRIBUTE` bigint NOT NULL,
  `ID_JOB` int NULL DEFAULT NULL,
  `ID_JOBENTRY` int NULL DEFAULT NULL,
  `NR` int NULL DEFAULT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VALUE_NUM` double NULL DEFAULT NULL,
  `VALUE_STR` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_JOBENTRY_ATTRIBUTE`) USING BTREE,
  UNIQUE INDEX `IDX_RJEA`(`ID_JOBENTRY_ATTRIBUTE`, `CODE`, `NR`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_jobentry_attribute
-- ----------------------------
INSERT INTO `r_jobentry_attribute` VALUES (1207, 6, 126, 0, 'start', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (1208, 6, 126, 0, 'dummy', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1209, 6, 126, 0, 'repeat', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (1210, 6, 126, 0, 'schedulerType', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1211, 6, 126, 0, 'intervalSeconds', 15, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1212, 6, 126, 0, 'intervalMinutes', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1213, 6, 126, 0, 'hour', 12, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1214, 6, 126, 0, 'minutes', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1215, 6, 126, 0, 'weekDay', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1216, 6, 126, 0, 'dayOfMonth', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1217, 6, 126, 0, 'initStart', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (1218, 6, 126, 0, 'cron', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1219, 6, 128, 0, 'configInfo', 0, '{}');
INSERT INTO `r_jobentry_attribute` VALUES (1220, 6, 128, 0, 'className', 0, 'cn.benma666.kettle.job.JobManager');
INSERT INTO `r_jobentry_attribute` VALUES (1271, 1, 135, 0, 'start', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (1272, 1, 135, 0, 'dummy', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1273, 1, 135, 0, 'repeat', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (1274, 1, 135, 0, 'schedulerType', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1275, 1, 135, 0, 'intervalSeconds', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1276, 1, 135, 0, 'intervalMinutes', 5, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1277, 1, 135, 0, 'hour', 12, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1278, 1, 135, 0, 'minutes', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1279, 1, 135, 0, 'weekDay', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1280, 1, 135, 0, 'dayOfMonth', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1281, 1, 135, 0, 'initStart', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (1282, 1, 135, 0, 'cron', 0, '0 2 * * * ? *');
INSERT INTO `r_jobentry_attribute` VALUES (1283, 1, 137, 0, 'specification_method', 0, 'rep_name');
INSERT INTO `r_jobentry_attribute` VALUES (1284, 1, 137, 0, 'trans_object_id', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1285, 1, 137, 0, 'name', 0, '获取公网ip');
INSERT INTO `r_jobentry_attribute` VALUES (1286, 1, 137, 0, 'dir_path', 0, '/other/获取公网ip');
INSERT INTO `r_jobentry_attribute` VALUES (1287, 1, 137, 0, 'file_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1288, 1, 137, 0, 'arg_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1289, 1, 137, 0, 'params_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1290, 1, 137, 0, 'exec_per_row', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1291, 1, 137, 0, 'clear_rows', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1292, 1, 137, 0, 'clear_files', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1293, 1, 137, 0, 'set_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1294, 1, 137, 0, 'add_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1295, 1, 137, 0, 'add_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1296, 1, 137, 0, 'logfile', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1297, 1, 137, 0, 'logext', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1298, 1, 137, 0, 'loglevel', 0, 'Basic');
INSERT INTO `r_jobentry_attribute` VALUES (1299, 1, 137, 0, 'cluster', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1300, 1, 137, 0, 'slave_server_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1301, 1, 137, 0, 'set_append_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1302, 1, 137, 0, 'wait_until_finished', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (1303, 1, 137, 0, 'follow_abort_remote', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1304, 1, 137, 0, 'create_parent_folder', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1305, 1, 137, 0, 'logging_remote_work', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1306, 1, 137, 0, 'run_configuration', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1307, 1, 137, 0, 'pass_all_parameters', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (1308, 1, 138, 0, 'file_name', 0, 'D:\\devtool\\aliyun-dns\\aliyun-dns.bat');
INSERT INTO `r_jobentry_attribute` VALUES (1309, 1, 138, 0, 'work_directory', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1310, 1, 138, 0, 'arg_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1311, 1, 138, 0, 'exec_per_row', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1312, 1, 138, 0, 'set_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1313, 1, 138, 0, 'set_append_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1314, 1, 138, 0, 'add_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1315, 1, 138, 0, 'add_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1316, 1, 138, 0, 'logfile', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1317, 1, 138, 0, 'logext', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1318, 1, 138, 0, 'loglevel', 0, 'Basic');
INSERT INTO `r_jobentry_attribute` VALUES (1319, 1, 138, 0, 'insertScript', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1320, 1, 138, 0, 'script', 0, 'java  -DACCESS_KEY_ID=LTAI5tEQEw1KSuktsUFFxoFf -DACCESS_KEY_SECRET=YrLd90Wqg8kN4vMSVZB4Vxo9EeeEhg  -jar D:\\devtool\\aliyun-dns.jar  \"\" \"123.146.223.212\" \"benma666.cn\" \"my\" \"A\"');
INSERT INTO `r_jobentry_attribute` VALUES (1321, 1, 138, 0, 'argument', 0, '${dqip}');
INSERT INTO `r_jobentry_attribute` VALUES (1322, 1, 138, 1, 'argument', 0, 'benma666.cn');
INSERT INTO `r_jobentry_attribute` VALUES (1323, 1, 138, 2, 'argument', 0, 'my');
INSERT INTO `r_jobentry_attribute` VALUES (1324, 1, 138, 3, 'argument', 0, 'A');
INSERT INTO `r_jobentry_attribute` VALUES (1325, 1, 139, 0, 'replacevars', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (1326, 1, 139, 0, 'filename', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1327, 1, 139, 0, 'file_variable_type', 0, 'ROOT_JOB');
INSERT INTO `r_jobentry_attribute` VALUES (1328, 1, 139, 0, 'variable_name', 0, 'msg');
INSERT INTO `r_jobentry_attribute` VALUES (1329, 1, 139, 0, 'variable_value', 0, 'none');
INSERT INTO `r_jobentry_attribute` VALUES (1330, 1, 139, 0, 'variable_type', 0, 'ROOT_JOB');
INSERT INTO `r_jobentry_attribute` VALUES (1331, 1, 140, 0, 'valuetype', 0, 'variable');
INSERT INTO `r_jobentry_attribute` VALUES (1332, 1, 140, 0, 'fieldname', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1333, 1, 140, 0, 'variablename', 0, '${msg}');
INSERT INTO `r_jobentry_attribute` VALUES (1334, 1, 140, 0, 'fieldtype', 0, 'string');
INSERT INTO `r_jobentry_attribute` VALUES (1335, 1, 140, 0, 'mask', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1336, 1, 140, 0, 'comparevalue', 0, 'none');
INSERT INTO `r_jobentry_attribute` VALUES (1337, 1, 140, 0, 'minvalue', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1338, 1, 140, 0, 'maxvalue', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1339, 1, 140, 0, 'successcondition', 0, 'equal');
INSERT INTO `r_jobentry_attribute` VALUES (1340, 1, 140, 0, 'successnumbercondition', 0, 'equal');
INSERT INTO `r_jobentry_attribute` VALUES (1341, 1, 140, 0, 'successbooleancondition', 0, 'false');
INSERT INTO `r_jobentry_attribute` VALUES (1342, 1, 140, 0, 'successwhenvarset', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1343, 1, 141, 0, 'file_name', 0, 'D:\\devtool\\aliyun-dns\\aliyun-dns.bat');
INSERT INTO `r_jobentry_attribute` VALUES (1344, 1, 141, 0, 'work_directory', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1345, 1, 141, 0, 'arg_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1346, 1, 141, 0, 'exec_per_row', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1347, 1, 141, 0, 'set_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1348, 1, 141, 0, 'set_append_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1349, 1, 141, 0, 'add_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1350, 1, 141, 0, 'add_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1351, 1, 141, 0, 'logfile', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1352, 1, 141, 0, 'logext', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1353, 1, 141, 0, 'loglevel', 0, 'Basic');
INSERT INTO `r_jobentry_attribute` VALUES (1354, 1, 141, 0, 'insertScript', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1355, 1, 141, 0, 'script', 0, 'java  -DACCESS_KEY_ID=LTAI5tEQEw1KSuktsUFFxoFf -DACCESS_KEY_SECRET=YrLd90Wqg8kN4vMSVZB4Vxo9EeeEhg  -jar D:\\devtool\\aliyun-dns.jar  \"\" \"123.146.223.212\" \"benma666.cn\" \"my\" \"A\"');
INSERT INTO `r_jobentry_attribute` VALUES (1356, 1, 141, 0, 'argument', 0, '${dqip}');
INSERT INTO `r_jobentry_attribute` VALUES (1357, 1, 141, 1, 'argument', 0, 'trimdata.cn');
INSERT INTO `r_jobentry_attribute` VALUES (1358, 1, 141, 2, 'argument', 0, '@');
INSERT INTO `r_jobentry_attribute` VALUES (1359, 1, 141, 3, 'argument', 0, 'A');
INSERT INTO `r_jobentry_attribute` VALUES (1360, 2, 142, 0, 'file_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1361, 2, 142, 0, 'work_directory', 0, 'd:');
INSERT INTO `r_jobentry_attribute` VALUES (1362, 2, 142, 0, 'arg_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1363, 2, 142, 0, 'exec_per_row', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1364, 2, 142, 0, 'set_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1365, 2, 142, 0, 'set_append_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1366, 2, 142, 0, 'add_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1367, 2, 142, 0, 'add_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1368, 2, 142, 0, 'logfile', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1369, 2, 142, 0, 'logext', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1370, 2, 142, 0, 'loglevel', 0, 'Basic');
INSERT INTO `r_jobentry_attribute` VALUES (1371, 2, 142, 0, 'insertScript', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (1372, 2, 142, 0, 'script', 0, 'd:\\devtool\\frp_0.36.2_windows_amd64\\frpc.bat');
INSERT INTO `r_jobentry_attribute` VALUES (1373, 2, 144, 0, 'start', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (1374, 2, 144, 0, 'dummy', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1375, 2, 144, 0, 'repeat', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1376, 2, 144, 0, 'schedulerType', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1377, 2, 144, 0, 'intervalSeconds', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1378, 2, 144, 0, 'intervalMinutes', 60, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1379, 2, 144, 0, 'hour', 12, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1380, 2, 144, 0, 'minutes', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1381, 2, 144, 0, 'weekDay', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1382, 2, 144, 0, 'dayOfMonth', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1383, 2, 144, 0, 'initStart', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1384, 2, 144, 0, 'cron', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1526, 7, 166, 0, 'start', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (1527, 7, 166, 0, 'dummy', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1528, 7, 166, 0, 'repeat', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (1529, 7, 166, 0, 'schedulerType', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1530, 7, 166, 0, 'intervalSeconds', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1531, 7, 166, 0, 'intervalMinutes', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1532, 7, 166, 0, 'hour', 12, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1533, 7, 166, 0, 'minutes', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1534, 7, 166, 0, 'weekDay', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1535, 7, 166, 0, 'dayOfMonth', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1536, 7, 166, 0, 'initStart', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (1537, 7, 166, 0, 'cron', 0, '0 0/5 * * * * ?');
INSERT INTO `r_jobentry_attribute` VALUES (1538, 7, 168, 0, 'specification_method', 0, 'rep_name');
INSERT INTO `r_jobentry_attribute` VALUES (1539, 7, 168, 0, 'trans_object_id', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1540, 7, 168, 0, 'name', 0, '处理转换');
INSERT INTO `r_jobentry_attribute` VALUES (1541, 7, 168, 0, 'dir_path', 0, '/sys/记录本机ip');
INSERT INTO `r_jobentry_attribute` VALUES (1542, 7, 168, 0, 'file_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1543, 7, 168, 0, 'arg_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1544, 7, 168, 0, 'params_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1545, 7, 168, 0, 'exec_per_row', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1546, 7, 168, 0, 'clear_rows', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1547, 7, 168, 0, 'clear_files', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1548, 7, 168, 0, 'set_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1549, 7, 168, 0, 'add_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1550, 7, 168, 0, 'add_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1551, 7, 168, 0, 'logfile', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1552, 7, 168, 0, 'logext', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1553, 7, 168, 0, 'loglevel', 0, 'Basic');
INSERT INTO `r_jobentry_attribute` VALUES (1554, 7, 168, 0, 'cluster', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1555, 7, 168, 0, 'slave_server_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1556, 7, 168, 0, 'set_append_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1557, 7, 168, 0, 'wait_until_finished', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (1558, 7, 168, 0, 'follow_abort_remote', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1559, 7, 168, 0, 'create_parent_folder', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1560, 7, 168, 0, 'logging_remote_work', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1561, 7, 168, 0, 'run_configuration', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1562, 7, 168, 0, 'pass_all_parameters', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (1951, 9, 195, 0, 'start', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (1952, 9, 195, 0, 'dummy', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1953, 9, 195, 0, 'repeat', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1954, 9, 195, 0, 'schedulerType', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1955, 9, 195, 0, 'intervalSeconds', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1956, 9, 195, 0, 'intervalMinutes', 60, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1957, 9, 195, 0, 'hour', 12, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1958, 9, 195, 0, 'minutes', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1959, 9, 195, 0, 'weekDay', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1960, 9, 195, 0, 'dayOfMonth', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1961, 9, 195, 0, 'initStart', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1962, 9, 195, 0, 'cron', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1963, 9, 197, 0, 'script', 0, '\r\ntrue;');
INSERT INTO `r_jobentry_attribute` VALUES (1989, 11, 201, 0, 'start', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (1990, 11, 201, 0, 'dummy', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1991, 11, 201, 0, 'repeat', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (1992, 11, 201, 0, 'schedulerType', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1993, 11, 201, 0, 'intervalSeconds', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1994, 11, 201, 0, 'intervalMinutes', 60, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1995, 11, 201, 0, 'hour', 12, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1996, 11, 201, 0, 'minutes', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1997, 11, 201, 0, 'weekDay', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1998, 11, 201, 0, 'dayOfMonth', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (1999, 11, 201, 0, 'initStart', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2000, 11, 201, 0, 'cron', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2001, 11, 203, 0, 'sql', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2002, 11, 203, 0, 'useVariableSubstitution', 0, 'F');
INSERT INTO `r_jobentry_attribute` VALUES (2003, 11, 203, 0, 'sqlfromfile', 0, 'F');
INSERT INTO `r_jobentry_attribute` VALUES (2004, 11, 203, 0, 'sqlfilename', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2005, 11, 203, 0, 'sendOneStatement', 0, 'F');
INSERT INTO `r_jobentry_attribute` VALUES (2006, 3, 205, 0, 'specification_method', 0, 'rep_name');
INSERT INTO `r_jobentry_attribute` VALUES (2007, 3, 205, 0, 'trans_object_id', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2008, 3, 205, 0, 'name', 0, '作业初始化');
INSERT INTO `r_jobentry_attribute` VALUES (2009, 3, 205, 0, 'dir_path', 0, '/common');
INSERT INTO `r_jobentry_attribute` VALUES (2010, 3, 205, 0, 'file_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2011, 3, 205, 0, 'arg_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2012, 3, 205, 0, 'params_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2013, 3, 205, 0, 'exec_per_row', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2014, 3, 205, 0, 'clear_rows', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2015, 3, 205, 0, 'clear_files', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2016, 3, 205, 0, 'set_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2017, 3, 205, 0, 'add_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2018, 3, 205, 0, 'add_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2019, 3, 205, 0, 'logfile', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2020, 3, 205, 0, 'logext', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2021, 3, 205, 0, 'loglevel', 0, 'Basic');
INSERT INTO `r_jobentry_attribute` VALUES (2022, 3, 205, 0, 'cluster', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2023, 3, 205, 0, 'slave_server_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2024, 3, 205, 0, 'set_append_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2025, 3, 205, 0, 'wait_until_finished', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2026, 3, 205, 0, 'follow_abort_remote', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2027, 3, 205, 0, 'create_parent_folder', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2028, 3, 205, 0, 'logging_remote_work', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2029, 3, 205, 0, 'run_configuration', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2030, 3, 205, 0, 'pass_all_parameters', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2031, 3, 206, 0, 'specification_method', 0, 'rep_name');
INSERT INTO `r_jobentry_attribute` VALUES (2032, 3, 206, 0, 'trans_object_id', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2033, 3, 206, 0, 'name', 0, '获取增量时间戳');
INSERT INTO `r_jobentry_attribute` VALUES (2034, 3, 206, 0, 'dir_path', 0, '/common');
INSERT INTO `r_jobentry_attribute` VALUES (2035, 3, 206, 0, 'file_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2036, 3, 206, 0, 'arg_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2037, 3, 206, 0, 'params_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2038, 3, 206, 0, 'exec_per_row', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2039, 3, 206, 0, 'clear_rows', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2040, 3, 206, 0, 'clear_files', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2041, 3, 206, 0, 'set_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2042, 3, 206, 0, 'add_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2043, 3, 206, 0, 'add_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2044, 3, 206, 0, 'logfile', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2045, 3, 206, 0, 'logext', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2046, 3, 206, 0, 'loglevel', 0, 'Basic');
INSERT INTO `r_jobentry_attribute` VALUES (2047, 3, 206, 0, 'cluster', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2048, 3, 206, 0, 'slave_server_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2049, 3, 206, 0, 'set_append_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2050, 3, 206, 0, 'wait_until_finished', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2051, 3, 206, 0, 'follow_abort_remote', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2052, 3, 206, 0, 'create_parent_folder', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2053, 3, 206, 0, 'logging_remote_work', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2054, 3, 206, 0, 'run_configuration', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2055, 3, 206, 0, 'parameter_name', 0, 'ID_JOB');
INSERT INTO `r_jobentry_attribute` VALUES (2056, 3, 206, 0, 'parameter_stream_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2057, 3, 206, 0, 'parameter_value', 0, '${ID_JOB}');
INSERT INTO `r_jobentry_attribute` VALUES (2058, 3, 206, 1, 'parameter_name', 0, 'RUN_START');
INSERT INTO `r_jobentry_attribute` VALUES (2059, 3, 206, 1, 'parameter_stream_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2060, 3, 206, 1, 'parameter_value', 0, '${RUN_START}');
INSERT INTO `r_jobentry_attribute` VALUES (2061, 3, 206, 0, 'pass_all_parameters', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2062, 3, 207, 0, 'specification_method', 0, 'rep_name');
INSERT INTO `r_jobentry_attribute` VALUES (2063, 3, 207, 0, 'trans_object_id', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2064, 3, 207, 0, 'name', 0, '${CLZH_NAME}');
INSERT INTO `r_jobentry_attribute` VALUES (2065, 3, 207, 0, 'dir_path', 0, '${CLZH_PATH}');
INSERT INTO `r_jobentry_attribute` VALUES (2066, 3, 207, 0, 'file_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2067, 3, 207, 0, 'arg_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2068, 3, 207, 0, 'params_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2069, 3, 207, 0, 'exec_per_row', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2070, 3, 207, 0, 'clear_rows', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2071, 3, 207, 0, 'clear_files', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2072, 3, 207, 0, 'set_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2073, 3, 207, 0, 'add_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2074, 3, 207, 0, 'add_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2075, 3, 207, 0, 'logfile', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2076, 3, 207, 0, 'logext', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2077, 3, 207, 0, 'loglevel', 0, 'Basic');
INSERT INTO `r_jobentry_attribute` VALUES (2078, 3, 207, 0, 'cluster', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2079, 3, 207, 0, 'slave_server_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2080, 3, 207, 0, 'set_append_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2081, 3, 207, 0, 'wait_until_finished', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2082, 3, 207, 0, 'follow_abort_remote', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2083, 3, 207, 0, 'create_parent_folder', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2084, 3, 207, 0, 'logging_remote_work', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2085, 3, 207, 0, 'run_configuration', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2086, 3, 207, 0, 'pass_all_parameters', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2087, 3, 208, 0, 'script', 0, '//获取数据量\nvar input = previous_result.getNrLinesInput();\nvar written = previous_result.getNrLinesWritten();\nvar output = previous_result.getNrLinesOutput();\nvar updated = previous_result.getNrLinesUpdated();\n\n//设置变量\nparent_job.setVariable(\'input\',input);\nparent_job.setVariable(\'written\',written);\nparent_job.setVariable(\'output\',output);\nparent_job.setVariable(\'updated\',updated);\nparent_job.setVariable(\'result\',\'success\');\n\n//正常结束\ntrue;');
INSERT INTO `r_jobentry_attribute` VALUES (2088, 3, 209, 0, 'specification_method', 0, 'rep_name');
INSERT INTO `r_jobentry_attribute` VALUES (2089, 3, 209, 0, 'trans_object_id', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2090, 3, 209, 0, 'name', 0, '写日志');
INSERT INTO `r_jobentry_attribute` VALUES (2091, 3, 209, 0, 'dir_path', 0, '/common');
INSERT INTO `r_jobentry_attribute` VALUES (2092, 3, 209, 0, 'file_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2093, 3, 209, 0, 'arg_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2094, 3, 209, 0, 'params_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2095, 3, 209, 0, 'exec_per_row', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2096, 3, 209, 0, 'clear_rows', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2097, 3, 209, 0, 'clear_files', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2098, 3, 209, 0, 'set_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2099, 3, 209, 0, 'add_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2100, 3, 209, 0, 'add_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2101, 3, 209, 0, 'logfile', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2102, 3, 209, 0, 'logext', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2103, 3, 209, 0, 'loglevel', 0, 'Basic');
INSERT INTO `r_jobentry_attribute` VALUES (2104, 3, 209, 0, 'cluster', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2105, 3, 209, 0, 'slave_server_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2106, 3, 209, 0, 'set_append_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2107, 3, 209, 0, 'wait_until_finished', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2108, 3, 209, 0, 'follow_abort_remote', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2109, 3, 209, 0, 'create_parent_folder', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2110, 3, 209, 0, 'logging_remote_work', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2111, 3, 209, 0, 'run_configuration', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2112, 3, 209, 0, 'parameter_name', 0, 'input');
INSERT INTO `r_jobentry_attribute` VALUES (2113, 3, 209, 0, 'parameter_stream_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2114, 3, 209, 0, 'parameter_value', 0, '${input}');
INSERT INTO `r_jobentry_attribute` VALUES (2115, 3, 209, 1, 'parameter_name', 0, 'output');
INSERT INTO `r_jobentry_attribute` VALUES (2116, 3, 209, 1, 'parameter_stream_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2117, 3, 209, 1, 'parameter_value', 0, '${output}');
INSERT INTO `r_jobentry_attribute` VALUES (2118, 3, 209, 2, 'parameter_name', 0, 'result');
INSERT INTO `r_jobentry_attribute` VALUES (2119, 3, 209, 2, 'parameter_stream_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2120, 3, 209, 2, 'parameter_value', 0, '${result}');
INSERT INTO `r_jobentry_attribute` VALUES (2121, 3, 209, 3, 'parameter_name', 0, 'updated');
INSERT INTO `r_jobentry_attribute` VALUES (2122, 3, 209, 3, 'parameter_stream_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2123, 3, 209, 3, 'parameter_value', 0, '${updated}');
INSERT INTO `r_jobentry_attribute` VALUES (2124, 3, 209, 4, 'parameter_name', 0, 'written');
INSERT INTO `r_jobentry_attribute` VALUES (2125, 3, 209, 4, 'parameter_stream_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2126, 3, 209, 4, 'parameter_value', 0, '${written}');
INSERT INTO `r_jobentry_attribute` VALUES (2127, 3, 209, 5, 'parameter_name', 0, 'NEW_ZLSJC');
INSERT INTO `r_jobentry_attribute` VALUES (2128, 3, 209, 5, 'parameter_stream_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2129, 3, 209, 5, 'parameter_value', 0, '${NEW_ZLSJC}');
INSERT INTO `r_jobentry_attribute` VALUES (2130, 3, 209, 6, 'parameter_name', 0, 'ZLSJC');
INSERT INTO `r_jobentry_attribute` VALUES (2131, 3, 209, 6, 'parameter_stream_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2132, 3, 209, 6, 'parameter_value', 0, '${ZLSJC}');
INSERT INTO `r_jobentry_attribute` VALUES (2133, 3, 209, 7, 'parameter_name', 0, 'DDKETTLE');
INSERT INTO `r_jobentry_attribute` VALUES (2134, 3, 209, 7, 'parameter_stream_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2135, 3, 209, 7, 'parameter_value', 0, '${DDKETTLE}');
INSERT INTO `r_jobentry_attribute` VALUES (2136, 3, 209, 0, 'pass_all_parameters', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2137, 3, 210, 0, 'valuetype', 0, 'variable');
INSERT INTO `r_jobentry_attribute` VALUES (2138, 3, 210, 0, 'fieldname', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2139, 3, 210, 0, 'variablename', 0, '${GGZY_CLQGZ}');
INSERT INTO `r_jobentry_attribute` VALUES (2140, 3, 210, 0, 'fieldtype', 0, 'string');
INSERT INTO `r_jobentry_attribute` VALUES (2141, 3, 210, 0, 'mask', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2142, 3, 210, 0, 'comparevalue', 0, 'zl');
INSERT INTO `r_jobentry_attribute` VALUES (2143, 3, 210, 0, 'minvalue', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2144, 3, 210, 0, 'maxvalue', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2145, 3, 210, 0, 'successcondition', 0, 'contains');
INSERT INTO `r_jobentry_attribute` VALUES (2146, 3, 210, 0, 'successnumbercondition', 0, 'equal');
INSERT INTO `r_jobentry_attribute` VALUES (2147, 3, 210, 0, 'successbooleancondition', 0, 'false');
INSERT INTO `r_jobentry_attribute` VALUES (2148, 3, 210, 0, 'successwhenvarset', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2149, 3, 211, 0, 'valuetype', 0, 'variable');
INSERT INTO `r_jobentry_attribute` VALUES (2150, 3, 211, 0, 'fieldname', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2151, 3, 211, 0, 'variablename', 0, '${GGZY_CLQGZ}');
INSERT INTO `r_jobentry_attribute` VALUES (2152, 3, 211, 0, 'fieldtype', 0, 'string');
INSERT INTO `r_jobentry_attribute` VALUES (2153, 3, 211, 0, 'mask', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2154, 3, 211, 0, 'comparevalue', 0, 'ftp');
INSERT INTO `r_jobentry_attribute` VALUES (2155, 3, 211, 0, 'minvalue', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2156, 3, 211, 0, 'maxvalue', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2157, 3, 211, 0, 'successcondition', 0, 'contains');
INSERT INTO `r_jobentry_attribute` VALUES (2158, 3, 211, 0, 'successnumbercondition', 0, 'equal');
INSERT INTO `r_jobentry_attribute` VALUES (2159, 3, 211, 0, 'successbooleancondition', 0, 'false');
INSERT INTO `r_jobentry_attribute` VALUES (2160, 3, 211, 0, 'successwhenvarset', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2161, 3, 212, 0, 'port', 0, '21');
INSERT INTO `r_jobentry_attribute` VALUES (2162, 3, 212, 0, 'servername', 0, '${XZ_FTP_IP}');
INSERT INTO `r_jobentry_attribute` VALUES (2163, 3, 212, 0, 'username', 0, '${XZ_FTP_YHM}');
INSERT INTO `r_jobentry_attribute` VALUES (2164, 3, 212, 0, 'password', 0, '${XZ_FTP_MM}');
INSERT INTO `r_jobentry_attribute` VALUES (2165, 3, 212, 0, 'ftpdirectory', 0, '${XZ_FTP_YCML}');
INSERT INTO `r_jobentry_attribute` VALUES (2166, 3, 212, 0, 'targetdirectory', 0, '${FTP_LSGML}${JOB_NAME}/${XZ_FTP_YCML}');
INSERT INTO `r_jobentry_attribute` VALUES (2167, 3, 212, 0, 'wildcard', 0, '${XZ_FTP_TPF}');
INSERT INTO `r_jobentry_attribute` VALUES (2168, 3, 212, 0, 'binary', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2169, 3, 212, 0, 'timeout', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2170, 3, 212, 0, 'remove', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2171, 3, 212, 0, 'only_new', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2172, 3, 212, 0, 'active', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2173, 3, 212, 0, 'control_encoding', 0, 'GBK');
INSERT INTO `r_jobentry_attribute` VALUES (2174, 3, 212, 0, 'movefiles', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2175, 3, 212, 0, 'movetodirectory', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2176, 3, 212, 0, 'addtime', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2177, 3, 212, 0, 'adddate', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2178, 3, 212, 0, 'SpecifyFormat', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2179, 3, 212, 0, 'date_time_format', 0, 'yyyyMMddHHmmssSSS');
INSERT INTO `r_jobentry_attribute` VALUES (2180, 3, 212, 0, 'AddDateBeforeExtension', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2181, 3, 212, 0, 'isaddresult', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2182, 3, 212, 0, 'createmovefolder', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2183, 3, 212, 0, 'proxy_host', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2184, 3, 212, 0, 'proxy_port', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2185, 3, 212, 0, 'proxy_username', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2186, 3, 212, 0, 'proxy_password', 0, 'Encrypted ');
INSERT INTO `r_jobentry_attribute` VALUES (2187, 3, 212, 0, 'socksproxy_host', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2188, 3, 212, 0, 'socksproxy_port', 0, '1080');
INSERT INTO `r_jobentry_attribute` VALUES (2189, 3, 212, 0, 'socksproxy_username', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2190, 3, 212, 0, 'socksproxy_password', 0, 'Encrypted ');
INSERT INTO `r_jobentry_attribute` VALUES (2191, 3, 212, 0, 'ifFileExists', 0, 'ifFileExistsSkip');
INSERT INTO `r_jobentry_attribute` VALUES (2192, 3, 212, 0, 'nr_limit', 0, '10');
INSERT INTO `r_jobentry_attribute` VALUES (2193, 3, 212, 0, 'success_condition', 0, 'success_if_no_errors');
INSERT INTO `r_jobentry_attribute` VALUES (2194, 3, 213, 0, 'valuetype', 0, 'variable');
INSERT INTO `r_jobentry_attribute` VALUES (2195, 3, 213, 0, 'fieldname', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2196, 3, 213, 0, 'variablename', 0, '${GGZY_CLHGZ}');
INSERT INTO `r_jobentry_attribute` VALUES (2197, 3, 213, 0, 'fieldtype', 0, 'string');
INSERT INTO `r_jobentry_attribute` VALUES (2198, 3, 213, 0, 'mask', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2199, 3, 213, 0, 'comparevalue', 0, 'ftp');
INSERT INTO `r_jobentry_attribute` VALUES (2200, 3, 213, 0, 'minvalue', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2201, 3, 213, 0, 'maxvalue', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2202, 3, 213, 0, 'successcondition', 0, 'contains');
INSERT INTO `r_jobentry_attribute` VALUES (2203, 3, 213, 0, 'successnumbercondition', 0, 'equal');
INSERT INTO `r_jobentry_attribute` VALUES (2204, 3, 213, 0, 'successbooleancondition', 0, 'false');
INSERT INTO `r_jobentry_attribute` VALUES (2205, 3, 213, 0, 'successwhenvarset', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2206, 3, 214, 0, 'servername', 0, '${SC_FTP_IP}');
INSERT INTO `r_jobentry_attribute` VALUES (2207, 3, 214, 0, 'serverport', 0, '21');
INSERT INTO `r_jobentry_attribute` VALUES (2208, 3, 214, 0, 'username', 0, '${SC_FTP_YHM}');
INSERT INTO `r_jobentry_attribute` VALUES (2209, 3, 214, 0, 'password', 0, '${SC_FTP_MM}');
INSERT INTO `r_jobentry_attribute` VALUES (2210, 3, 214, 0, 'remoteDirectory', 0, '${SC_FTP_YCML}');
INSERT INTO `r_jobentry_attribute` VALUES (2211, 3, 214, 0, 'localDirectory', 0, '${FTP_LSGML}${JOB_NAME}/${SC_FTP_YCML}');
INSERT INTO `r_jobentry_attribute` VALUES (2212, 3, 214, 0, 'wildcard', 0, '${SC_FTP_TPF}');
INSERT INTO `r_jobentry_attribute` VALUES (2213, 3, 214, 0, 'binary', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2214, 3, 214, 0, 'timeout', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2215, 3, 214, 0, 'remove', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2216, 3, 214, 0, 'only_new', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2217, 3, 214, 0, 'active', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2218, 3, 214, 0, 'control_encoding', 0, 'GBK');
INSERT INTO `r_jobentry_attribute` VALUES (2219, 3, 214, 0, 'proxy_host', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2220, 3, 214, 0, 'proxy_port', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2221, 3, 214, 0, 'proxy_username', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2222, 3, 214, 0, 'proxy_password', 0, 'Encrypted ');
INSERT INTO `r_jobentry_attribute` VALUES (2223, 3, 214, 0, 'socksproxy_host', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2224, 3, 214, 0, 'socksproxy_port', 0, '1080');
INSERT INTO `r_jobentry_attribute` VALUES (2225, 3, 214, 0, 'socksproxy_username', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2226, 3, 214, 0, 'socksproxy_password', 0, 'Encrypted ');
INSERT INTO `r_jobentry_attribute` VALUES (2227, 3, 215, 0, 'valuetype', 0, 'variable');
INSERT INTO `r_jobentry_attribute` VALUES (2228, 3, 215, 0, 'fieldname', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2229, 3, 215, 0, 'variablename', 0, '${GGZY_CLHGZ}');
INSERT INTO `r_jobentry_attribute` VALUES (2230, 3, 215, 0, 'fieldtype', 0, 'string');
INSERT INTO `r_jobentry_attribute` VALUES (2231, 3, 215, 0, 'mask', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2232, 3, 215, 0, 'comparevalue', 0, 'none');
INSERT INTO `r_jobentry_attribute` VALUES (2233, 3, 215, 0, 'minvalue', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2234, 3, 215, 0, 'maxvalue', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2235, 3, 215, 0, 'successcondition', 0, 'equal');
INSERT INTO `r_jobentry_attribute` VALUES (2236, 3, 215, 0, 'successnumbercondition', 0, 'equal');
INSERT INTO `r_jobentry_attribute` VALUES (2237, 3, 215, 0, 'successbooleancondition', 0, 'false');
INSERT INTO `r_jobentry_attribute` VALUES (2238, 3, 215, 0, 'successwhenvarset', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2239, 3, 216, 0, 'valuetype', 0, 'variable');
INSERT INTO `r_jobentry_attribute` VALUES (2240, 3, 216, 0, 'fieldname', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2241, 3, 216, 0, 'variablename', 0, '${GGZY_CLQGZ}');
INSERT INTO `r_jobentry_attribute` VALUES (2242, 3, 216, 0, 'fieldtype', 0, 'string');
INSERT INTO `r_jobentry_attribute` VALUES (2243, 3, 216, 0, 'mask', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2244, 3, 216, 0, 'comparevalue', 0, 'cjsclsml');
INSERT INTO `r_jobentry_attribute` VALUES (2245, 3, 216, 0, 'minvalue', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2246, 3, 216, 0, 'maxvalue', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2247, 3, 216, 0, 'successcondition', 0, 'contains');
INSERT INTO `r_jobentry_attribute` VALUES (2248, 3, 216, 0, 'successnumbercondition', 0, 'equal');
INSERT INTO `r_jobentry_attribute` VALUES (2249, 3, 216, 0, 'successbooleancondition', 0, 'false');
INSERT INTO `r_jobentry_attribute` VALUES (2250, 3, 216, 0, 'successwhenvarset', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2251, 3, 217, 0, 'foldername', 0, '${FTP_LSGML}${JOB_NAME}/${XZ_FTP_YCML}');
INSERT INTO `r_jobentry_attribute` VALUES (2252, 3, 217, 0, 'fail_of_folder_exists', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2253, 3, 218, 0, 'move_empty_folders', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2254, 3, 218, 0, 'arg_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2255, 3, 218, 0, 'include_subfolders', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2256, 3, 218, 0, 'add_result_filesname', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2257, 3, 218, 0, 'destination_is_a_file', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2258, 3, 218, 0, 'create_destination_folder', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2259, 3, 218, 0, 'nr_errors_less_than', 0, '10');
INSERT INTO `r_jobentry_attribute` VALUES (2260, 3, 218, 0, 'success_condition', 0, 'success_if_no_errors');
INSERT INTO `r_jobentry_attribute` VALUES (2261, 3, 218, 0, 'add_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2262, 3, 218, 0, 'add_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2263, 3, 218, 0, 'SpecifyFormat', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2264, 3, 218, 0, 'date_time_format', 0, 'yyyyMMddHHmmss');
INSERT INTO `r_jobentry_attribute` VALUES (2265, 3, 218, 0, 'AddDateBeforeExtension', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2266, 3, 218, 0, 'DoNotKeepFolderStructure', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2267, 3, 218, 0, 'iffileexists', 0, 'unique_name');
INSERT INTO `r_jobentry_attribute` VALUES (2268, 3, 218, 0, 'destinationFolder', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2269, 3, 218, 0, 'ifmovedfileexists', 0, 'do_nothing');
INSERT INTO `r_jobentry_attribute` VALUES (2270, 3, 218, 0, 'moved_date_time_format', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2271, 3, 218, 0, 'add_moved_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2272, 3, 218, 0, 'add_moved_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2273, 3, 218, 0, 'SpecifyMoveFormat', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2274, 3, 218, 0, 'create_move_to_folder', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2275, 3, 218, 0, 'AddMovedDateBeforeExtension', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2276, 3, 218, 0, 'simulate', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2277, 3, 218, 0, 'source_filefolder', 0, '${SOURCE_DIR}');
INSERT INTO `r_jobentry_attribute` VALUES (2278, 3, 218, 0, 'destination_filefolder', 0, '${BDWJ_CLHWJ}${JOB_NAME}');
INSERT INTO `r_jobentry_attribute` VALUES (2279, 3, 218, 0, 'wildcard', 0, '${SOURCE_TPF}');
INSERT INTO `r_jobentry_attribute` VALUES (2280, 3, 219, 0, 'valuetype', 0, 'variable');
INSERT INTO `r_jobentry_attribute` VALUES (2281, 3, 219, 0, 'fieldname', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2282, 3, 219, 0, 'variablename', 0, '${GGZY_CLHGZ}');
INSERT INTO `r_jobentry_attribute` VALUES (2283, 3, 219, 0, 'fieldtype', 0, 'string');
INSERT INTO `r_jobentry_attribute` VALUES (2284, 3, 219, 0, 'mask', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2285, 3, 219, 0, 'comparevalue', 0, 'bdwj');
INSERT INTO `r_jobentry_attribute` VALUES (2286, 3, 219, 0, 'minvalue', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2287, 3, 219, 0, 'maxvalue', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2288, 3, 219, 0, 'successcondition', 0, 'contains');
INSERT INTO `r_jobentry_attribute` VALUES (2289, 3, 219, 0, 'successnumbercondition', 0, 'equal');
INSERT INTO `r_jobentry_attribute` VALUES (2290, 3, 219, 0, 'successbooleancondition', 0, 'false');
INSERT INTO `r_jobentry_attribute` VALUES (2291, 3, 219, 0, 'successwhenvarset', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2292, 3, 220, 0, 'foldername', 0, '${FTP_LSGML}${JOB_NAME}/${SC_FTP_YCML}');
INSERT INTO `r_jobentry_attribute` VALUES (2293, 3, 220, 0, 'fail_of_folder_exists', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2294, 3, 221, 0, 'move_empty_folders', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2295, 3, 221, 0, 'arg_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2296, 3, 221, 0, 'include_subfolders', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2297, 3, 221, 0, 'add_result_filesname', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2298, 3, 221, 0, 'destination_is_a_file', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2299, 3, 221, 0, 'create_destination_folder', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2300, 3, 221, 0, 'nr_errors_less_than', 0, '10');
INSERT INTO `r_jobentry_attribute` VALUES (2301, 3, 221, 0, 'success_condition', 0, 'success_if_no_errors');
INSERT INTO `r_jobentry_attribute` VALUES (2302, 3, 221, 0, 'add_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2303, 3, 221, 0, 'add_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2304, 3, 221, 0, 'SpecifyFormat', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2305, 3, 221, 0, 'date_time_format', 0, 'yyyyMMddHHmmss');
INSERT INTO `r_jobentry_attribute` VALUES (2306, 3, 221, 0, 'AddDateBeforeExtension', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2307, 3, 221, 0, 'DoNotKeepFolderStructure', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2308, 3, 221, 0, 'iffileexists', 0, 'unique_name');
INSERT INTO `r_jobentry_attribute` VALUES (2309, 3, 221, 0, 'destinationFolder', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2310, 3, 221, 0, 'ifmovedfileexists', 0, 'do_nothing');
INSERT INTO `r_jobentry_attribute` VALUES (2311, 3, 221, 0, 'moved_date_time_format', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2312, 3, 221, 0, 'add_moved_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2313, 3, 221, 0, 'add_moved_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2314, 3, 221, 0, 'SpecifyMoveFormat', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2315, 3, 221, 0, 'create_move_to_folder', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2316, 3, 221, 0, 'AddMovedDateBeforeExtension', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2317, 3, 221, 0, 'simulate', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2318, 3, 221, 0, 'source_filefolder', 0, '${SOURCE_DIR}');
INSERT INTO `r_jobentry_attribute` VALUES (2319, 3, 221, 0, 'destination_filefolder', 0, '${BDWJ_CLSBWJ}${JOB_NAME}');
INSERT INTO `r_jobentry_attribute` VALUES (2320, 3, 221, 0, 'wildcard', 0, '${SOURCE_TPF}');
INSERT INTO `r_jobentry_attribute` VALUES (2321, 3, 222, 0, 'valuetype', 0, 'variable');
INSERT INTO `r_jobentry_attribute` VALUES (2322, 3, 222, 0, 'fieldname', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2323, 3, 222, 0, 'variablename', 0, '${GGZY_CLSBGZ}');
INSERT INTO `r_jobentry_attribute` VALUES (2324, 3, 222, 0, 'fieldtype', 0, 'string');
INSERT INTO `r_jobentry_attribute` VALUES (2325, 3, 222, 0, 'mask', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2326, 3, 222, 0, 'comparevalue', 0, 'bdwj');
INSERT INTO `r_jobentry_attribute` VALUES (2327, 3, 222, 0, 'minvalue', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2328, 3, 222, 0, 'maxvalue', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2329, 3, 222, 0, 'successcondition', 0, 'contains');
INSERT INTO `r_jobentry_attribute` VALUES (2330, 3, 222, 0, 'successnumbercondition', 0, 'equal');
INSERT INTO `r_jobentry_attribute` VALUES (2331, 3, 222, 0, 'successbooleancondition', 0, 'false');
INSERT INTO `r_jobentry_attribute` VALUES (2332, 3, 222, 0, 'successwhenvarset', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2333, 3, 223, 0, 'start', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2334, 3, 223, 0, 'dummy', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2335, 3, 223, 0, 'repeat', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2336, 3, 223, 0, 'schedulerType', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2337, 3, 223, 0, 'intervalSeconds', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2338, 3, 223, 0, 'intervalMinutes', 60, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2339, 3, 223, 0, 'hour', 12, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2340, 3, 223, 0, 'minutes', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2341, 3, 223, 0, 'weekDay', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2342, 3, 223, 0, 'dayOfMonth', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2343, 3, 223, 0, 'initStart', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2344, 3, 223, 0, 'cron', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2345, 5, 224, 0, 'specification_method', 0, 'rep_name');
INSERT INTO `r_jobentry_attribute` VALUES (2346, 5, 224, 0, 'job_object_id', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2347, 5, 224, 0, 'name', 0, '${GGZY_NAME}');
INSERT INTO `r_jobentry_attribute` VALUES (2348, 5, 224, 0, 'dir_path', 0, '${GGZY_PATH}');
INSERT INTO `r_jobentry_attribute` VALUES (2349, 5, 224, 0, 'file_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2350, 5, 224, 0, 'arg_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2351, 5, 224, 0, 'params_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2352, 5, 224, 0, 'exec_per_row', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2353, 5, 224, 0, 'set_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2354, 5, 224, 0, 'add_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2355, 5, 224, 0, 'add_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2356, 5, 224, 0, 'logfile', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2357, 5, 224, 0, 'logext', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2358, 5, 224, 0, 'set_append_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2359, 5, 224, 0, 'loglevel', 0, 'Nothing');
INSERT INTO `r_jobentry_attribute` VALUES (2360, 5, 224, 0, 'slave_server_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2361, 5, 224, 0, 'pass_export', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2362, 5, 224, 0, 'wait_until_finished', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2363, 5, 224, 0, 'follow_abort_remote', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2364, 5, 224, 0, 'expand_remote_job', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2365, 5, 224, 0, 'create_parent_folder', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2366, 5, 224, 0, 'run_configuration', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2367, 5, 224, 0, 'pass_all_parameters', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2368, 5, 226, 0, 'start', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2369, 5, 226, 0, 'dummy', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2370, 5, 226, 0, 'repeat', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2371, 5, 226, 0, 'schedulerType', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2372, 5, 226, 0, 'intervalSeconds', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2373, 5, 226, 0, 'intervalMinutes', 60, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2374, 5, 226, 0, 'hour', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2375, 5, 226, 0, 'minutes', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2376, 5, 226, 0, 'weekDay', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2377, 5, 226, 0, 'dayOfMonth', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2378, 5, 226, 0, 'initStart', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2379, 5, 226, 0, 'cron', 0, '0 0/2 * * * ?');
INSERT INTO `r_jobentry_attribute` VALUES (2380, 8, 227, 0, 'configInfo', 0, '{\n	\"key1\":\"\",\n	\"array\":[\n		\"arr1\",\n		\"arr2\"\n	]\n}');
INSERT INTO `r_jobentry_attribute` VALUES (2381, 8, 227, 0, 'className', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2382, 8, 228, 0, 'start', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2383, 8, 228, 0, 'dummy', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2384, 8, 228, 0, 'repeat', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2385, 8, 228, 0, 'schedulerType', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2386, 8, 228, 0, 'intervalSeconds', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2387, 8, 228, 0, 'intervalMinutes', 60, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2388, 8, 228, 0, 'hour', 12, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2389, 8, 228, 0, 'minutes', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2390, 8, 228, 0, 'weekDay', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2391, 8, 228, 0, 'dayOfMonth', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2392, 8, 228, 0, 'initStart', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2393, 8, 228, 0, 'cron', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2394, 10, 230, 0, 'start', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2395, 10, 230, 0, 'dummy', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2396, 10, 230, 0, 'repeat', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2397, 10, 230, 0, 'schedulerType', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2398, 10, 230, 0, 'intervalSeconds', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2399, 10, 230, 0, 'intervalMinutes', 60, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2400, 10, 230, 0, 'hour', 12, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2401, 10, 230, 0, 'minutes', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2402, 10, 230, 0, 'weekDay', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2403, 10, 230, 0, 'dayOfMonth', 1, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2404, 10, 230, 0, 'initStart', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2405, 10, 230, 0, 'cron', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2406, 10, 231, 0, 'file_name', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2407, 10, 231, 0, 'work_directory', 0, '.');
INSERT INTO `r_jobentry_attribute` VALUES (2408, 10, 231, 0, 'arg_from_previous', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2409, 10, 231, 0, 'exec_per_row', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2410, 10, 231, 0, 'set_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2411, 10, 231, 0, 'set_append_logfile', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2412, 10, 231, 0, 'add_date', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2413, 10, 231, 0, 'add_time', 0, 'N');
INSERT INTO `r_jobentry_attribute` VALUES (2414, 10, 231, 0, 'logfile', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2415, 10, 231, 0, 'logext', 0, NULL);
INSERT INTO `r_jobentry_attribute` VALUES (2416, 10, 231, 0, 'loglevel', 0, 'Basic');
INSERT INTO `r_jobentry_attribute` VALUES (2417, 10, 231, 0, 'insertScript', 0, 'Y');
INSERT INTO `r_jobentry_attribute` VALUES (2418, 10, 231, 0, 'script', 0, 'dir');

-- ----------------------------
-- Table structure for r_jobentry_copy
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry_copy`;
CREATE TABLE `r_jobentry_copy`  (
  `ID_JOBENTRY_COPY` bigint NOT NULL,
  `ID_JOBENTRY` int NULL DEFAULT NULL,
  `ID_JOB` int NULL DEFAULT NULL,
  `ID_JOBENTRY_TYPE` int NULL DEFAULT NULL,
  `NR` int NULL DEFAULT NULL,
  `GUI_LOCATION_X` int NULL DEFAULT NULL,
  `GUI_LOCATION_Y` int NULL DEFAULT NULL,
  `GUI_DRAW` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARALLEL` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_JOBENTRY_COPY`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_jobentry_copy
-- ----------------------------
INSERT INTO `r_jobentry_copy` VALUES (126, 126, 6, 74, 0, 162, 240, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (127, 127, 6, 59, 0, 521, 241, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (128, 128, 6, 91, 0, 352, 240, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (135, 135, 1, 74, 0, 158, 138, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (136, 136, 1, 59, 0, 779, 138, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (137, 137, 1, 87, 0, 339, 139, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (138, 138, 1, 32, 0, 471, 289, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (139, 139, 1, 86, 0, 781, 288, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (140, 140, 1, 69, 0, 469, 136, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (141, 141, 1, 32, 0, 635, 291, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (142, 142, 2, 32, 0, 265, 183, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (143, 143, 2, 59, 0, 409, 183, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (144, 144, 2, 74, 0, 121, 183, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (166, 166, 7, 74, 0, 136, 175, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (167, 167, 7, 59, 0, 504, 175, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (168, 168, 7, 87, 0, 320, 175, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (195, 195, 9, 74, 0, 115, 246, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (196, 196, 9, 59, 0, 499, 248, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (197, 197, 9, 19, 0, 307, 248, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (201, 201, 11, 74, 0, 105, 191, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (202, 202, 11, 59, 0, 393, 191, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (203, 203, 11, 34, 0, 256, 194, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (204, 204, 3, 59, 0, 161, 696, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (205, 205, 3, 87, 0, 161, 548, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (206, 206, 3, 87, 0, 310, 548, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (207, 207, 3, 87, 0, 698, 160, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (208, 208, 3, 19, 0, 1167, 160, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (209, 209, 3, 87, 0, 693, 696, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (210, 210, 3, 69, 0, 161, 422, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (211, 211, 3, 69, 0, 164, 301, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (212, 212, 3, 10, 0, 465, 422, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (213, 213, 3, 69, 0, 1174, 301, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (214, 214, 3, 9, 0, 1017, 422, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (215, 215, 3, 69, 0, 1180, 696, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (216, 216, 3, 69, 0, 161, 160, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (217, 217, 3, 48, 0, 311, 422, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (218, 218, 3, 79, 0, 1020, 548, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (219, 219, 3, 69, 0, 1172, 422, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (220, 220, 3, 48, 0, 466, 301, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (221, 221, 3, 79, 0, 888, 308, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (222, 222, 3, 69, 0, 696, 313, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (223, 223, 3, 74, 0, 35, 548, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (224, 224, 5, 45, 0, 245, 143, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (225, 225, 5, 59, 0, 388, 146, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (226, 226, 5, 74, 0, 99, 144, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (227, 227, 8, 91, 0, 342, 242, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (228, 228, 8, 74, 0, 162, 240, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (229, 229, 8, 59, 0, 521, 241, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (230, 230, 10, 74, 0, 121, 183, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (231, 231, 10, 32, 0, 265, 183, '1', '0');
INSERT INTO `r_jobentry_copy` VALUES (232, 232, 10, 59, 0, 409, 183, '1', '0');

-- ----------------------------
-- Table structure for r_jobentry_database
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry_database`;
CREATE TABLE `r_jobentry_database`  (
  `ID_JOB` int NULL DEFAULT NULL,
  `ID_JOBENTRY` int NULL DEFAULT NULL,
  `ID_DATABASE` int NULL DEFAULT NULL,
  INDEX `IDX_RJD1`(`ID_JOB`) USING BTREE,
  INDEX `IDX_RJD2`(`ID_DATABASE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_jobentry_database
-- ----------------------------

-- ----------------------------
-- Table structure for r_jobentry_type
-- ----------------------------
DROP TABLE IF EXISTS `r_jobentry_type`;
CREATE TABLE `r_jobentry_type`  (
  `ID_JOBENTRY_TYPE` bigint NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_JOBENTRY_TYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_jobentry_type
-- ----------------------------
INSERT INTO `r_jobentry_type` VALUES (1, 'EMRJobExecutorPlugin', 'Amazon EMR job executor');
INSERT INTO `r_jobentry_type` VALUES (2, 'HiveJobExecutorPlugin', 'Amazon Hive job executor');
INSERT INTO `r_jobentry_type` VALUES (3, 'DataRefineryBuildModel', 'Build model');
INSERT INTO `r_jobentry_type` VALUES (4, 'CHECK_DB_CONNECTIONS', 'Check DB connections');
INSERT INTO `r_jobentry_type` VALUES (5, 'XML_WELL_FORMED', 'Check if XML file is well formed');
INSERT INTO `r_jobentry_type` VALUES (6, 'DOS_UNIX_CONVERTER', 'DOS和UNIX之间的文本转换');
INSERT INTO `r_jobentry_type` VALUES (7, 'DTD_VALIDATOR', 'DTD validator');
INSERT INTO `r_jobentry_type` VALUES (8, 'DummyJob', 'Example job (deprecated)');
INSERT INTO `r_jobentry_type` VALUES (9, 'FTP_PUT', 'FTP 上传');
INSERT INTO `r_jobentry_type` VALUES (10, 'FTP', 'FTP 下载');
INSERT INTO `r_jobentry_type` VALUES (11, 'FTP_DELETE', 'FTP 删除');
INSERT INTO `r_jobentry_type` VALUES (12, 'FTPS_PUT', 'FTPS 上传');
INSERT INTO `r_jobentry_type` VALUES (13, 'FTPS_GET', 'FTPS 下载');
INSERT INTO `r_jobentry_type` VALUES (14, 'HadoopCopyFilesPlugin', 'Hadoop copy files');
INSERT INTO `r_jobentry_type` VALUES (15, 'HadoopJobExecutorPlugin', 'Hadoop job executor ');
INSERT INTO `r_jobentry_type` VALUES (16, 'HL7MLLPAcknowledge', 'HL7 MLLP acknowledge');
INSERT INTO `r_jobentry_type` VALUES (17, 'HL7MLLPInput', 'HL7 MLLP input');
INSERT INTO `r_jobentry_type` VALUES (18, 'HTTP', 'HTTP');
INSERT INTO `r_jobentry_type` VALUES (19, 'EVAL', 'JavaScript');
INSERT INTO `r_jobentry_type` VALUES (20, 'MS_ACCESS_BULK_LOAD', 'MS Access bulk load (deprecated)');
INSERT INTO `r_jobentry_type` VALUES (21, 'MYSQL_BULK_LOAD', 'MySQL 批量加载');
INSERT INTO `r_jobentry_type` VALUES (22, 'OozieJobExecutor', 'Oozie job executor');
INSERT INTO `r_jobentry_type` VALUES (23, 'PALO_CUBE_CREATE', 'Palo cube create (deprecated)');
INSERT INTO `r_jobentry_type` VALUES (24, 'PALO_CUBE_DELETE', 'Palo cube delete (deprecated)');
INSERT INTO `r_jobentry_type` VALUES (25, 'HadoopTransJobExecutorPlugin', 'Pentaho MapReduce');
INSERT INTO `r_jobentry_type` VALUES (26, 'HadoopPigScriptExecutorPlugin', 'Pig script executor');
INSERT INTO `r_jobentry_type` VALUES (27, 'PING', 'Ping 一台主机');
INSERT INTO `r_jobentry_type` VALUES (28, 'GET_POP', 'POP 收信');
INSERT INTO `r_jobentry_type` VALUES (29, 'DATASOURCE_PUBLISH', 'Publish model');
INSERT INTO `r_jobentry_type` VALUES (30, 'SFTPPUT', 'SFTP 上传');
INSERT INTO `r_jobentry_type` VALUES (31, 'SFTP', 'SFTP 下载');
INSERT INTO `r_jobentry_type` VALUES (32, 'SHELL', 'Shell');
INSERT INTO `r_jobentry_type` VALUES (33, 'SparkSubmit', 'Spark submit');
INSERT INTO `r_jobentry_type` VALUES (34, 'SQL', 'SQL');
INSERT INTO `r_jobentry_type` VALUES (35, 'MSSQL_BULK_LOAD', 'SQLServer 批量加载');
INSERT INTO `r_jobentry_type` VALUES (36, 'SqoopExport', 'Sqoop export');
INSERT INTO `r_jobentry_type` VALUES (37, 'SqoopImport', 'Sqoop import');
INSERT INTO `r_jobentry_type` VALUES (38, 'TALEND_JOB_EXEC', 'Talend 作业执行 (deprecated)');
INSERT INTO `r_jobentry_type` VALUES (39, 'XSD_VALIDATOR', 'XSD validator');
INSERT INTO `r_jobentry_type` VALUES (40, 'XSLT', 'XSL transformation');
INSERT INTO `r_jobentry_type` VALUES (41, 'ZIP_FILE', 'Zip 压缩文件');
INSERT INTO `r_jobentry_type` VALUES (42, 'ABORT', '中止作业');
INSERT INTO `r_jobentry_type` VALUES (43, 'MYSQL_BULK_FILE', '从 MySQL 批量导出到文件');
INSERT INTO `r_jobentry_type` VALUES (44, 'DELETE_RESULT_FILENAMES', '从结果文件中删除文件');
INSERT INTO `r_jobentry_type` VALUES (45, 'JOB', '作业');
INSERT INTO `r_jobentry_type` VALUES (46, 'WRITE_TO_FILE', '写入文件');
INSERT INTO `r_jobentry_type` VALUES (47, 'WRITE_TO_LOG', '写日志');
INSERT INTO `r_jobentry_type` VALUES (48, 'CREATE_FOLDER', '创建一个目录');
INSERT INTO `r_jobentry_type` VALUES (49, 'CREATE_FILE', '创建文件');
INSERT INTO `r_jobentry_type` VALUES (50, 'DELETE_FILE', '删除一个文件');
INSERT INTO `r_jobentry_type` VALUES (51, 'DELETE_FILES', '删除多个文件');
INSERT INTO `r_jobentry_type` VALUES (52, 'DELETE_FOLDERS', '删除目录');
INSERT INTO `r_jobentry_type` VALUES (53, 'SNMP_TRAP', '发送 SNMP 自陷');
INSERT INTO `r_jobentry_type` VALUES (54, 'SEND_NAGIOS_PASSIVE_CHECK', '发送Nagios 被动检查');
INSERT INTO `r_jobentry_type` VALUES (55, 'MAIL', '发送邮件');
INSERT INTO `r_jobentry_type` VALUES (56, 'COPY_MOVE_RESULT_FILENAMES', '复制/移动结果文件');
INSERT INTO `r_jobentry_type` VALUES (57, 'COPY_FILES', '复制文件');
INSERT INTO `r_jobentry_type` VALUES (58, 'EXPORT_REPOSITORY', '导出资源库到XML文件');
INSERT INTO `r_jobentry_type` VALUES (59, 'SUCCESS', '成功');
INSERT INTO `r_jobentry_type` VALUES (60, 'MSGBOX_INFO', '显示消息对话框');
INSERT INTO `r_jobentry_type` VALUES (61, 'WEBSERVICE_AVAILABLE', '检查web服务是否可用');
INSERT INTO `r_jobentry_type` VALUES (62, 'FILE_EXISTS', '检查一个文件是否存在');
INSERT INTO `r_jobentry_type` VALUES (63, 'COLUMNS_EXIST', '检查列是否存在');
INSERT INTO `r_jobentry_type` VALUES (64, 'FILES_EXIST', '检查多个文件是否存在');
INSERT INTO `r_jobentry_type` VALUES (65, 'CHECK_FILES_LOCKED', '检查文件是否被锁');
INSERT INTO `r_jobentry_type` VALUES (66, 'CONNECTED_TO_REPOSITORY', '检查是否连接到资源库');
INSERT INTO `r_jobentry_type` VALUES (67, 'FOLDER_IS_EMPTY', '检查目录是否为空');
INSERT INTO `r_jobentry_type` VALUES (68, 'TABLE_EXISTS', '检查表是否存在');
INSERT INTO `r_jobentry_type` VALUES (69, 'SIMPLE_EVAL', '检验字段的值');
INSERT INTO `r_jobentry_type` VALUES (70, 'FILE_COMPARE', '比较文件');
INSERT INTO `r_jobentry_type` VALUES (71, 'FOLDERS_COMPARE', '比较目录');
INSERT INTO `r_jobentry_type` VALUES (72, 'ADD_RESULT_FILENAMES', '添加文件到结果文件中');
INSERT INTO `r_jobentry_type` VALUES (73, 'TRUNCATE_TABLES', '清空表');
INSERT INTO `r_jobentry_type` VALUES (74, 'SPECIAL', '特殊作业项');
INSERT INTO `r_jobentry_type` VALUES (75, 'SYSLOG', '用 syslog 发送信息');
INSERT INTO `r_jobentry_type` VALUES (76, 'PGP_ENCRYPT_FILES', '用PGP加密文件');
INSERT INTO `r_jobentry_type` VALUES (77, 'PGP_DECRYPT_FILES', '用PGP解密文件');
INSERT INTO `r_jobentry_type` VALUES (78, 'PGP_VERIFY_FILES', '用PGP验证文件签名');
INSERT INTO `r_jobentry_type` VALUES (79, 'MOVE_FILES', '移动文件');
INSERT INTO `r_jobentry_type` VALUES (80, 'DELAY', '等待');
INSERT INTO `r_jobentry_type` VALUES (81, 'WAIT_FOR_SQL', '等待SQL');
INSERT INTO `r_jobentry_type` VALUES (82, 'WAIT_FOR_FILE', '等待文件');
INSERT INTO `r_jobentry_type` VALUES (83, 'UNZIP', '解压缩文件');
INSERT INTO `r_jobentry_type` VALUES (84, 'EVAL_FILES_METRICS', '计算文件大小或个数');
INSERT INTO `r_jobentry_type` VALUES (85, 'EVAL_TABLE_CONTENT', '计算表中的记录数');
INSERT INTO `r_jobentry_type` VALUES (86, 'SET_VARIABLES', '设置变量');
INSERT INTO `r_jobentry_type` VALUES (87, 'TRANS', '转换');
INSERT INTO `r_jobentry_type` VALUES (88, 'TELNET', '远程登录一台主机');
INSERT INTO `r_jobentry_type` VALUES (89, 'MAIL_VALIDATOR', '邮件验证');
INSERT INTO `r_jobentry_type` VALUES (90, 'MyJobEntryEasyExpand', '我的kettle简单扩展作业插件');
INSERT INTO `r_jobentry_type` VALUES (91, 'JobEntryEasyExpand', 'kettle简单扩展作业插件');

-- ----------------------------
-- Table structure for r_log
-- ----------------------------
DROP TABLE IF EXISTS `r_log`;
CREATE TABLE `r_log`  (
  `ID_LOG` bigint NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ID_LOGLEVEL` int NULL DEFAULT NULL,
  `LOGTYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FILEEXTENTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ADD_DATE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ADD_TIME` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ID_DATABASE_LOG` int NULL DEFAULT NULL,
  `TABLE_NAME_LOG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_LOG`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_log
-- ----------------------------

-- ----------------------------
-- Table structure for r_loglevel
-- ----------------------------
DROP TABLE IF EXISTS `r_loglevel`;
CREATE TABLE `r_loglevel`  (
  `ID_LOGLEVEL` bigint NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_LOGLEVEL`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_loglevel
-- ----------------------------
INSERT INTO `r_loglevel` VALUES (1, 'Error', '错误日志');
INSERT INTO `r_loglevel` VALUES (2, 'Minimal', '最小日志');
INSERT INTO `r_loglevel` VALUES (3, 'Basic', '基本日志');
INSERT INTO `r_loglevel` VALUES (4, 'Detailed', '详细日志');
INSERT INTO `r_loglevel` VALUES (5, 'Debug', '调试');
INSERT INTO `r_loglevel` VALUES (6, 'Rowlevel', '行级日志(非常详细)');

-- ----------------------------
-- Table structure for r_namespace
-- ----------------------------
DROP TABLE IF EXISTS `r_namespace`;
CREATE TABLE `r_namespace`  (
  `ID_NAMESPACE` bigint NOT NULL,
  `NAME` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_NAMESPACE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_namespace
-- ----------------------------

-- ----------------------------
-- Table structure for r_note
-- ----------------------------
DROP TABLE IF EXISTS `r_note`;
CREATE TABLE `r_note`  (
  `ID_NOTE` bigint NOT NULL,
  `VALUE_STR` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `GUI_LOCATION_X` int NULL DEFAULT NULL,
  `GUI_LOCATION_Y` int NULL DEFAULT NULL,
  `GUI_LOCATION_WIDTH` int NULL DEFAULT NULL,
  `GUI_LOCATION_HEIGHT` int NULL DEFAULT NULL,
  `FONT_NAME` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `FONT_SIZE` int NULL DEFAULT NULL,
  `FONT_BOLD` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FONT_ITALIC` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FONT_COLOR_RED` int NULL DEFAULT NULL,
  `FONT_COLOR_GREEN` int NULL DEFAULT NULL,
  `FONT_COLOR_BLUE` int NULL DEFAULT NULL,
  `FONT_BACK_GROUND_COLOR_RED` int NULL DEFAULT NULL,
  `FONT_BACK_GROUND_COLOR_GREEN` int NULL DEFAULT NULL,
  `FONT_BACK_GROUND_COLOR_BLUE` int NULL DEFAULT NULL,
  `FONT_BORDER_COLOR_RED` int NULL DEFAULT NULL,
  `FONT_BORDER_COLOR_GREEN` int NULL DEFAULT NULL,
  `FONT_BORDER_COLOR_BLUE` int NULL DEFAULT NULL,
  `DRAW_SHADOW` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_NOTE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_note
-- ----------------------------
INSERT INTO `r_note` VALUES (1, '处理前工作、处理后工作、处理失败工作都是支持进行多个的。', 419, 50, 430, 25, '宋体', 9, '0', '0', 0, 0, 0, 255, 205, 112, 100, 100, 100, '1');

-- ----------------------------
-- Table structure for r_partition
-- ----------------------------
DROP TABLE IF EXISTS `r_partition`;
CREATE TABLE `r_partition`  (
  `ID_PARTITION` bigint NOT NULL,
  `ID_PARTITION_SCHEMA` int NULL DEFAULT NULL,
  `PARTITION_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_PARTITION`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_partition
-- ----------------------------

-- ----------------------------
-- Table structure for r_partition_schema
-- ----------------------------
DROP TABLE IF EXISTS `r_partition_schema`;
CREATE TABLE `r_partition_schema`  (
  `ID_PARTITION_SCHEMA` bigint NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DYNAMIC_DEFINITION` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARTITIONS_PER_SLAVE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_PARTITION_SCHEMA`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_partition_schema
-- ----------------------------

-- ----------------------------
-- Table structure for r_repository_log
-- ----------------------------
DROP TABLE IF EXISTS `r_repository_log`;
CREATE TABLE `r_repository_log`  (
  `ID_REPOSITORY_LOG` bigint NOT NULL,
  `REP_VERSION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LOG_DATE` datetime NULL DEFAULT NULL,
  `LOG_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OPERATION_DESC` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_REPOSITORY_LOG`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_repository_log
-- ----------------------------
INSERT INTO `r_repository_log` VALUES (1, '5.0', '2023-05-15 22:41:36', 'admin', 'Creation of the Kettle repository');
INSERT INTO `r_repository_log` VALUES (2, '5.0', '2023-05-17 23:21:44', 'admin', 'save job \'作业 1\'');
INSERT INTO `r_repository_log` VALUES (3, '5.0', '2023-05-17 23:22:23', 'admin', 'Renamed from 作业 1 to 测试作业');
INSERT INTO `r_repository_log` VALUES (4, '5.0', '2023-05-17 23:38:00', 'admin', 'save job \'测试作业\'');
INSERT INTO `r_repository_log` VALUES (5, '5.0', '2023-05-17 23:38:10', 'admin', 'save job \'测试作业\'');
INSERT INTO `r_repository_log` VALUES (6, '5.0', '2023-05-18 18:07:50', 'admin', 'save job \'测试作业\'');
INSERT INTO `r_repository_log` VALUES (7, '5.0', '2023-05-18 18:56:15', 'admin', 'save job \'测试作业\'');
INSERT INTO `r_repository_log` VALUES (8, '5.0', '2023-05-18 18:56:48', 'admin', 'save job \'测试作业\'');
INSERT INTO `r_repository_log` VALUES (9, '5.0', '2023-05-18 22:01:19', 'admin', 'save job \'测试作业\'');
INSERT INTO `r_repository_log` VALUES (10, '5.0', '2023-05-18 23:17:38', 'admin', 'save job \'测试作业\'');
INSERT INTO `r_repository_log` VALUES (11, '5.0', '2023-05-18 23:46:30', 'admin', 'save job \'作业管理\'');
INSERT INTO `r_repository_log` VALUES (12, '5.0', '2023-05-19 11:33:17', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (13, '5.0', '2023-05-19 11:33:17', 'admin', 'save transformation \'获取公网ip\'');
INSERT INTO `r_repository_log` VALUES (14, '5.0', '2023-05-19 11:33:18', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (15, '5.0', '2023-05-19 11:33:18', 'admin', 'save transformation \'作业初始化\'');
INSERT INTO `r_repository_log` VALUES (16, '5.0', '2023-05-19 11:33:18', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (17, '5.0', '2023-05-19 11:33:18', 'admin', 'save transformation \'JSON解析示例\'');
INSERT INTO `r_repository_log` VALUES (18, '5.0', '2023-05-19 11:33:26', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (19, '5.0', '2023-05-19 11:33:26', 'admin', 'save transformation \'webservice测试\'');
INSERT INTO `r_repository_log` VALUES (20, '5.0', '2023-05-19 11:33:26', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (21, '5.0', '2023-05-19 11:33:26', 'admin', 'save transformation \'测试存储过程\'');
INSERT INTO `r_repository_log` VALUES (22, '5.0', '2023-05-19 11:33:26', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (23, '5.0', '2023-05-19 11:33:26', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (24, '5.0', '2023-05-19 11:33:26', 'admin', 'save transformation \'获取文件大小\'');
INSERT INTO `r_repository_log` VALUES (25, '5.0', '2023-05-19 11:33:27', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (26, '5.0', '2023-05-19 11:33:27', 'admin', 'save transformation \'处理转换-增量模板\'');
INSERT INTO `r_repository_log` VALUES (27, '5.0', '2023-05-19 11:33:27', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (28, '5.0', '2023-05-19 11:33:27', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (29, '5.0', '2023-05-19 11:33:27', 'admin', 'save transformation \'处理转换-组件集合\'');
INSERT INTO `r_repository_log` VALUES (30, '5.0', '2023-05-19 11:33:27', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (31, '5.0', '2023-05-19 11:33:27', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (32, '5.0', '2023-05-19 11:33:28', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (33, '5.0', '2023-05-19 11:33:28', 'admin', 'save transformation \'处理转换-默认模板\'');
INSERT INTO `r_repository_log` VALUES (34, '5.0', '2023-05-19 11:33:28', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (35, '5.0', '2023-05-19 11:33:28', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (36, '5.0', '2023-05-19 11:33:28', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (37, '5.0', '2023-05-19 11:33:28', 'admin', 'save transformation \'处理转换\'');
INSERT INTO `r_repository_log` VALUES (38, '5.0', '2023-05-19 11:33:28', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (39, '5.0', '2023-05-19 11:33:28', 'admin', 'save job \'获取公网ip\'');
INSERT INTO `r_repository_log` VALUES (40, '5.0', '2023-05-19 11:33:29', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (41, '5.0', '2023-05-19 11:33:29', 'admin', 'save job \'启动frpc\'');
INSERT INTO `r_repository_log` VALUES (42, '5.0', '2023-05-19 11:33:29', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (43, '5.0', '2023-05-19 11:33:29', 'admin', 'save job \'流转公用作业\'');
INSERT INTO `r_repository_log` VALUES (44, '5.0', '2023-05-19 11:33:30', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (45, '5.0', '2023-05-19 11:33:30', 'admin', 'save job \'测试作业\'');
INSERT INTO `r_repository_log` VALUES (46, '5.0', '2023-05-19 11:33:30', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (47, '5.0', '2023-05-19 11:33:30', 'admin', 'save job \'模板作业\'');
INSERT INTO `r_repository_log` VALUES (48, '5.0', '2023-05-19 11:33:34', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (49, '5.0', '2023-05-19 11:33:34', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (50, '5.0', '2023-05-19 11:33:35', 'admin', '迁移');
INSERT INTO `r_repository_log` VALUES (51, '5.0', '2023-05-19 11:33:35', 'admin', 'save job \'记录本机ip\'');
INSERT INTO `r_repository_log` VALUES (52, '5.0', '2023-05-19 14:27:34', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (53, '5.0', '2023-05-19 18:49:42', 'admin', 'save transformation \'处理转换\'');
INSERT INTO `r_repository_log` VALUES (54, '5.0', '2023-05-19 19:00:03', 'admin', 'save transformation \'处理转换\'');
INSERT INTO `r_repository_log` VALUES (55, '5.0', '2023-05-19 22:38:19', 'admin', 'save job \'启动frpc\'');
INSERT INTO `r_repository_log` VALUES (56, '5.0', '2023-05-19 22:38:44', 'admin', 'save job \'启动frpc\'');
INSERT INTO `r_repository_log` VALUES (57, '5.0', '2023-05-20 00:28:27', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (58, '5.0', '2023-05-20 00:32:09', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (59, '5.0', '2023-05-20 03:39:40', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (60, '5.0', '2023-05-20 03:44:28', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (61, '5.0', '2023-05-20 03:49:07', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (62, '5.0', '2023-05-20 15:46:46', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (63, '5.0', '2023-05-20 15:47:20', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (64, '5.0', '2023-05-20 15:48:51', 'admin', 'save job \'获取公网ip\'');
INSERT INTO `r_repository_log` VALUES (65, '5.0', '2023-05-21 22:13:11', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (66, '5.0', '2023-05-21 23:40:56', 'admin', 'save job \'dasd\'');
INSERT INTO `r_repository_log` VALUES (67, '5.0', '2023-05-21 23:45:55', 'admin', 'save job \'435435\'');
INSERT INTO `r_repository_log` VALUES (68, '5.0', '2023-05-21 23:45:55', 'admin', 'save job \'rtertger\'');
INSERT INTO `r_repository_log` VALUES (69, '5.0', '2023-05-21 23:50:36', 'admin', 'save job \'rterter\'');
INSERT INTO `r_repository_log` VALUES (70, '5.0', '2023-05-21 23:50:37', 'admin', 'save job \'treterte\'');
INSERT INTO `r_repository_log` VALUES (71, '5.0', '2023-05-21 23:54:25', 'admin', 'save job \'记录本机ip\'');
INSERT INTO `r_repository_log` VALUES (72, '5.0', '2023-05-21 23:54:42', 'admin', 'save job \'记录本机ip\'');
INSERT INTO `r_repository_log` VALUES (73, '5.0', '2023-05-21 23:55:15', 'admin', 'save job \'记录本机ip\'');
INSERT INTO `r_repository_log` VALUES (74, '5.0', '2023-05-22 21:32:00', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (75, '5.0', '2023-05-22 21:34:02', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (76, '5.0', '2023-05-22 21:35:31', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (77, '5.0', '2023-05-22 21:39:28', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (78, '5.0', '2023-05-22 21:40:19', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (79, '5.0', '2023-05-22 21:41:55', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (80, '5.0', '2023-05-22 21:45:29', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (81, '5.0', '2023-05-22 21:53:39', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (82, '5.0', '2023-05-23 08:07:56', 'admin', 'save job \'获取公网ip\'');
INSERT INTO `r_repository_log` VALUES (83, '5.0', '2023-05-23 08:08:08', 'admin', 'save job \'记录本机ip\'');
INSERT INTO `r_repository_log` VALUES (84, '5.0', '2023-05-23 08:08:17', 'admin', 'save job \'启动frpc\'');
INSERT INTO `r_repository_log` VALUES (85, '5.0', '2023-05-24 23:33:32', 'admin', 'save job \'javascript\'');
INSERT INTO `r_repository_log` VALUES (86, '5.0', '2023-05-24 23:33:44', 'admin', 'save job \'测试js\'');
INSERT INTO `r_repository_log` VALUES (87, '5.0', '2023-05-24 23:37:30', 'admin', 'save job \'sssss\'');
INSERT INTO `r_repository_log` VALUES (88, '5.0', '2023-05-24 23:50:09', 'admin', 'save job \'jsces\'');
INSERT INTO `r_repository_log` VALUES (89, '5.0', '2023-05-24 23:50:31', 'admin', 'save job \'jsces1\'');
INSERT INTO `r_repository_log` VALUES (90, '5.0', '2023-05-25 23:57:44', 'admin', 'save job \'km\'');
INSERT INTO `r_repository_log` VALUES (91, '5.0', '2023-05-25 23:59:34', 'admin', 'save job \'javascript\'');
INSERT INTO `r_repository_log` VALUES (92, '5.0', '2023-05-25 23:59:46', 'admin', 'save job \'shell\'');
INSERT INTO `r_repository_log` VALUES (93, '5.0', '2023-05-25 23:59:56', 'admin', 'save job \'sql\'');
INSERT INTO `r_repository_log` VALUES (94, '5.0', '2023-05-26 11:15:21', 'admin', 'save job \'km\'');
INSERT INTO `r_repository_log` VALUES (95, '5.0', '2023-05-26 11:15:38', 'admin', 'save job \'javascript\'');
INSERT INTO `r_repository_log` VALUES (96, '5.0', '2023-05-26 11:15:57', 'admin', 'save job \'shell\'');
INSERT INTO `r_repository_log` VALUES (97, '5.0', '2023-05-26 11:20:07', 'admin', 'save job \'sql\'');
INSERT INTO `r_repository_log` VALUES (98, '5.0', '2023-05-26 12:58:09', 'admin', 'save job \'js测试2\'');
INSERT INTO `r_repository_log` VALUES (99, '5.0', '2023-05-26 12:59:20', 'admin', 'save job \'sql测试\'');
INSERT INTO `r_repository_log` VALUES (100, '5.0', '2023-05-26 13:00:17', 'admin', 'save job \'sql测试\'');
INSERT INTO `r_repository_log` VALUES (101, '5.0', '2023-05-26 14:21:48', 'admin', 'save job \'shell测试\'');
INSERT INTO `r_repository_log` VALUES (102, '5.0', '2023-05-26 14:24:54', 'admin', 'save job \'km测试\'');
INSERT INTO `r_repository_log` VALUES (103, '5.0', '2023-05-26 14:44:54', 'admin', 'save job \'km测试\'');
INSERT INTO `r_repository_log` VALUES (104, '5.0', '2023-05-29 22:13:53', 'admin', 'save job \'js测试2\'');
INSERT INTO `r_repository_log` VALUES (105, '5.0', '2023-05-31 12:44:38', 'admin', 'save job \'xxxxx\'');
INSERT INTO `r_repository_log` VALUES (106, '5.0', '2023-05-31 14:11:40', 'admin', 'save job \'test2\'');
INSERT INTO `r_repository_log` VALUES (107, '5.0', '2023-05-31 14:11:41', 'admin', 'save job \'test3\'');
INSERT INTO `r_repository_log` VALUES (108, '5.0', '2023-05-31 14:12:21', 'admin', 'save job \'test4\'');
INSERT INTO `r_repository_log` VALUES (109, '5.0', '2023-05-31 14:13:45', 'admin', 'save job \'test5\'');
INSERT INTO `r_repository_log` VALUES (110, '5.0', '2023-05-31 14:26:29', 'admin', 'save job \'记录本机ip\'');
INSERT INTO `r_repository_log` VALUES (111, '5.0', '2023-05-31 14:29:29', 'admin', 'save job \'shell测试1\'');
INSERT INTO `r_repository_log` VALUES (112, '5.0', '2023-05-31 15:10:45', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (113, '5.0', '2023-05-31 15:10:59', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (114, '5.0', '2023-05-31 15:15:08', 'admin', 'save job \'JobManager\'');
INSERT INTO `r_repository_log` VALUES (115, '5.0', '2023-05-31 15:15:09', 'admin', 'save job \'记录本机ip\'');
INSERT INTO `r_repository_log` VALUES (116, '5.0', '2023-05-31 15:15:09', 'admin', 'save job \'js测试2\'');
INSERT INTO `r_repository_log` VALUES (117, '5.0', '2023-05-31 15:15:10', 'admin', 'save job \'获取公网ip\'');
INSERT INTO `r_repository_log` VALUES (118, '5.0', '2023-05-31 15:15:11', 'admin', 'save job \'启动frpc\'');
INSERT INTO `r_repository_log` VALUES (119, '5.0', '2023-05-31 15:15:12', 'admin', 'save job \'sql测试\'');
INSERT INTO `r_repository_log` VALUES (120, '5.0', '2023-05-31 15:15:13', 'admin', 'save job \'shell测试\'');
INSERT INTO `r_repository_log` VALUES (121, '5.0', '2023-05-31 15:15:14', 'admin', 'save job \'km测试\'');
INSERT INTO `r_repository_log` VALUES (122, '5.0', '2023-05-31 15:15:14', 'admin', 'save job \'shell测试1\'');
INSERT INTO `r_repository_log` VALUES (123, '5.0', '2023-05-31 15:15:30', 'admin', 'save job \'sql测试\'');
INSERT INTO `r_repository_log` VALUES (124, '5.0', '2023-05-31 15:15:31', 'admin', 'save job \'km测试\'');
INSERT INTO `r_repository_log` VALUES (125, '5.0', '2023-05-31 15:16:42', 'admin', 'save job \'shell测试\'');
INSERT INTO `r_repository_log` VALUES (126, '5.0', '2023-05-31 15:17:00', 'admin', 'save job \'shell测试\'');
INSERT INTO `r_repository_log` VALUES (127, '5.0', '2023-05-31 15:48:26', 'admin', 'save job \'记录本机ip\'');
INSERT INTO `r_repository_log` VALUES (128, '5.0', '2023-06-01 22:32:56', 'admin', 'save job \'流转公用作业\'');
INSERT INTO `r_repository_log` VALUES (129, '5.0', '2023-06-01 22:32:58', 'admin', 'save job \'模板作业\'');
INSERT INTO `r_repository_log` VALUES (130, '5.0', '2023-06-01 22:32:59', 'admin', 'save job \'km\'');
INSERT INTO `r_repository_log` VALUES (131, '5.0', '2023-06-01 22:32:59', 'admin', 'save job \'javascript\'');
INSERT INTO `r_repository_log` VALUES (132, '5.0', '2023-06-01 22:33:00', 'admin', 'save job \'shell\'');
INSERT INTO `r_repository_log` VALUES (133, '5.0', '2023-06-01 22:33:01', 'admin', 'save job \'sql\'');
INSERT INTO `r_repository_log` VALUES (134, '5.0', '2023-06-01 22:33:22', 'admin', 'save job \'流转公用作业\'');
INSERT INTO `r_repository_log` VALUES (135, '5.0', '2023-06-01 22:33:23', 'admin', 'save job \'模板作业\'');
INSERT INTO `r_repository_log` VALUES (136, '5.0', '2023-06-01 22:33:24', 'admin', 'save job \'km\'');
INSERT INTO `r_repository_log` VALUES (137, '5.0', '2023-06-01 22:33:25', 'admin', 'save job \'shell\'');

-- ----------------------------
-- Table structure for r_slave
-- ----------------------------
DROP TABLE IF EXISTS `r_slave`;
CREATE TABLE `r_slave`  (
  `ID_SLAVE` bigint NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HOST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PORT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `WEB_APP_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROXY_HOST_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PROXY_PORT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NON_PROXY_HOSTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MASTER` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_SLAVE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_slave
-- ----------------------------

-- ----------------------------
-- Table structure for r_step
-- ----------------------------
DROP TABLE IF EXISTS `r_step`;
CREATE TABLE `r_step`  (
  `ID_STEP` bigint NOT NULL,
  `ID_TRANSFORMATION` int NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ID_STEP_TYPE` int NULL DEFAULT NULL,
  `DISTRIBUTE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COPIES` int NULL DEFAULT NULL,
  `GUI_LOCATION_X` int NULL DEFAULT NULL,
  `GUI_LOCATION_Y` int NULL DEFAULT NULL,
  `GUI_DRAW` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COPIES_STRING` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_STEP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_step
-- ----------------------------
INSERT INTO `r_step` VALUES (1, 1, 'HTTP client', NULL, 43, '1', 1, 204, 98, '1', '1');
INSERT INTO `r_step` VALUES (2, 1, 'HTTP client 2', NULL, 43, '1', 1, 201, 198, '1', '1');
INSERT INTO `r_step` VALUES (3, 1, 'JavaScript代码', NULL, 48, '1', 1, 335, 98, '1', '1');
INSERT INTO `r_step` VALUES (4, 1, 'JavaScript代码 2', NULL, 48, '1', 1, 334, 196, '1', '1');
INSERT INTO `r_step` VALUES (5, 1, 'Switch / Case', NULL, 109, '1', 1, 472, 100, '1', '1');
INSERT INTO `r_step` VALUES (6, 1, '写日志', NULL, 131, '1', 1, 610, 99, '1', '1');
INSERT INTO `r_step` VALUES (7, 1, '发送邮件', NULL, 142, '1', 1, 476, 208, '1', '1');
INSERT INTO `r_step` VALUES (8, 1, '获取变量', NULL, 206, '1', 1, 73, 98, '1', '1');
INSERT INTO `r_step` VALUES (9, 1, '设置变量', NULL, 222, '1', 1, 615, 206, '1', '1');
INSERT INTO `r_step` VALUES (10, 2, 'JavaScript代码', NULL, 48, '1', 1, 333, 122, '1', '1');
INSERT INTO `r_step` VALUES (11, 2, '获取系统信息', NULL, 210, '1', 1, 130, 120, '1', '1');
INSERT INTO `r_step` VALUES (12, 2, '设置变量', NULL, 222, '1', 1, 521, 128, '1', '1');
INSERT INTO `r_step` VALUES (27, 7, '获取最大时间戳', NULL, 48, '1', 1, 153, 283, '1', '1');
INSERT INTO `r_step` VALUES (28, 7, '输入', NULL, 215, '0', 1, 151, 170, '1', '1');
INSERT INTO `r_step` VALUES (29, 7, '输出', NULL, 166, '1', 1, 344, 171, '1', '1');
INSERT INTO `r_step` VALUES (30, 8, '输入-excel', NULL, 27, '1', 1, 144, 371, '1', '1');
INSERT INTO `r_step` VALUES (31, 8, '输入-文本文件', NULL, 175, '1', 1, 316, 249, '1', '1');
INSERT INTO `r_step` VALUES (32, 8, '输入-表输入', NULL, 215, '0', 1, 150, 243, '1', '1');
INSERT INTO `r_step` VALUES (33, 8, '输出-excel', NULL, 61, '1', 1, 731, 362, '1', '1');
INSERT INTO `r_step` VALUES (34, 8, '输出-插入更新', NULL, 166, '1', 1, 721, 250, '1', '1');
INSERT INTO `r_step` VALUES (35, 8, '输出-文本文件', NULL, 176, '1', 1, 576, 363, '1', '1');
INSERT INTO `r_step` VALUES (36, 8, '输出-表输出', NULL, 216, '1', 1, 575, 248, '1', '1');
INSERT INTO `r_step` VALUES (37, 9, '输入', NULL, 215, '0', 1, 151, 170, '1', '1');
INSERT INTO `r_step` VALUES (38, 9, '输出', NULL, 166, '1', 1, 344, 171, '1', '1');
INSERT INTO `r_step` VALUES (39, 10, 'HTTP Post', NULL, 44, '1', 1, 392, 177, '1', '1');
INSERT INTO `r_step` VALUES (40, 10, 'HTTP client', NULL, 43, '1', 1, 393, 270, '1', '1');
INSERT INTO `r_step` VALUES (41, 10, '写日志', NULL, 131, '1', 1, 581, 183, '1', '1');
INSERT INTO `r_step` VALUES (42, 10, '自定义常量数据', NULL, 205, '1', 1, 133, 180, '1', '1');

-- ----------------------------
-- Table structure for r_step_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_step_attribute`;
CREATE TABLE `r_step_attribute`  (
  `ID_STEP_ATTRIBUTE` bigint NOT NULL,
  `ID_TRANSFORMATION` int NULL DEFAULT NULL,
  `ID_STEP` int NULL DEFAULT NULL,
  `NR` int NULL DEFAULT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VALUE_NUM` bigint NULL DEFAULT NULL,
  `VALUE_STR` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_STEP_ATTRIBUTE`) USING BTREE,
  UNIQUE INDEX `IDX_RSAT`(`ID_STEP`, `CODE`, `NR`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_step_attribute
-- ----------------------------
INSERT INTO `r_step_attribute` VALUES (1, 1, 1, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (2, 1, 1, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (3, 1, 1, 0, 'url', 0, 'http://icanhazip.com/');
INSERT INTO `r_step_attribute` VALUES (4, 1, 1, 0, 'urlInField', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (5, 1, 1, 0, 'urlField', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (6, 1, 1, 0, 'encoding', 0, 'UTF-8');
INSERT INTO `r_step_attribute` VALUES (7, 1, 1, 0, 'httpLogin', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (8, 1, 1, 0, 'httpPassword', 0, 'Encrypted ');
INSERT INTO `r_step_attribute` VALUES (9, 1, 1, 0, 'proxyHost', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (10, 1, 1, 0, 'proxyPort', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (11, 1, 1, 0, 'socketTimeout', 0, '10000');
INSERT INTO `r_step_attribute` VALUES (12, 1, 1, 0, 'connectionTimeout', 0, '10000');
INSERT INTO `r_step_attribute` VALUES (13, 1, 1, 0, 'closeIdleConnectionsTime', 0, '-1');
INSERT INTO `r_step_attribute` VALUES (14, 1, 1, 0, 'result_name', 0, 'zxip');
INSERT INTO `r_step_attribute` VALUES (15, 1, 1, 0, 'result_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (16, 1, 1, 0, 'response_time', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (17, 1, 1, 0, 'response_header', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (18, 1, 1, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (19, 1, 1, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (20, 1, 2, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (21, 1, 2, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (22, 1, 2, 0, 'url', 0, 'https://benma666.cn/myip');
INSERT INTO `r_step_attribute` VALUES (23, 1, 2, 0, 'urlInField', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (24, 1, 2, 0, 'urlField', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (25, 1, 2, 0, 'encoding', 0, 'UTF-8');
INSERT INTO `r_step_attribute` VALUES (26, 1, 2, 0, 'httpLogin', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (27, 1, 2, 0, 'httpPassword', 0, 'Encrypted ');
INSERT INTO `r_step_attribute` VALUES (28, 1, 2, 0, 'proxyHost', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (29, 1, 2, 0, 'proxyPort', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (30, 1, 2, 0, 'socketTimeout', 0, '10000');
INSERT INTO `r_step_attribute` VALUES (31, 1, 2, 0, 'connectionTimeout', 0, '10000');
INSERT INTO `r_step_attribute` VALUES (32, 1, 2, 0, 'closeIdleConnectionsTime', 0, '-1');
INSERT INTO `r_step_attribute` VALUES (33, 1, 2, 0, 'result_name', 0, 'result');
INSERT INTO `r_step_attribute` VALUES (34, 1, 2, 0, 'result_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (35, 1, 2, 0, 'response_time', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (36, 1, 2, 0, 'response_header', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (37, 1, 2, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (38, 1, 2, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (39, 1, 3, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (40, 1, 3, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (41, 1, 3, 0, 'compatible', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (42, 1, 3, 0, 'optimizationLevel', 0, '9');
INSERT INTO `r_step_attribute` VALUES (43, 1, 3, 0, 'jsScript_name', 0, 'Script 1');
INSERT INTO `r_step_attribute` VALUES (44, 1, 3, 0, 'jsScript_script', 0, '//Script here\n//ip变化\nvar ipbh = false;\nvar msg = \"\";\n//替换换行符\nvar zxip1 = zxip.replace(\"\\n\",\"\");\nif(dqip!=zxip1){\n	ipbh = true;\n	msg = \"原IP：\"+dqip+\"，最新IP：\"+zxip1;\n}');
INSERT INTO `r_step_attribute` VALUES (45, 1, 3, 0, 'jsScript_type', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (46, 1, 3, 0, 'field_name', 0, 'ipbh');
INSERT INTO `r_step_attribute` VALUES (47, 1, 3, 0, 'field_rename', 0, 'ipbh');
INSERT INTO `r_step_attribute` VALUES (48, 1, 3, 0, 'field_type', 0, 'Boolean');
INSERT INTO `r_step_attribute` VALUES (49, 1, 3, 0, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (50, 1, 3, 0, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (51, 1, 3, 0, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (52, 1, 3, 1, 'field_name', 0, 'msg');
INSERT INTO `r_step_attribute` VALUES (53, 1, 3, 1, 'field_rename', 0, 'msg');
INSERT INTO `r_step_attribute` VALUES (54, 1, 3, 1, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (55, 1, 3, 1, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (56, 1, 3, 1, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (57, 1, 3, 1, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (58, 1, 3, 2, 'field_name', 0, 'zxip1');
INSERT INTO `r_step_attribute` VALUES (59, 1, 3, 2, 'field_rename', 0, 'zxip1');
INSERT INTO `r_step_attribute` VALUES (60, 1, 3, 2, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (61, 1, 3, 2, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (62, 1, 3, 2, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (63, 1, 3, 2, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (64, 1, 3, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (65, 1, 3, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (66, 1, 4, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (67, 1, 4, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (68, 1, 4, 0, 'compatible', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (69, 1, 4, 0, 'optimizationLevel', 0, '9');
INSERT INTO `r_step_attribute` VALUES (70, 1, 4, 0, 'jsScript_name', 0, 'Script 1');
INSERT INTO `r_step_attribute` VALUES (71, 1, 4, 0, 'jsScript_script', 0, '//Script here\n//ip变化\nvar ipbh = false;\nvar msg = \"\";\n//var start = result.indexOf(\'14px; \">\')+8;\n//var zxip1 = result.substring(start,result.indexOf(\' \',start));\nvar zxip1=trim(result);\nif(dqip!=zxip1){\n	ipbh = true;\n	msg = \"原IP：\"+dqip+\"，最新IP：\"+zxip1;\n}');
INSERT INTO `r_step_attribute` VALUES (72, 1, 4, 0, 'jsScript_type', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (73, 1, 4, 0, 'field_name', 0, 'ipbh');
INSERT INTO `r_step_attribute` VALUES (74, 1, 4, 0, 'field_rename', 0, 'ipbh');
INSERT INTO `r_step_attribute` VALUES (75, 1, 4, 0, 'field_type', 0, 'Boolean');
INSERT INTO `r_step_attribute` VALUES (76, 1, 4, 0, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (77, 1, 4, 0, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (78, 1, 4, 0, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (79, 1, 4, 1, 'field_name', 0, 'msg');
INSERT INTO `r_step_attribute` VALUES (80, 1, 4, 1, 'field_rename', 0, 'msg');
INSERT INTO `r_step_attribute` VALUES (81, 1, 4, 1, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (82, 1, 4, 1, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (83, 1, 4, 1, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (84, 1, 4, 1, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (85, 1, 4, 2, 'field_name', 0, 'zxip1');
INSERT INTO `r_step_attribute` VALUES (86, 1, 4, 2, 'field_rename', 0, 'zxip1');
INSERT INTO `r_step_attribute` VALUES (87, 1, 4, 2, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (88, 1, 4, 2, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (89, 1, 4, 2, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (90, 1, 4, 2, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (91, 1, 4, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (92, 1, 4, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (93, 1, 5, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (94, 1, 5, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (95, 1, 5, 0, 'fieldname', 0, 'ipbh');
INSERT INTO `r_step_attribute` VALUES (96, 1, 5, 0, 'use_contains', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (97, 1, 5, 0, 'case_value_type', 0, 'Boolean');
INSERT INTO `r_step_attribute` VALUES (98, 1, 5, 0, 'case_value_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (99, 1, 5, 0, 'case_value_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (100, 1, 5, 0, 'case_value_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (101, 1, 5, 0, 'default_target_step', 0, '写日志');
INSERT INTO `r_step_attribute` VALUES (102, 1, 5, 0, 'case_value', 0, 'true');
INSERT INTO `r_step_attribute` VALUES (103, 1, 5, 0, 'case_target_step', 0, '发送邮件');
INSERT INTO `r_step_attribute` VALUES (104, 1, 5, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (105, 1, 5, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (106, 1, 6, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (107, 1, 6, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (108, 1, 6, 0, 'loglevel', 0, 'log_level_basic');
INSERT INTO `r_step_attribute` VALUES (109, 1, 6, 0, 'displayHeader', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (110, 1, 6, 0, 'limitRows', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (111, 1, 6, 0, 'limitRowsNumber', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (112, 1, 6, 0, 'logmessage', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (113, 1, 6, 0, 'field_name', 0, 'zxip1');
INSERT INTO `r_step_attribute` VALUES (114, 1, 6, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (115, 1, 6, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (116, 1, 7, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (117, 1, 7, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (118, 1, 7, 0, 'server', 0, 'yx_smtp');
INSERT INTO `r_step_attribute` VALUES (119, 1, 7, 0, 'port', 0, 'yx_smtp_dk');
INSERT INTO `r_step_attribute` VALUES (120, 1, 7, 0, 'destination', 0, 'yx_zh');
INSERT INTO `r_step_attribute` VALUES (121, 1, 7, 0, 'destinationCc', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (122, 1, 7, 0, 'destinationBCc', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (123, 1, 7, 0, 'replyToAddresses', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (124, 1, 7, 0, 'replyto', 0, 'yx_zh');
INSERT INTO `r_step_attribute` VALUES (125, 1, 7, 0, 'replytoname', 0, 'yx_zh');
INSERT INTO `r_step_attribute` VALUES (126, 1, 7, 0, 'subject', 0, 'zxip1');
INSERT INTO `r_step_attribute` VALUES (127, 1, 7, 0, 'include_date', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (128, 1, 7, 0, 'include_subfolders', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (129, 1, 7, 0, 'zipFilenameDynamic', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (130, 1, 7, 0, 'attachContentFromField', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (131, 1, 7, 0, 'attachContentField', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (132, 1, 7, 0, 'attachContentFileNameField', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (133, 1, 7, 0, 'isFilenameDynamic', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (134, 1, 7, 0, 'dynamicFieldname', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (135, 1, 7, 0, 'dynamicWildcard', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (136, 1, 7, 0, 'dynamicZipFilename', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (137, 1, 7, 0, 'sourcefilefoldername', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (138, 1, 7, 0, 'sourcewildcard', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (139, 1, 7, 0, 'contact_person', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (140, 1, 7, 0, 'contact_phone', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (141, 1, 7, 0, 'comment', 0, 'msg');
INSERT INTO `r_step_attribute` VALUES (142, 1, 7, 0, 'encoding', 0, 'UTF-8');
INSERT INTO `r_step_attribute` VALUES (143, 1, 7, 0, 'priority', 0, 'normal');
INSERT INTO `r_step_attribute` VALUES (144, 1, 7, 0, 'importance', 0, 'normal');
INSERT INTO `r_step_attribute` VALUES (145, 1, 7, 0, 'sensitivity', 0, 'normal');
INSERT INTO `r_step_attribute` VALUES (146, 1, 7, 0, 'include_files', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (147, 1, 7, 0, 'use_auth', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (148, 1, 7, 0, 'use_secure_auth', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (149, 1, 7, 0, 'auth_user', 0, 'yx_zh');
INSERT INTO `r_step_attribute` VALUES (150, 1, 7, 0, 'auth_password', 0, 'Encrypted 2be98afc86aa7f2e4cb79ce69c6ada2d7');
INSERT INTO `r_step_attribute` VALUES (151, 1, 7, 0, 'only_comment', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (152, 1, 7, 0, 'use_HTML', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (153, 1, 7, 0, 'use_Priority', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (154, 1, 7, 0, 'secureconnectiontype', 0, 'SSL');
INSERT INTO `r_step_attribute` VALUES (155, 1, 7, 0, 'zip_files', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (156, 1, 7, 0, 'zip_name', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (157, 1, 7, 0, 'zip_limit_size', 0, '0');
INSERT INTO `r_step_attribute` VALUES (158, 1, 7, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (159, 1, 7, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (160, 1, 8, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (161, 1, 8, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (162, 1, 8, 0, 'field_name', 0, 'dqip');
INSERT INTO `r_step_attribute` VALUES (163, 1, 8, 0, 'field_variable', 0, '${dqip}');
INSERT INTO `r_step_attribute` VALUES (164, 1, 8, 0, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (165, 1, 8, 0, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (166, 1, 8, 0, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (167, 1, 8, 0, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (168, 1, 8, 0, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (169, 1, 8, 0, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (170, 1, 8, 0, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (171, 1, 8, 0, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (172, 1, 8, 1, 'field_name', 0, 'yx_zh');
INSERT INTO `r_step_attribute` VALUES (173, 1, 8, 1, 'field_variable', 0, 'jinjuma@yeah.net');
INSERT INTO `r_step_attribute` VALUES (174, 1, 8, 1, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (175, 1, 8, 1, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (176, 1, 8, 1, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (177, 1, 8, 1, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (178, 1, 8, 1, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (179, 1, 8, 1, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (180, 1, 8, 1, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (181, 1, 8, 1, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (182, 1, 8, 2, 'field_name', 0, 'yx_mm');
INSERT INTO `r_step_attribute` VALUES (183, 1, 8, 2, 'field_variable', 0, 'Majinju1990.');
INSERT INTO `r_step_attribute` VALUES (184, 1, 8, 2, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (185, 1, 8, 2, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (186, 1, 8, 2, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (187, 1, 8, 2, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (188, 1, 8, 2, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (189, 1, 8, 2, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (190, 1, 8, 2, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (191, 1, 8, 2, 'field_trim_type', 0, 'both');
INSERT INTO `r_step_attribute` VALUES (192, 1, 8, 3, 'field_name', 0, 'yx_smtp');
INSERT INTO `r_step_attribute` VALUES (193, 1, 8, 3, 'field_variable', 0, 'smtp.yeah.net');
INSERT INTO `r_step_attribute` VALUES (194, 1, 8, 3, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (195, 1, 8, 3, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (196, 1, 8, 3, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (197, 1, 8, 3, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (198, 1, 8, 3, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (199, 1, 8, 3, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (200, 1, 8, 3, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (201, 1, 8, 3, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (202, 1, 8, 4, 'field_name', 0, 'yx_smtp_dk');
INSERT INTO `r_step_attribute` VALUES (203, 1, 8, 4, 'field_variable', 0, '994');
INSERT INTO `r_step_attribute` VALUES (204, 1, 8, 4, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (205, 1, 8, 4, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (206, 1, 8, 4, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (207, 1, 8, 4, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (208, 1, 8, 4, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (209, 1, 8, 4, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (210, 1, 8, 4, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (211, 1, 8, 4, 'field_trim_type', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (212, 1, 8, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (213, 1, 8, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (214, 1, 9, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (215, 1, 9, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (216, 1, 9, 0, 'field_name', 0, 'zxip1');
INSERT INTO `r_step_attribute` VALUES (217, 1, 9, 0, 'variable_name', 0, 'dqip');
INSERT INTO `r_step_attribute` VALUES (218, 1, 9, 0, 'variable_type', 0, 'ROOT_JOB');
INSERT INTO `r_step_attribute` VALUES (219, 1, 9, 0, 'default_value', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (220, 1, 9, 1, 'field_name', 0, 'msg');
INSERT INTO `r_step_attribute` VALUES (221, 1, 9, 1, 'variable_name', 0, 'msg');
INSERT INTO `r_step_attribute` VALUES (222, 1, 9, 1, 'variable_type', 0, 'ROOT_JOB');
INSERT INTO `r_step_attribute` VALUES (223, 1, 9, 1, 'default_value', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (224, 1, 9, 0, 'use_formatting', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (225, 1, 9, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (226, 1, 9, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (227, 2, 10, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (228, 2, 10, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (229, 2, 10, 0, 'compatible', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (230, 2, 10, 0, 'optimizationLevel', 0, '9');
INSERT INTO `r_step_attribute` VALUES (231, 2, 10, 0, 'jsScript_name', 0, 'Script 1');
INSERT INTO `r_step_attribute` VALUES (232, 2, 10, 0, 'jsScript_script', 0, '//Script here\n\nvar rootJob=Packages.cn.benma666.kettle.mytuils.KettleUtils.getRootJob(_step_);\nvar ID_JOB=rootJob.getObjectId().getId();\nvar JOB_NAME=rootJob.getObjectName();\n\nvar CLZH_PATH = getVariable(\"CLZH_PATH\",null);\nif(CLZH_PATH==null||CLZH_PATH==\"\"){\n	CLZH_PATH = rootJob.getRepositoryDirectory().getPath();\n}');
INSERT INTO `r_step_attribute` VALUES (233, 2, 10, 0, 'jsScript_type', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (234, 2, 10, 0, 'field_name', 0, 'ID_JOB');
INSERT INTO `r_step_attribute` VALUES (235, 2, 10, 0, 'field_rename', 0, 'ID_JOB');
INSERT INTO `r_step_attribute` VALUES (236, 2, 10, 0, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (237, 2, 10, 0, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (238, 2, 10, 0, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (239, 2, 10, 0, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (240, 2, 10, 1, 'field_name', 0, 'JOB_NAME');
INSERT INTO `r_step_attribute` VALUES (241, 2, 10, 1, 'field_rename', 0, 'JOB_NAME');
INSERT INTO `r_step_attribute` VALUES (242, 2, 10, 1, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (243, 2, 10, 1, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (244, 2, 10, 1, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (245, 2, 10, 1, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (246, 2, 10, 2, 'field_name', 0, 'CLZH_PATH');
INSERT INTO `r_step_attribute` VALUES (247, 2, 10, 2, 'field_rename', 0, 'CLZH_PATH');
INSERT INTO `r_step_attribute` VALUES (248, 2, 10, 2, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (249, 2, 10, 2, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (250, 2, 10, 2, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (251, 2, 10, 2, 'field_replace', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (252, 2, 10, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (253, 2, 10, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (254, 2, 11, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (255, 2, 11, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (256, 2, 11, 0, 'field_name', 0, 'START_TIME');
INSERT INTO `r_step_attribute` VALUES (257, 2, 11, 0, 'field_type', 0, 'system date (variable)');
INSERT INTO `r_step_attribute` VALUES (258, 2, 11, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (259, 2, 11, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (260, 2, 12, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (261, 2, 12, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (262, 2, 12, 0, 'field_name', 0, 'START_TIME');
INSERT INTO `r_step_attribute` VALUES (263, 2, 12, 0, 'variable_name', 0, 'START_TIME');
INSERT INTO `r_step_attribute` VALUES (264, 2, 12, 0, 'variable_type', 0, 'ROOT_JOB');
INSERT INTO `r_step_attribute` VALUES (265, 2, 12, 0, 'default_value', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (266, 2, 12, 1, 'field_name', 0, 'ID_JOB');
INSERT INTO `r_step_attribute` VALUES (267, 2, 12, 1, 'variable_name', 0, 'ID_JOB');
INSERT INTO `r_step_attribute` VALUES (268, 2, 12, 1, 'variable_type', 0, 'ROOT_JOB');
INSERT INTO `r_step_attribute` VALUES (269, 2, 12, 1, 'default_value', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (270, 2, 12, 2, 'field_name', 0, 'JOB_NAME');
INSERT INTO `r_step_attribute` VALUES (271, 2, 12, 2, 'variable_name', 0, 'JOB_NAME');
INSERT INTO `r_step_attribute` VALUES (272, 2, 12, 2, 'variable_type', 0, 'ROOT_JOB');
INSERT INTO `r_step_attribute` VALUES (273, 2, 12, 2, 'default_value', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (274, 2, 12, 3, 'field_name', 0, 'CLZH_PATH');
INSERT INTO `r_step_attribute` VALUES (275, 2, 12, 3, 'variable_name', 0, 'CLZH_PATH');
INSERT INTO `r_step_attribute` VALUES (276, 2, 12, 3, 'variable_type', 0, 'ROOT_JOB');
INSERT INTO `r_step_attribute` VALUES (277, 2, 12, 3, 'default_value', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (278, 2, 12, 0, 'use_formatting', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (279, 2, 12, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (280, 2, 12, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (537, 7, 27, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (538, 7, 27, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (539, 7, 27, 0, 'compatible', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (540, 7, 27, 0, 'optimizationLevel', 0, '9');
INSERT INTO `r_step_attribute` VALUES (541, 7, 27, 0, 'jsScript_name', 0, 'Script 1');
INSERT INTO `r_step_attribute` VALUES (542, 7, 27, 0, 'jsScript_script', 0, '//Script here\n\n\nif(ZLCQZD>getVariable(\"NEW_ZLSJC\",\"\")){\n	setVariable(\"NEW_ZLSJC\",ZLCQZD,\"r\");\n}\n\n');
INSERT INTO `r_step_attribute` VALUES (543, 7, 27, 0, 'jsScript_type', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (544, 7, 27, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (545, 7, 27, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (546, 7, 28, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (547, 7, 28, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (548, 7, 28, 0, 'id_connection', 2, NULL);
INSERT INTO `r_step_attribute` VALUES (549, 7, 28, 0, 'sql', 0, '${SOURCE_SQL}');
INSERT INTO `r_step_attribute` VALUES (550, 7, 28, 0, 'limit', 0, '0');
INSERT INTO `r_step_attribute` VALUES (551, 7, 28, 0, 'lookup', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (552, 7, 28, 0, 'execute_each_row', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (553, 7, 28, 0, 'variables_active', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (554, 7, 28, 0, 'lazy_conversion_active', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (555, 7, 28, 0, 'cached_row_meta_active', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (556, 7, 28, 0, 'row-meta', 0, '<row-meta></row-meta>');
INSERT INTO `r_step_attribute` VALUES (557, 7, 28, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (558, 7, 28, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (559, 7, 29, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (560, 7, 29, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (561, 7, 29, 0, 'id_connection', 2, NULL);
INSERT INTO `r_step_attribute` VALUES (562, 7, 29, 0, 'commit', 0, '1000');
INSERT INTO `r_step_attribute` VALUES (563, 7, 29, 0, 'schema', 0, '${TG_SCHEMA}');
INSERT INTO `r_step_attribute` VALUES (564, 7, 29, 0, 'table', 0, '${TG_TABLE}');
INSERT INTO `r_step_attribute` VALUES (565, 7, 29, 0, 'update_bypassed', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (566, 7, 29, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (567, 7, 29, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (568, 8, 30, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (569, 8, 30, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (570, 8, 30, 0, 'header', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (571, 8, 30, 0, 'noempty', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (572, 8, 30, 0, 'stoponempty', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (573, 8, 30, 0, 'filefield', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (574, 8, 30, 0, 'sheetfield', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (575, 8, 30, 0, 'sheetrownumfield', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (576, 8, 30, 0, 'rownumfield', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (577, 8, 30, 0, 'limit', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (578, 8, 30, 0, 'encoding', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (579, 8, 30, 0, 'add_to_result_filenames', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (580, 8, 30, 0, 'accept_filenames', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (581, 8, 30, 0, 'accept_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (582, 8, 30, 0, 'accept_stepname', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (583, 8, 30, 0, 'file_name', 0, '${SOURCE_DIR}');
INSERT INTO `r_step_attribute` VALUES (584, 8, 30, 0, 'file_mask', 0, '${SOURCE_TPF}');
INSERT INTO `r_step_attribute` VALUES (585, 8, 30, 0, 'exclude_file_mask', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (586, 8, 30, 0, 'file_required', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (587, 8, 30, 0, 'include_subfolders', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (588, 8, 30, 0, 'strict_types', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (589, 8, 30, 0, 'error_ignored', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (590, 8, 30, 0, 'error_line_skipped', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (591, 8, 30, 0, 'bad_line_files_dest_dir', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (592, 8, 30, 0, 'bad_line_files_ext', 0, 'warning');
INSERT INTO `r_step_attribute` VALUES (593, 8, 30, 0, 'error_line_files_dest_dir', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (594, 8, 30, 0, 'error_line_files_ext', 0, 'error');
INSERT INTO `r_step_attribute` VALUES (595, 8, 30, 0, 'line_number_files_dest_dir', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (596, 8, 30, 0, 'line_number_files_ext', 0, 'line');
INSERT INTO `r_step_attribute` VALUES (597, 8, 30, 0, 'shortFileFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (598, 8, 30, 0, 'pathFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (599, 8, 30, 0, 'hiddenFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (600, 8, 30, 0, 'lastModificationTimeFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (601, 8, 30, 0, 'uriNameFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (602, 8, 30, 0, 'rootUriNameFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (603, 8, 30, 0, 'extensionFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (604, 8, 30, 0, 'sizeFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (605, 8, 30, 0, 'spreadsheet_type', 0, 'POI');
INSERT INTO `r_step_attribute` VALUES (606, 8, 30, 0, 'password', 0, 'Encrypted ');
INSERT INTO `r_step_attribute` VALUES (607, 8, 30, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (608, 8, 30, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (609, 8, 31, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (610, 8, 31, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (611, 8, 31, 0, 'accept_filenames', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (612, 8, 31, 0, 'passing_through_fields', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (613, 8, 31, 0, 'accept_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (614, 8, 31, 0, 'accept_stepname', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (615, 8, 31, 0, 'separator', 0, '${SOURCE_FGF}');
INSERT INTO `r_step_attribute` VALUES (616, 8, 31, 0, 'enclosure', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (617, 8, 31, 0, 'enclosure_breaks', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (618, 8, 31, 0, 'escapechar', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (619, 8, 31, 0, 'header', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (620, 8, 31, 0, 'nr_headerlines', 1, NULL);
INSERT INTO `r_step_attribute` VALUES (621, 8, 31, 0, 'footer', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (622, 8, 31, 0, 'nr_footerlines', 1, NULL);
INSERT INTO `r_step_attribute` VALUES (623, 8, 31, 0, 'line_wrapped', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (624, 8, 31, 0, 'nr_wraps', 1, NULL);
INSERT INTO `r_step_attribute` VALUES (625, 8, 31, 0, 'layout_paged', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (626, 8, 31, 0, 'nr_lines_per_page', 80, NULL);
INSERT INTO `r_step_attribute` VALUES (627, 8, 31, 0, 'nr_lines_doc_header', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (628, 8, 31, 0, 'noempty', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (629, 8, 31, 0, 'include', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (630, 8, 31, 0, 'include_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (631, 8, 31, 0, 'rownum', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (632, 8, 31, 0, 'rownumByFile', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (633, 8, 31, 0, 'rownum_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (634, 8, 31, 0, 'format', 0, 'mixed');
INSERT INTO `r_step_attribute` VALUES (635, 8, 31, 0, 'encoding', 0, 'UTF-8');
INSERT INTO `r_step_attribute` VALUES (636, 8, 31, 0, 'length', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (637, 8, 31, 0, 'add_to_result_filenames', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (638, 8, 31, 0, 'limit', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (639, 8, 31, 0, 'file_name', 0, '${SOURCE_DIR}');
INSERT INTO `r_step_attribute` VALUES (640, 8, 31, 0, 'file_mask', 0, '${SOURCE_TPF}');
INSERT INTO `r_step_attribute` VALUES (641, 8, 31, 0, 'exclude_file_mask', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (642, 8, 31, 0, 'file_required', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (643, 8, 31, 0, 'include_subfolders', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (644, 8, 31, 0, 'file_type', 0, 'CSV');
INSERT INTO `r_step_attribute` VALUES (645, 8, 31, 0, 'compression', 0, 'None');
INSERT INTO `r_step_attribute` VALUES (646, 8, 31, 0, 'error_ignored', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (647, 8, 31, 0, 'skip_bad_files', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (648, 8, 31, 0, 'file_error_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (649, 8, 31, 0, 'file_error_message_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (650, 8, 31, 0, 'error_line_skipped', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (651, 8, 31, 0, 'error_count_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (652, 8, 31, 0, 'error_fields_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (653, 8, 31, 0, 'error_text_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (654, 8, 31, 0, 'bad_line_files_dest_dir', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (655, 8, 31, 0, 'bad_line_files_ext', 0, 'warning');
INSERT INTO `r_step_attribute` VALUES (656, 8, 31, 0, 'error_line_files_dest_dir', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (657, 8, 31, 0, 'error_line_files_ext', 0, 'error');
INSERT INTO `r_step_attribute` VALUES (658, 8, 31, 0, 'line_number_files_dest_dir', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (659, 8, 31, 0, 'line_number_files_ext', 0, 'line');
INSERT INTO `r_step_attribute` VALUES (660, 8, 31, 0, 'date_format_lenient', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (661, 8, 31, 0, 'date_format_locale', 0, 'zh_CN');
INSERT INTO `r_step_attribute` VALUES (662, 8, 31, 0, 'shortFileFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (663, 8, 31, 0, 'pathFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (664, 8, 31, 0, 'hiddenFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (665, 8, 31, 0, 'lastModificationTimeFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (666, 8, 31, 0, 'uriNameFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (667, 8, 31, 0, 'rootUriNameFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (668, 8, 31, 0, 'extensionFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (669, 8, 31, 0, 'sizeFieldName', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (670, 8, 31, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (671, 8, 31, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (672, 8, 32, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (673, 8, 32, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (674, 8, 32, 0, 'id_connection', 1, NULL);
INSERT INTO `r_step_attribute` VALUES (675, 8, 32, 0, 'sql', 0, '${SOURCE_SQL}');
INSERT INTO `r_step_attribute` VALUES (676, 8, 32, 0, 'limit', 0, '0');
INSERT INTO `r_step_attribute` VALUES (677, 8, 32, 0, 'lookup', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (678, 8, 32, 0, 'execute_each_row', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (679, 8, 32, 0, 'variables_active', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (680, 8, 32, 0, 'lazy_conversion_active', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (681, 8, 32, 0, 'cached_row_meta_active', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (682, 8, 32, 0, 'row-meta', 0, '<row-meta></row-meta>');
INSERT INTO `r_step_attribute` VALUES (683, 8, 32, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (684, 8, 32, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (685, 8, 33, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (686, 8, 33, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (687, 8, 33, 0, 'header', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (688, 8, 33, 0, 'footer', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (689, 8, 33, 0, 'makeSheetActive', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (690, 8, 33, 0, 'startingCell', 0, 'A1');
INSERT INTO `r_step_attribute` VALUES (691, 8, 33, 0, 'appendOmitHeader', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (692, 8, 33, 0, 'appendEmpty', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (693, 8, 33, 0, 'appendOffset', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (694, 8, 33, 0, 'rowWritingMethod', 0, 'overwrite');
INSERT INTO `r_step_attribute` VALUES (695, 8, 33, 0, 'appendLines', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (696, 8, 33, 0, 'add_to_result_filenames', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (697, 8, 33, 0, 'file_name', 0, '${TG_FILENAME}');
INSERT INTO `r_step_attribute` VALUES (698, 8, 33, 0, 'do_not_open_newfile_init', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (699, 8, 33, 0, 'forceFormulaRecalculation', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (700, 8, 33, 0, 'leaveExistingStylesUnchanged', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (701, 8, 33, 0, 'file_extention', 0, 'xlsx');
INSERT INTO `r_step_attribute` VALUES (702, 8, 33, 0, 'file_split', 100000, NULL);
INSERT INTO `r_step_attribute` VALUES (703, 8, 33, 0, 'file_add_stepnr', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (704, 8, 33, 0, 'file_add_date', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (705, 8, 33, 0, 'file_add_time', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (706, 8, 33, 0, 'SpecifyFormat', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (707, 8, 33, 0, 'date_time_format', 0, 'yyyyMMddHHmmss');
INSERT INTO `r_step_attribute` VALUES (708, 8, 33, 0, 'autosizecolums', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (709, 8, 33, 0, 'stream_data', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (710, 8, 33, 0, 'protect_sheet', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (711, 8, 33, 0, 'protected_by', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (712, 8, 33, 0, 'password', 0, 'Encrypted ');
INSERT INTO `r_step_attribute` VALUES (713, 8, 33, 0, 'template_enabled', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (714, 8, 33, 0, 'template_filename', 0, 'template.xls');
INSERT INTO `r_step_attribute` VALUES (715, 8, 33, 0, 'template_sheet_enabled', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (716, 8, 33, 0, 'template_sheet_hidden', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (717, 8, 33, 0, 'template_sheetname', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (718, 8, 33, 0, 'sheetname', 0, 'Sheet1');
INSERT INTO `r_step_attribute` VALUES (719, 8, 33, 0, 'if_file_exists', 0, 'new');
INSERT INTO `r_step_attribute` VALUES (720, 8, 33, 0, 'if_sheet_exists', 0, 'new');
INSERT INTO `r_step_attribute` VALUES (721, 8, 33, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (722, 8, 33, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (723, 8, 34, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (724, 8, 34, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (725, 8, 34, 0, 'id_connection', 2, NULL);
INSERT INTO `r_step_attribute` VALUES (726, 8, 34, 0, 'commit', 0, '100');
INSERT INTO `r_step_attribute` VALUES (727, 8, 34, 0, 'schema', 0, '${TG_SCHEMA}');
INSERT INTO `r_step_attribute` VALUES (728, 8, 34, 0, 'table', 0, '${TG_TABLE}');
INSERT INTO `r_step_attribute` VALUES (729, 8, 34, 0, 'update_bypassed', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (730, 8, 34, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (731, 8, 34, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (732, 8, 35, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (733, 8, 35, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (734, 8, 35, 0, 'separator', 0, '${TG_FGF}');
INSERT INTO `r_step_attribute` VALUES (735, 8, 35, 0, 'enclosure', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (736, 8, 35, 0, 'enclosure_forced', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (737, 8, 35, 0, 'enclosure_fix_disabled', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (738, 8, 35, 0, 'header', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (739, 8, 35, 0, 'footer', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (740, 8, 35, 0, 'format', 0, 'DOS');
INSERT INTO `r_step_attribute` VALUES (741, 8, 35, 0, 'compression', 0, 'None');
INSERT INTO `r_step_attribute` VALUES (742, 8, 35, 0, 'encoding', 0, 'UTF-8');
INSERT INTO `r_step_attribute` VALUES (743, 8, 35, 0, 'file_name', 0, '${TG_FILENAME}');
INSERT INTO `r_step_attribute` VALUES (744, 8, 35, 0, 'file_servlet_output', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (745, 8, 35, 0, 'do_not_open_new_file_init', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (746, 8, 35, 0, 'file_extention', 0, 'txt');
INSERT INTO `r_step_attribute` VALUES (747, 8, 35, 0, 'file_append', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (748, 8, 35, 0, 'file_split_rows', 0, '200000');
INSERT INTO `r_step_attribute` VALUES (749, 8, 35, 0, 'file_add_stepnr', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (750, 8, 35, 0, 'file_add_partnr', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (751, 8, 35, 0, 'file_add_date', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (752, 8, 35, 0, 'date_time_format', 0, 'yyyyMMddHHmmss');
INSERT INTO `r_step_attribute` VALUES (753, 8, 35, 0, 'create_parent_folder', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (754, 8, 35, 0, 'SpecifyFormat', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (755, 8, 35, 0, 'add_to_result_filenames', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (756, 8, 35, 0, 'file_add_time', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (757, 8, 35, 0, 'file_pad', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (758, 8, 35, 0, 'file_fast_dump', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (759, 8, 35, 0, 'fileNameInField', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (760, 8, 35, 0, 'fileNameField', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (761, 8, 35, 0, 'endedLine', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (762, 8, 35, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (763, 8, 35, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (764, 8, 36, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (765, 8, 36, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (766, 8, 36, 0, 'id_connection', 1, NULL);
INSERT INTO `r_step_attribute` VALUES (767, 8, 36, 0, 'schema', 0, '${TG_SCHEMA}');
INSERT INTO `r_step_attribute` VALUES (768, 8, 36, 0, 'table', 0, '${TG_TABLE}');
INSERT INTO `r_step_attribute` VALUES (769, 8, 36, 0, 'commit', 0, '1000');
INSERT INTO `r_step_attribute` VALUES (770, 8, 36, 0, 'truncate', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (771, 8, 36, 0, 'ignore_errors', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (772, 8, 36, 0, 'use_batch', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (773, 8, 36, 0, 'specify_fields', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (774, 8, 36, 0, 'partitioning_enabled', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (775, 8, 36, 0, 'partitioning_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (776, 8, 36, 0, 'partitioning_daily', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (777, 8, 36, 0, 'partitioning_monthly', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (778, 8, 36, 0, 'tablename_in_field', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (779, 8, 36, 0, 'tablename_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (780, 8, 36, 0, 'tablename_in_table', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (781, 8, 36, 0, 'return_keys', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (782, 8, 36, 0, 'return_field', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (783, 8, 36, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (784, 8, 36, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (785, 9, 37, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (786, 9, 37, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (787, 9, 37, 0, 'id_connection', 1, NULL);
INSERT INTO `r_step_attribute` VALUES (788, 9, 37, 0, 'sql', 0, '${SOURCE_SQL}');
INSERT INTO `r_step_attribute` VALUES (789, 9, 37, 0, 'limit', 0, '0');
INSERT INTO `r_step_attribute` VALUES (790, 9, 37, 0, 'lookup', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (791, 9, 37, 0, 'execute_each_row', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (792, 9, 37, 0, 'variables_active', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (793, 9, 37, 0, 'lazy_conversion_active', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (794, 9, 37, 0, 'cached_row_meta_active', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (795, 9, 37, 0, 'row-meta', 0, '<row-meta></row-meta>');
INSERT INTO `r_step_attribute` VALUES (796, 9, 37, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (797, 9, 37, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (798, 9, 38, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (799, 9, 38, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (800, 9, 38, 0, 'id_connection', 2, NULL);
INSERT INTO `r_step_attribute` VALUES (801, 9, 38, 0, 'commit', 0, '100');
INSERT INTO `r_step_attribute` VALUES (802, 9, 38, 0, 'schema', 0, '${TG_SCHEMA}');
INSERT INTO `r_step_attribute` VALUES (803, 9, 38, 0, 'table', 0, '${TG_TABLE}');
INSERT INTO `r_step_attribute` VALUES (804, 9, 38, 0, 'update_bypassed', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (805, 9, 38, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (806, 9, 38, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (807, 10, 39, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (808, 10, 39, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (809, 10, 39, 0, 'postafile', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (810, 10, 39, 0, 'encoding', 0, 'UTF-8');
INSERT INTO `r_step_attribute` VALUES (811, 10, 39, 0, 'url', 0, 'https://58.17.186.206:8021/myservice/sjdx/list.do?dxdm=SYS_QX_QXXX_MRCD&e_sjly=trimdata');
INSERT INTO `r_step_attribute` VALUES (812, 10, 39, 0, 'urlInField', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (813, 10, 39, 0, 'urlField', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (814, 10, 39, 0, 'requestEntity', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (815, 10, 39, 0, 'httpLogin', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (816, 10, 39, 0, 'httpPassword', 0, 'Encrypted ');
INSERT INTO `r_step_attribute` VALUES (817, 10, 39, 0, 'proxyHost', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (818, 10, 39, 0, 'proxyPort', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (819, 10, 39, 0, 'socketTimeout', 0, '10000');
INSERT INTO `r_step_attribute` VALUES (820, 10, 39, 0, 'connectionTimeout', 0, '10000');
INSERT INTO `r_step_attribute` VALUES (821, 10, 39, 0, 'closeIdleConnectionsTime', 0, '-1');
INSERT INTO `r_step_attribute` VALUES (822, 10, 39, 0, 'query_name', 0, 'e_sjly');
INSERT INTO `r_step_attribute` VALUES (823, 10, 39, 0, 'query_parameter', 0, 'e_sjly');
INSERT INTO `r_step_attribute` VALUES (824, 10, 39, 0, 'result_name', 0, 'result');
INSERT INTO `r_step_attribute` VALUES (825, 10, 39, 0, 'result_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (826, 10, 39, 0, 'response_time', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (827, 10, 39, 0, 'response_header', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (828, 10, 39, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (829, 10, 39, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (830, 10, 40, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (831, 10, 40, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (832, 10, 40, 0, 'url', 0, 'https://trimdata.cn:2000/myservice/sjdx/page.do?dxdm=SYS_QX_YHXX_CQJCDL&e_sjly=trimdata');
INSERT INTO `r_step_attribute` VALUES (833, 10, 40, 0, 'urlInField', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (834, 10, 40, 0, 'urlField', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (835, 10, 40, 0, 'encoding', 0, 'UTF-8');
INSERT INTO `r_step_attribute` VALUES (836, 10, 40, 0, 'httpLogin', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (837, 10, 40, 0, 'httpPassword', 0, 'Encrypted ');
INSERT INTO `r_step_attribute` VALUES (838, 10, 40, 0, 'proxyHost', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (839, 10, 40, 0, 'proxyPort', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (840, 10, 40, 0, 'socketTimeout', 0, '10000');
INSERT INTO `r_step_attribute` VALUES (841, 10, 40, 0, 'connectionTimeout', 0, '10000');
INSERT INTO `r_step_attribute` VALUES (842, 10, 40, 0, 'closeIdleConnectionsTime', 0, '-1');
INSERT INTO `r_step_attribute` VALUES (843, 10, 40, 0, 'result_name', 0, 'result');
INSERT INTO `r_step_attribute` VALUES (844, 10, 40, 0, 'result_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (845, 10, 40, 0, 'response_time', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (846, 10, 40, 0, 'response_header', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (847, 10, 40, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (848, 10, 40, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (849, 10, 41, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (850, 10, 41, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (851, 10, 41, 0, 'loglevel', 0, 'log_level_basic');
INSERT INTO `r_step_attribute` VALUES (852, 10, 41, 0, 'displayHeader', 0, 'Y');
INSERT INTO `r_step_attribute` VALUES (853, 10, 41, 0, 'limitRows', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (854, 10, 41, 0, 'limitRowsNumber', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (855, 10, 41, 0, 'logmessage', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (856, 10, 41, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (857, 10, 41, 0, 'row_distribution_code', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (858, 10, 42, 0, 'PARTITIONING_SCHEMA', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (859, 10, 42, 0, 'PARTITIONING_METHOD', 0, 'none');
INSERT INTO `r_step_attribute` VALUES (860, 10, 42, 0, 'field_name', 0, 'e_sjly');
INSERT INTO `r_step_attribute` VALUES (861, 10, 42, 0, 'field_type', 0, 'String');
INSERT INTO `r_step_attribute` VALUES (862, 10, 42, 0, 'field_format', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (863, 10, 42, 0, 'field_currency', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (864, 10, 42, 0, 'field_decimal', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (865, 10, 42, 0, 'field_group', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (866, 10, 42, 0, 'field_length', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (867, 10, 42, 0, 'field_precision', -1, NULL);
INSERT INTO `r_step_attribute` VALUES (868, 10, 42, 0, 'set_empty_string', 0, 'N');
INSERT INTO `r_step_attribute` VALUES (869, 10, 42, 0, 'nr_lines', 1, NULL);
INSERT INTO `r_step_attribute` VALUES (870, 10, 42, 0, 'item_0', 0, 'trimdata');
INSERT INTO `r_step_attribute` VALUES (871, 10, 42, 0, 'cluster_schema', 0, NULL);
INSERT INTO `r_step_attribute` VALUES (872, 10, 42, 0, 'row_distribution_code', 0, NULL);

-- ----------------------------
-- Table structure for r_step_database
-- ----------------------------
DROP TABLE IF EXISTS `r_step_database`;
CREATE TABLE `r_step_database`  (
  `ID_TRANSFORMATION` int NULL DEFAULT NULL,
  `ID_STEP` int NULL DEFAULT NULL,
  `ID_DATABASE` int NULL DEFAULT NULL,
  INDEX `IDX_RSD1`(`ID_TRANSFORMATION`) USING BTREE,
  INDEX `IDX_RSD2`(`ID_DATABASE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_step_database
-- ----------------------------
INSERT INTO `r_step_database` VALUES (7, 28, 2);
INSERT INTO `r_step_database` VALUES (7, 29, 2);
INSERT INTO `r_step_database` VALUES (8, 32, 1);
INSERT INTO `r_step_database` VALUES (8, 34, 2);
INSERT INTO `r_step_database` VALUES (8, 36, 1);
INSERT INTO `r_step_database` VALUES (9, 37, 1);
INSERT INTO `r_step_database` VALUES (9, 38, 2);

-- ----------------------------
-- Table structure for r_step_type
-- ----------------------------
DROP TABLE IF EXISTS `r_step_type`;
CREATE TABLE `r_step_type`  (
  `ID_STEP_TYPE` bigint NOT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HELPTEXT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_STEP_TYPE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_step_type
-- ----------------------------
INSERT INTO `r_step_type` VALUES (1, 'AccessInput', 'Access 输入', 'Read data from a Microsoft Access file');
INSERT INTO `r_step_type` VALUES (2, 'AccessOutput', 'Access 输出', 'Stores records into an MS-Access database table.');
INSERT INTO `r_step_type` VALUES (3, 'CheckSum', 'Add a checksum', 'Add a checksum column for each input row');
INSERT INTO `r_step_type` VALUES (4, 'AddXML', 'Add XML', 'Encode several fields into an XML fragment');
INSERT INTO `r_step_type` VALUES (5, 'FieldMetadataAnnotation', 'Annotate stream', 'Add more details to describe data for published models used by the Streamlined Data Refinery.');
INSERT INTO `r_step_type` VALUES (6, 'AvroInput', 'Avro input', 'Reads data from an Avro file');
INSERT INTO `r_step_type` VALUES (7, 'AvroInputNew', 'Avro input', 'Reads data from Avro file');
INSERT INTO `r_step_type` VALUES (8, 'AvroOutput', 'Avro output', 'Writes data to an Avro file according to a mapping');
INSERT INTO `r_step_type` VALUES (9, 'BlockingStep', 'Blocking step', 'The Blocking step blocks all output until the very last row is received from the previous step.');
INSERT INTO `r_step_type` VALUES (10, 'CallEndpointStep', 'Call endpoint', 'Call an endpoint of the Pentaho Server.');
INSERT INTO `r_step_type` VALUES (11, 'CassandraInput', 'Cassandra input', 'Reads data from a Cassandra table');
INSERT INTO `r_step_type` VALUES (12, 'CassandraOutput', 'Cassandra output', 'Writes to a Cassandra table');
INSERT INTO `r_step_type` VALUES (13, 'ChangeFileEncoding', 'Change file encoding', 'Change file encoding and create a new file');
INSERT INTO `r_step_type` VALUES (14, 'CloneRow', 'Clone row', 'Clone a row as many times as needed');
INSERT INTO `r_step_type` VALUES (15, 'ClosureGenerator', 'Closure generator', 'This step allows you to generates a closure table using parent-child relationships.');
INSERT INTO `r_step_type` VALUES (16, 'ColumnExists', 'Column exists', 'Check if a column exists');
INSERT INTO `r_step_type` VALUES (17, 'ConcatFields', 'Concat fields', 'Concat fields together into a new field (similar to the Text File Output step)');
INSERT INTO `r_step_type` VALUES (18, 'CouchDbInput', 'CouchDB input', 'Reads from a Couch DB view');
INSERT INTO `r_step_type` VALUES (19, 'CsvInput', 'CSV文件输入', 'Simple CSV file input');
INSERT INTO `r_step_type` VALUES (20, 'CubeInput', 'Cube 文件输入', '从一个cube读取记录.');
INSERT INTO `r_step_type` VALUES (21, 'CubeOutput', 'Cube输出', '把数据写入一个cube');
INSERT INTO `r_step_type` VALUES (22, 'TypeExitEdi2XmlStep', 'EDI to XML', 'Converts Edi text to generic XML');
INSERT INTO `r_step_type` VALUES (23, 'ElasticSearchBulk', 'Elasticsearch bulk insert', 'Performs bulk inserts into ElasticSearch');
INSERT INTO `r_step_type` VALUES (24, 'ShapeFileReader', 'ESRI shapefile reader', 'Reads shape file data from an ESRI shape file and linked DBF file');
INSERT INTO `r_step_type` VALUES (25, 'MetaInject', 'ETL metadata injection', 'ETL元数据注入');
INSERT INTO `r_step_type` VALUES (26, 'DummyStep', 'Example step', 'This is a plugin example step');
INSERT INTO `r_step_type` VALUES (27, 'ExcelInput', 'Excel输入', '从一个微软的Excel文件里读取数据. 兼容Excel 95, 97 and 2000.');
INSERT INTO `r_step_type` VALUES (28, 'ExcelOutput', 'Excel输出', 'Stores records into an Excel (XLS) document with formatting information.');
INSERT INTO `r_step_type` VALUES (29, 'getXMLData', 'Get data from XML', 'Get data from XML file by using XPath.\n This step also allows you to parse XML defined in a previous field.');
INSERT INTO `r_step_type` VALUES (30, 'GetSlaveSequence', 'Get ID from slave server', 'Retrieves unique IDs in blocks from a slave server.  The referenced sequence needs to be configured on the slave server in the XML configuration file.');
INSERT INTO `r_step_type` VALUES (31, 'RecordsFromStream', 'Get records from stream', 'This step allows you to read records from a streaming step.');
INSERT INTO `r_step_type` VALUES (32, 'GetSessionVariableStep', 'Get session variables', 'Get session variables from the current user session.');
INSERT INTO `r_step_type` VALUES (33, 'TypeExitGoogleAnalyticsInputStep', 'Google Analytics', 'Fetches data from google analytics account');
INSERT INTO `r_step_type` VALUES (34, 'GPBulkLoader', 'Greenplum bulk loader', 'Greenplum bulk loader');
INSERT INTO `r_step_type` VALUES (35, 'GPLoad', 'Greenplum load', 'Greenplum load');
INSERT INTO `r_step_type` VALUES (36, 'ParallelGzipCsvInput', 'GZIP CSV input', 'Parallel GZIP CSV file input reader');
INSERT INTO `r_step_type` VALUES (37, 'HadoopFileInputPlugin', 'Hadoop file input', 'Process files from an HDFS location');
INSERT INTO `r_step_type` VALUES (38, 'HadoopFileOutputPlugin', 'Hadoop file output', 'Create files in an HDFS location ');
INSERT INTO `r_step_type` VALUES (39, 'HBaseInput', 'HBase input', 'Reads data from a HBase table according to a mapping ');
INSERT INTO `r_step_type` VALUES (40, 'HBaseOutput', 'HBase output', 'Writes data to an HBase table according to a mapping');
INSERT INTO `r_step_type` VALUES (41, 'HBaseRowDecoder', 'HBase row decoder', 'Decodes an incoming key and HBase result object according to a mapping ');
INSERT INTO `r_step_type` VALUES (42, 'HL7Input', 'HL7 input', 'Reads and parses HL7 messages and outputs a series of values from the messages');
INSERT INTO `r_step_type` VALUES (43, 'HTTP', 'HTTP client', 'Call a web service over HTTP by supplying a base URL by allowing parameters to be set dynamically');
INSERT INTO `r_step_type` VALUES (44, 'HTTPPOST', 'HTTP post', 'Call a web service request over HTTP by supplying a base URL by allowing parameters to be set dynamically');
INSERT INTO `r_step_type` VALUES (45, 'InfobrightOutput', 'Infobright 批量加载', 'Load data to an Infobright database table');
INSERT INTO `r_step_type` VALUES (46, 'VectorWiseBulkLoader', 'Ingres VectorWise 批量加载', 'This step interfaces with the Ingres VectorWise Bulk Loader \"COPY TABLE\" command.');
INSERT INTO `r_step_type` VALUES (47, 'UserDefinedJavaClass', 'Java 代码', 'This step allows you to program a step using Java code');
INSERT INTO `r_step_type` VALUES (48, 'ScriptValueMod', 'JavaScript代码', 'This is a modified plugin for the Scripting Values with improved interface and performance.\nWritten & donated to open source by Martin Lange, Proconis : http://www.proconis.de');
INSERT INTO `r_step_type` VALUES (49, 'Jms2Consumer', 'JMS consumer', 'Consumes JMS streams');
INSERT INTO `r_step_type` VALUES (50, 'Jms2Producer', 'JMS producer', 'Produces JMS streams');
INSERT INTO `r_step_type` VALUES (51, 'JsonInput', 'JSON input', 'Extract relevant portions out of JSON structures (file or incoming field) and output rows');
INSERT INTO `r_step_type` VALUES (52, 'JsonOutput', 'JSON output', 'Create JSON block and output it in a field or a file.');
INSERT INTO `r_step_type` VALUES (53, 'KafkaConsumerInput', 'Kafka consumer', 'Consume messages from a Kafka topic');
INSERT INTO `r_step_type` VALUES (54, 'KafkaProducerOutput', 'Kafka producer', 'Produce messages to a Kafka topic');
INSERT INTO `r_step_type` VALUES (55, 'LDAPInput', 'LDAP 输入', 'Read data from LDAP host');
INSERT INTO `r_step_type` VALUES (56, 'LDAPOutput', 'LDAP 输出', 'Perform Insert, upsert, update, add or delete operations on records based on their DN (Distinguished  Name).');
INSERT INTO `r_step_type` VALUES (57, 'LDIFInput', 'LDIF 输入', 'Read data from LDIF files');
INSERT INTO `r_step_type` VALUES (58, 'LucidDBStreamingLoader', 'LucidDB streaming loader', 'Load data into LucidDB by using Remote Rows UDX.');
INSERT INTO `r_step_type` VALUES (59, 'HadoopEnterPlugin', 'MapReduce input', 'Enter a Hadoop Mapper or Reducer transformation');
INSERT INTO `r_step_type` VALUES (60, 'HadoopExitPlugin', 'MapReduce output', 'Exit a Hadoop Mapper or Reducer transformation ');
INSERT INTO `r_step_type` VALUES (61, 'TypeExitExcelWriterStep', 'Microsoft Excel 输出', 'Writes or appends data to an Excel file');
INSERT INTO `r_step_type` VALUES (62, 'MondrianInput', 'Mondrian 输入', 'Execute and retrieve data using an MDX query against a Pentaho Analyses OLAP server (Mondrian)');
INSERT INTO `r_step_type` VALUES (63, 'MonetDBAgileMart', 'MonetDB Agile Mart', 'Load data into MonetDB for Agile BI use cases');
INSERT INTO `r_step_type` VALUES (64, 'MonetDBBulkLoader', 'MonetDB 批量加载', 'Load data into MonetDB by using their bulk load command in streaming mode.');
INSERT INTO `r_step_type` VALUES (65, 'MongoDbInput', 'MongoDB input', 'Reads from a Mongo DB collection');
INSERT INTO `r_step_type` VALUES (66, 'MongoDbOutput', 'MongoDB output', 'Writes to a Mongo DB collection');
INSERT INTO `r_step_type` VALUES (67, 'MQTTConsumer', 'MQTT consumer', 'Subscribes and streams an MQTT Topic');
INSERT INTO `r_step_type` VALUES (68, 'MQTTProducer', 'MQTT producer', 'Produce messages to a MQTT Topic');
INSERT INTO `r_step_type` VALUES (69, 'MultiwayMergeJoin', 'Multiway merge join', 'Multiway merge join');
INSERT INTO `r_step_type` VALUES (70, 'MySQLBulkLoader', 'MySQL 批量加载', 'MySQL bulk loader step, loading data over a named pipe (not available on MS Windows)');
INSERT INTO `r_step_type` VALUES (71, 'OlapInput', 'OLAP 输入', 'Execute and retrieve data using an MDX query against any XML/A OLAP datasource using olap4j');
INSERT INTO `r_step_type` VALUES (72, 'OraBulkLoader', 'Oracle 批量加载', 'Use Oracle bulk loader to load data');
INSERT INTO `r_step_type` VALUES (73, 'OrcInput', 'ORC input', 'Reads data from ORC file');
INSERT INTO `r_step_type` VALUES (74, 'OrcOutput', 'ORC output', 'Writes data to an Orc file according to a mapping');
INSERT INTO `r_step_type` VALUES (75, 'PaloCellInput', 'Palo cell input', 'Reads data from a defined Palo Cube ');
INSERT INTO `r_step_type` VALUES (76, 'PaloCellOutput', 'Palo cell output', 'Writes data to a defined Palo Cube');
INSERT INTO `r_step_type` VALUES (77, 'PaloDimInput', 'Palo dim input', 'Reads data from a defined Palo Dimension');
INSERT INTO `r_step_type` VALUES (78, 'PaloDimOutput', 'Palo dim output', 'Writes data to defined Palo Dimension');
INSERT INTO `r_step_type` VALUES (79, 'ParquetInput', 'Parquet input', 'Reads data from a Parquet file.');
INSERT INTO `r_step_type` VALUES (80, 'ParquetOutput', 'Parquet output', 'Writes data to a Parquet file according to a mapping.');
INSERT INTO `r_step_type` VALUES (81, 'PentahoReportingOutput', 'Pentaho 报表输出', 'Executes an existing report (PRPT)');
INSERT INTO `r_step_type` VALUES (82, 'PGPDecryptStream', 'PGP decrypt stream', 'Decrypt data stream with PGP');
INSERT INTO `r_step_type` VALUES (83, 'PGPEncryptStream', 'PGP encrypt stream', 'Encrypt data stream with PGP');
INSERT INTO `r_step_type` VALUES (84, 'PGBulkLoader', 'PostgreSQL 批量加载', 'PostgreSQL Bulk Loader');
INSERT INTO `r_step_type` VALUES (85, 'Rest', 'REST client', 'Consume RESTfull services.\nREpresentational State Transfer (REST) is a key design idiom that embraces a stateless client-server\narchitecture in which the web services are viewed as resources and can be identified by their URLs');
INSERT INTO `r_step_type` VALUES (86, 'RssInput', 'RSS 输入', 'Read RSS feeds');
INSERT INTO `r_step_type` VALUES (87, 'RssOutput', 'RSS 输出', 'Read RSS stream.');
INSERT INTO `r_step_type` VALUES (88, 'RuleAccumulator', 'Rules accumulator', 'Rules accumulator step');
INSERT INTO `r_step_type` VALUES (89, 'RuleExecutor', 'Rules executor', 'Rules executor step');
INSERT INTO `r_step_type` VALUES (90, 'S3CSVINPUT', 'S3 CSV input', 'Is capable of reading CSV data stored on Amazon S3 in parallel');
INSERT INTO `r_step_type` VALUES (91, 'S3FileOutputPlugin', 'S3 file output', 'Create files in an S3 location');
INSERT INTO `r_step_type` VALUES (92, 'SalesforceDelete', 'Salesforce delete', 'Delete records in Salesforce module.');
INSERT INTO `r_step_type` VALUES (93, 'SalesforceInput', 'Salesforce input', 'Extract data from Salesforce');
INSERT INTO `r_step_type` VALUES (94, 'SalesforceInsert', 'Salesforce insert', 'Insert records in Salesforce module.');
INSERT INTO `r_step_type` VALUES (95, 'SalesforceUpdate', 'Salesforce update', 'Update records in Salesforce module.');
INSERT INTO `r_step_type` VALUES (96, 'SalesforceUpsert', 'Salesforce upsert', 'Insert or update records in Salesforce module.');
INSERT INTO `r_step_type` VALUES (97, 'SAPINPUT', 'SAP input', 'Read data from SAP ERP, optionally with parameters');
INSERT INTO `r_step_type` VALUES (98, 'SASInput', 'SAS 输入', 'This step reads files in sas7bdat (SAS) native format');
INSERT INTO `r_step_type` VALUES (99, 'Script', 'Script', 'Calculate values by scripting in Ruby, Python, Groovy, JavaScript, ... (JSR-223)');
INSERT INTO `r_step_type` VALUES (100, 'SetSessionVariableStep', 'Set session variables', 'Set session variables in the current user session.');
INSERT INTO `r_step_type` VALUES (101, 'SFTPPut', 'SFTP put', 'Upload a file or a stream file to remote host via SFTP');
INSERT INTO `r_step_type` VALUES (102, 'CreateSharedDimensions', 'Shared dimension', 'Create shared dimensions for use with Streamlined Data Refinery.');
INSERT INTO `r_step_type` VALUES (103, 'SimpleMapping', 'Simple mapping (sub-transformation)', 'Run a mapping (sub-transformation), use MappingInput and MappingOutput to specify the fields interface.  This is the simplified version only allowing one input and one output data set.');
INSERT INTO `r_step_type` VALUES (104, 'SingleThreader', 'Single threader', 'Executes a transformation snippet in a single thread.  You need a standard mapping or a transformation with an Injector step where data from the parent transformation will arive in blocks.');
INSERT INTO `r_step_type` VALUES (105, 'SocketWriter', 'Socket 写', 'Socket writer.  A socket server that can send rows of data to a socket reader.');
INSERT INTO `r_step_type` VALUES (106, 'SocketReader', 'Socket 读', 'Socket reader.  A socket client that connects to a server (Socket Writer step).');
INSERT INTO `r_step_type` VALUES (107, 'SQLFileOutput', 'SQL 文件输出', 'Output SQL INSERT statements to file');
INSERT INTO `r_step_type` VALUES (108, 'SSTableOutput', 'SSTable output', 'Writes to a filesystem directory as a Cassandra SSTable');
INSERT INTO `r_step_type` VALUES (109, 'SwitchCase', 'Switch / case', 'Switch a row to a certain target step based on the case value in a field.');
INSERT INTO `r_step_type` VALUES (110, 'TableAgileMart', 'Table Agile Mart', 'Load data into a table for Agile BI use cases');
INSERT INTO `r_step_type` VALUES (111, 'TeraFast', 'Teradata Fastload 批量加载', 'The Teradata Fastload bulk loader');
INSERT INTO `r_step_type` VALUES (112, 'TeraDataBulkLoader', 'Teradata TPT bulk loader', 'Teradata TPT bulkloader, using tbuild command');
INSERT INTO `r_step_type` VALUES (113, 'OldTextFileInput', 'Text file input', '从一个文本文件（几种格式）里读取数据{0}这些数据可以被传递到下一个步骤里...');
INSERT INTO `r_step_type` VALUES (114, 'TextFileOutputLegacy', 'Text file output', '写记录到一个文本文件.');
INSERT INTO `r_step_type` VALUES (115, 'TransExecutor', 'Transformation executor', 'This step executes a Pentaho Data Integration transformation, sets parameters and passes rows.');
INSERT INTO `r_step_type` VALUES (116, 'VerticaBulkLoader', 'Vertica bulk loader', 'Bulk load data into a Vertica database table');
INSERT INTO `r_step_type` VALUES (117, 'WebServiceLookup', 'Web 服务查询', '使用 Web 服务查询信息');
INSERT INTO `r_step_type` VALUES (118, 'XBaseInput', 'XBase输入', '从一个XBase类型的文件(DBF)读取记录');
INSERT INTO `r_step_type` VALUES (119, 'XMLInputStream', 'XML input stream (StAX)', 'This step is capable of processing very large and complex XML files very fast.');
INSERT INTO `r_step_type` VALUES (120, 'XMLJoin', 'XML join', 'Joins a stream of XML-Tags into a target XML string');
INSERT INTO `r_step_type` VALUES (121, 'XMLOutput', 'XML output', 'Write data to an XML file');
INSERT INTO `r_step_type` VALUES (122, 'XSDValidator', 'XSD validator', 'Validate XML source (files or streams) against XML Schema Definition.');
INSERT INTO `r_step_type` VALUES (123, 'XSLT', 'XSL transformation', 'Make an XSL transformation');
INSERT INTO `r_step_type` VALUES (124, 'YamlInput', 'YAML 输入', 'Read YAML source (file or stream) parse them and convert them to rows and writes these to one or more output.');
INSERT INTO `r_step_type` VALUES (125, 'ZipFile', 'Zip 文件', 'Zip a file.\nFilename will be extracted from incoming stream.');
INSERT INTO `r_step_type` VALUES (126, 'Abort', '中止', 'Abort a transformation');
INSERT INTO `r_step_type` VALUES (127, 'FilesFromResult', '从结果获取文件', 'This step allows you to read filenames used or generated in a previous entry in a job.');
INSERT INTO `r_step_type` VALUES (128, 'RowsFromResult', '从结果获取记录', '这个允许你从同一个任务的前一个条目里读取记录.');
INSERT INTO `r_step_type` VALUES (129, 'ValueMapper', '值映射', 'Maps values of a certain field from one value to another');
INSERT INTO `r_step_type` VALUES (130, 'Formula', '公式', '使用 Pentaho 的公式库来计算公式');
INSERT INTO `r_step_type` VALUES (131, 'WriteToLog', '写日志', 'Write data to log');
INSERT INTO `r_step_type` VALUES (132, 'AnalyticQuery', '分析查询', 'Execute analytic queries over a sorted dataset (LEAD/LAG/FIRST/LAST)');
INSERT INTO `r_step_type` VALUES (133, 'GroupBy', '分组', '以分组的形式创建聚合.{0}这个仅仅在一个已经排好序的输入有效.{1}如果输入没有排序, 仅仅两个连续的记录行被正确处理.');
INSERT INTO `r_step_type` VALUES (134, 'SplitFieldToRows3', '列拆分为多行', 'Splits a single string field by delimiter and creates a new row for each split term');
INSERT INTO `r_step_type` VALUES (135, 'Denormaliser', '列转行', 'Denormalises rows by looking up key-value pairs and by assigning them to new fields in the输出 rows.{0}This method aggregates and needs the输入 rows to be sorted on the grouping fields');
INSERT INTO `r_step_type` VALUES (136, 'Delete', '删除', '基于关键字删除记录');
INSERT INTO `r_step_type` VALUES (137, 'Janino', '利用Janino计算Java表达式', 'Calculate the result of a Java Expression using Janino');
INSERT INTO `r_step_type` VALUES (138, 'StringCut', '剪切字符串', 'Strings cut (substring).');
INSERT INTO `r_step_type` VALUES (139, 'UnivariateStats', '单变量统计', 'This step computes some simple stats based on a single input field');
INSERT INTO `r_step_type` VALUES (140, 'Unique', '去除重复记录', '去除重复的记录行，保持记录唯一{0}这个仅仅基于一个已经排好序的输入.{1}如果输入没有排序, 仅仅两个连续的记录行被正确处理.');
INSERT INTO `r_step_type` VALUES (141, 'SyslogMessage', '发送信息至syslog', 'Send message to syslog server');
INSERT INTO `r_step_type` VALUES (142, 'Mail', '发送邮件', 'Send eMail.');
INSERT INTO `r_step_type` VALUES (143, 'MergeRows', '合并记录', '合并两个数据流, 并根据某个关键字排序.  这两个数据流被比较，以标识相等的、变更的、删除的和新建的记录.');
INSERT INTO `r_step_type` VALUES (144, 'ExecProcess', '启动一个进程', 'Execute a process and return the result');
INSERT INTO `r_step_type` VALUES (145, 'UniqueRowsByHashSet', '唯一行 (哈希值)', 'Remove double rows and leave only unique occurrences by using a HashSet.');
INSERT INTO `r_step_type` VALUES (146, 'FixedInput', '固定宽度文件输入', 'Fixed file input');
INSERT INTO `r_step_type` VALUES (147, 'MemoryGroupBy', '在内存中分组', 'Builds aggregates in a group by fashion.\nThis step doesn\'t require sorted input.');
INSERT INTO `r_step_type` VALUES (148, 'Constant', '增加常量', '给记录增加一到多个常量');
INSERT INTO `r_step_type` VALUES (149, 'Sequence', '增加序列', '从序列获取下一个值');
INSERT INTO `r_step_type` VALUES (150, 'ProcessFiles', '处理文件', 'Process one file per row (copy or move or delete).\nThis step only accept filename in input.');
INSERT INTO `r_step_type` VALUES (151, 'FilesToResult', '复制文件到结果', 'This step allows you to set filenames in the result of this transformation.\nSubsequent job entries can then use this information.');
INSERT INTO `r_step_type` VALUES (152, 'RowsToResult', '复制记录到结果', '使用这个步骤把记录写到正在执行的任务.{0}信息将会被传递给同一个任务里的下一个条目.');
INSERT INTO `r_step_type` VALUES (153, 'SelectValues', '字段选择', '选择或移除记录里的字。{0}此外，可以设置字段的元数据: 类型, 长度和精度.');
INSERT INTO `r_step_type` VALUES (154, 'StringOperations', '字符串操作', 'Apply certain operations like trimming, padding and others to string value.');
INSERT INTO `r_step_type` VALUES (155, 'ReplaceString', '字符串替换', 'Replace all occurences a word in a string with another word.');
INSERT INTO `r_step_type` VALUES (156, 'SymmetricCryptoTrans', '对称加密', 'Encrypt or decrypt a string using symmetric encryption.\nAvailable algorithms are DES, AES, TripleDES.');
INSERT INTO `r_step_type` VALUES (157, 'SetValueConstant', '将字段值设置为常量', 'Set value of a field to a constant');
INSERT INTO `r_step_type` VALUES (158, 'Delay', '延迟行', 'Output each input row after a delay');
INSERT INTO `r_step_type` VALUES (159, 'DynamicSQLRow', '执行Dynamic SQL', 'Execute dynamic SQL statement build in a previous field');
INSERT INTO `r_step_type` VALUES (160, 'ExecSQL', '执行SQL脚本', '执行一个SQL脚本, 另外，可以使用输入的记录作为参数');
INSERT INTO `r_step_type` VALUES (161, 'ExecSQLRow', '执行SQL脚本(字段流替换)', 'Execute SQL script extracted from a field\ncreated in a previous step.');
INSERT INTO `r_step_type` VALUES (162, 'JobExecutor', '执行作业', 'This step executes a Pentaho Data Integration job, sets parameters and passes rows.');
INSERT INTO `r_step_type` VALUES (163, 'FieldSplitter', '拆分字段', '当你想把一个字段拆分成多个时，使用这个类型.');
INSERT INTO `r_step_type` VALUES (164, 'SortedMerge', '排序合并', 'Sorted merge');
INSERT INTO `r_step_type` VALUES (165, 'SortRows', '排序记录', '基于字段值把记录排序(升序或降序)');
INSERT INTO `r_step_type` VALUES (166, 'InsertUpdate', '插入 / 更新', '基于关键字更新或插入记录到数据库.');
INSERT INTO `r_step_type` VALUES (167, 'NumberRange', '数值范围', 'Create ranges based on numeric field');
INSERT INTO `r_step_type` VALUES (168, 'SynchronizeAfterMerge', '数据同步', 'This step perform insert/update/delete in one go based on the value of a field.');
INSERT INTO `r_step_type` VALUES (169, 'DBLookup', '数据库查询', '使用字段值在数据库里查询值');
INSERT INTO `r_step_type` VALUES (170, 'DBJoin', '数据库连接', '使用数据流里的值作为参数执行一个数据库查询');
INSERT INTO `r_step_type` VALUES (171, 'Validator', '数据检验', 'Validates passing data based on a set of rules');
INSERT INTO `r_step_type` VALUES (172, 'PrioritizeStreams', '数据流优先级排序', 'Prioritize streams in an order way.');
INSERT INTO `r_step_type` VALUES (173, 'ReservoirSampling', '数据采样', '[Transform] Samples a fixed number of rows from the incoming stream');
INSERT INTO `r_step_type` VALUES (174, 'LoadFileInput', '文件内容加载至内存', 'Load file content in memory');
INSERT INTO `r_step_type` VALUES (175, 'TextFileInput', '文本文件输入', '从一个文本文件（几种格式）里读取数据{0}这些数据可以被传递到下一个步骤里...');
INSERT INTO `r_step_type` VALUES (176, 'TextFileOutput', '文本文件输出', '写记录到一个文本文件.');
INSERT INTO `r_step_type` VALUES (177, 'Mapping', '映射 (子转换)', '运行一个映射 (子转换), 使用MappingInput和MappingOutput来指定接口的字段');
INSERT INTO `r_step_type` VALUES (178, 'MappingInput', '映射输入规范', '指定一个映射的字段输入');
INSERT INTO `r_step_type` VALUES (179, 'MappingOutput', '映射输出规范', '指定一个映射的字段输出');
INSERT INTO `r_step_type` VALUES (180, 'Update', '更新', '基于关键字更新记录到数据库');
INSERT INTO `r_step_type` VALUES (181, 'IfNull', '替换NULL值', 'Sets a field value to a constant if it is null.');
INSERT INTO `r_step_type` VALUES (182, 'SampleRows', '样本行', 'Filter rows based on the line number.');
INSERT INTO `r_step_type` VALUES (183, 'JavaFilter', '根据Java代码过滤记录', 'Filter rows using java code');
INSERT INTO `r_step_type` VALUES (184, 'FieldsChangeSequence', '根据字段值来改变序列', 'Add sequence depending of fields value change.\nEach time value of at least one field change, PDI will reset sequence.');
INSERT INTO `r_step_type` VALUES (185, 'WebServiceAvailable', '检查web服务是否可用', 'Check if a webservice is available');
INSERT INTO `r_step_type` VALUES (186, 'FileExists', '检查文件是否存在', 'Check if a file exists');
INSERT INTO `r_step_type` VALUES (187, 'FileLocked', '检查文件是否已被锁定', 'Check if a file is locked by another process');
INSERT INTO `r_step_type` VALUES (188, 'TableExists', '检查表是否存在', 'Check if a table exists on a specified connection');
INSERT INTO `r_step_type` VALUES (189, 'DetectEmptyStream', '检测空流', 'This step will output one empty row if input stream is empty\n(ie when input stream does not contain any row)');
INSERT INTO `r_step_type` VALUES (190, 'CreditCardValidator', '检验信用卡号码是否有效', 'The Credit card validator step will help you tell:\n(1) if a credit card number is valid (uses LUHN10 (MOD-10) algorithm)\n(2) which credit card vendor handles that number\n(VISA, MasterCard, Diners Club, EnRoute, American Express (AMEX),...)');
INSERT INTO `r_step_type` VALUES (191, 'MailValidator', '检验邮件地址', 'Check if an email address is valid.');
INSERT INTO `r_step_type` VALUES (192, 'FuzzyMatch', '模糊匹配', 'Finding approximate matches to a string using matching algorithms.\nRead a field from a main stream and output approximative value from lookup stream.');
INSERT INTO `r_step_type` VALUES (193, 'RegexEval', '正则表达式', 'Regular expression Evaluation\nThis step uses a regular expression to evaluate a field. It can also extract new fields out of an existing field with capturing groups.');
INSERT INTO `r_step_type` VALUES (194, 'TableCompare', '比较表', 'Compares 2 tables and gives back a list of differences');
INSERT INTO `r_step_type` VALUES (195, 'StreamLookup', '流查询', '从转换中的其它流里查询值.');
INSERT INTO `r_step_type` VALUES (196, 'StepMetastructure', '流的元数据', 'This is a step to read the metadata of the incoming stream.');
INSERT INTO `r_step_type` VALUES (197, 'SecretKeyGenerator', '生成密钥', 'Generate secret key for algorithms such as DES, AES, TripleDES.');
INSERT INTO `r_step_type` VALUES (198, 'RowGenerator', '生成记录', '产生一些空记录或相等的行.');
INSERT INTO `r_step_type` VALUES (199, 'RandomValue', '生成随机数', 'Generate random value');
INSERT INTO `r_step_type` VALUES (200, 'RandomCCNumberGenerator', '生成随机的信用卡号', 'Generate random valide (luhn check) credit card numbers');
INSERT INTO `r_step_type` VALUES (201, 'Dummy', '空操作 (什么也不做)', '这个步骤类型什么都不作.{0} 当你想测试或拆分数据流的时候有用.');
INSERT INTO `r_step_type` VALUES (202, 'DimensionLookup', '维度查询/更新', '在一个数据仓库里更新一个渐变维 {0} 或者在这个维里查询信息.');
INSERT INTO `r_step_type` VALUES (203, 'CombinationLookup', '联合查询/更新', '更新数据仓库里的一个junk维 {0} 可选的, 科研查询维里的信息.{1}junk维的主键是所有的字段.');
INSERT INTO `r_step_type` VALUES (204, 'AutoDoc', '自动文档输出', 'This step automatically generates documentation based on input in the form of a list of transformations and jobs');
INSERT INTO `r_step_type` VALUES (205, 'DataGrid', '自定义常量数据', 'Enter rows of static data in a grid, usually for testing, reference or demo purpose');
INSERT INTO `r_step_type` VALUES (206, 'GetVariable', '获取变量', 'Determine the values of certain (environment or Kettle) variables and put them in field values.');
INSERT INTO `r_step_type` VALUES (207, 'GetSubFolders', '获取子目录名', 'Read a parent folder and return all subfolders');
INSERT INTO `r_step_type` VALUES (208, 'GetFileNames', '获取文件名', 'Get file names from the operating system and send them to the next step.');
INSERT INTO `r_step_type` VALUES (209, 'GetFilesRowsCount', '获取文件行数', 'Returns rows count for text files.');
INSERT INTO `r_step_type` VALUES (210, 'SystemInfo', '获取系统信息', '获取系统信息，例如时间、日期.');
INSERT INTO `r_step_type` VALUES (211, 'GetTableNames', '获取表名', 'Get table names from database connection and send them to the next step');
INSERT INTO `r_step_type` VALUES (212, 'GetRepositoryNames', '获取资源库配置', 'Lists detailed information about transformations and/or jobs in a repository');
INSERT INTO `r_step_type` VALUES (213, 'Flattener', '行扁平化', 'Flattens consequetive rows based on the order in which they appear in the输入 stream');
INSERT INTO `r_step_type` VALUES (214, 'Normaliser', '行转列', 'De-normalised information can be normalised using this step type.');
INSERT INTO `r_step_type` VALUES (215, 'TableInput', '表输入', '从数据库表里读取信息.');
INSERT INTO `r_step_type` VALUES (216, 'TableOutput', '表输出', '写信息到一个数据库表');
INSERT INTO `r_step_type` VALUES (217, 'Calculator', '计算器', '通过执行简单的计算创建一个新字段');
INSERT INTO `r_step_type` VALUES (218, 'JoinRows', '记录关联 (笛卡尔输出)', '这个步骤的输出是输入流的笛卡尔的结果.{0} 输出结果的记录数是输入流记录之间的乘积.');
INSERT INTO `r_step_type` VALUES (219, 'Injector', '记录注射', 'Injector step to allow to inject rows into the transformation through the java API');
INSERT INTO `r_step_type` VALUES (220, 'MergeJoin', '记录集连接', 'Joins two streams on a given key and outputs a joined set. The input streams must be sorted on the join key');
INSERT INTO `r_step_type` VALUES (221, 'NullIf', '设置值为NULL', '如果一个字段值等于某个固定值，那么把这个字段值设置成null');
INSERT INTO `r_step_type` VALUES (222, 'SetVariable', '设置变量', 'Set environment variables based on a single input row.');
INSERT INTO `r_step_type` VALUES (223, 'SetValueField', '设置字段值', 'Set value of a field with another value field');
INSERT INTO `r_step_type` VALUES (224, 'DetectLastRow', '识别流的最后一行', 'Last row will be marked');
INSERT INTO `r_step_type` VALUES (225, 'DBProc', '调用DB存储过程', '通过调用数据库存储过程获得返回值.');
INSERT INTO `r_step_type` VALUES (226, 'StepsMetrics', '转换步骤信息统计', 'Return metrics for one or several steps');
INSERT INTO `r_step_type` VALUES (227, 'FilterRows', '过滤记录', '使用简单的相等来过滤记录');
INSERT INTO `r_step_type` VALUES (228, 'SSH', '运行SSH命令', 'Run SSH commands and returns result.');
INSERT INTO `r_step_type` VALUES (229, 'Append', '追加流', 'Append 2 streams in an ordered way');
INSERT INTO `r_step_type` VALUES (230, 'MailInput', '邮件信息输入', 'Read POP3/IMAP server and retrieve messages');
INSERT INTO `r_step_type` VALUES (231, 'PropertyInput', '配置文件输入', 'Read data (key, value) from properties files.');
INSERT INTO `r_step_type` VALUES (232, 'PropertyOutput', '配置文件输出', 'Write data to properties file');
INSERT INTO `r_step_type` VALUES (233, 'BlockUntilStepsFinish', '阻塞数据直到步骤都完成', 'Block this step until selected steps finish.');
INSERT INTO `r_step_type` VALUES (234, 'MyEasyExpand', '我的Kettle简单扩展', 'Kettle简单扩展');

-- ----------------------------
-- Table structure for r_trans_attribute
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_attribute`;
CREATE TABLE `r_trans_attribute`  (
  `ID_TRANS_ATTRIBUTE` bigint NOT NULL,
  `ID_TRANSFORMATION` int NULL DEFAULT NULL,
  `NR` int NULL DEFAULT NULL,
  `CODE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VALUE_NUM` bigint NULL DEFAULT NULL,
  `VALUE_STR` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID_TRANS_ATTRIBUTE`) USING BTREE,
  UNIQUE INDEX `IDX_TATT`(`ID_TRANSFORMATION`, `CODE`, `NR`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_trans_attribute
-- ----------------------------
INSERT INTO `r_trans_attribute` VALUES (1, 1, 0, 'UNIQUE_CONNECTIONS', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (2, 1, 0, 'FEEDBACK_SHOWN', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (3, 1, 0, 'FEEDBACK_SIZE', 50000, NULL);
INSERT INTO `r_trans_attribute` VALUES (4, 1, 0, 'USING_THREAD_PRIORITIES', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (5, 1, 0, 'SHARED_FILE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (6, 1, 0, 'CAPTURE_STEP_PERFORMANCE', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (7, 1, 0, 'STEP_PERFORMANCE_CAPTURING_DELAY', 1000, NULL);
INSERT INTO `r_trans_attribute` VALUES (8, 1, 0, 'STEP_PERFORMANCE_CAPTURING_SIZE_LIMIT', 0, '100');
INSERT INTO `r_trans_attribute` VALUES (9, 1, 0, 'STEP_PERFORMANCE_LOG_TABLE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (10, 1, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (11, 1, 0, 'LOG_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (12, 1, 0, 'TRANSFORMATION_TYPE', 0, 'Normal');
INSERT INTO `r_trans_attribute` VALUES (13, 1, 0, 'SLEEP_TIME_EMPTY', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (14, 1, 0, 'SLEEP_TIME_FULL', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (15, 1, 0, 'TRANS_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (16, 1, 0, 'TRANS_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (17, 1, 0, 'TRANS_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (18, 1, 0, 'TRANS_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (19, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (20, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (21, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (22, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (23, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (24, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (25, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (26, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (27, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (28, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (29, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (30, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (31, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (32, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (33, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (34, 1, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT4', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (35, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (36, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (37, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (38, 1, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT5', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (39, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (40, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (41, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (42, 1, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT6', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (43, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (44, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (45, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (46, 1, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT7', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (47, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (48, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (49, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (50, 1, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT8', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (51, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (52, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (53, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (54, 1, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT9', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (55, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (56, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (57, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (58, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (59, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (60, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (61, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (62, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (63, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (64, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (65, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (66, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (67, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (68, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (69, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (70, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (71, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (72, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (73, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (74, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (75, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (76, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (77, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (78, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (79, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (80, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (81, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (82, 1, 0, 'TRANS_LOG_TABLE_FIELD_ID19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (83, 1, 0, 'TRANS_LOG_TABLE_FIELD_NAME19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (84, 1, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (85, 1, 0, 'TRANSLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (86, 1, 0, 'TRANSLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (87, 1, 0, 'STEP_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (88, 1, 0, 'STEP_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (89, 1, 0, 'STEP_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (90, 1, 0, 'STEP_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (91, 1, 0, 'STEP_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (92, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (93, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (94, 1, 0, 'STEP_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (95, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (96, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (97, 1, 0, 'STEP_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (98, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (99, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (100, 1, 0, 'STEP_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (101, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (102, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (103, 1, 0, 'STEP_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (104, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (105, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (106, 1, 0, 'STEP_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (107, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (108, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (109, 1, 0, 'STEP_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (110, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (111, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (112, 1, 0, 'STEP_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (113, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (114, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (115, 1, 0, 'STEP_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (116, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (117, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (118, 1, 0, 'STEP_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (119, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (120, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (121, 1, 0, 'STEP_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (122, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (123, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (124, 1, 0, 'STEP_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (125, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (126, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (127, 1, 0, 'STEP_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (128, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (129, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (130, 1, 0, 'STEP_LOG_TABLE_FIELD_ID13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (131, 1, 0, 'STEP_LOG_TABLE_FIELD_NAME13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (132, 1, 0, 'STEP_LOG_TABLE_FIELD_ENABLED13', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (133, 1, 0, 'PERFORMANCE_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (134, 1, 0, 'PERFORMANCE_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (135, 1, 0, 'PERFORMANCE_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (136, 1, 0, 'PERFORMANCE_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (137, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (138, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (139, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (140, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (141, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (142, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (143, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (144, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (145, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (146, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (147, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (148, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (149, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (150, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (151, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (152, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (153, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (154, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (155, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (156, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (157, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (158, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (159, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (160, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (161, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (162, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (163, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (164, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (165, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (166, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (167, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (168, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (169, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (170, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (171, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (172, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (173, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (174, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (175, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (176, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (177, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (178, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (179, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (180, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (181, 1, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (182, 1, 0, 'PERFORMANCELOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (183, 1, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (184, 1, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (185, 1, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (186, 1, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (187, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (188, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (189, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (190, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (191, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (192, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (193, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (194, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (195, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (196, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (197, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (198, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (199, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (200, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (201, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (202, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (203, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (204, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (205, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (206, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (207, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (208, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (209, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (210, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (211, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (212, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (213, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (214, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (215, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (216, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (217, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (218, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (219, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (220, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (221, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (222, 1, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (223, 2, 0, 'UNIQUE_CONNECTIONS', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (224, 2, 0, 'FEEDBACK_SHOWN', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (225, 2, 0, 'FEEDBACK_SIZE', 50000, NULL);
INSERT INTO `r_trans_attribute` VALUES (226, 2, 0, 'USING_THREAD_PRIORITIES', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (227, 2, 0, 'SHARED_FILE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (228, 2, 0, 'CAPTURE_STEP_PERFORMANCE', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (229, 2, 0, 'STEP_PERFORMANCE_CAPTURING_DELAY', 1000, NULL);
INSERT INTO `r_trans_attribute` VALUES (230, 2, 0, 'STEP_PERFORMANCE_CAPTURING_SIZE_LIMIT', 0, '100');
INSERT INTO `r_trans_attribute` VALUES (231, 2, 0, 'STEP_PERFORMANCE_LOG_TABLE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (232, 2, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (233, 2, 0, 'LOG_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (234, 2, 0, 'TRANSFORMATION_TYPE', 0, 'Normal');
INSERT INTO `r_trans_attribute` VALUES (235, 2, 0, 'SLEEP_TIME_EMPTY', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (236, 2, 0, 'SLEEP_TIME_FULL', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (237, 2, 0, 'TRANS_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (238, 2, 0, 'TRANS_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (239, 2, 0, 'TRANS_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (240, 2, 0, 'TRANS_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (241, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (242, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (243, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (244, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (245, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (246, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (247, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (248, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (249, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (250, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (251, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (252, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (253, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (254, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (255, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (256, 2, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT4', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (257, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (258, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (259, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (260, 2, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT5', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (261, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (262, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (263, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (264, 2, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT6', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (265, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (266, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (267, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (268, 2, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT7', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (269, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (270, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (271, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (272, 2, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT8', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (273, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (274, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (275, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (276, 2, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT9', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (277, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (278, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (279, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (280, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (281, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (282, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (283, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (284, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (285, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (286, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (287, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (288, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (289, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (290, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (291, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (292, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (293, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (294, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (295, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (296, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (297, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (298, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (299, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (300, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (301, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (302, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (303, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (304, 2, 0, 'TRANS_LOG_TABLE_FIELD_ID19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (305, 2, 0, 'TRANS_LOG_TABLE_FIELD_NAME19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (306, 2, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (307, 2, 0, 'TRANSLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (308, 2, 0, 'TRANSLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (309, 2, 0, 'STEP_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (310, 2, 0, 'STEP_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (311, 2, 0, 'STEP_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (312, 2, 0, 'STEP_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (313, 2, 0, 'STEP_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (314, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (315, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (316, 2, 0, 'STEP_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (317, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (318, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (319, 2, 0, 'STEP_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (320, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (321, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (322, 2, 0, 'STEP_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (323, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (324, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (325, 2, 0, 'STEP_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (326, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (327, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (328, 2, 0, 'STEP_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (329, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (330, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (331, 2, 0, 'STEP_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (332, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (333, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (334, 2, 0, 'STEP_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (335, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (336, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (337, 2, 0, 'STEP_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (338, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (339, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (340, 2, 0, 'STEP_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (341, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (342, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (343, 2, 0, 'STEP_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (344, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (345, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (346, 2, 0, 'STEP_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (347, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (348, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (349, 2, 0, 'STEP_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (350, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (351, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (352, 2, 0, 'STEP_LOG_TABLE_FIELD_ID13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (353, 2, 0, 'STEP_LOG_TABLE_FIELD_NAME13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (354, 2, 0, 'STEP_LOG_TABLE_FIELD_ENABLED13', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (355, 2, 0, 'PERFORMANCE_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (356, 2, 0, 'PERFORMANCE_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (357, 2, 0, 'PERFORMANCE_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (358, 2, 0, 'PERFORMANCE_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (359, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (360, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (361, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (362, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (363, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (364, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (365, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (366, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (367, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (368, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (369, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (370, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (371, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (372, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (373, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (374, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (375, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (376, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (377, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (378, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (379, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (380, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (381, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (382, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (383, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (384, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (385, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (386, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (387, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (388, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (389, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (390, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (391, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (392, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (393, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (394, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (395, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (396, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (397, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (398, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (399, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (400, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (401, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (402, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (403, 2, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (404, 2, 0, 'PERFORMANCELOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (405, 2, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (406, 2, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (407, 2, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (408, 2, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (409, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (410, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (411, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (412, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (413, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (414, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (415, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (416, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (417, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (418, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (419, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (420, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (421, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (422, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (423, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (424, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (425, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (426, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (427, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (428, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (429, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (430, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (431, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (432, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (433, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (434, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (435, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (436, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (437, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (438, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (439, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (440, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (441, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (442, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (443, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (444, 2, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1336, 7, 0, 'UNIQUE_CONNECTIONS', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (1337, 7, 0, 'FEEDBACK_SHOWN', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1338, 7, 0, 'FEEDBACK_SIZE', 50000, NULL);
INSERT INTO `r_trans_attribute` VALUES (1339, 7, 0, 'USING_THREAD_PRIORITIES', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1340, 7, 0, 'SHARED_FILE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1341, 7, 0, 'CAPTURE_STEP_PERFORMANCE', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (1342, 7, 0, 'STEP_PERFORMANCE_CAPTURING_DELAY', 1000, NULL);
INSERT INTO `r_trans_attribute` VALUES (1343, 7, 0, 'STEP_PERFORMANCE_CAPTURING_SIZE_LIMIT', 0, '100');
INSERT INTO `r_trans_attribute` VALUES (1344, 7, 0, 'STEP_PERFORMANCE_LOG_TABLE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1345, 7, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1346, 7, 0, 'LOG_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1347, 7, 0, 'TRANSFORMATION_TYPE', 0, 'Normal');
INSERT INTO `r_trans_attribute` VALUES (1348, 7, 0, 'SLEEP_TIME_EMPTY', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (1349, 7, 0, 'SLEEP_TIME_FULL', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (1350, 7, 0, 'TRANS_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1351, 7, 0, 'TRANS_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1352, 7, 0, 'TRANS_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1353, 7, 0, 'TRANS_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1354, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1355, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1356, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1357, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1358, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1359, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1360, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (1361, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (1362, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1363, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (1364, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (1365, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1366, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (1367, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (1368, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1369, 7, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT4', 0, '输入');
INSERT INTO `r_trans_attribute` VALUES (1370, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (1371, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (1372, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1373, 7, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT5', 0, '输出');
INSERT INTO `r_trans_attribute` VALUES (1374, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (1375, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (1376, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1377, 7, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT6', 0, '输出');
INSERT INTO `r_trans_attribute` VALUES (1378, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (1379, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (1380, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1381, 7, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT7', 0, '输入');
INSERT INTO `r_trans_attribute` VALUES (1382, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (1383, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (1384, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1385, 7, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT8', 0, '输入');
INSERT INTO `r_trans_attribute` VALUES (1386, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (1387, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (1388, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1389, 7, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT9', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1390, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (1391, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (1392, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1393, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (1394, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (1395, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1396, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (1397, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (1398, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1399, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (1400, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (1401, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1402, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (1403, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (1404, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1405, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (1406, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (1407, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1408, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (1409, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (1410, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1411, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (1412, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (1413, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (1414, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (1415, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (1416, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (1417, 7, 0, 'TRANS_LOG_TABLE_FIELD_ID19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (1418, 7, 0, 'TRANS_LOG_TABLE_FIELD_NAME19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (1419, 7, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (1420, 7, 0, 'TRANSLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1421, 7, 0, 'TRANSLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1422, 7, 0, 'STEP_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1423, 7, 0, 'STEP_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1424, 7, 0, 'STEP_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1425, 7, 0, 'STEP_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1426, 7, 0, 'STEP_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1427, 7, 0, 'STEP_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1428, 7, 0, 'STEP_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1429, 7, 0, 'STEP_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1430, 7, 0, 'STEP_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1431, 7, 0, 'STEP_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1432, 7, 0, 'STEP_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (1433, 7, 0, 'STEP_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (1434, 7, 0, 'STEP_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1435, 7, 0, 'STEP_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (1436, 7, 0, 'STEP_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (1437, 7, 0, 'STEP_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1438, 7, 0, 'STEP_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (1439, 7, 0, 'STEP_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (1440, 7, 0, 'STEP_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1441, 7, 0, 'STEP_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (1442, 7, 0, 'STEP_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (1443, 7, 0, 'STEP_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1444, 7, 0, 'STEP_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (1445, 7, 0, 'STEP_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (1446, 7, 0, 'STEP_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1447, 7, 0, 'STEP_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (1448, 7, 0, 'STEP_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (1449, 7, 0, 'STEP_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1450, 7, 0, 'STEP_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (1451, 7, 0, 'STEP_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (1452, 7, 0, 'STEP_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1453, 7, 0, 'STEP_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (1454, 7, 0, 'STEP_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (1455, 7, 0, 'STEP_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1456, 7, 0, 'STEP_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (1457, 7, 0, 'STEP_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (1458, 7, 0, 'STEP_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1459, 7, 0, 'STEP_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (1460, 7, 0, 'STEP_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (1461, 7, 0, 'STEP_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1462, 7, 0, 'STEP_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (1463, 7, 0, 'STEP_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (1464, 7, 0, 'STEP_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1465, 7, 0, 'STEP_LOG_TABLE_FIELD_ID13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (1466, 7, 0, 'STEP_LOG_TABLE_FIELD_NAME13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (1467, 7, 0, 'STEP_LOG_TABLE_FIELD_ENABLED13', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (1468, 7, 0, 'PERFORMANCE_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1469, 7, 0, 'PERFORMANCE_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1470, 7, 0, 'PERFORMANCE_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1471, 7, 0, 'PERFORMANCE_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1472, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1473, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1474, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1475, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (1476, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (1477, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1478, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (1479, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (1480, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1481, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (1482, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (1483, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1484, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (1485, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (1486, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1487, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (1488, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (1489, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1490, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (1491, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (1492, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1493, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (1494, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (1495, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1496, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (1497, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (1498, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1499, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (1500, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (1501, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1502, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (1503, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (1504, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1505, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (1506, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (1507, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1508, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (1509, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (1510, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1511, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (1512, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (1513, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1514, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (1515, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (1516, 7, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1517, 7, 0, 'PERFORMANCELOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1518, 7, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1519, 7, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1520, 7, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1521, 7, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1522, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1523, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1524, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1525, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1526, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1527, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1528, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (1529, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (1530, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1531, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (1532, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (1533, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1534, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (1535, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (1536, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1537, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (1538, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (1539, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1540, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (1541, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (1542, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1543, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (1544, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (1545, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1546, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (1547, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (1548, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1549, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (1550, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (1551, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1552, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1553, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1554, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1555, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1556, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1557, 7, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1558, 8, 0, 'UNIQUE_CONNECTIONS', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (1559, 8, 0, 'FEEDBACK_SHOWN', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1560, 8, 0, 'FEEDBACK_SIZE', 50000, NULL);
INSERT INTO `r_trans_attribute` VALUES (1561, 8, 0, 'USING_THREAD_PRIORITIES', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1562, 8, 0, 'SHARED_FILE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1563, 8, 0, 'CAPTURE_STEP_PERFORMANCE', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (1564, 8, 0, 'STEP_PERFORMANCE_CAPTURING_DELAY', 1000, NULL);
INSERT INTO `r_trans_attribute` VALUES (1565, 8, 0, 'STEP_PERFORMANCE_CAPTURING_SIZE_LIMIT', 0, '100');
INSERT INTO `r_trans_attribute` VALUES (1566, 8, 0, 'STEP_PERFORMANCE_LOG_TABLE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1567, 8, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1568, 8, 0, 'LOG_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1569, 8, 0, 'TRANSFORMATION_TYPE', 0, 'Normal');
INSERT INTO `r_trans_attribute` VALUES (1570, 8, 0, 'SLEEP_TIME_EMPTY', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (1571, 8, 0, 'SLEEP_TIME_FULL', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (1572, 8, 0, 'TRANS_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1573, 8, 0, 'TRANS_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1574, 8, 0, 'TRANS_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1575, 8, 0, 'TRANS_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1576, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1577, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1578, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1579, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1580, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1581, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1582, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (1583, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (1584, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1585, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (1586, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (1587, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1588, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (1589, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (1590, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1591, 8, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT4', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1592, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (1593, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (1594, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1595, 8, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT5', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1596, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (1597, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (1598, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1599, 8, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT6', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1600, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (1601, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (1602, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1603, 8, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT7', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1604, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (1605, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (1606, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1607, 8, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT8', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1608, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (1609, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (1610, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1611, 8, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT9', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1612, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (1613, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (1614, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1615, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (1616, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (1617, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1618, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (1619, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (1620, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1621, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (1622, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (1623, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1624, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (1625, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (1626, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1627, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (1628, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (1629, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1630, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (1631, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (1632, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1633, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (1634, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (1635, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (1636, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (1637, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (1638, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (1639, 8, 0, 'TRANS_LOG_TABLE_FIELD_ID19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (1640, 8, 0, 'TRANS_LOG_TABLE_FIELD_NAME19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (1641, 8, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (1642, 8, 0, 'TRANSLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1643, 8, 0, 'TRANSLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1644, 8, 0, 'STEP_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1645, 8, 0, 'STEP_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1646, 8, 0, 'STEP_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1647, 8, 0, 'STEP_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1648, 8, 0, 'STEP_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1649, 8, 0, 'STEP_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1650, 8, 0, 'STEP_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1651, 8, 0, 'STEP_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1652, 8, 0, 'STEP_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1653, 8, 0, 'STEP_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1654, 8, 0, 'STEP_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (1655, 8, 0, 'STEP_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (1656, 8, 0, 'STEP_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1657, 8, 0, 'STEP_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (1658, 8, 0, 'STEP_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (1659, 8, 0, 'STEP_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1660, 8, 0, 'STEP_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (1661, 8, 0, 'STEP_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (1662, 8, 0, 'STEP_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1663, 8, 0, 'STEP_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (1664, 8, 0, 'STEP_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (1665, 8, 0, 'STEP_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1666, 8, 0, 'STEP_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (1667, 8, 0, 'STEP_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (1668, 8, 0, 'STEP_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1669, 8, 0, 'STEP_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (1670, 8, 0, 'STEP_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (1671, 8, 0, 'STEP_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1672, 8, 0, 'STEP_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (1673, 8, 0, 'STEP_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (1674, 8, 0, 'STEP_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1675, 8, 0, 'STEP_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (1676, 8, 0, 'STEP_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (1677, 8, 0, 'STEP_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1678, 8, 0, 'STEP_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (1679, 8, 0, 'STEP_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (1680, 8, 0, 'STEP_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1681, 8, 0, 'STEP_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (1682, 8, 0, 'STEP_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (1683, 8, 0, 'STEP_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1684, 8, 0, 'STEP_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (1685, 8, 0, 'STEP_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (1686, 8, 0, 'STEP_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1687, 8, 0, 'STEP_LOG_TABLE_FIELD_ID13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (1688, 8, 0, 'STEP_LOG_TABLE_FIELD_NAME13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (1689, 8, 0, 'STEP_LOG_TABLE_FIELD_ENABLED13', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (1690, 8, 0, 'PERFORMANCE_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1691, 8, 0, 'PERFORMANCE_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1692, 8, 0, 'PERFORMANCE_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1693, 8, 0, 'PERFORMANCE_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1694, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1695, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1696, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1697, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (1698, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (1699, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1700, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (1701, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (1702, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1703, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (1704, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (1705, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1706, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (1707, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (1708, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1709, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (1710, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (1711, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1712, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (1713, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (1714, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1715, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (1716, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (1717, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1718, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (1719, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (1720, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1721, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (1722, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (1723, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1724, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (1725, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (1726, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1727, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (1728, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (1729, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1730, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (1731, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (1732, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1733, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (1734, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (1735, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1736, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (1737, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (1738, 8, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1739, 8, 0, 'PERFORMANCELOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1740, 8, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1741, 8, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1742, 8, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1743, 8, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1744, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1745, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1746, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1747, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1748, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1749, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1750, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (1751, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (1752, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1753, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (1754, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (1755, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1756, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (1757, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (1758, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1759, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (1760, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (1761, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1762, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (1763, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (1764, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1765, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (1766, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (1767, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1768, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (1769, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (1770, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1771, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (1772, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (1773, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1774, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1775, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1776, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1777, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1778, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1779, 8, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1780, 9, 0, 'UNIQUE_CONNECTIONS', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (1781, 9, 0, 'FEEDBACK_SHOWN', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1782, 9, 0, 'FEEDBACK_SIZE', 50000, NULL);
INSERT INTO `r_trans_attribute` VALUES (1783, 9, 0, 'USING_THREAD_PRIORITIES', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1784, 9, 0, 'SHARED_FILE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1785, 9, 0, 'CAPTURE_STEP_PERFORMANCE', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (1786, 9, 0, 'STEP_PERFORMANCE_CAPTURING_DELAY', 1000, NULL);
INSERT INTO `r_trans_attribute` VALUES (1787, 9, 0, 'STEP_PERFORMANCE_CAPTURING_SIZE_LIMIT', 0, '100');
INSERT INTO `r_trans_attribute` VALUES (1788, 9, 0, 'STEP_PERFORMANCE_LOG_TABLE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1789, 9, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1790, 9, 0, 'LOG_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1791, 9, 0, 'TRANSFORMATION_TYPE', 0, 'Normal');
INSERT INTO `r_trans_attribute` VALUES (1792, 9, 0, 'SLEEP_TIME_EMPTY', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (1793, 9, 0, 'SLEEP_TIME_FULL', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (1794, 9, 0, 'TRANS_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1795, 9, 0, 'TRANS_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1796, 9, 0, 'TRANS_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1797, 9, 0, 'TRANS_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1798, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1799, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1800, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1801, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1802, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1803, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1804, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (1805, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (1806, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1807, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (1808, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (1809, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1810, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (1811, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (1812, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1813, 9, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT4', 0, '输入');
INSERT INTO `r_trans_attribute` VALUES (1814, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (1815, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (1816, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1817, 9, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT5', 0, '输出');
INSERT INTO `r_trans_attribute` VALUES (1818, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (1819, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (1820, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1821, 9, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT6', 0, '输出');
INSERT INTO `r_trans_attribute` VALUES (1822, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (1823, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (1824, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1825, 9, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT7', 0, '输入');
INSERT INTO `r_trans_attribute` VALUES (1826, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (1827, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (1828, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1829, 9, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT8', 0, '输入');
INSERT INTO `r_trans_attribute` VALUES (1830, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (1831, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (1832, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1833, 9, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT9', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1834, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (1835, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (1836, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1837, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (1838, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (1839, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1840, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (1841, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (1842, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1843, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (1844, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (1845, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1846, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (1847, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (1848, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1849, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (1850, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (1851, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1852, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (1853, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (1854, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1855, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (1856, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (1857, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (1858, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (1859, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (1860, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (1861, 9, 0, 'TRANS_LOG_TABLE_FIELD_ID19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (1862, 9, 0, 'TRANS_LOG_TABLE_FIELD_NAME19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (1863, 9, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (1864, 9, 0, 'TRANSLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1865, 9, 0, 'TRANSLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1866, 9, 0, 'STEP_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1867, 9, 0, 'STEP_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1868, 9, 0, 'STEP_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1869, 9, 0, 'STEP_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1870, 9, 0, 'STEP_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1871, 9, 0, 'STEP_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1872, 9, 0, 'STEP_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1873, 9, 0, 'STEP_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1874, 9, 0, 'STEP_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1875, 9, 0, 'STEP_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1876, 9, 0, 'STEP_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (1877, 9, 0, 'STEP_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (1878, 9, 0, 'STEP_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1879, 9, 0, 'STEP_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (1880, 9, 0, 'STEP_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (1881, 9, 0, 'STEP_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1882, 9, 0, 'STEP_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (1883, 9, 0, 'STEP_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (1884, 9, 0, 'STEP_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1885, 9, 0, 'STEP_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (1886, 9, 0, 'STEP_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (1887, 9, 0, 'STEP_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1888, 9, 0, 'STEP_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (1889, 9, 0, 'STEP_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (1890, 9, 0, 'STEP_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1891, 9, 0, 'STEP_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (1892, 9, 0, 'STEP_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (1893, 9, 0, 'STEP_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1894, 9, 0, 'STEP_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (1895, 9, 0, 'STEP_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (1896, 9, 0, 'STEP_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1897, 9, 0, 'STEP_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (1898, 9, 0, 'STEP_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (1899, 9, 0, 'STEP_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1900, 9, 0, 'STEP_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (1901, 9, 0, 'STEP_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (1902, 9, 0, 'STEP_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1903, 9, 0, 'STEP_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (1904, 9, 0, 'STEP_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (1905, 9, 0, 'STEP_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1906, 9, 0, 'STEP_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (1907, 9, 0, 'STEP_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (1908, 9, 0, 'STEP_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1909, 9, 0, 'STEP_LOG_TABLE_FIELD_ID13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (1910, 9, 0, 'STEP_LOG_TABLE_FIELD_NAME13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (1911, 9, 0, 'STEP_LOG_TABLE_FIELD_ENABLED13', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (1912, 9, 0, 'PERFORMANCE_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1913, 9, 0, 'PERFORMANCE_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1914, 9, 0, 'PERFORMANCE_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1915, 9, 0, 'PERFORMANCE_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1916, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1917, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1918, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1919, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (1920, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (1921, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1922, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (1923, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (1924, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1925, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (1926, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (1927, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1928, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (1929, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (1930, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1931, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (1932, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (1933, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1934, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (1935, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (1936, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1937, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (1938, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (1939, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1940, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (1941, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (1942, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1943, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (1944, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (1945, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1946, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (1947, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (1948, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1949, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (1950, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (1951, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1952, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (1953, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (1954, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1955, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (1956, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (1957, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1958, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (1959, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (1960, 9, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1961, 9, 0, 'PERFORMANCELOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1962, 9, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1963, 9, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1964, 9, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1965, 9, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (1966, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1967, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (1968, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1969, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1970, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1971, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1972, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (1973, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (1974, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1975, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (1976, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (1977, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1978, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (1979, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (1980, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1981, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (1982, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (1983, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1984, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (1985, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (1986, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1987, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (1988, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (1989, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1990, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (1991, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (1992, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1993, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (1994, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (1995, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1996, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1997, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (1998, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (1999, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (2000, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (2001, 9, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2002, 10, 0, 'UNIQUE_CONNECTIONS', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (2003, 10, 0, 'FEEDBACK_SHOWN', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2004, 10, 0, 'FEEDBACK_SIZE', 50000, NULL);
INSERT INTO `r_trans_attribute` VALUES (2005, 10, 0, 'USING_THREAD_PRIORITIES', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2006, 10, 0, 'SHARED_FILE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2007, 10, 0, 'CAPTURE_STEP_PERFORMANCE', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (2008, 10, 0, 'STEP_PERFORMANCE_CAPTURING_DELAY', 1000, NULL);
INSERT INTO `r_trans_attribute` VALUES (2009, 10, 0, 'STEP_PERFORMANCE_CAPTURING_SIZE_LIMIT', 0, '100');
INSERT INTO `r_trans_attribute` VALUES (2010, 10, 0, 'STEP_PERFORMANCE_LOG_TABLE', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2011, 10, 0, 'LOG_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2012, 10, 0, 'LOG_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2013, 10, 0, 'TRANSFORMATION_TYPE', 0, 'Normal');
INSERT INTO `r_trans_attribute` VALUES (2014, 10, 0, 'SLEEP_TIME_EMPTY', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (2015, 10, 0, 'SLEEP_TIME_FULL', 50, NULL);
INSERT INTO `r_trans_attribute` VALUES (2016, 10, 0, 'TRANS_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2017, 10, 0, 'TRANS_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2018, 10, 0, 'TRANS_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2019, 10, 0, 'TRANS_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2020, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (2021, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (2022, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2023, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (2024, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (2025, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2026, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (2027, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME2', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (2028, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2029, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (2030, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME3', 0, 'STATUS');
INSERT INTO `r_trans_attribute` VALUES (2031, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2032, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (2033, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME4', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (2034, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2035, 10, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT4', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2036, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (2037, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME5', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (2038, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2039, 10, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT5', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2040, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (2041, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME6', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (2042, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2043, 10, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT6', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2044, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (2045, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME7', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (2046, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2047, 10, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT7', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2048, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (2049, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME8', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (2050, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2051, 10, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT8', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2052, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (2053, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME9', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (2054, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2055, 10, 0, 'TRANS_LOG_TABLE_FIELD_SUBJECT9', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2056, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (2057, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME10', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (2058, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2059, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (2060, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME11', 0, 'STARTDATE');
INSERT INTO `r_trans_attribute` VALUES (2061, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2062, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (2063, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME12', 0, 'ENDDATE');
INSERT INTO `r_trans_attribute` VALUES (2064, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2065, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (2066, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME13', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (2067, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2068, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (2069, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME14', 0, 'DEPDATE');
INSERT INTO `r_trans_attribute` VALUES (2070, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2071, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (2072, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME15', 0, 'REPLAYDATE');
INSERT INTO `r_trans_attribute` VALUES (2073, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED15', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2074, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (2075, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME16', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (2076, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED16', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2077, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (2078, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME17', 0, 'EXECUTING_SERVER');
INSERT INTO `r_trans_attribute` VALUES (2079, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED17', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (2080, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (2081, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME18', 0, 'EXECUTING_USER');
INSERT INTO `r_trans_attribute` VALUES (2082, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED18', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (2083, 10, 0, 'TRANS_LOG_TABLE_FIELD_ID19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (2084, 10, 0, 'TRANS_LOG_TABLE_FIELD_NAME19', 0, 'CLIENT');
INSERT INTO `r_trans_attribute` VALUES (2085, 10, 0, 'TRANS_LOG_TABLE_FIELD_ENABLED19', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (2086, 10, 0, 'TRANSLOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2087, 10, 0, 'TRANSLOG_TABLE_SIZE_LIMIT', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2088, 10, 0, 'STEP_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2089, 10, 0, 'STEP_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2090, 10, 0, 'STEP_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2091, 10, 0, 'STEP_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2092, 10, 0, 'STEP_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (2093, 10, 0, 'STEP_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (2094, 10, 0, 'STEP_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2095, 10, 0, 'STEP_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (2096, 10, 0, 'STEP_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (2097, 10, 0, 'STEP_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2098, 10, 0, 'STEP_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (2099, 10, 0, 'STEP_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (2100, 10, 0, 'STEP_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2101, 10, 0, 'STEP_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (2102, 10, 0, 'STEP_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (2103, 10, 0, 'STEP_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2104, 10, 0, 'STEP_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (2105, 10, 0, 'STEP_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (2106, 10, 0, 'STEP_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2107, 10, 0, 'STEP_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (2108, 10, 0, 'STEP_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (2109, 10, 0, 'STEP_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2110, 10, 0, 'STEP_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (2111, 10, 0, 'STEP_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (2112, 10, 0, 'STEP_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2113, 10, 0, 'STEP_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (2114, 10, 0, 'STEP_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (2115, 10, 0, 'STEP_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2116, 10, 0, 'STEP_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (2117, 10, 0, 'STEP_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (2118, 10, 0, 'STEP_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2119, 10, 0, 'STEP_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (2120, 10, 0, 'STEP_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (2121, 10, 0, 'STEP_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2122, 10, 0, 'STEP_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (2123, 10, 0, 'STEP_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (2124, 10, 0, 'STEP_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2125, 10, 0, 'STEP_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (2126, 10, 0, 'STEP_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (2127, 10, 0, 'STEP_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2128, 10, 0, 'STEP_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (2129, 10, 0, 'STEP_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (2130, 10, 0, 'STEP_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2131, 10, 0, 'STEP_LOG_TABLE_FIELD_ID13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (2132, 10, 0, 'STEP_LOG_TABLE_FIELD_NAME13', 0, 'LOG_FIELD');
INSERT INTO `r_trans_attribute` VALUES (2133, 10, 0, 'STEP_LOG_TABLE_FIELD_ENABLED13', 0, 'N');
INSERT INTO `r_trans_attribute` VALUES (2134, 10, 0, 'PERFORMANCE_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2135, 10, 0, 'PERFORMANCE_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2136, 10, 0, 'PERFORMANCE_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2137, 10, 0, 'PERFORMANCE_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2138, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (2139, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (2140, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2141, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (2142, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME1', 0, 'SEQ_NR');
INSERT INTO `r_trans_attribute` VALUES (2143, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2144, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (2145, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME2', 0, 'LOGDATE');
INSERT INTO `r_trans_attribute` VALUES (2146, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2147, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (2148, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME3', 0, 'TRANSNAME');
INSERT INTO `r_trans_attribute` VALUES (2149, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2150, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (2151, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME4', 0, 'STEPNAME');
INSERT INTO `r_trans_attribute` VALUES (2152, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2153, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (2154, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME5', 0, 'STEP_COPY');
INSERT INTO `r_trans_attribute` VALUES (2155, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2156, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (2157, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME6', 0, 'LINES_READ');
INSERT INTO `r_trans_attribute` VALUES (2158, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2159, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (2160, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME7', 0, 'LINES_WRITTEN');
INSERT INTO `r_trans_attribute` VALUES (2161, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2162, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (2163, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME8', 0, 'LINES_UPDATED');
INSERT INTO `r_trans_attribute` VALUES (2164, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2165, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (2166, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME9', 0, 'LINES_INPUT');
INSERT INTO `r_trans_attribute` VALUES (2167, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2168, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (2169, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME10', 0, 'LINES_OUTPUT');
INSERT INTO `r_trans_attribute` VALUES (2170, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2171, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (2172, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME11', 0, 'LINES_REJECTED');
INSERT INTO `r_trans_attribute` VALUES (2173, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2174, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (2175, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME12', 0, 'ERRORS');
INSERT INTO `r_trans_attribute` VALUES (2176, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED12', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2177, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (2178, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME13', 0, 'INPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (2179, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED13', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2180, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ID14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (2181, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_NAME14', 0, 'OUTPUT_BUFFER_ROWS');
INSERT INTO `r_trans_attribute` VALUES (2182, 10, 0, 'PERFORMANCE_LOG_TABLE_FIELD_ENABLED14', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2183, 10, 0, 'PERFORMANCELOG_TABLE_INTERVAL', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2184, 10, 0, 'CHANNEL_LOG_TABLE_CONNECTION_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2185, 10, 0, 'CHANNEL_LOG_TABLE_SCHEMA_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2186, 10, 0, 'CHANNEL_LOG_TABLE_TABLE_NAME', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2187, 10, 0, 'CHANNEL_LOG_TABLE_TIMEOUT_IN_DAYS', 0, NULL);
INSERT INTO `r_trans_attribute` VALUES (2188, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (2189, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME0', 0, 'ID_BATCH');
INSERT INTO `r_trans_attribute` VALUES (2190, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED0', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2191, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (2192, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME1', 0, 'CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (2193, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED1', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2194, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (2195, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME2', 0, 'LOG_DATE');
INSERT INTO `r_trans_attribute` VALUES (2196, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED2', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2197, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (2198, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME3', 0, 'LOGGING_OBJECT_TYPE');
INSERT INTO `r_trans_attribute` VALUES (2199, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED3', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2200, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (2201, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME4', 0, 'OBJECT_NAME');
INSERT INTO `r_trans_attribute` VALUES (2202, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED4', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2203, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (2204, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME5', 0, 'OBJECT_COPY');
INSERT INTO `r_trans_attribute` VALUES (2205, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED5', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2206, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (2207, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME6', 0, 'REPOSITORY_DIRECTORY');
INSERT INTO `r_trans_attribute` VALUES (2208, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED6', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2209, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (2210, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME7', 0, 'FILENAME');
INSERT INTO `r_trans_attribute` VALUES (2211, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED7', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2212, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (2213, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME8', 0, 'OBJECT_ID');
INSERT INTO `r_trans_attribute` VALUES (2214, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED8', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2215, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (2216, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME9', 0, 'OBJECT_REVISION');
INSERT INTO `r_trans_attribute` VALUES (2217, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED9', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2218, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (2219, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME10', 0, 'PARENT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (2220, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED10', 0, 'Y');
INSERT INTO `r_trans_attribute` VALUES (2221, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ID11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (2222, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_NAME11', 0, 'ROOT_CHANNEL_ID');
INSERT INTO `r_trans_attribute` VALUES (2223, 10, 0, 'CHANNEL_LOG_TABLE_FIELD_ENABLED11', 0, 'Y');

-- ----------------------------
-- Table structure for r_trans_cluster
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_cluster`;
CREATE TABLE `r_trans_cluster`  (
  `ID_TRANS_CLUSTER` bigint NOT NULL,
  `ID_TRANSFORMATION` int NULL DEFAULT NULL,
  `ID_CLUSTER` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_CLUSTER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_trans_cluster
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_hop
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_hop`;
CREATE TABLE `r_trans_hop`  (
  `ID_TRANS_HOP` bigint NOT NULL,
  `ID_TRANSFORMATION` int NULL DEFAULT NULL,
  `ID_STEP_FROM` int NULL DEFAULT NULL,
  `ID_STEP_TO` int NULL DEFAULT NULL,
  `ENABLED` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_HOP`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_trans_hop
-- ----------------------------
INSERT INTO `r_trans_hop` VALUES (1, 1, 8, 1, '0');
INSERT INTO `r_trans_hop` VALUES (2, 1, 5, 6, '1');
INSERT INTO `r_trans_hop` VALUES (3, 1, 1, 3, '1');
INSERT INTO `r_trans_hop` VALUES (4, 1, 3, 5, '0');
INSERT INTO `r_trans_hop` VALUES (5, 1, 5, 7, '1');
INSERT INTO `r_trans_hop` VALUES (6, 1, 7, 9, '1');
INSERT INTO `r_trans_hop` VALUES (7, 1, 2, 4, '1');
INSERT INTO `r_trans_hop` VALUES (8, 1, 8, 2, '1');
INSERT INTO `r_trans_hop` VALUES (9, 1, 4, 5, '1');
INSERT INTO `r_trans_hop` VALUES (10, 2, 10, 12, '1');
INSERT INTO `r_trans_hop` VALUES (11, 2, 11, 10, '1');
INSERT INTO `r_trans_hop` VALUES (24, 7, 28, 27, '1');
INSERT INTO `r_trans_hop` VALUES (25, 7, 28, 29, '1');
INSERT INTO `r_trans_hop` VALUES (26, 9, 37, 38, '1');
INSERT INTO `r_trans_hop` VALUES (27, 10, 42, 39, '0');
INSERT INTO `r_trans_hop` VALUES (28, 10, 39, 41, '0');
INSERT INTO `r_trans_hop` VALUES (29, 10, 42, 40, '1');
INSERT INTO `r_trans_hop` VALUES (30, 10, 40, 41, '1');

-- ----------------------------
-- Table structure for r_trans_lock
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_lock`;
CREATE TABLE `r_trans_lock`  (
  `ID_TRANS_LOCK` bigint NOT NULL,
  `ID_TRANSFORMATION` int NULL DEFAULT NULL,
  `ID_USER` int NULL DEFAULT NULL,
  `LOCK_MESSAGE` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `LOCK_DATE` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_LOCK`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_trans_lock
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_note
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_note`;
CREATE TABLE `r_trans_note`  (
  `ID_TRANSFORMATION` int NULL DEFAULT NULL,
  `ID_NOTE` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_trans_note
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_partition_schema
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_partition_schema`;
CREATE TABLE `r_trans_partition_schema`  (
  `ID_TRANS_PARTITION_SCHEMA` bigint NOT NULL,
  `ID_TRANSFORMATION` int NULL DEFAULT NULL,
  `ID_PARTITION_SCHEMA` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_PARTITION_SCHEMA`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_trans_partition_schema
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_slave
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_slave`;
CREATE TABLE `r_trans_slave`  (
  `ID_TRANS_SLAVE` bigint NOT NULL,
  `ID_TRANSFORMATION` int NULL DEFAULT NULL,
  `ID_SLAVE` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TRANS_SLAVE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_trans_slave
-- ----------------------------

-- ----------------------------
-- Table structure for r_trans_step_condition
-- ----------------------------
DROP TABLE IF EXISTS `r_trans_step_condition`;
CREATE TABLE `r_trans_step_condition`  (
  `ID_TRANSFORMATION` int NULL DEFAULT NULL,
  `ID_STEP` int NULL DEFAULT NULL,
  `ID_CONDITION` int NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_trans_step_condition
-- ----------------------------

-- ----------------------------
-- Table structure for r_transformation
-- ----------------------------
DROP TABLE IF EXISTS `r_transformation`;
CREATE TABLE `r_transformation`  (
  `ID_TRANSFORMATION` bigint NOT NULL,
  `ID_DIRECTORY` int NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `EXTENDED_DESCRIPTION` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `TRANS_VERSION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `TRANS_STATUS` int NULL DEFAULT NULL,
  `ID_STEP_READ` int NULL DEFAULT NULL,
  `ID_STEP_WRITE` int NULL DEFAULT NULL,
  `ID_STEP_INPUT` int NULL DEFAULT NULL,
  `ID_STEP_OUTPUT` int NULL DEFAULT NULL,
  `ID_STEP_UPDATE` int NULL DEFAULT NULL,
  `ID_DATABASE_LOG` int NULL DEFAULT NULL,
  `TABLE_NAME_LOG` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USE_BATCHID` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `USE_LOGFIELD` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ID_DATABASE_MAXDATE` int NULL DEFAULT NULL,
  `TABLE_NAME_MAXDATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FIELD_NAME_MAXDATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OFFSET_MAXDATE` double NULL DEFAULT NULL,
  `DIFF_MAXDATE` double NULL DEFAULT NULL,
  `CREATED_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CREATED_DATE` datetime NULL DEFAULT NULL,
  `MODIFIED_USER` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MODIFIED_DATE` datetime NULL DEFAULT NULL,
  `SIZE_ROWSET` int NULL DEFAULT NULL,
  PRIMARY KEY (`ID_TRANSFORMATION`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_transformation
-- ----------------------------
INSERT INTO `r_transformation` VALUES (1, 2, '获取公网ip', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, -1, NULL, '1', '1', -1, NULL, NULL, 0, 0, 'admin', '2020-08-21 09:50:53', 'admin', '2022-04-12 14:58:54', 10000);
INSERT INTO `r_transformation` VALUES (2, 3, '作业初始化', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, -1, NULL, '1', '1', -1, NULL, NULL, 0, 0, 'admin', '2019-12-07 21:01:30', 'admin', '2019-11-16 00:51:20', 10000);
INSERT INTO `r_transformation` VALUES (7, 6, '处理转换-增量模板', NULL, NULL, NULL, 0, 28, 29, 28, 28, 29, -1, NULL, '1', '1', -1, NULL, NULL, 0, 0, 'admin', '2019-12-07 21:01:35', 'admin', '2019-11-16 01:35:20', 10000);
INSERT INTO `r_transformation` VALUES (8, 6, '处理转换-组件集合', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, -1, NULL, '1', '1', -1, NULL, NULL, 0, 0, 'admin', '2019-12-07 21:01:35', 'admin', '2019-11-16 23:57:00', 10000);
INSERT INTO `r_transformation` VALUES (9, 6, '处理转换-默认模板', NULL, NULL, NULL, 0, 37, 38, 37, 37, 38, -1, NULL, '1', '1', -1, NULL, NULL, 0, 0, 'admin', '2019-12-07 21:01:34', 'admin', '2019-11-16 01:35:36', 10000);
INSERT INTO `r_transformation` VALUES (10, 8, '处理转换', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, -1, NULL, '1', '1', -1, NULL, NULL, 0, 0, 'admin', '2023-05-19 11:33:28', 'admin', '2023-05-19 19:00:03', 10000);

-- ----------------------------
-- Table structure for r_user
-- ----------------------------
DROP TABLE IF EXISTS `r_user`;
CREATE TABLE `r_user`  (
  `ID_USER` bigint NOT NULL,
  `LOGIN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ENABLED` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_USER`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_user
-- ----------------------------
INSERT INTO `r_user` VALUES (1, 'admin', '2be98afc86aa7f2e4cb79ce71da9fa6d4', 'Administrator', 'User manager', 'Y');
INSERT INTO `r_user` VALUES (2, 'guest', '2be98afc86aa7f2e4cb79ce77cb97bcce', 'Guest account', 'Read-only guest account', 'Y');

-- ----------------------------
-- Table structure for r_value
-- ----------------------------
DROP TABLE IF EXISTS `r_value`;
CREATE TABLE `r_value`  (
  `ID_VALUE` bigint NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VALUE_TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `VALUE_STR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IS_NULL` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_VALUE`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_value
-- ----------------------------

-- ----------------------------
-- Table structure for r_version
-- ----------------------------
DROP TABLE IF EXISTS `r_version`;
CREATE TABLE `r_version`  (
  `ID_VERSION` bigint NOT NULL,
  `MAJOR_VERSION` int NULL DEFAULT NULL,
  `MINOR_VERSION` int NULL DEFAULT NULL,
  `UPGRADE_DATE` datetime NULL DEFAULT NULL,
  `IS_UPGRADE` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID_VERSION`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_version
-- ----------------------------
INSERT INTO `r_version` VALUES (1, 5, 0, '2023-05-15 22:41:36', 'N');

-- ----------------------------
-- View structure for v_job
-- ----------------------------
DROP VIEW IF EXISTS `v_job`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_job` AS select `j`.`ID_JOB` AS `ID_JOB`,`j`.`ID_DIRECTORY` AS `ID_DIRECTORY`,`j`.`NAME` AS `NAME`,`j`.`DESCRIPTION` AS `DESCRIPTION`,`j`.`EXTENDED_DESCRIPTION` AS `EXTENDED_DESCRIPTION`,`j`.`JOB_VERSION` AS `JOB_VERSION`,`j`.`JOB_STATUS` AS `JOB_STATUS`,`j`.`ID_DATABASE_LOG` AS `ID_DATABASE_LOG`,`j`.`TABLE_NAME_LOG` AS `TABLE_NAME_LOG`,`j`.`CREATED_USER` AS `CREATED_USER`,`j`.`CREATED_DATE` AS `CREATED_DATE`,`j`.`MODIFIED_USER` AS `MODIFIED_USER`,`j`.`MODIFIED_DATE` AS `MODIFIED_DATE`,`j`.`USE_BATCH_ID` AS `USE_BATCH_ID`,`j`.`PASS_BATCH_ID` AS `PASS_BATCH_ID`,`j`.`USE_LOGFIELD` AS `USE_LOGFIELD`,`j`.`SHARED_FILE` AS `SHARED_FILE`,`k`.`gxsj` AS `gxsj`,`k`.`yxx` AS `yxx`,`k`.`px` AS `px`,`k`.`kzxx` AS `kzxx`,`k`.`cjrxm` AS `cjrxm`,`k`.`cjrdm` AS `cjrdm`,`k`.`cjrdwmc` AS `cjrdwmc`,`k`.`cjrdwdm` AS `cjrdwdm`,`k`.`id` AS `id`,`k`.`yxzt` AS `yxzt`,`k`.`zhgxsj` AS `zhgxsj`,`k`.`zdcqcs` AS `zdcqcs`,`k`.`ddjd` AS `ddjd`,`k`.`dsms` AS `dsms`,`k`.`rzjb` AS `rzjb`,ifnull(`k`.`zylx`,'cgzy') AS `zylx`,`k`.`gzlj` AS `gzlj`,`k`.`shell` AS `shell`,`k`.`sjzt` AS `sjzt`,`k`.`sql` AS `sql`,`k`.`js` AS `js`,`k`.`kmlm` AS `kmlm`,`k`.`kmpz` AS `kmpz`,`k`.`lydx` AS `lydx`,`k`.`mbdx` AS `mbdx`,`k`.`lzmb` AS `lzmb`,`k`.`gdpz` AS `gdpz`,`k`.`srzj` AS `srzj`,`k`.`sczj` AS `sczj`,`k`.`bz` AS `bz` from (`r_job` `j` left join `kettle_kz_zykz` `k` on((`j`.`ID_JOB` = `k`.`id_job`)));

-- ----------------------------
-- View structure for v_zhyy
-- ----------------------------
DROP VIEW IF EXISTS `v_zhyy`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_zhyy` AS select `j`.`ID_JOB` AS `id_job`,`j`.`NAME` AS `name`,`j`.`DESCRIPTION` AS `description`,`je`.`ID_JOBENTRY` AS `id_jobentry`,`je`.`NAME` AS `je_name`,`ja`.`VALUE_STR` AS `zhmc`,`jad`.`zhlj` AS `zhlj` from (((`r_job` `j` join `r_jobentry` `je` on((`j`.`ID_JOB` = `je`.`ID_JOB`))) join `r_jobentry_attribute` `ja` on((`ja`.`ID_JOBENTRY` = `je`.`ID_JOBENTRY`))) join (select `je`.`ID_JOBENTRY` AS `id_jobentry`,`ja`.`CODE` AS `code`,`ja`.`VALUE_STR` AS `zhlj` from ((`r_job` `j` join `r_jobentry` `je` on((`j`.`ID_JOB` = `je`.`ID_JOB`))) join `r_jobentry_attribute` `ja` on((`ja`.`ID_JOBENTRY` = `je`.`ID_JOBENTRY`))) where ((`je`.`ID_JOBENTRY_TYPE` = (select `jt`.`ID_JOBENTRY_TYPE` from `r_jobentry_type` `jt` where (`jt`.`CODE` = 'TRANS'))) and (`ja`.`CODE` = 'dir_path'))) `jad` on((`jad`.`id_jobentry` = `je`.`ID_JOBENTRY`))) where ((`je`.`ID_JOBENTRY_TYPE` = (select `jt`.`ID_JOBENTRY_TYPE` from `r_jobentry_type` `jt` where (`jt`.`CODE` = 'TRANS'))) and (`ja`.`CODE` = 'name'));

-- ----------------------------
-- View structure for v_zycs
-- ----------------------------
DROP VIEW IF EXISTS `v_zycs`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_zycs` AS select `ja`.`ID_JOB` AS `id_job`,`ja`.`ID_JOB_ATTRIBUTE` AS `id`,`ja`.`VALUE_STR` AS `key`,`ja1`.`VALUE_STR` AS `name`,`ja2`.`VALUE_STR` AS `PARAM_DEFAULT`,`p`.`value` AS `value`,`p`.`gxsj` AS `gxsj`,`p`.`yxx` AS `yxx` from ((((`r_job_attribute` `ja` join `r_job_attribute` `ja1` on(((`ja1`.`ID_JOB` = `ja`.`ID_JOB`) and (`ja1`.`NR` = `ja`.`NR`) and (`ja1`.`CODE` = 'PARAM_DESC')))) join `r_job_attribute` `ja2` on(((`ja2`.`ID_JOB` = `ja`.`ID_JOB`) and (`ja2`.`NR` = `ja`.`NR`) and (`ja2`.`CODE` = 'PARAM_DEFAULT')))) join `r_job` `j` on((`j`.`ID_JOB` = `ja`.`ID_JOB`))) left join `kettle_kz_zycs` `p` on(((`p`.`id_job` = `ja`.`ID_JOB`) and (`ja`.`VALUE_STR` = `p`.`key`)))) where (`ja`.`CODE` = 'PARAM_KEY') order by `ja`.`NR`;

SET FOREIGN_KEY_CHECKS = 1;
