--备份相关数据库语句
--exp km/km@127.0.0.1/mydb file=E:/workspace/kettle-manager/doc/sql/oracle/km.dmp owner=(km)  log=E:/workspace/kettle-manager/doc/sql/oracle/km_exp.log 

--导入数据库语句
--imp km/km@127.0.0.1/mydb file=E:/workspace/kettle-manager/doc/sql/oracle/km.dmp fromuser=km touser=km commit buffer=512000000 ignore=y

--设置环境变量
--KETTLE_JNDI_ROOT=E:\云盘同步文件夹\360云同步\文档杂物\simple-jndi
--KETTLE_HOME=D:\NIS\data-integration5.4

-------------------数据库脚本----------------------
--kettle资源库的数据库中执行如下语句
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
       auto_restart_num
  from r_job j
  where j.job_status=2
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

-- 以下语句在km库（本系统数据库）执行
create table METL_TASK_TIMING
(
  OID              VARCHAR2(32) default sys_guid() not null,
  OCODE            VARCHAR2(100),
  ONAME            VARCHAR2(100),
  ODESCRIBE        VARCHAR2(500),
  OORDER           NUMBER,
  SIMPLE_SPELL     VARCHAR2(200),
  FULL_SPELL       VARCHAR2(500),
  CREATE_DATE      VARCHAR2(14) default to_char(sysdate,'yyyymmddhh24miss'),
  UPDATE_DATE      VARCHAR2(14) default to_char(sysdate,'yyyymmddhh24miss'),
  CREATE_USER      VARCHAR2(100),
  UPDATE_USER      VARCHAR2(100),
  EXPAND           VARCHAR2(2000),
  IS_DISABLE       VARCHAR2(10) default '0',
  FLAG1            VARCHAR2(200),
  FLAG2            VARCHAR2(200),
  IS_REPEAT        VARCHAR2(10),
  SCHEDULER_TYPE   VARCHAR2(100),
  INTERVAL_SECONDS NUMBER,
  INTERVAL_MINUTES NUMBER,
  HOUR             NUMBER,
  MINUTES          NUMBER,
  WEEK_DAY         VARCHAR2(100),
  DAY_OF_MONTH     NUMBER
);
-- Add comments to the table 
comment on table METL_TASK_TIMING
  is '任务定时';
-- Add comments to the columns 
comment on column METL_TASK_TIMING.OID
  is '对象主键';
comment on column METL_TASK_TIMING.OCODE
  is '对象代码';
comment on column METL_TASK_TIMING.ONAME
  is '对象名称';
comment on column METL_TASK_TIMING.ODESCRIBE
  is '对象描述';
comment on column METL_TASK_TIMING.OORDER
  is '对象排序';
comment on column METL_TASK_TIMING.SIMPLE_SPELL
  is '对象简拼';
comment on column METL_TASK_TIMING.FULL_SPELL
  is '对象全拼';
comment on column METL_TASK_TIMING.CREATE_DATE
  is '创建时间';
comment on column METL_TASK_TIMING.UPDATE_DATE
  is '更新时间';
comment on column METL_TASK_TIMING.CREATE_USER
  is '创建人';
comment on column METL_TASK_TIMING.UPDATE_USER
  is '更新人';
comment on column METL_TASK_TIMING.EXPAND
  is '扩展信息';
comment on column METL_TASK_TIMING.IS_DISABLE
  is '是否禁用';
comment on column METL_TASK_TIMING.FLAG1
  is '备用1';
comment on column METL_TASK_TIMING.FLAG2
  is '备用2';
comment on column METL_TASK_TIMING.IS_REPEAT
  is '允许重复';
comment on column METL_TASK_TIMING.SCHEDULER_TYPE
  is '定时类型';
comment on column METL_TASK_TIMING.INTERVAL_SECONDS
  is '秒间隔';
comment on column METL_TASK_TIMING.INTERVAL_MINUTES
  is '分间隔';
comment on column METL_TASK_TIMING.HOUR
  is '每天几时';
comment on column METL_TASK_TIMING.MINUTES
  is '每天几分';
comment on column METL_TASK_TIMING.WEEK_DAY
  is '每周周几';
comment on column METL_TASK_TIMING.DAY_OF_MONTH
  is '每月几号';
-- Create/Recreate primary, unique and foreign key constraints 
alter table METL_TASK_TIMING
  add constraint PK_METL_TASK_TIMING primary key (OID);
-- Create/Recreate indexes 
create index IDX_M_T_TIMING_CREATE_DATE on METL_TASK_TIMING (CREATE_DATE);
create index IDX_M_T_TIMING_UPDATE_DATE on METL_TASK_TIMING (UPDATE_DATE);

create table eova_menu_object(
    id NUMBER(10) NOT NULL,
    menu_code VARCHAR2(50) NOT NULL,
    object_code VARCHAR2(50) NOT NULL,
    indexs NUMBER(10)
);

alter table eova_menu_object add constraint pk_eova_menu_object primary key(id);
comment on column eova_menu_object.menu_code is '菜单编码';
comment on column eova_menu_object.object_code is '对象编码';
comment on column eova_menu_object.indexs is '对象索引';
alter table eova_menu_object modify indexs default '0';


