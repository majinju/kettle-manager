--设置环境变量
--KETTLE_HOME=D:\NIS\data-integration5.4

--KM用户是管理平台的数据库用户，请自行创建或使用已有用户，然后修改数据库配置
--将KM.sql导入

-------------------数据库脚本----------------------
--原始kettle资源库的数据库中执行如下语句（若使用我提供的资源库建表语句kettle.sql则不用执行，已经包含了）
--R_JOB表新增字段
ALTER TABLE `r_job`
ADD COLUMN `RUN_STATUS`  varchar(100) NULL DEFAULT 'Stopped' COMMENT '运行状态' AFTER `SHARED_FILE`;
ALTER TABLE `r_job`
ADD COLUMN `LAST_UPDATE`  varchar(14) NULL COMMENT '最后更新时间' AFTER `RUN_STATUS`;
ALTER TABLE `r_job`
ADD COLUMN `AUTO_RESTART_NUM`  varchar(10) NULL DEFAULT '0' COMMENT '自动重启次数' AFTER `LAST_UPDATE`;
ALTER TABLE `r_job`
ADD COLUMN `REPOSITORY_CODE`  varchar(200) NULL  DEFAULT 'KETTLE_DEFAULT' COMMENT '资源库代码' AFTER `AUTO_RESTART_NUM`;
ALTER TABLE `r_job`
ADD COLUMN `PROJECT_CODE`  varchar(200) NULL DEFAULT 'KM_LOCALHOST_82' COMMENT '运行在' AFTER `REPOSITORY_CODE`;
  
-- 在kettle资源库中新增参数设置表
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



create or replace view v_job as
select id_job,
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
  */;
  
create or replace view v_job_params as
select ja.id_job,
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



