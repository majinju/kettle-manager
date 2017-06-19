----------------------------------------------
-- Export file for user KETTLE              --
-- Created by jingma on 2017/4/19, 16:04:33 --
----------------------------------------------
create table KETTLE.JOB_LOG
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
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table KETTLE.JOB_LOG
  is '作业日志';
comment on column KETTLE.JOB_LOG.OID
  is '对象主键';
comment on column KETTLE.JOB_LOG.OCODE
  is '对象代码';
comment on column KETTLE.JOB_LOG.ONAME
  is '对象名称';
comment on column KETTLE.JOB_LOG.ODESCRIBE
  is '对象描述';
comment on column KETTLE.JOB_LOG.OORDER
  is '对象排序';
comment on column KETTLE.JOB_LOG.SIMPLE_SPELL
  is '对象简拼';
comment on column KETTLE.JOB_LOG.FULL_SPELL
  is '对象全拼';
comment on column KETTLE.JOB_LOG.CREATE_DATE
  is '创建时间';
comment on column KETTLE.JOB_LOG.UPDATE_DATE
  is '更新时间';
comment on column KETTLE.JOB_LOG.CREATE_USER
  is '创建人';
comment on column KETTLE.JOB_LOG.UPDATE_USER
  is '更新人';
comment on column KETTLE.JOB_LOG.EXPAND
  is '扩展信息';
comment on column KETTLE.JOB_LOG.IS_DISABLE
  is '是否禁用';
comment on column KETTLE.JOB_LOG.FLAG1
  is '备用1';
comment on column KETTLE.JOB_LOG.FLAG2
  is '备用2';
comment on column KETTLE.JOB_LOG.ID_JOB
  is '作业ID';
comment on column KETTLE.JOB_LOG.JOB_NAME
  is '作业名称';
comment on column KETTLE.JOB_LOG.START_DATE
  is '开始时间';
comment on column KETTLE.JOB_LOG.END_DATE
  is '结束时间';
comment on column KETTLE.JOB_LOG.RESULT
  is '运行结果';
comment on column KETTLE.JOB_LOG.LOG_FILE
  is '日志文件';
create table KETTLE.JOB_PARAMS
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
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table KETTLE.JOB_PARAMS
  is '作业参数设置';
comment on column KETTLE.JOB_PARAMS.OID
  is '对象主键';
comment on column KETTLE.JOB_PARAMS.OCODE
  is '对象代码';
comment on column KETTLE.JOB_PARAMS.ONAME
  is '对象名称';
comment on column KETTLE.JOB_PARAMS.ODESCRIBE
  is '对象描述';
comment on column KETTLE.JOB_PARAMS.OORDER
  is '对象排序';
comment on column KETTLE.JOB_PARAMS.SIMPLE_SPELL
  is '对象简拼';
comment on column KETTLE.JOB_PARAMS.FULL_SPELL
  is '对象全拼';
comment on column KETTLE.JOB_PARAMS.CREATE_DATE
  is '创建时间';
comment on column KETTLE.JOB_PARAMS.UPDATE_DATE
  is '更新时间';
comment on column KETTLE.JOB_PARAMS.CREATE_USER
  is '创建人';
comment on column KETTLE.JOB_PARAMS.UPDATE_USER
  is '更新人';
comment on column KETTLE.JOB_PARAMS.EXPAND
  is '扩展信息';
comment on column KETTLE.JOB_PARAMS.IS_DISABLE
  is '是否禁用';
comment on column KETTLE.JOB_PARAMS.FLAG1
  is '备用1';
comment on column KETTLE.JOB_PARAMS.FLAG2
  is '备用2';
comment on column KETTLE.JOB_PARAMS.ID_JOB
  is '作业';
comment on column KETTLE.JOB_PARAMS.VALUE
  is '变量值';
