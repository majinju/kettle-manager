--设置环境变量
--KETTLE_HOME=D:\NIS\data-integration5.4

--KM用户是管理平台的数据库用户，请自行创建或使用已有用户，然后修改数据库配置
--KM结构和数据用plsql导出，可以使用plsql的工具->导出表->sql插入将KM.sql导入

-------------------数据库脚本----------------------
--原始kettle资源库的数据库中执行如下语句（若使用我提供的资源库建表语句kettle.sql则不用执行，已经包含了）
--R_JOB表新增字段
alter table R_JOB add RUN_STATUS VARCHAR2(100) default 'Stopped';
comment on column R_JOB.RUN_STATUS
  is '运行状态';
alter table R_JOB add LAST_UPDATE VARCHAR2(14) default to_char(sysdate,'yyyymmddhh24miss');
comment on column R_JOB.LAST_UPDATE
  is '最后更新时间';
alter table R_JOB add AUTO_RESTART_NUM VARCHAR2(10) default '0';
comment on column R_JOB.AUTO_RESTART_NUM
  is '自动重启次数';
alter table R_JOB add REPOSITORY_CODE VARCHAR2(100) default 'KETTLE_DEFAULT';
alter table R_JOB add PROJECT_CODE VARCHAR2(500) default 'KM_LOCALHOST_82';
-- Add comments to the columns 
comment on column R_JOB.REPOSITORY_CODE
  is '资源库代码';
comment on column R_JOB.PROJECT_CODE
  is '运行在';
  
-- 在kettle资源库中新增参数设置表
create table JOB_PARAMS
(
  OID          VARCHAR2(32) default sys_guid() not null,
  OCODE        VARCHAR2(100),
  ONAME        VARCHAR2(100),
  ODESCRIBE    VARCHAR2(500),
  OORDER       NUMBER,
  SIMPLE_SPELL VARCHAR2(200),
  FULL_SPELL   VARCHAR2(500),
  CREATE_DATE  VARCHAR2(14) default to_char(sysdate,'yyyymmddhh24miss'),
  UPDATE_DATE  VARCHAR2(14) default to_char(sysdate,'yyyymmddhh24miss'),
  CREATE_USER  VARCHAR2(100),
  UPDATE_USER  VARCHAR2(100),
  EXPAND       VARCHAR2(2000),
  IS_DISABLE   VARCHAR2(10) default '0',
  FLAG1        VARCHAR2(200),
  FLAG2        VARCHAR2(200),
  ID_JOB       NUMBER,
  VALUE        VARCHAR2(2000)
);
-- Add comments to the table 
comment on table JOB_PARAMS
  is '作业参数设置';
-- Add comments to the columns 
comment on column JOB_PARAMS.OID
  is '对象主键';
comment on column JOB_PARAMS.OCODE
  is '对象代码';
comment on column JOB_PARAMS.ONAME
  is '对象名称';
comment on column JOB_PARAMS.ODESCRIBE
  is '对象描述';
comment on column JOB_PARAMS.OORDER
  is '对象排序';
comment on column JOB_PARAMS.SIMPLE_SPELL
  is '对象简拼';
comment on column JOB_PARAMS.FULL_SPELL
  is '对象全拼';
comment on column JOB_PARAMS.CREATE_DATE
  is '创建时间';
comment on column JOB_PARAMS.UPDATE_DATE
  is '更新时间';
comment on column JOB_PARAMS.CREATE_USER
  is '创建人';
comment on column JOB_PARAMS.UPDATE_USER
  is '更新人';
comment on column JOB_PARAMS.EXPAND
  is '扩展信息';
comment on column JOB_PARAMS.IS_DISABLE
  is '是否禁用';
comment on column JOB_PARAMS.FLAG1
  is '备用1';
comment on column JOB_PARAMS.FLAG2
  is '备用2';
comment on column JOB_PARAMS.ID_JOB
  is '作业';
comment on column JOB_PARAMS.VALUE
  is '变量值';
-- Create/Recreate primary, unique and foreign key constraints 
alter table JOB_PARAMS
  add constraint PK_JOB_PARAMS primary key (OID);
