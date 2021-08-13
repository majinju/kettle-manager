
----------先用kettle创建默认资源库，然后执行如下语句，再将本地资源库在kettle导入。
-- 作业扩展表
create table JOB_EXTEND
(
  ID_JOB           INTEGER not null,
  RUN_STATUS       VARCHAR2(100) default 'Stopped',
  LAST_UPDATE      VARCHAR2(14) default to_char(sysdate,'yyyymmddhh24miss'),
  AUTO_RESTART_NUM VARCHAR2(10) default '0',
  REPOSITORY_CODE  VARCHAR2(100) default 'KETTLE_DEFAULT',
  PROJECT_CODE     VARCHAR2(500) default 'KM_LOCALHOST_82',
  OORDER           NUMBER default 9999,
  ZLSJC            VARCHAR2(14),
  TIMING           VARCHAR2(100),
  LOG_LEVEL        VARCHAR2(100) default '3',
  ZYLX             VARCHAR2(32) default 'cgzy',
  GXSX             NUMBER,
  RZSX             NUMBER,
  BZSX             NUMBER,
  SCWCSJ           VARCHAR2(14),
  SCZXZT           VARCHAR2(32),
  JCPL             VARCHAR2(64),
  GZLJ             VARCHAR2(255),
  SHELL            VARCHAR2(4000),
  SJZT             VARCHAR2(32),
  SQL              VARCHAR2(4000),
  JS               VARCHAR2(4000),
  KMLM             VARCHAR2(255),
  KMPZ             VARCHAR2(4000),
  LYDX             VARCHAR2(32),
  MBDX             VARCHAR2(32),
  LZMB             VARCHAR2(255),
  GDPZ             VARCHAR2(4000),
  SRZJ             VARCHAR2(32),
  SCZJ             VARCHAR2(32)
);
-- Add comments to the table 
comment on table JOB_EXTEND
  is '作业_扩展信息';
-- Add comments to the columns 
comment on column JOB_EXTEND.ID_JOB
  is '主键';
comment on column JOB_EXTEND.RUN_STATUS
  is '运行状态';
comment on column JOB_EXTEND.LAST_UPDATE
  is '最后更新时间';
comment on column JOB_EXTEND.AUTO_RESTART_NUM
  is '自动重启次数';
comment on column JOB_EXTEND.REPOSITORY_CODE
  is '资源库代码';
comment on column JOB_EXTEND.PROJECT_CODE
  is '运行在';
comment on column JOB_EXTEND.OORDER
  is '对象排序';
comment on column JOB_EXTEND.ZLSJC
  is '增量时间戳';
comment on column JOB_EXTEND.TIMING
  is '定时';
comment on column JOB_EXTEND.LOG_LEVEL
  is '日志级别';
comment on column JOB_EXTEND.ZYLX
  is '作业类型@OTHER_KETTLE_ZYLX';
comment on column JOB_EXTEND.GXSX
  is '更新时限;单位分钟，r_job中的最后更新时间更新时限';
comment on column JOB_EXTEND.RZSX
  is '日志时限;单位分钟，日志表更新时限';
comment on column JOB_EXTEND.BZSX
  is '标志时限;单位分钟，抽取标志位时限';
comment on column JOB_EXTEND.SCWCSJ
  is '上次完成时间';
comment on column JOB_EXTEND.SCZXZT
  is '上次执行状态';
comment on column JOB_EXTEND.JCPL
  is '监测频率';
comment on column JOB_EXTEND.GZLJ
  is '工作路径';
comment on column JOB_EXTEND.SHELL
  is 'shell脚本';
comment on column JOB_EXTEND.SJZT
  is '数据载体';
comment on column JOB_EXTEND.SQL
  is 'sql脚本';
comment on column JOB_EXTEND.JS
  is 'js脚本';
comment on column JOB_EXTEND.KMLM
  is 'KM类名';
comment on column JOB_EXTEND.KMPZ
  is 'KM配置';
comment on column JOB_EXTEND.LYDX
  is '来源对象';
comment on column JOB_EXTEND.MBDX
  is '目标对象';
comment on column JOB_EXTEND.LZMB
  is '流转模板';
comment on column JOB_EXTEND.GDPZ
  is '更多配置';
comment on column JOB_EXTEND.SRZJ
  is '输入组件';
comment on column JOB_EXTEND.SCZJ
  is '输出组件';
  
  --合并后的视图
create or replace view v_job as
select id_directory,
       e.timing as timing_txt,
       j.name,
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
       e.*
  from r_job j
  left join job_extend e on e.id_job=j.id_job
  where j.job_status<>0
  /*
  作业视图，默认只显示处于发布状态的作业，可以根据需要自行修改
  */;
  
create or replace trigger TRI_JOB_INSERT
  before insert on r_job  
  for each row
declare
  -- local variables here
  v_count number;
  v_gxsx number;
  v_rzsx number;
  v_bzsx number;
  v_jcpl varchar2(128);
  v_zlsjc varchar2(32);