alter table KETTLE.JOB_PARAMS
  add constraint PK_JOB_PARAMS primary key (OID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index KETTLE.IDX_JOB_PARAMS_CREATE_DATE on KETTLE.JOB_PARAMS (CREATE_DATE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index KETTLE.IDX_JOB_PARAMS_ONAME on KETTLE.JOB_PARAMS (ONAME)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index KETTLE.IDX_JOB_PARAMS_UPDATE_DATE on KETTLE.JOB_PARAMS (UPDATE_DATE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_CLUSTER
(
  ID_CLUSTER             INTEGER not null,
  NAME                   VARCHAR2(255),
  BASE_PORT              VARCHAR2(255),
  SOCKETS_BUFFER_SIZE    VARCHAR2(255),
  SOCKETS_FLUSH_INTERVAL VARCHAR2(255),
  SOCKETS_COMPRESSED     CHAR(1),
  DYNAMIC_CLUSTER        CHAR(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_CLUSTER
  add primary key (ID_CLUSTER)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_CLUSTER_SLAVE
(
  ID_CLUSTER_SLAVE INTEGER not null,
  ID_CLUSTER       INTEGER,
  ID_SLAVE         INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_CLUSTER_SLAVE
  add primary key (ID_CLUSTER_SLAVE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_CONDITION
(
  ID_CONDITION        INTEGER not null,
  ID_CONDITION_PARENT INTEGER,
  NEGATED             CHAR(1),
  OPERATOR            VARCHAR2(255),
  LEFT_NAME           VARCHAR2(255),
  CONDITION_FUNCTION  VARCHAR2(255),
  RIGHT_NAME          VARCHAR2(255),
  ID_VALUE_RIGHT      INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table KETTLE.R_CONDITION
  add primary key (ID_CONDITION)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create table KETTLE.R_DATABASE
(
  ID_DATABASE         INTEGER not null,
  NAME                VARCHAR2(255),
  ID_DATABASE_TYPE    INTEGER,
  ID_DATABASE_CONTYPE INTEGER,
  HOST_NAME           VARCHAR2(255),
  DATABASE_NAME       CLOB,
  PORT                INTEGER,
  USERNAME            VARCHAR2(255),
  PASSWORD            VARCHAR2(255),
  SERVERNAME          VARCHAR2(255),
  DATA_TBS            VARCHAR2(255),
  INDEX_TBS           VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_DATABASE
  add primary key (ID_DATABASE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_DATABASE_ATTRIBUTE
(
  ID_DATABASE_ATTRIBUTE INTEGER not null,
  ID_DATABASE           INTEGER,
  CODE                  VARCHAR2(255),
  VALUE_STR             CLOB
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_DATABASE_ATTRIBUTE
  add primary key (ID_DATABASE_ATTRIBUTE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index KETTLE.IDX_RDAT on KETTLE.R_DATABASE_ATTRIBUTE (ID_DATABASE, CODE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_DATABASE_CONTYPE
(
  ID_DATABASE_CONTYPE INTEGER not null,
  CODE                VARCHAR2(255),
  DESCRIPTION         VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_DATABASE_CONTYPE
  add primary key (ID_DATABASE_CONTYPE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_DATABASE_TYPE
(
  ID_DATABASE_TYPE INTEGER not null,
  CODE             VARCHAR2(255),
  DESCRIPTION      VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_DATABASE_TYPE
  add primary key (ID_DATABASE_TYPE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_DEPENDENCY
(
  ID_DEPENDENCY     INTEGER not null,
  ID_TRANSFORMATION INTEGER,
  ID_DATABASE       INTEGER,
  TABLE_NAME        VARCHAR2(255),
  FIELD_NAME        VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table KETTLE.R_DEPENDENCY
  add primary key (ID_DEPENDENCY)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create table KETTLE.R_DIRECTORY
(
  ID_DIRECTORY        INTEGER not null,
  ID_DIRECTORY_PARENT INTEGER,
  DIRECTORY_NAME      VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_DIRECTORY
  add primary key (ID_DIRECTORY)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index KETTLE.IDX_RDIR on KETTLE.R_DIRECTORY (ID_DIRECTORY_PARENT, DIRECTORY_NAME)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_ELEMENT
(
  ID_ELEMENT      INTEGER not null,
  ID_ELEMENT_TYPE INTEGER,
  NAME            VARCHAR2(1999)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_ELEMENT
  add primary key (ID_ELEMENT)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_ELEMENT_ATTRIBUTE
(
  ID_ELEMENT_ATTRIBUTE        INTEGER not null,
  ID_ELEMENT                  INTEGER,
  ID_ELEMENT_ATTRIBUTE_PARENT INTEGER,
  ATTR_KEY                    VARCHAR2(255),
  ATTR_VALUE                  CLOB
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_ELEMENT_ATTRIBUTE
  add primary key (ID_ELEMENT_ATTRIBUTE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_ELEMENT_TYPE
(
  ID_ELEMENT_TYPE INTEGER not null,
  ID_NAMESPACE    INTEGER,
  NAME            VARCHAR2(1999),
  DESCRIPTION     CLOB
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_ELEMENT_TYPE
  add primary key (ID_ELEMENT_TYPE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_JOB
(
  ID_JOB               INTEGER not null,
  ID_DIRECTORY         INTEGER,
  NAME                 VARCHAR2(255),
  DESCRIPTION          CLOB,
  EXTENDED_DESCRIPTION CLOB,
  JOB_VERSION          VARCHAR2(255),
  JOB_STATUS           INTEGER,
  ID_DATABASE_LOG      INTEGER,
  TABLE_NAME_LOG       VARCHAR2(255),
  CREATED_USER         VARCHAR2(255),
  CREATED_DATE         DATE,
  MODIFIED_USER        VARCHAR2(255),
  MODIFIED_DATE        DATE,
  USE_BATCH_ID         CHAR(1),
  PASS_BATCH_ID        CHAR(1),
  USE_LOGFIELD         CHAR(1),
  SHARED_FILE          VARCHAR2(255),
  RUN_STATUS           VARCHAR2(100) default 'Stopped',
  LAST_UPDATE          VARCHAR2(14) default to_char(sysdate,'yyyymmddhh24miss'),
  AUTO_RESTART_NUM     VARCHAR2(10) default '0',
  REPOSITORY_CODE      VARCHAR2(100) default 'KETTLE_DEFAULT',
  PROJECT_CODE         VARCHAR2(500) default 'KM_LOCALHOST_82'
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on column KETTLE.R_JOB.RUN_STATUS
  is '运行状态';
comment on column KETTLE.R_JOB.LAST_UPDATE
  is '最后更新时间';
comment on column KETTLE.R_JOB.AUTO_RESTART_NUM
  is '自动重启次数';
comment on column KETTLE.R_JOB.REPOSITORY_CODE
  is '资源库代码';
comment on column KETTLE.R_JOB.PROJECT_CODE
  is '运行在';
alter table KETTLE.R_JOB
  add primary key (ID_JOB)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_JOBENTRY
(
  ID_JOBENTRY      INTEGER not null,
  ID_JOB           INTEGER,
  ID_JOBENTRY_TYPE INTEGER,
  NAME             VARCHAR2(255),
  DESCRIPTION      CLOB
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_JOBENTRY
  add primary key (ID_JOBENTRY)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_JOBENTRY_ATTRIBUTE
(
  ID_JOBENTRY_ATTRIBUTE INTEGER not null,
  ID_JOB                INTEGER,
  ID_JOBENTRY           INTEGER,
  NR                    INTEGER,
  CODE                  VARCHAR2(255),
  VALUE_NUM             NUMBER(13,2),
  VALUE_STR             CLOB
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_JOBENTRY_ATTRIBUTE
  add primary key (ID_JOBENTRY_ATTRIBUTE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index KETTLE.IDX_RJEA on KETTLE.R_JOBENTRY_ATTRIBUTE (ID_JOBENTRY_ATTRIBUTE, CODE, NR)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_JOBENTRY_COPY
(
  ID_JOBENTRY_COPY INTEGER not null,
  ID_JOBENTRY      INTEGER,
  ID_JOB           INTEGER,
  ID_JOBENTRY_TYPE INTEGER,
  NR               INTEGER,
  GUI_LOCATION_X   INTEGER,
  GUI_LOCATION_Y   INTEGER,
  GUI_DRAW         CHAR(1),
  PARALLEL         CHAR(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_JOBENTRY_COPY
  add primary key (ID_JOBENTRY_COPY)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_JOBENTRY_DATABASE
(
  ID_JOB      INTEGER,
  ID_JOBENTRY INTEGER,
  ID_DATABASE INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index KETTLE.IDX_RJD1 on KETTLE.R_JOBENTRY_DATABASE (ID_JOB)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index KETTLE.IDX_RJD2 on KETTLE.R_JOBENTRY_DATABASE (ID_DATABASE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_JOBENTRY_TYPE
(
  ID_JOBENTRY_TYPE INTEGER not null,
  CODE             VARCHAR2(255),
  DESCRIPTION      VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_JOBENTRY_TYPE
  add primary key (ID_JOBENTRY_TYPE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_JOB_ATTRIBUTE
(
  ID_JOB_ATTRIBUTE INTEGER not null,
  ID_JOB           INTEGER,
  NR               INTEGER,
  CODE             VARCHAR2(255),
  VALUE_NUM        INTEGER,
  VALUE_STR        CLOB
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 640K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_JOB_ATTRIBUTE
  add primary key (ID_JOB_ATTRIBUTE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index KETTLE.IDX_JATT on KETTLE.R_JOB_ATTRIBUTE (ID_JOB, CODE, NR)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_JOB_HOP
(
  ID_JOB_HOP            INTEGER not null,
  ID_JOB                INTEGER,
  ID_JOBENTRY_COPY_FROM INTEGER,
  ID_JOBENTRY_COPY_TO   INTEGER,
  ENABLED               CHAR(1),
  EVALUATION            CHAR(1),
  UNCONDITIONAL         CHAR(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_JOB_HOP
  add primary key (ID_JOB_HOP)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_JOB_LOCK
(
  ID_JOB_LOCK  INTEGER not null,
  ID_JOB       INTEGER,
  ID_USER      INTEGER,
  LOCK_MESSAGE CLOB,
  LOCK_DATE    DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table KETTLE.R_JOB_LOCK
  add primary key (ID_JOB_LOCK)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create table KETTLE.R_JOB_NOTE
(
  ID_JOB  INTEGER,
  ID_NOTE INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
create table KETTLE.R_LOG
(
  ID_LOG          INTEGER not null,
  NAME            VARCHAR2(255),
  ID_LOGLEVEL     INTEGER,
  LOGTYPE         VARCHAR2(255),
  FILENAME        VARCHAR2(255),
  FILEEXTENTION   VARCHAR2(255),
  ADD_DATE        CHAR(1),
  ADD_TIME        CHAR(1),
  ID_DATABASE_LOG INTEGER,
  TABLE_NAME_LOG  VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table KETTLE.R_LOG
  add primary key (ID_LOG)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create table KETTLE.R_LOGLEVEL
(
  ID_LOGLEVEL INTEGER not null,
  CODE        VARCHAR2(255),
  DESCRIPTION VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_LOGLEVEL
  add primary key (ID_LOGLEVEL)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_NAMESPACE
(
  ID_NAMESPACE INTEGER not null,
  NAME         VARCHAR2(1999)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_NAMESPACE
  add primary key (ID_NAMESPACE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_NOTE
(
  ID_NOTE                      INTEGER not null,
  VALUE_STR                    CLOB,
  GUI_LOCATION_X               INTEGER,
  GUI_LOCATION_Y               INTEGER,
  GUI_LOCATION_WIDTH           INTEGER,
  GUI_LOCATION_HEIGHT          INTEGER,
  FONT_NAME                    CLOB,
  FONT_SIZE                    INTEGER,
  FONT_BOLD                    CHAR(1),
  FONT_ITALIC                  CHAR(1),
  FONT_COLOR_RED               INTEGER,
  FONT_COLOR_GREEN             INTEGER,
  FONT_COLOR_BLUE              INTEGER,
  FONT_BACK_GROUND_COLOR_RED   INTEGER,
  FONT_BACK_GROUND_COLOR_GREEN INTEGER,
  FONT_BACK_GROUND_COLOR_BLUE  INTEGER,
  FONT_BORDER_COLOR_RED        INTEGER,
  FONT_BORDER_COLOR_GREEN      INTEGER,
  FONT_BORDER_COLOR_BLUE       INTEGER,
  DRAW_SHADOW                  CHAR(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table KETTLE.R_NOTE
  add primary key (ID_NOTE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create table KETTLE.R_PARTITION
(
  ID_PARTITION        INTEGER not null,
  ID_PARTITION_SCHEMA INTEGER,
  PARTITION_ID        VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_PARTITION
  add primary key (ID_PARTITION)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_PARTITION_SCHEMA
(
  ID_PARTITION_SCHEMA  INTEGER not null,
  NAME                 VARCHAR2(255),
  DYNAMIC_DEFINITION   CHAR(1),
  PARTITIONS_PER_SLAVE VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_PARTITION_SCHEMA
  add primary key (ID_PARTITION_SCHEMA)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_REPOSITORY_LOG
(
  ID_REPOSITORY_LOG INTEGER not null,
  REP_VERSION       VARCHAR2(255),
  LOG_DATE          DATE,
  LOG_USER          VARCHAR2(255),
  OPERATION_DESC    CLOB
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 192K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_REPOSITORY_LOG
  add primary key (ID_REPOSITORY_LOG)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_SLAVE
(
  ID_SLAVE        INTEGER not null,
  NAME            VARCHAR2(255),
  HOST_NAME       VARCHAR2(255),
  PORT            VARCHAR2(255),
  WEB_APP_NAME    VARCHAR2(255),
  USERNAME        VARCHAR2(255),
  PASSWORD        VARCHAR2(255),
  PROXY_HOST_NAME VARCHAR2(255),
  PROXY_PORT      VARCHAR2(255),
  NON_PROXY_HOSTS VARCHAR2(255),
  MASTER          CHAR(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_SLAVE
  add primary key (ID_SLAVE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_STEP
(
  ID_STEP           INTEGER not null,
  ID_TRANSFORMATION INTEGER,
  NAME              VARCHAR2(255),
  DESCRIPTION       CLOB,
  ID_STEP_TYPE      INTEGER,
  DISTRIBUTE        CHAR(1),
  COPIES            INTEGER,
  GUI_LOCATION_X    INTEGER,
  GUI_LOCATION_Y    INTEGER,
  GUI_DRAW          CHAR(1),
  COPIES_STRING     VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_STEP
  add primary key (ID_STEP)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_STEP_ATTRIBUTE
(
  ID_STEP_ATTRIBUTE INTEGER not null,
  ID_TRANSFORMATION INTEGER,
  ID_STEP           INTEGER,
  NR                INTEGER,
  CODE              VARCHAR2(255),
  VALUE_NUM         INTEGER,
  VALUE_STR         CLOB
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 384K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_STEP_ATTRIBUTE
  add primary key (ID_STEP_ATTRIBUTE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 128K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index KETTLE.IDX_RSAT on KETTLE.R_STEP_ATTRIBUTE (ID_STEP, CODE, NR)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_STEP_DATABASE
(
  ID_TRANSFORMATION INTEGER,
  ID_STEP           INTEGER,
  ID_DATABASE       INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index KETTLE.IDX_RSD1 on KETTLE.R_STEP_DATABASE (ID_TRANSFORMATION)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index KETTLE.IDX_RSD2 on KETTLE.R_STEP_DATABASE (ID_DATABASE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_STEP_TYPE
(
  ID_STEP_TYPE INTEGER not null,
  CODE         VARCHAR2(255),
  DESCRIPTION  VARCHAR2(255),
  HELPTEXT     VARCHAR2(255)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_STEP_TYPE
  add primary key (ID_STEP_TYPE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_TRANSFORMATION
(
  ID_TRANSFORMATION    INTEGER not null,
  ID_DIRECTORY         INTEGER,
  NAME                 VARCHAR2(255),
  DESCRIPTION          CLOB,
  EXTENDED_DESCRIPTION CLOB,
  TRANS_VERSION        VARCHAR2(255),
  TRANS_STATUS         INTEGER,
  ID_STEP_READ         INTEGER,
  ID_STEP_WRITE        INTEGER,
  ID_STEP_INPUT        INTEGER,
  ID_STEP_OUTPUT       INTEGER,
  ID_STEP_UPDATE       INTEGER,
  ID_DATABASE_LOG      INTEGER,
  TABLE_NAME_LOG       VARCHAR2(255),
  USE_BATCHID          CHAR(1),
  USE_LOGFIELD         CHAR(1),
  ID_DATABASE_MAXDATE  INTEGER,
  TABLE_NAME_MAXDATE   VARCHAR2(255),
  FIELD_NAME_MAXDATE   VARCHAR2(255),
  OFFSET_MAXDATE       NUMBER(12,2),
  DIFF_MAXDATE         NUMBER(12,2),
  CREATED_USER         VARCHAR2(255),
  CREATED_DATE         DATE,
  MODIFIED_USER        VARCHAR2(255),
  MODIFIED_DATE        DATE,
  SIZE_ROWSET          INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_TRANSFORMATION
  add primary key (ID_TRANSFORMATION)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_TRANS_ATTRIBUTE
(
  ID_TRANS_ATTRIBUTE INTEGER not null,
  ID_TRANSFORMATION  INTEGER,
  NR                 INTEGER,
  CODE               VARCHAR2(255),
  VALUE_NUM          INTEGER,
  VALUE_STR          CLOB
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 768K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_TRANS_ATTRIBUTE
  add primary key (ID_TRANS_ATTRIBUTE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
create unique index KETTLE.IDX_TATT on KETTLE.R_TRANS_ATTRIBUTE (ID_TRANSFORMATION, CODE, NR)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 576K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_TRANS_CLUSTER
(
  ID_TRANS_CLUSTER  INTEGER not null,
  ID_TRANSFORMATION INTEGER,
  ID_CLUSTER        INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table KETTLE.R_TRANS_CLUSTER
  add primary key (ID_TRANS_CLUSTER)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create table KETTLE.R_TRANS_HOP
(
  ID_TRANS_HOP      INTEGER not null,
  ID_TRANSFORMATION INTEGER,
  ID_STEP_FROM      INTEGER,
  ID_STEP_TO        INTEGER,
  ENABLED           CHAR(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_TRANS_HOP
  add primary key (ID_TRANS_HOP)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_TRANS_LOCK
(
  ID_TRANS_LOCK     INTEGER not null,
  ID_TRANSFORMATION INTEGER,
  ID_USER           INTEGER,
  LOCK_MESSAGE      CLOB,
  LOCK_DATE         DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table KETTLE.R_TRANS_LOCK
  add primary key (ID_TRANS_LOCK)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create table KETTLE.R_TRANS_NOTE
(
  ID_TRANSFORMATION INTEGER,
  ID_NOTE           INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
create table KETTLE.R_TRANS_PARTITION_SCHEMA
(
  ID_TRANS_PARTITION_SCHEMA INTEGER not null,
  ID_TRANSFORMATION         INTEGER,
  ID_PARTITION_SCHEMA       INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table KETTLE.R_TRANS_PARTITION_SCHEMA
  add primary key (ID_TRANS_PARTITION_SCHEMA)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create table KETTLE.R_TRANS_SLAVE
(
  ID_TRANS_SLAVE    INTEGER not null,
  ID_TRANSFORMATION INTEGER,
  ID_SLAVE          INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table KETTLE.R_TRANS_SLAVE
  add primary key (ID_TRANS_SLAVE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create table KETTLE.R_TRANS_STEP_CONDITION
(
  ID_TRANSFORMATION INTEGER,
  ID_STEP           INTEGER,
  ID_CONDITION      INTEGER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
create table KETTLE.R_USER
(
  ID_USER     INTEGER not null,
  LOGIN       VARCHAR2(255),
  PASSWORD    VARCHAR2(255),
  NAME        VARCHAR2(255),
  DESCRIPTION VARCHAR2(255),
  ENABLED     CHAR(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_USER
  add primary key (ID_USER)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create table KETTLE.R_VALUE
(
  ID_VALUE   INTEGER not null,
  NAME       VARCHAR2(255),
  VALUE_TYPE VARCHAR2(255),
  VALUE_STR  VARCHAR2(255),
  IS_NULL    CHAR(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table KETTLE.R_VALUE
  add primary key (ID_VALUE)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
create table KETTLE.R_VERSION
(
  ID_VERSION    INTEGER not null,
  MAJOR_VERSION INTEGER,
  MINOR_VERSION INTEGER,
  UPGRADE_DATE  DATE,
  IS_UPGRADE    CHAR(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table KETTLE.R_VERSION
  add primary key (ID_VERSION)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create or replace view kettle.v_job as
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
       repository_code,
       project_code
  from r_job j
--  where j.job_status=2
  /*
  作业视图，默认只显示处于发布状态的作业，可以根据需要自行修改
  */;
create or replace view kettle.v_job_params as
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