-- Create/Recreate indexes 
create index IDX_JOB_PARAMS_CREATE_DATE on JOB_PARAMS (CREATE_DATE);
create index IDX_JOB_PARAMS_ONAME on JOB_PARAMS (ONAME);
create index IDX_JOB_PARAMS_UPDATE_DATE on JOB_PARAMS (UPDATE_DATE);

-- Create table
create table JOB_LOG
(
  OID          VARCHAR2(32) default sys_guid() not null,
  OCODE        VARCHAR2(100),
  ONAME        VARCHAR2(100),
  ODESCRIBE    VARCHAR2(500),
  OORDER       NUMBER,
  SIMPLE_SPELL VARCHAR2(200),
  FULL_SPELL   VARCHAR2(500),
  CREATE_DATE  VARCHAR2(14) default to_char(sysdate,'yyyymmddhh24miss'),
  UPDATE_DATE  VARCHAR2(14) default to_char(sysdate,'yyyymmddhh24miss'),
  CREATE_USER  VARCHAR2(100),
  UPDATE_USER  VARCHAR2(100),
  EXPAND       VARCHAR2(4000) default '{}',
  IS_DISABLE   VARCHAR2(10) default '0',
  FLAG1        VARCHAR2(200),
  FLAG2        VARCHAR2(200),
  ID_JOB       NUMBER,
  JOB_NAME     VARCHAR2(200),
  start_date   VARCHAR2(14),
  end_date     VARCHAR2(14),
  result       VARCHAR2(200),
  log_file     VARCHAR2(1000)
)
;
-- Add comments to the table 
comment on table JOB_LOG
  is '作业日志';
-- Add comments to the columns 
comment on column JOB_LOG.OID
  is '对象主键';
comment on column JOB_LOG.OCODE
  is '对象代码';
comment on column JOB_LOG.ONAME
  is '对象名称';
comment on column JOB_LOG.ODESCRIBE
  is '对象描述';
comment on column JOB_LOG.OORDER
  is '对象排序';
comment on column JOB_LOG.SIMPLE_SPELL
  is '对象简拼';
comment on column JOB_LOG.FULL_SPELL
  is '对象全拼';
comment on column JOB_LOG.CREATE_DATE
  is '创建时间';
comment on column JOB_LOG.UPDATE_DATE
  is '更新时间';
comment on column JOB_LOG.CREATE_USER
  is '创建人';
comment on column JOB_LOG.UPDATE_USER
  is '更新人';
comment on column JOB_LOG.EXPAND
  is '扩展信息';
comment on column JOB_LOG.IS_DISABLE
  is '是否禁用';
comment on column JOB_LOG.FLAG1
  is '备用1';
comment on column JOB_LOG.FLAG2
  is '备用2';
comment on column JOB_LOG.ID_JOB
  is '作业ID';
comment on column JOB_LOG.JOB_NAME
  is '作业名称';
comment on column JOB_LOG.start_date
  is '开始时间';
comment on column JOB_LOG.end_date
  is '结束时间';
comment on column JOB_LOG.result
  is '运行结果';
comment on column JOB_LOG.log_file
  is '日志文件';

create or replace view v_job as
select id_job,
       id_directory,
       id_job as timing,
       name,
       to_char(description) as description,
       to_char(extended_description) as extended_description,
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
       REPOSITORY_CODE,
       PROJECT_CODE
  from r_job j
  --where j.job_status=2
  /*
  作业视图，默认只显示处于发布状态的作业，可以根据需要自行修改
  */;
  
create or replace view v_job_params as
select ja.id_job,
to_char(ja.value_str) as ocode,
to_char(ja1.value_str) as oname,
to_char(ja2.value_str) as PARAM_DEFAULT,
p.value,p.simple_spell,p.full_spell
from r_job_attribute ja
inner join r_job_attribute ja1 on ja1.id_job=ja.id_job and ja1.nr=ja.nr and ja1.code='PARAM_DESC'
inner join r_job_attribute ja2 on ja2.id_job=ja.id_job and ja2.nr=ja.nr and ja2.code='PARAM_DEFAULT'
inner join r_job j on j.job_status=2 and j.id_job=ja.id_job
left join job_params p on p.id_job=ja.id_job and to_char(ja.value_str)=p.ocode
where ja.code = 'PARAM_KEY'
order by ja.nr asc
/*
参数设置
*/;
