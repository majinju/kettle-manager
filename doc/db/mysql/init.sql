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

 Date: 31/05/2023 21:34:51
*/

SET NAMES utf8mb4;

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

CREATE OR REPLACE  VIEW `v_job` AS SELECT
      `j`.`ID_JOB` AS `ID_JOB`,
      `j`.`ID_DIRECTORY` AS `ID_DIRECTORY`,
      `j`.`NAME` AS `NAME`,
      `j`.`DESCRIPTION` AS `DESCRIPTION`,
      `j`.`EXTENDED_DESCRIPTION` AS `EXTENDED_DESCRIPTION`,
      `j`.`JOB_VERSION` AS `JOB_VERSION`,
      `j`.`JOB_STATUS` AS `JOB_STATUS`,
      `j`.`ID_DATABASE_LOG` AS `ID_DATABASE_LOG`,
      `j`.`TABLE_NAME_LOG` AS `TABLE_NAME_LOG`,
      `j`.`CREATED_USER` AS `CREATED_USER`,
      `j`.`CREATED_DATE` AS `CREATED_DATE`,
      `j`.`MODIFIED_USER` AS `MODIFIED_USER`,
      `j`.`MODIFIED_DATE` AS `MODIFIED_DATE`,
      `j`.`USE_BATCH_ID` AS `USE_BATCH_ID`,
      `j`.`PASS_BATCH_ID` AS `PASS_BATCH_ID`,
      `j`.`USE_LOGFIELD` AS `USE_LOGFIELD`,
      `j`.`SHARED_FILE` AS `SHARED_FILE`,
      `k`.`gxsj` AS `gxsj`,
      `k`.`yxx` AS `yxx`,
      `k`.`px` AS `px`,
      `k`.`kzxx` AS `kzxx`,
      `k`.`cjrxm` AS `cjrxm`,
      `k`.`cjrdm` AS `cjrdm`,
      `k`.`cjrdwmc` AS `cjrdwmc`,
      `k`.`cjrdwdm` AS `cjrdwdm`,
      `k`.`id` AS `id`,
      `k`.`yxzt` AS `yxzt`,
      `k`.`zhgxsj` AS `zhgxsj`,
      `k`.`zdcqcs` AS `zdcqcs`,
      `k`.`ddjd` AS `ddjd`,
      `k`.`dsms` AS `dsms`,
      `k`.`rzjb` AS `rzjb`,
      ifnull( `k`.`zylx`, 'cgzy' ) AS `zylx`,
      `k`.`gzlj` AS `gzlj`,
      `k`.`shell` AS `shell`,
      `k`.`sjzt` AS `sjzt`,
      `k`.`sql` AS `sql`,
      `k`.`js` AS `js`,
      `k`.`kmlm` AS `kmlm`,
      `k`.`kmpz` AS `kmpz`,
      `k`.`lydx` AS `lydx`,
      `k`.`mbdx` AS `mbdx`,
      `k`.`lzmb` AS `lzmb`,
      `k`.`gdpz` AS `gdpz`,
      `k`.`srzj` AS `srzj`,
      `k`.`sczj` AS `sczj`,
      `k`.`bz` AS `bz`
  FROM
      (
       `r_job` `j`
          LEFT JOIN `kettle_kz_zykz` `k` ON ((
              `j`.`ID_JOB` = `k`.`id_job` and k.yxx='1'
          )));

CREATE OR REPLACE VIEW `v_zhyy` AS SELECT
   `j`.`ID_JOB` AS `id_job`,
   `j`.`NAME` AS `name`,
   `j`.`DESCRIPTION` AS `description`,
   `je`.`ID_JOBENTRY` AS `id_jobentry`,
   `je`.`NAME` AS `je_name`,
   `ja`.`VALUE_STR` AS `zhmc`,
   `jad`.`zhlj` AS `zhlj`
FROM
   (((
       `r_job` `j`
           JOIN `r_jobentry` `je` ON ((
               `j`.`ID_JOB` = `je`.`ID_JOB`
           )))
       JOIN `r_jobentry_attribute` `ja` ON ((
               `ja`.`ID_JOBENTRY` = `je`.`ID_JOBENTRY`
           )))
       JOIN (
       SELECT
           `je`.`ID_JOBENTRY` AS `id_jobentry`,
           `ja`.`CODE` AS `code`,
           `ja`.`VALUE_STR` AS `zhlj`
       FROM
           ((
                `r_job` `j`
                    JOIN `r_jobentry` `je` ON ((
                        `j`.`ID_JOB` = `je`.`ID_JOB`
                    )))
               JOIN `r_jobentry_attribute` `ja` ON ((
                   `ja`.`ID_JOBENTRY` = `je`.`ID_JOBENTRY`
               )))
       WHERE
           ((
                    `je`.`ID_JOBENTRY_TYPE` = (
                    SELECT
                        `jt`.`ID_JOBENTRY_TYPE`
                    FROM
                        `r_jobentry_type` `jt`
                    WHERE
                        ( `jt`.`CODE` = 'TRANS' )))
               AND ( `ja`.`CODE` = 'dir_path' ))) `jad` ON ((
           `jad`.`id_jobentry` = `je`.`ID_JOBENTRY`
       )))
WHERE
   ((
            `je`.`ID_JOBENTRY_TYPE` = (
            SELECT
                `jt`.`ID_JOBENTRY_TYPE`
            FROM
                `r_jobentry_type` `jt`
            WHERE
                ( `jt`.`CODE` = 'TRANS' )))
       AND ( `ja`.`CODE` = 'name' ));

CREATE OR REPLACE VIEW `v_zycs` AS SELECT
   `ja`.`ID_JOB` AS `id_job`,
   `ja`.`ID_JOB_ATTRIBUTE` AS `id`,
   `ja`.`VALUE_STR` AS `key`,
   `ja1`.`VALUE_STR` AS `name`,
   `ja2`.`VALUE_STR` AS `PARAM_DEFAULT`,
   `p`.`value` AS `value`,
   `p`.`gxsj` AS `gxsj`,
   `p`.`yxx` AS `yxx`
FROM
   ((((
       `r_job_attribute` `ja`
           JOIN `r_job_attribute` `ja1` ON (((
                                                     `ja1`.`ID_JOB` = `ja`.`ID_JOB`
                                                 )
           AND ( `ja1`.`NR` = `ja`.`NR` )
           AND ( `ja1`.`CODE` = 'PARAM_DESC' ))))
       JOIN `r_job_attribute` `ja2` ON (((
                                                 `ja2`.`ID_JOB` = `ja`.`ID_JOB`
                                             )
           AND ( `ja2`.`NR` = `ja`.`NR` )
           AND ( `ja2`.`CODE` = 'PARAM_DEFAULT' ))))
       JOIN `r_job` `j` ON ((
               `j`.`ID_JOB` = `ja`.`ID_JOB`
           )))
       LEFT JOIN `kettle_kz_zycs` `p` ON (((
                                                   `p`.`id_job` = `ja`.`ID_JOB`
                                               )
       AND ( `ja`.`VALUE_STR` = `p`.`key` ))))
WHERE
   ( `ja`.`CODE` = 'PARAM_KEY' )
ORDER BY
   `ja`.`NR`;