begin
  select count(1) into v_count from job_extend e where e.name=:new.name;
  if v_count=0 then
    insert into job_extend(id_job,name) values(:new.id_job,:new.name);
  else
    select zlsjc,gxsx,bzsx,rzsx,jcpl into v_zlsjc,v_gxsx,v_bzsx,v_rzsx,v_jcpl from job_extend e where e.name=:new.name;
    :new.jcpl := v_jcpl;
    :new.gxsx := v_gxsx;
    :new.rzsx := v_rzsx;
    :new.bzsx := v_bzsx;
    :new.zlsjc := v_zlsjc;
  end if;
end TRI_JOB_INSERT;
  
-- 创建作业基础日志表
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
  START_DATE   VARCHAR2(14),
  END_DATE     VARCHAR2(14),
  RESULT       VARCHAR2(200),
  LOG_FILE     VARCHAR2(1000)
);
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
comment on column JOB_LOG.START_DATE
  is '开始时间';
comment on column JOB_LOG.END_DATE
  is '结束时间';
comment on column JOB_LOG.RESULT
  is '运行结果';
comment on column JOB_LOG.LOG_FILE
  is '日志文件';

  -- 创建作业参数表
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

  -- 创建作业预警信息表
create table JOB_WARNING
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
  LOG_FILE     VARCHAR2(1000),
  MSG          VARCHAR2(4000),
  LOG_LEVEL    VARCHAR2(10),
  ERROR        VARCHAR2(10),
  SUBJECT      VARCHAR2(100),
  LOG_CHANNEL  VARCHAR2(100)
);
-- Add comments to the table 
comment on table JOB_WARNING
  is '作业预警';
-- Add comments to the columns 
comment on column JOB_WARNING.OID
  is '对象主键';
comment on column JOB_WARNING.OCODE
  is '对象代码';
comment on column JOB_WARNING.ONAME
  is '对象名称';
comment on column JOB_WARNING.ODESCRIBE
  is '对象描述';
comment on column JOB_WARNING.OORDER
  is '对象排序';
comment on column JOB_WARNING.SIMPLE_SPELL
  is '对象简拼';
comment on column JOB_WARNING.FULL_SPELL
  is '对象全拼';
comment on column JOB_WARNING.CREATE_DATE
  is '创建时间';
comment on column JOB_WARNING.UPDATE_DATE
  is '更新时间';
comment on column JOB_WARNING.CREATE_USER
  is '创建人';
comment on column JOB_WARNING.UPDATE_USER
  is '更新人';
comment on column JOB_WARNING.EXPAND
  is '扩展信息';
comment on column JOB_WARNING.IS_DISABLE
  is '是否禁用';
comment on column JOB_WARNING.FLAG1
  is '备用1';
comment on column JOB_WARNING.FLAG2
  is '备用2';
comment on column JOB_WARNING.ID_JOB
  is '作业ID';
comment on column JOB_WARNING.JOB_NAME
  is '作业名称';
comment on column JOB_WARNING.LOG_FILE
  is '日志文件';
comment on column JOB_WARNING.MSG
  is '预警日志';
comment on column JOB_WARNING.LOG_LEVEL
  is '日志级别';
comment on column JOB_WARNING.ERROR
  is '是否错误';
comment on column JOB_WARNING.SUBJECT
  is '宿主';
comment on column JOB_WARNING.LOG_CHANNEL
  is '日志通道';
  
create or replace view v_job_params as
select ja.id_job,ja.id_job_attribute id,
to_char(ja.value_str) as ocode,
to_char(ja1.value_str) as oname,
to_char(ja2.value_str) as PARAM_DEFAULT,
p.value,p.simple_spell,p.full_spell,nvl(p.update_date,'0000') update_date,ja.nr,p.oid
from r_job_attribute ja
inner join r_job_attribute ja1 on ja1.id_job=ja.id_job and ja1.nr=ja.nr and ja1.code='PARAM_DESC'
inner join r_job_attribute ja2 on ja2.id_job=ja.id_job and ja2.nr=ja.nr and ja2.code='PARAM_DEFAULT'
inner join r_job j on j.id_job=ja.id_job
left join job_params p on p.id_job=ja.id_job and to_char(ja.value_str)=p.ocode
where ja.code = 'PARAM_KEY'
order by ja.nr asc
/*
参数设置
*/;

create or replace view v_job_trans_yy as
select j.id_job,
       j.name,
       to_char(j.description) description,
       je.id_jobentry,
       je.name je_name,
       to_char(ja.value_str) zhmc,
       zhlj
  from r_job j
 inner join r_jobentry je
    on j.id_job = je.id_job
 inner join r_jobentry_attribute ja
    on ja.id_jobentry = je.id_jobentry
 inner join (select je.id_jobentry, ja.code, to_char(ja.value_str) zhlj
               from r_job j
              inner join r_jobentry je
                 on j.id_job = je.id_job
              inner join r_jobentry_attribute ja
                 on ja.id_jobentry = je.id_jobentry
              where je.id_jobentry_type =
                    (select jt.id_jobentry_type
                       from r_jobentry_type jt
                      where jt.code = 'TRANS')
                and ja.code = 'dir_path') jad
    on jad.id_jobentry = je.id_jobentry
 where je.id_jobentry_type =
       (select jt.id_jobentry_type
          from r_jobentry_type jt
         where jt.code = 'TRANS')
   and ja.code = 'name'
/*作业对转换的引用视图*/;
