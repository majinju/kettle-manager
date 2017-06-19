prompt PL/SQL Developer import file
prompt Created on 2017年6月15日 by jingma
set feedback off
set define off
prompt Dropping EOVA_BUTTON...
drop table EOVA_BUTTON cascade constraints;
prompt Dropping EOVA_DICT...
drop table EOVA_DICT cascade constraints;
prompt Dropping EOVA_FIELD...
drop table EOVA_FIELD cascade constraints;
prompt Dropping EOVA_LOG...
drop table EOVA_LOG cascade constraints;
prompt Dropping EOVA_MENU...
drop table EOVA_MENU cascade constraints;
prompt Dropping EOVA_MENU_OBJECT...
drop table EOVA_MENU_OBJECT cascade constraints;
prompt Dropping EOVA_OBJECT...
drop table EOVA_OBJECT cascade constraints;
prompt Dropping EOVA_ROLE...
drop table EOVA_ROLE cascade constraints;
prompt Dropping EOVA_ROLE_BTN...
drop table EOVA_ROLE_BTN cascade constraints;
prompt Dropping EOVA_TASK...
drop table EOVA_TASK cascade constraints;
prompt Dropping EOVA_USER...
drop table EOVA_USER cascade constraints;
prompt Dropping EOVA_WIDGET...
drop table EOVA_WIDGET cascade constraints;
prompt Dropping METL_DATABASE...
drop table METL_DATABASE cascade constraints;
prompt Dropping METL_KETTLE_LOG...
drop table METL_KETTLE_LOG cascade constraints;
prompt Dropping METL_PROJECT...
drop table METL_PROJECT cascade constraints;
prompt Dropping METL_TASK_TIMING...
drop table METL_TASK_TIMING cascade constraints;
prompt Dropping METL_UNIFY_DICT...
drop table METL_UNIFY_DICT cascade constraints;
prompt Creating EOVA_BUTTON...
create table EOVA_BUTTON
(
  ID        NUMBER(10) not null,
  MENU_CODE VARCHAR2(255) not null,
  NAME      VARCHAR2(255) not null,
  ICON      VARCHAR2(255),
  UI        VARCHAR2(255),
  BS        VARCHAR2(500),
  ORDER_NUM NUMBER(10) default '0',
  GROUP_NUM NUMBER(10) default '0',
  IS_BASE   CHAR(1) default '0',
  IS_DEL    CHAR(1) default '0'
)
;
comment on column EOVA_BUTTON.MENU_CODE
  is '菜单Code';
comment on column EOVA_BUTTON.NAME
  is '按钮名称';
comment on column EOVA_BUTTON.ICON
  is '图标';
comment on column EOVA_BUTTON.UI
  is '按钮UI路径';
comment on column EOVA_BUTTON.BS
  is '按钮BS路径';
comment on column EOVA_BUTTON.ORDER_NUM
  is '排序号';
comment on column EOVA_BUTTON.GROUP_NUM
  is '分组号';
comment on column EOVA_BUTTON.IS_BASE
  is '是否基础功能';
comment on column EOVA_BUTTON.IS_DEL
  is '是否删除';
alter table EOVA_BUTTON
  add constraint PK_EOVA_BUTTON primary key (ID);

prompt Creating EOVA_DICT...
create table EOVA_DICT
(
  ID     NUMBER(10) not null,
  VALUE  VARCHAR2(50) not null,
  NAME   VARCHAR2(50) not null,
  OBJECT VARCHAR2(50) not null,
  FIELD  VARCHAR2(50) not null
)
;
alter table EOVA_DICT
  add constraint PK_EOVA_DICT primary key (ID);

prompt Creating EOVA_FIELD...
create table EOVA_FIELD
(
  ID          NUMBER(10) not null,
  OBJECT_CODE VARCHAR2(50) not null,
  PO_CODE     VARCHAR2(255),
  EN          VARCHAR2(50) not null,
  CN          VARCHAR2(50) not null,
  IS_AUTO     CHAR(1) default '0',
  DATA_TYPE   VARCHAR2(20) default 'string',
  TYPE        VARCHAR2(10) default '文本框',
  ORDER_NUM   NUMBER(10) default '9',
  EXP         VARCHAR2(800),
  IS_QUERY    CHAR(1) default '0',
  IS_SHOW     CHAR(1) default '1',
  IS_DISABLE  CHAR(1) default '0',
  IS_ORDER    CHAR(1) default '1',
  IS_ADD      CHAR(1) default '1',
  IS_UPDATE   CHAR(1) default '1',
  IS_EDIT     CHAR(1) default '1',
  IS_REQUIRED CHAR(1) default '1',
  IS_MULTIPLE CHAR(1) default '0',
  PLACEHOLDER VARCHAR2(255),
  VALIDATOR   VARCHAR2(255),
  DEFAULTER   VARCHAR2(255),
  FORMATTER   VARCHAR2(2000),
  WIDTH       NUMBER(10) default '130',
  HEIGHT      NUMBER(10) default '20',
  CONFIG      VARCHAR2(2000)
)
;
comment on column EOVA_FIELD.ID
  is 'ID';
comment on column EOVA_FIELD.PO_CODE
  is '持久化对象';
comment on column EOVA_FIELD.EN
  is '英文名';
comment on column EOVA_FIELD.CN
  is '中文名';
comment on column EOVA_FIELD.IS_AUTO
  is '主键是否自增长';
comment on column EOVA_FIELD.DATA_TYPE
  is '数据类型';
comment on column EOVA_FIELD.TYPE
  is '控件类型';
comment on column EOVA_FIELD.ORDER_NUM
  is '排序索引';
comment on column EOVA_FIELD.EXP
  is '控件表达式';
comment on column EOVA_FIELD.IS_QUERY
  is '是否可查询';
comment on column EOVA_FIELD.IS_SHOW
  is '是否可显示';
comment on column EOVA_FIELD.IS_DISABLE
  is '是否禁用';
comment on column EOVA_FIELD.IS_ORDER
  is '是否可排序';
comment on column EOVA_FIELD.IS_ADD
  is '是否可新增字段';
comment on column EOVA_FIELD.IS_UPDATE
  is '是否可修改字段';
comment on column EOVA_FIELD.IS_EDIT
  is '是否可编辑字段';
comment on column EOVA_FIELD.IS_REQUIRED
  is '是否必填';
comment on column EOVA_FIELD.IS_MULTIPLE
  is '是否多选项';
comment on column EOVA_FIELD.PLACEHOLDER
  is '输入提示';
comment on column EOVA_FIELD.VALIDATOR
  is 'UI校验表达式';
comment on column EOVA_FIELD.DEFAULTER
  is '默认值表达式';
comment on column EOVA_FIELD.FORMATTER
  is '格式化器';
comment on column EOVA_FIELD.WIDTH
  is '控件宽度';
comment on column EOVA_FIELD.HEIGHT
  is '控件高度';
comment on column EOVA_FIELD.CONFIG
  is '拓展配置';
alter table EOVA_FIELD
  add constraint PK_EOVA_FIELD primary key (ID);

prompt Creating EOVA_LOG...
create table EOVA_LOG
(
  ID          NUMBER(10) not null,
  USER_ID     NUMBER(10) not null,
  TYPE        NUMBER(10) not null,
  IP          VARCHAR2(255) not null,
  INFO        VARCHAR2(500),
  CREATE_DATE VARCHAR2(14) default to_char(sysdate,'yyyymmddhh24miss')
)
;
comment on column EOVA_LOG.USER_ID
  is '操作用户';
comment on column EOVA_LOG.TYPE
  is '日志类型';
comment on column EOVA_LOG.IP
  is '操作IP';
comment on column EOVA_LOG.INFO
  is '操作详情';
comment on column EOVA_LOG.CREATE_DATE
  is '创建时间';
alter table EOVA_LOG
  add constraint PK_EOVA_LOG primary key (ID);

prompt Creating EOVA_MENU...
create table EOVA_MENU
(
  ID            NUMBER(10) not null,
  CODE          VARCHAR2(255) not null,
  NAME          VARCHAR2(100) not null,
  TYPE          VARCHAR2(20) not null,
  ICON          VARCHAR2(255),
  ORDER_NUM     NUMBER(10) default '0',
  PARENT_ID     NUMBER(10) default '0',
  IS_COLLAPSE   CHAR(1) default '0',
  BIZ_INTERCEPT VARCHAR2(255),
  URL           VARCHAR2(255),
  CONFIG        VARCHAR2(500),
  DIY_JS        VARCHAR2(255),
  IS_DEL        CHAR(1) default '0',
  FILTER        VARCHAR2(500),
  IS_NEW_TAB    CHAR(1) default '0'
)
;
comment on column EOVA_MENU.CODE
  is '编码';
comment on column EOVA_MENU.NAME
  is '名称';
comment on column EOVA_MENU.TYPE
  is '菜单类型';
comment on column EOVA_MENU.ICON
  is '图标';
comment on column EOVA_MENU.ORDER_NUM
  is '序号';
comment on column EOVA_MENU.PARENT_ID
  is '父节点';
comment on column EOVA_MENU.IS_COLLAPSE
  is '是否折叠';
comment on column EOVA_MENU.BIZ_INTERCEPT
  is '自定义业务拦截器';
comment on column EOVA_MENU.URL
  is '自定义URL';
comment on column EOVA_MENU.CONFIG
  is '菜单配置JSON';
comment on column EOVA_MENU.DIY_JS
  is '依赖JS文件';
comment on column EOVA_MENU.IS_DEL
  is '是否隐藏';
comment on column EOVA_MENU.FILTER
  is '初始数据过滤条件';
comment on column EOVA_MENU.IS_NEW_TAB
  is '新标签打开';
alter table EOVA_MENU
  add constraint PK_EOVA_MENU primary key (ID);

prompt Creating EOVA_MENU_OBJECT...
create table EOVA_MENU_OBJECT
(
  ID          NUMBER(10) not null,
  MENU_CODE   VARCHAR2(50) not null,
  OBJECT_CODE VARCHAR2(50) not null,
  INDEXS      NUMBER(10) default '0'
)
;
comment on column EOVA_MENU_OBJECT.MENU_CODE
  is '菜单编码';
comment on column EOVA_MENU_OBJECT.OBJECT_CODE
  is '对象编码';
comment on column EOVA_MENU_OBJECT.INDEXS
  is '对象索引';
alter table EOVA_MENU_OBJECT
  add constraint PK_EOVA_MENU_OBJECT primary key (ID);

prompt Creating EOVA_OBJECT...
create table EOVA_OBJECT
(
  ID            NUMBER(10) not null,
  CODE          VARCHAR2(100) not null,
  NAME          VARCHAR2(100) not null,
  VIEW_NAME     VARCHAR2(255),
  TABLE_NAME    VARCHAR2(255),
  PK_NAME       VARCHAR2(50) not null,
  DATA_SOURCE   VARCHAR2(50) default 'main',
  IS_SINGLE     CHAR(1) default '1',
  IS_CELLEDIT   CHAR(1) default '0',
  IS_SHOW_NUM   CHAR(1) default '1',
  IS_FIRST_LOAD CHAR(1) default '1',
  FILTER        VARCHAR2(500),
  DEFAULT_ORDER VARCHAR2(255),
  DIY_CARD      VARCHAR2(255),
  DIY_JS        VARCHAR2(255),
  BIZ_INTERCEPT VARCHAR2(255)
)
;
comment on column EOVA_OBJECT.CODE
  is '对象编码';
comment on column EOVA_OBJECT.NAME
  is '对象名称';
comment on column EOVA_OBJECT.VIEW_NAME
  is '查询数据视图';
comment on column EOVA_OBJECT.TABLE_NAME
  is '保存数据主表';
comment on column EOVA_OBJECT.PK_NAME
  is '主键';
comment on column EOVA_OBJECT.DATA_SOURCE
  is '数据源';
comment on column EOVA_OBJECT.IS_SINGLE
  is '是否单选';
comment on column EOVA_OBJECT.IS_CELLEDIT
  is '是否可行内编辑';
comment on column EOVA_OBJECT.IS_SHOW_NUM
  is '是否显示行号';
comment on column EOVA_OBJECT.IS_FIRST_LOAD
  is '是否初始加载数据';
comment on column EOVA_OBJECT.FILTER
  is '初始数据过滤条件';
comment on column EOVA_OBJECT.DEFAULT_ORDER
  is '默认排序字段(desc)';
comment on column EOVA_OBJECT.DIY_CARD
  is '自定义卡片面板';
comment on column EOVA_OBJECT.DIY_JS
  is '依赖JS文件';
comment on column EOVA_OBJECT.BIZ_INTERCEPT
  is '自定义业务拦截器';
alter table EOVA_OBJECT
  add constraint PK_EOVA_OBJECT primary key (ID);

prompt Creating EOVA_ROLE...
create table EOVA_ROLE
(
  ID   NUMBER(10) not null,
  NAME VARCHAR2(255) not null,
  INFO VARCHAR2(255)
)
;
comment on column EOVA_ROLE.NAME
  is '角色名';
comment on column EOVA_ROLE.INFO
  is '角色描述';
alter table EOVA_ROLE
  add constraint PK_EOVA_ROLE primary key (ID);

prompt Creating EOVA_ROLE_BTN...
create table EOVA_ROLE_BTN
(
  ID  NUMBER(10) not null,
  RID NUMBER(10) not null,
  BID NUMBER(10) not null
)
;
comment on column EOVA_ROLE_BTN.RID
  is '角色';
comment on column EOVA_ROLE_BTN.BID
  is '功能';
alter table EOVA_ROLE_BTN
  add constraint PK_EOVA_ROLE_BTN primary key (ID);

prompt Creating EOVA_TASK...
create table EOVA_TASK
(
  ID           NUMBER(10) not null,
  STATE        NUMBER(10) default '0' not null,
  NAME         VARCHAR2(255) not null,
  EXP          VARCHAR2(50) not null,
  CLASS        VARCHAR2(255) not null,
  INFO         VARCHAR2(255),
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
  CONFIG_INFO  VARCHAR2(4000)
)
;
comment on column EOVA_TASK.STATE
  is '状态：0=停止，1=启动';
comment on column EOVA_TASK.NAME
  is '名称';
comment on column EOVA_TASK.EXP
  is '表达式';
comment on column EOVA_TASK.CLASS
  is '实现类';
comment on column EOVA_TASK.INFO
  is '说明';
comment on column EOVA_TASK.OID
  is '对象主键';
comment on column EOVA_TASK.OCODE
  is '对象代码';
comment on column EOVA_TASK.ONAME
  is '对象名称';
comment on column EOVA_TASK.ODESCRIBE
  is '对象描述';
comment on column EOVA_TASK.OORDER
  is '对象排序';
comment on column EOVA_TASK.SIMPLE_SPELL
  is '对象简拼';
comment on column EOVA_TASK.FULL_SPELL
  is '对象全拼';
comment on column EOVA_TASK.CREATE_DATE
  is '创建时间';
comment on column EOVA_TASK.UPDATE_DATE
  is '更新时间';
comment on column EOVA_TASK.CREATE_USER
  is '创建人';
comment on column EOVA_TASK.UPDATE_USER
  is '更新人';
comment on column EOVA_TASK.EXPAND
  is '扩展信息';
comment on column EOVA_TASK.IS_DISABLE
  is '是否禁用';
comment on column EOVA_TASK.FLAG1
  is '备用1';
comment on column EOVA_TASK.FLAG2
  is '备用2';
comment on column EOVA_TASK.CONFIG_INFO
  is 'JSON格式配置';
alter table EOVA_TASK
  add constraint PK_EOVA_TASK primary key (ID);

prompt Creating EOVA_USER...
create table EOVA_USER
(
  ID        NUMBER(10) not null,
  LOGIN_ID  VARCHAR2(30) not null,
  LOGIN_PWD VARCHAR2(50) not null,
  NICKNAME  VARCHAR2(255),
  RID       NUMBER(10) default '0',
  HOTEL_ID  NUMBER(10) default '0'
)
;
comment on column EOVA_USER.LOGIN_ID
  is '帐号';
comment on column EOVA_USER.LOGIN_PWD
  is '密码';
comment on column EOVA_USER.NICKNAME
  is '中文名';
comment on column EOVA_USER.RID
  is '角色ID';
comment on column EOVA_USER.HOTEL_ID
  is '所属酒店';
alter table EOVA_USER
  add constraint PK_EOVA_USER primary key (ID);

prompt Creating EOVA_WIDGET...
create table EOVA_WIDGET
(
  ID          NUMBER(10) not null,
  TYPE        NUMBER(10) default '1' not null,
  VALUE       VARCHAR2(50) not null,
  NAME        VARCHAR2(50) not null,
  VERSION     VARCHAR2(5) default '1.0',
  PATH        VARCHAR2(50),
  DESCRIPTION VARCHAR2(3000),
  CONFIG      VARCHAR2(3000)
)
;
comment on column EOVA_WIDGET.TYPE
  is '控件类型：1=EOVA控件，2=DIY控件';
comment on column EOVA_WIDGET.VALUE
  is '控件值';
comment on column EOVA_WIDGET.NAME
  is '名称';
comment on column EOVA_WIDGET.VERSION
  is '版本号';
comment on column EOVA_WIDGET.PATH
  is '路径';
comment on column EOVA_WIDGET.DESCRIPTION
  is '介绍';
comment on column EOVA_WIDGET.CONFIG
  is '控件配置信息JSON';
alter table EOVA_WIDGET
  add constraint PK_EOVA_WIDGET primary key (ID);

prompt Creating METL_DATABASE...
create table METL_DATABASE
(
  OID               VARCHAR2(32) default sys_guid() not null,
  OCODE             VARCHAR2(100),
  ONAME             VARCHAR2(100),
  ODESCRIBE         VARCHAR2(500),
  OORDER            NUMBER,
  SIMPLE_SPELL      VARCHAR2(200),
  FULL_SPELL        VARCHAR2(500),
  CREATE_DATE       VARCHAR2(14) default to_char(sysdate,'yyyymmddhh24miss'),
  UPDATE_DATE       VARCHAR2(14) default to_char(sysdate,'yyyymmddhh24miss'),
  CREATE_USER       VARCHAR2(100),
  UPDATE_USER       VARCHAR2(100),
  EXPAND            VARCHAR2(2000),
  IS_DISABLE        VARCHAR2(10) default '0',
  FLAG1             VARCHAR2(200),
  FLAG2             VARCHAR2(200),
  ORGANIZATION_NAME VARCHAR2(500),
  ORGANIZATION_CODE VARCHAR2(100),
  TYPE              VARCHAR2(100),
  ACCESS_WAY        VARCHAR2(100),
  JNDI              VARCHAR2(100),
  URL               VARCHAR2(1000),
  USERNAME          VARCHAR2(100),
  PASSWORD          VARCHAR2(32),
  STATUS            VARCHAR2(100) default 0,
  VALIDATION_QUERY  VARCHAR2(100)
)
;
comment on table METL_DATABASE
  is '数据库';
comment on column METL_DATABASE.OID
  is '对象主键';
comment on column METL_DATABASE.OCODE
  is '对象代码';
comment on column METL_DATABASE.ONAME
  is '对象名称';
comment on column METL_DATABASE.ODESCRIBE
  is '对象描述';
comment on column METL_DATABASE.OORDER
  is '对象排序';
comment on column METL_DATABASE.SIMPLE_SPELL
  is '对象简拼';
comment on column METL_DATABASE.FULL_SPELL
  is '对象全拼';
comment on column METL_DATABASE.CREATE_DATE
  is '创建时间';
comment on column METL_DATABASE.UPDATE_DATE
  is '更新时间';
comment on column METL_DATABASE.CREATE_USER
  is '创建人';
comment on column METL_DATABASE.UPDATE_USER
  is '更新人';
comment on column METL_DATABASE.EXPAND
  is '扩展信息';
comment on column METL_DATABASE.IS_DISABLE
  is '是否禁用';
comment on column METL_DATABASE.FLAG1
  is '备用1';
comment on column METL_DATABASE.FLAG2
  is '备用2';
comment on column METL_DATABASE.ORGANIZATION_NAME
  is '机构名称';
comment on column METL_DATABASE.ORGANIZATION_CODE
  is '机构代码';
comment on column METL_DATABASE.TYPE
  is '数据库类型';
comment on column METL_DATABASE.ACCESS_WAY
  is '访问方式';
comment on column METL_DATABASE.JNDI
  is 'JNDI名称';
comment on column METL_DATABASE.URL
  is '连接串';
comment on column METL_DATABASE.USERNAME
  is '用户名';
comment on column METL_DATABASE.PASSWORD
  is '密码';
comment on column METL_DATABASE.STATUS
  is '状态';
comment on column METL_DATABASE.VALIDATION_QUERY
  is '测试语句';
alter table METL_DATABASE
  add constraint PK_METL_DATABASE primary key (OID);
create index IDX_M_DATABASE_CREATE_DATE on METL_DATABASE (CREATE_DATE);
create index IDX_M_DATABASE_UPDATE_DATE on METL_DATABASE (UPDATE_DATE);

prompt Creating METL_KETTLE_LOG...
create table METL_KETTLE_LOG
(
  OID           VARCHAR2(32) default sys_guid() not null,
  OCODE         VARCHAR2(100),
  ONAME         VARCHAR2(100),
  ODESCRIBE     VARCHAR2(500),
  OORDER        NUMBER default 5000000,
  SIMPLE_SPELL  VARCHAR2(200),
  FULL_SPELL    VARCHAR2(500),
  CREATE_DATE   VARCHAR2(14) default to_char(sysdate,'yyyymmddhh24miss'),
  UPDATE_DATE   VARCHAR2(14) default to_char(sysdate,'yyyymmddhh24miss'),
  CREATE_USER   VARCHAR2(100),
  UPDATE_USER   VARCHAR2(100),
  EXPAND        VARCHAR2(2000),
  IS_DISABLE    VARCHAR2(10) default '0',
  FLAG1         VARCHAR2(200),
  FLAG2         VARCHAR2(200),
  DATA_BILL     VARCHAR2(32),
  JOB           VARCHAR2(100),
  START_TIME    VARCHAR2(14),
  END_TIME      VARCHAR2(14),
  ETLFLAG       VARCHAR2(100),
  RESULT        VARCHAR2(100),
  INPUT_COUNT   NUMBER default 0,
  ADD_COUNT     NUMBER default 0,
  REPEAT_COUNT  NUMBER default 0,
  INVALID_COUNT NUMBER default 0
)
partition by range (CREATE_DATE)
(
  partition P_201605 values less than ('201606')
    tablespace USERS,
  partition P_201606 values less than ('201607')
    tablespace USERS,
  partition P_201607 values less than ('201608')
    tablespace USERS,
  partition P_201608 values less than ('201609')
    tablespace USERS,
  partition P_201609 values less than ('201610')
    tablespace USERS,
  partition P_201610 values less than ('201611')
    tablespace USERS,
  partition P_201611 values less than ('201612')
    tablespace USERS,
  partition P_201612 values less than ('201701')
    tablespace USERS,
  partition P_201701 values less than ('201702')
    tablespace USERS,
  partition P_201702 values less than ('201703')
    tablespace USERS,
  partition P_201703 values less than ('201704')
    tablespace USERS,
  partition P_201704 values less than ('201705')
    tablespace USERS,
  partition P_201705 values less than ('201706')
    tablespace USERS,
  partition P_201706 values less than ('201707')
    tablespace USERS,
  partition P_201707 values less than ('201708')
    tablespace USERS,
  partition P_201708 values less than ('201709')
    tablespace USERS,
  partition P_201709 values less than ('201710')
    tablespace USERS
);
comment on table METL_KETTLE_LOG
  is 'kettle日志';
comment on column METL_KETTLE_LOG.OID
  is '对象主键';
comment on column METL_KETTLE_LOG.OCODE
  is '对象代码';
comment on column METL_KETTLE_LOG.ONAME
  is '对象名称';
comment on column METL_KETTLE_LOG.ODESCRIBE
  is '对象描述';
comment on column METL_KETTLE_LOG.OORDER
  is '对象排序';
comment on column METL_KETTLE_LOG.SIMPLE_SPELL
  is '对象简拼';
comment on column METL_KETTLE_LOG.FULL_SPELL
  is '对象全拼';
comment on column METL_KETTLE_LOG.CREATE_DATE
  is '创建时间';
comment on column METL_KETTLE_LOG.UPDATE_DATE
  is '更新时间';
comment on column METL_KETTLE_LOG.CREATE_USER
  is '创建人';
comment on column METL_KETTLE_LOG.UPDATE_USER
  is '更新人';
comment on column METL_KETTLE_LOG.EXPAND
  is '扩展信息';
comment on column METL_KETTLE_LOG.IS_DISABLE
  is '是否禁用';
comment on column METL_KETTLE_LOG.FLAG1
  is '备用1';
comment on column METL_KETTLE_LOG.FLAG2
  is '备用2';
comment on column METL_KETTLE_LOG.DATA_BILL
  is '数据账单';
comment on column METL_KETTLE_LOG.JOB
  is '作业';
comment on column METL_KETTLE_LOG.START_TIME
  is '开始时间';
comment on column METL_KETTLE_LOG.END_TIME
  is '结束时间';
comment on column METL_KETTLE_LOG.ETLFLAG
  is '抽取标志';
comment on column METL_KETTLE_LOG.RESULT
  is '结果';
comment on column METL_KETTLE_LOG.INPUT_COUNT
  is '读取量';
comment on column METL_KETTLE_LOG.ADD_COUNT
  is '新增量';
comment on column METL_KETTLE_LOG.REPEAT_COUNT
  is '重复量';
comment on column METL_KETTLE_LOG.INVALID_COUNT
  is '无效量';
alter table METL_KETTLE_LOG
  add constraint PK_METL_KETTLE_LOG primary key (OID);
create index IDX_M_K_LOG_CREATE_DATE on METL_KETTLE_LOG (CREATE_DATE);
create index IDX_M_K_LOG_UPDATE_DATE on METL_KETTLE_LOG (UPDATE_DATE);

prompt Creating METL_PROJECT...
create table METL_PROJECT
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
  URL          VARCHAR2(200),
  PASSWORD     VARCHAR2(200),
  STATUS       VARCHAR2(200)
)
;
comment on table METL_PROJECT
  is '项目';
comment on column METL_PROJECT.OID
  is '对象主键';
comment on column METL_PROJECT.OCODE
  is '对象代码';
comment on column METL_PROJECT.ONAME
  is '对象名称';
comment on column METL_PROJECT.ODESCRIBE
  is '对象描述';
comment on column METL_PROJECT.OORDER
  is '对象排序';
comment on column METL_PROJECT.SIMPLE_SPELL
  is '对象简拼';
comment on column METL_PROJECT.FULL_SPELL
  is '对象全拼';
comment on column METL_PROJECT.CREATE_DATE
  is '创建时间';
comment on column METL_PROJECT.UPDATE_DATE
  is '更新时间';
comment on column METL_PROJECT.CREATE_USER
  is '创建人';
comment on column METL_PROJECT.UPDATE_USER
  is '更新人';
comment on column METL_PROJECT.EXPAND
  is '扩展信息';
comment on column METL_PROJECT.IS_DISABLE
  is '是否禁用';
comment on column METL_PROJECT.FLAG1
  is '备用1';
comment on column METL_PROJECT.FLAG2
  is '备用2';
comment on column METL_PROJECT.URL
  is '项目URL';
comment on column METL_PROJECT.PASSWORD
  is '项目密码';
comment on column METL_PROJECT.STATUS
  is '状态';
alter table METL_PROJECT
  add constraint PK_METL_PROJECT primary key (OID);

prompt Creating METL_TASK_TIMING...
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
)
;
comment on table METL_TASK_TIMING
  is '任务定时';
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
alter table METL_TASK_TIMING
  add constraint PK_METL_TASK_TIMING primary key (OID);
create index IDX_M_T_TIMING_CREATE_DATE on METL_TASK_TIMING (CREATE_DATE);
create index IDX_M_T_TIMING_UPDATE_DATE on METL_TASK_TIMING (UPDATE_DATE);

prompt Creating METL_UNIFY_DICT...
create table METL_UNIFY_DICT
(
  OID           VARCHAR2(32) default sys_guid() not null,
  OCODE         VARCHAR2(100),
  ONAME         VARCHAR2(100),
  ODESCRIBE     VARCHAR2(500),
  OORDER        NUMBER,
  SIMPLE_SPELL  VARCHAR2(200),
  FULL_SPELL    VARCHAR2(500),
  CREATE_DATE   VARCHAR2(14) default to_char(sysdate,'yyyymmddhh24miss'),
  UPDATE_DATE   VARCHAR2(14) default to_char(sysdate,'yyyymmddhh24miss'),
  CREATE_USER   VARCHAR2(100),
  UPDATE_USER   VARCHAR2(100),
  EXPAND        VARCHAR2(4000) default '{}',
  IS_DISABLE    VARCHAR2(10) default '0',
  FLAG1         VARCHAR2(200),
  FLAG2         VARCHAR2(200),
  DICT_CATEGORY VARCHAR2(100),
  BELONG_OBJ    VARCHAR2(100)
)
;
comment on table METL_UNIFY_DICT
  is '统一字典';
comment on column METL_UNIFY_DICT.OID
  is '对象主键';
comment on column METL_UNIFY_DICT.OCODE
  is '对象代码';
comment on column METL_UNIFY_DICT.ONAME
  is '对象名称';
comment on column METL_UNIFY_DICT.ODESCRIBE
  is '对象描述';
comment on column METL_UNIFY_DICT.OORDER
  is '对象排序';
comment on column METL_UNIFY_DICT.SIMPLE_SPELL
  is '对象简拼';
comment on column METL_UNIFY_DICT.FULL_SPELL
  is '对象全拼';
comment on column METL_UNIFY_DICT.CREATE_DATE
  is '创建时间';
comment on column METL_UNIFY_DICT.UPDATE_DATE
  is '更新时间';
comment on column METL_UNIFY_DICT.CREATE_USER
  is '创建人';
comment on column METL_UNIFY_DICT.UPDATE_USER
  is '更新人';
comment on column METL_UNIFY_DICT.EXPAND
  is '扩展信息';
comment on column METL_UNIFY_DICT.IS_DISABLE
  is '是否禁用';
comment on column METL_UNIFY_DICT.FLAG1
  is '备用1';
comment on column METL_UNIFY_DICT.FLAG2
  is '备用2';
comment on column METL_UNIFY_DICT.DICT_CATEGORY
  is '字典类别';
comment on column METL_UNIFY_DICT.BELONG_OBJ
  is '所属对象';
alter table METL_UNIFY_DICT
  add constraint PK_METL_UNIFY_DICT primary key (OID);
create index IDX_M_U_DICT_CREATE_DATE on METL_UNIFY_DICT (CREATE_DATE);
create index IDX_M_U_DICT_UPDATE_DATE on METL_UNIFY_DICT (UPDATE_DATE);

prompt Disabling triggers for EOVA_BUTTON...
alter table EOVA_BUTTON disable all triggers;
prompt Disabling triggers for EOVA_DICT...
alter table EOVA_DICT disable all triggers;
prompt Disabling triggers for EOVA_FIELD...
alter table EOVA_FIELD disable all triggers;
prompt Disabling triggers for EOVA_LOG...
alter table EOVA_LOG disable all triggers;
prompt Disabling triggers for EOVA_MENU...
alter table EOVA_MENU disable all triggers;
prompt Disabling triggers for EOVA_MENU_OBJECT...
alter table EOVA_MENU_OBJECT disable all triggers;
prompt Disabling triggers for EOVA_OBJECT...
alter table EOVA_OBJECT disable all triggers;
prompt Disabling triggers for EOVA_ROLE...
alter table EOVA_ROLE disable all triggers;
prompt Disabling triggers for EOVA_ROLE_BTN...
alter table EOVA_ROLE_BTN disable all triggers;
prompt Disabling triggers for EOVA_TASK...
alter table EOVA_TASK disable all triggers;
prompt Disabling triggers for EOVA_USER...
alter table EOVA_USER disable all triggers;
prompt Disabling triggers for EOVA_WIDGET...
alter table EOVA_WIDGET disable all triggers;
prompt Disabling triggers for METL_DATABASE...
alter table METL_DATABASE disable all triggers;
prompt Disabling triggers for METL_KETTLE_LOG...
alter table METL_KETTLE_LOG disable all triggers;
prompt Disabling triggers for METL_PROJECT...
alter table METL_PROJECT disable all triggers;
prompt Disabling triggers for METL_TASK_TIMING...
alter table METL_TASK_TIMING disable all triggers;
prompt Disabling triggers for METL_UNIFY_DICT...
alter table METL_UNIFY_DICT disable all triggers;
prompt Loading EOVA_BUTTON...
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1057, 'biz_4j_test1', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1058, 'biz_4j_test1', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', 60, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1059, 'biz_demo_userscell', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1060, 'biz_demo_userscell', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1061, 'biz_demo_userscell', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1062, 'biz_demo_userscell', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1063, 'biz_demo_userscell', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1064, 'biz_demo_userscell', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', 60, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1065, 'biz_demo_import', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1066, 'biz_demo_import', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1067, 'biz_demo_import', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1068, 'biz_demo_import', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1069, 'biz_demo_import', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1070, 'biz_demo_import', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', 60, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1071, 'biz_product', '产品发布', 'icon-arrowbranch', '/product/btn/release.html', '/product/release', 70, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11015, 'list_job_params', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 2, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11014, 'list_job_params', '查询', null, 'query', '/grid/query', 1, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11016, 'list_job_params', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 3, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11017, 'list_job_params', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 4, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11018, 'list_job_params', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 5, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (10975, 'diy_druid', '查询', null, 'query', '/grid/query', 1, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (10828, 'list_database', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (10829, 'list_database', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (10830, 'list_database', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (10831, 'list_database', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (10832, 'list_database', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (10833, 'list_database', '导入', null, '/eova/template/single/btn/import.html', '/single_grid/import', 60, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11019, 'list_job_params', '导入', null, '/eova/template/single/btn/import.html', '/single_grid/import', 6, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (10751, 'list_unify_dict', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (10752, 'list_unify_dict', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (10753, 'list_unify_dict', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (10754, 'list_unify_dict', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (10755, 'list_unify_dict', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (10756, 'list_unify_dict', '导入', null, '/eova/template/single/btn/import.html', '/single_grid/import', 60, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1, 'eova_menu', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (2, 'eova_menu', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (3, 'eova_menu', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (4, 'eova_menu', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (5, 'eova_menu', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (6, 'eova_menu', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', 60, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (7, 'eova_menu', '导出菜单脚本', 'icon-databasego', '/eova/menu/btn/export.html', '/menu/doExport', 120, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (8, 'eova_menu', '基本功能设置', 'icon-cogedit', '/eova/menu/btn/fun.html', '/meta/fun', 110, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (9, 'eova_menu', '新增功能', 'icon-pageadd', '/eova/menu/btn/add.html', '/menu/add', 100, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (20, 'eova_object', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (21, 'eova_object', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (22, 'eova_object', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (23, 'eova_object', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (24, 'eova_object', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (25, 'eova_object', '字段新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 1, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (26, 'eova_object', '字段修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 1, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (27, 'eova_object', '字段删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 1, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (28, 'eova_object', '导出元数据脚本', 'icon-databasego', '/eova/meta/btn/export.html', '/meta/doExport', 110, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (29, 'eova_object', '导入元数据', 'icon-databaseadd', '/eova/meta/btn/import.html', '/meta/import', 100, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (40, 'eova_button', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (41, 'eova_button', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (42, 'eova_button', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (43, 'eova_button', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (44, 'eova_button', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (45, 'eova_button', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', 60, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (46, 'eova_button', '导出按钮脚本', 'icon-databasego', '/eova/button/btn/export.html', '/button/doExport', 70, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (60, 'eova_dictionary', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (61, 'eova_dictionary', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (62, 'eova_dictionary', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (63, 'eova_dictionary', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (64, 'eova_dictionary', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (65, 'eova_dictionary', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', 60, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (80, 'eova_task', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (81, 'eova_task', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (82, 'eova_task', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (83, 'eova_task', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (84, 'eova_task', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (85, 'eova_task', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', 60, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (86, 'eova_task', '启动任务', 'icon-clockplay', '/eova/task/btn/start.html', '/task/start', 100, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (87, 'eova_task', '暂停任务', 'icon-clockpause', '/eova/task/btn/stop.html', '/task/stop', 110, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (88, 'eova_task', '立即运行一次', 'icon-clockgo', '/eova/task/btn/trigger.html', '/task/trigger', 120, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (100, 'sys_auth_role', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (101, 'sys_auth_role', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (102, 'sys_auth_role', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (103, 'sys_auth_role', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (104, 'sys_auth_role', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (105, 'sys_auth_role', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', 60, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (106, 'sys_auth_role', '权限分配', 'icon-groupedit', '/eova/auth/btn/roleChoose.html', '/auth/getRoleFunJson/*', 100, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (120, 'sys_auth_user', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (121, 'sys_auth_user', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11010, 'list_job', '参数设置', 'icon-applicationformedit', '/oss/job_manager/btn_set_params.html', '/oss/job_manager/setParams', 3, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11011, 'list_job', '启动', 'icon-bulletright', '/oss/job_manager/btn_start_job.html', '/oss/job_manager/startJob', 9, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11012, 'list_job', '停止', 'icon-bulletshape', '/oss/job_manager/btn_stop_job.html', '/oss/job_manager/stopJob', 10, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11013, 'list_job', '查看运行日志', 'icon-door', '/oss/job_manager/btn_get_log.html', '/oss/job_manager/getLog', 6, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11023, 'list_job_log', '查询', null, 'query', '/grid/query', 1, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11024, 'list_job_log', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 2, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11025, 'list_job_log', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 3, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11026, 'list_job_log', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 4, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11027, 'list_job_log', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 5, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11028, 'list_job_log', '导入', null, '/eova/template/single/btn/import.html', '/single_grid/import', 6, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11144, 'list_job', '删除作业', 'icon-bulletcross', '/oss/job_manager/btn_del_job.html', '/oss/job_manager/delJob', 4, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11146, 'diy_json', '查询', null, 'query', '/grid/query', 1, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11143, 'list_job', '修改作业', 'icon-bookaddressesedit', '/oss/job_manager/btn_update_job.html', '/oss/job_manager/updateJob', 3, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11145, 'diy_cron', '查询', null, 'query', '/grid/query', 1, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11123, 'list_job', '获取作业目录', 'icon-applicationsidetree', '/oss/job_manager/btn_get_dir.html', '/oss/job_manager/getDir', 6, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11103, 'list_kettle_log', '查询', null, 'query', '/grid/query', 1, 0, '1', '0');
commit;
prompt 100 records committed...
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11104, 'list_kettle_log', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 2, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11105, 'list_kettle_log', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 3, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11106, 'list_kettle_log', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 4, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11107, 'list_kettle_log', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 5, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11108, 'list_kettle_log', '导入', null, '/eova/template/single/btn/import.html', '/single_grid/import', 6, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11063, 'list_job', '新建作业', 'icon-add', '/oss/job_manager/btn_add_job.html', '/oss/job_manager/toNewJob', 2, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11083, 'list_job', '结束', 'icon-bulletdelete', '/oss/job_manager/btn_kill_job.html', '/oss/job_manager/killJob', 13, 0, '0', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (146, 'list_project', '查询', null, 'query', '/grid/query', 1, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (147, 'list_project', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 2, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (148, 'list_project', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 3, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (149, 'list_project', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 4, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (150, 'list_project', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 5, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (151, 'list_project', '导入', null, '/eova/template/single/btn/import.html', '/single_grid/import', 6, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11043, 'list_job', '更新到文件资源库', 'icon-doorin', '/oss/job_manager/btn_update_to_file.html', '/oss/job_manager/updateTofile', 12, 0, '0', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11003, 'list_job', '查询', 'icon-zoom', 'query', '/grid/query', 1, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11004, 'list_job', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 2, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11005, 'list_job', '修改', 'icon-bulletedit', '/eova/widget/form/btn/update.html', '/form/update', 3, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11006, 'list_job', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 4, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11007, 'list_job', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 5, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (11008, 'list_job', '导入', null, '/eova/template/single/btn/import.html', '/single_grid/import', 6, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (122, 'sys_auth_user', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (123, 'sys_auth_user', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (124, 'sys_auth_user', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (125, 'sys_auth_user', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', 60, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (140, 'sys_log', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (141, 'sys_log', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (142, 'sys_log', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (143, 'sys_log', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (144, 'sys_log', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (145, 'sys_log', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', 60, 0, '1', '1');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1000, 'biz_demo_tool', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1001, 'biz_demo_tool', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1002, 'biz_demo_tool', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1003, 'biz_demo_tool', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1004, 'biz_demo_tool', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1005, 'biz_demo_tool', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', 60, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1006, 'biz_demo_usersitem', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1007, 'biz_demo_usersitem', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1008, 'biz_demo_usersitem', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1009, 'biz_demo_usersitem', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1010, 'biz_demo_usersitem', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1011, 'biz_demo_usersitem', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', 60, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1012, 'biz_demo_usersview', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1013, 'biz_demo_usersview', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1014, 'biz_demo_usersview', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1015, 'biz_demo_usersview', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1016, 'biz_demo_usersview', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1017, 'biz_demo_usersview', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', 60, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1018, 'biz_users_exp', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1019, 'biz_users_exp', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1020, 'biz_users_exp', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1021, 'biz_users_exp', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1022, 'biz_users_exp', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1023, 'biz_users_exp', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', 60, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1024, 'biz_demo_users', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1025, 'biz_demo_users', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1026, 'biz_demo_users', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1027, 'biz_demo_users', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1028, 'biz_demo_users', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1029, 'biz_demo_users', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', 60, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1030, 'biz_comment', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1031, 'biz_comment', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1032, 'biz_comment', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1033, 'biz_comment', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1034, 'biz_comment', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1035, 'biz_comment', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', 60, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1036, 'biz_product', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1037, 'biz_product', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1038, 'biz_product', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1039, 'biz_product', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1040, 'biz_product', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1041, 'biz_product', '导入', null, '/eova/template/single/btn/import.html', '/singleGrid/import', 60, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1042, 'biz_hotelzz', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1043, 'biz_hotelzz', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1044, 'biz_hotelzz', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1045, 'biz_hotelzz', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1046, 'biz_hotelzz', '查看', null, '/eova/widget/form/btn/detail.html', '/form/detail', 50, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1047, 'biz_hotelzz', '床位新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 1, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1048, 'biz_hotelzz', '床位修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 1, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1049, 'biz_hotelzz', '床位删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 1, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1050, 'biz_hotelzz', '存货新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 2, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1051, 'biz_hotelzz', '存货修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 2, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1052, 'biz_hotelzz', '存货删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 2, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1053, 'biz_4j_test1', '查询', null, 'query', '/grid/query', 10, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1054, 'biz_4j_test1', '新增', null, '/eova/widget/form/btn/add.html', '/form/add', 20, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1055, 'biz_4j_test1', '修改', null, '/eova/widget/form/btn/update.html', '/form/update', 30, 0, '1', '0');
insert into EOVA_BUTTON (ID, MENU_CODE, NAME, ICON, UI, BS, ORDER_NUM, GROUP_NUM, IS_BASE, IS_DEL)
values (1056, 'biz_4j_test1', '删除', null, '/eova/widget/form/btn/delete.html', '/grid/delete', 40, 0, '1', '0');
commit;
prompt 187 records loaded
prompt Loading EOVA_DICT...
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (1051, '2', '异常', 'eova_job', 'state');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (20, 'string', '字符', 'eova_field', 'data_type');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (21, 'number', '数字', 'eova_field', 'data_type');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (22, 'time', '时间', 'eova_field', 'data_type');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (40, '1', '新增', 'eova_log', 'type');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (41, '2', '修改', 'eova_log', 'type');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (42, '3', '删除', 'eova_log', 'type');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (50, '文本框', '文本框', 'eova_field', 'type');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (51, '下拉框', '下拉框', 'eova_field', 'type');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (52, '查找框', '查找框', 'eova_field', 'type');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (53, '时间框', '时间框', 'eova_field', 'type');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (54, '文本域', '文本域', 'eova_field', 'type');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (55, '编辑框', '编辑框', 'eova_field', 'type');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (56, '复选框', '复选框', 'eova_field', 'type');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (57, '自增框', '自增框', 'eova_field', 'type');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (58, '图片框', '图片框', 'eova_field', 'type');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (59, '图标框', '图标框', 'eova_field', 'type');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (60, '文件框', '文件框', 'eova_field', 'type');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (61, '日期框', '日期框', 'eova_field', 'type');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (62, '密码框', '密码框', 'eova_field', 'type');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (100, '0', '暂停', 'eova_job', 'state');
insert into EOVA_DICT (ID, VALUE, NAME, OBJECT, FIELD)
values (101, '1', '运行', 'eova_job', 'state');
commit;
prompt 22 records loaded
prompt Loading EOVA_FIELD...
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21764, 'METL_KETTLE_LOG', null, 'is_disable', '是否禁用', '0', 'string', '文本框', 130, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, '''0''', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21765, 'METL_KETTLE_LOG', null, 'flag1', '备用1', '0', 'string', '文本框', 140, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21766, 'METL_KETTLE_LOG', null, 'flag2', '备用2', '0', 'string', '文本框', 150, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21767, 'METL_KETTLE_LOG', null, 'job', '作业', '0', 'string', '文本框', 160, null, '1', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21768, 'METL_KETTLE_LOG', null, 'start_time', '开始时间', '0', 'string', '时间框', 170, null, '1', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21769, 'METL_KETTLE_LOG', null, 'end_time', '结束时间', '0', 'string', '时间框', 180, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21770, 'METL_KETTLE_LOG', null, 'etlflag', '抽取标志', '0', 'string', '文本框', 190, null, '1', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21771, 'METL_KETTLE_LOG', null, 'result', '结果', '0', 'string', '下拉框', 200, 'SUCCESS_FAILED', '1', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21772, 'METL_KETTLE_LOG', null, 'input_count', '读取量', '0', 'number', '文本框', 210, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '0', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21773, 'METL_KETTLE_LOG', null, 'add_count', '新增量', '0', 'number', '文本框', 220, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '0', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21774, 'METL_KETTLE_LOG', null, 'repeat_count', '重复量', '0', 'number', '文本框', 230, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '0', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21775, 'METL_KETTLE_LOG', null, 'invalid_count', '无效量', '0', 'number', '文本框', 240, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '0' || chr(10) || '', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21712, 'R_JOB', null, 'auto_restart_num', '自动重启次数', '0', 'string', '文本框', 76, null, '0', '1', '0', '0', '1', '1', '1', '0', '0', null, null, null, null, 80, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (286, 'METL_PROJECT', null, 'oid', '对象主键', '0', 'string', '文本框', 10, null, '0', '0', '0', '1', '0', '1', '1', '1', '0', null, null, 'sys_guid() ', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (287, 'METL_PROJECT', null, 'ocode', '对象代码', '0', 'string', '文本框', 20, null, '1', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (288, 'METL_PROJECT', null, 'oname', '对象名称', '0', 'string', '文本框', 30, null, '1', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (289, 'METL_PROJECT', null, 'odescribe', '对象描述', '0', 'string', '文本域', 40, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (290, 'METL_PROJECT', null, 'oorder', '对象排序', '0', 'number', '文本框', 50, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 80, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (291, 'METL_PROJECT', null, 'simple_spell', '对象简拼', '0', 'string', '文本框', 60, null, '0', '0', '0', '1', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (292, 'METL_PROJECT', null, 'full_spell', '对象全拼', '0', 'string', '文本域', 70, null, '0', '0', '0', '1', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (293, 'METL_PROJECT', null, 'create_date', '创建时间', '0', 'string', '时间框', 80, null, '0', '1', '1', '1', '0', '1', '1', '0', '0', null, null, 'to_char(sysdate,''yyyymmddhh24miss'')', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (294, 'METL_PROJECT', null, 'update_date', '更新时间', '0', 'string', '时间框', 90, null, '0', '0', '1', '1', '0', '1', '1', '0', '0', null, null, 'to_char(sysdate,''yyyymmddhh24miss'')', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (295, 'METL_PROJECT', null, 'create_user', '创建人', '0', 'string', '文本框', 100, null, '0', '1', '1', '1', '0', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (296, 'METL_PROJECT', null, 'update_user', '更新人', '0', 'string', '文本框', 110, null, '0', '0', '1', '1', '0', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (297, 'METL_PROJECT', null, 'expand', '扩展信息', '0', 'string', 'JSON框', 1000, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (298, 'METL_PROJECT', null, 'is_disable', '是否禁用', '0', 'string', '复选框', 130, null, '1', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '''0''', null, 80, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (299, 'METL_PROJECT', null, 'flag1', '备用1', '0', 'string', '文本框', 140, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (300, 'METL_PROJECT', null, 'flag2', '备用2', '0', 'string', '文本框', 150, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (301, 'METL_PROJECT', null, 'url', '项目URL', '0', 'string', '文本框', 160, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 200, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21748, 'R_JOB', null, 'repository_code', '资源库', '0', 'string', '下拉框', 74, 'repository', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21749, 'R_JOB', null, 'project_code', '运行在', '0', 'string', '下拉框', 75, 'PROJECT', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21751, 'METL_PROJECT', null, 'status', '状态', '0', 'string', '下拉框', 180, 'LINK_STATUS', '1', '1', '1', '0', '0', '1', '0', '0', '0', null, null, null, null, 60, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21776, 'METL_KETTLE_LOG', null, 'data_bill', '数据账单', '0', 'string', '文本框', 250, null, '1', '1', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, null, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (302, 'METL_PROJECT', null, 'password', '项目密码', '0', 'string', '文本框', 170, null, '0', '0', '0', '0', '1', '1', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21631, 'R_JOB', null, 'id_job', '作业ID', '0', 'number', '文本框', 10, null, '1', '1', '1', '1', '1', '1', '0', '1', '0', null, null, null, null, 40, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21632, 'R_JOB', null, 'id_directory', '作业目录', '0', 'number', '文本框', 20, null, '0', '0', '1', '1', '0', '0', '0', '0', '0', null, null, null, null, 60, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21633, 'R_JOB', null, 'name', '作业名称', '0', 'string', '文本框', 30, null, '1', '1', '1', '1', '1', '1', '0', '0', '0', null, null, null, null, 200, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21634, 'R_JOB', null, 'description', '作业描述', '0', 'string', '文本域', 40, null, '1', '1', '1', '0', '1', '1', '0', '0', '0', null, null, null, null, 250, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21635, 'R_JOB', null, 'extended_description', '扩展描述', '0', 'string', 'JSON框', 50000, null, '0', '0', '0', '0', '1', '1', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21636, 'R_JOB', null, 'job_version', '作业类别', '0', 'string', '下拉框', 60, 'KETTLE_JOB_TYPE', '1', '1', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 80, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21637, 'R_JOB', null, 'job_status', '作业状态', '0', 'number', '下拉框', 70, 'KETTLE_JOB_STATUS', '1', '1', '0', '0', '1', '1', '0', '0', '0', null, null, null, null, 80, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21638, 'R_JOB', null, 'id_database_log', '日志数据库ID', '0', 'number', '文本框', 80, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21639, 'R_JOB', null, 'table_name_log', '日志表名', '0', 'string', '文本框', 90, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21640, 'R_JOB', null, 'created_user', '创建人', '0', 'string', '文本框', 100, null, '0', '1', '1', '0', '0', '0', '0', '0', '0', null, null, null, null, 80, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21641, 'R_JOB', null, 'created_date', '创建时间', '0', 'time', '时间框', 110, null, '0', '1', '1', '1', '0', '1', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21642, 'R_JOB', null, 'modified_user', '修改人', '0', 'string', '文本框', 120, null, '0', '0', '1', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21643, 'R_JOB', null, 'modified_date', '修改时间', '0', 'time', '时间框', 130, null, '0', '0', '1', '1', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21644, 'R_JOB', null, 'use_batch_id', 'use_batch_id', '0', 'string', '文本框', 140, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21645, 'R_JOB', null, 'pass_batch_id', 'pass_batch_id', '0', 'string', '文本框', 150, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21646, 'R_JOB', null, 'use_logfield', 'use_logfield', '0', 'string', '文本框', 160, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21647, 'R_JOB', null, 'shared_file', 'shared_file', '0', 'string', '文本框', 170, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (22631, 'R_JOB', null, 'timing', '定时设置', '0', 'number', '定时框', 45, null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, 200, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21181, 'eova_field_code', null, 'config', '额外配置', '0', 'string', 'JSON框', 450, null, '0', '0', '0', '0', '0', '1', '0', '0', '0', null, null, null, null, 130, 60, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21201, 'METL_UNIFY_DICT', null, 'oid', '对象主键', '0', 'string', '文本框', 10, null, '0', '0', '1', '0', '0', '1', '0', '1', '0', null, null, 'sys_guid() ', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21202, 'METL_UNIFY_DICT', null, 'ocode', '代码', '0', 'string', '文本框', 20, null, '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, 200, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21203, 'METL_UNIFY_DICT', null, 'oname', '名称', '0', 'string', '文本框', 30, null, '1', '1', '0', '0', '1', '1', '1', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21204, 'METL_UNIFY_DICT', null, 'odescribe', '描述', '0', 'string', '文本域', 50, null, '0', '0', '0', '0', '1', '1', '1', '0', '0', null, null, null, null, 130, 60, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21205, 'METL_UNIFY_DICT', null, 'oorder', '排序', '0', 'number', '文本框', 40, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '50000', null, 80, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21206, 'METL_UNIFY_DICT', null, 'simple_spell', '对象简拼', '0', 'string', '文本框', 60, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21207, 'METL_UNIFY_DICT', null, 'full_spell', '对象全拼', '0', 'string', '文本域', 70, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21208, 'METL_UNIFY_DICT', null, 'create_date', '创建时间', '0', 'string', '时间框', 80, null, '0', '1', '0', '1', '0', '0', '0', '0', '0', null, null, 'to_char(sysdate,''yyyymmddhh24miss'')', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21209, 'METL_UNIFY_DICT', null, 'update_date', '更新时间', '0', 'string', '时间框', 90, null, '0', '1', '0', '1', '0', '0', '0', '0', '0', null, null, 'to_char(sysdate,''yyyymmddhh24miss'')', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21210, 'METL_UNIFY_DICT', null, 'create_user', '创建人', '0', 'string', '文本框', 100, null, '0', '1', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 80, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21211, 'METL_UNIFY_DICT', null, 'update_user', '更新人', '0', 'string', '文本框', 110, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21212, 'METL_UNIFY_DICT', null, 'expand', '扩展信息', '0', 'string', 'JSON框', 50000, null, '0', '0', '0', '0', '1', '1', '0', '0', '0', null, null, '{}', null, 130, 60, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21213, 'METL_UNIFY_DICT', null, 'is_disable', '是否禁用', '0', 'string', '复选框', 130, null, '1', '1', '0', '0', '1', '1', '1', '0', '0', null, null, '0', null, 80, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21214, 'METL_UNIFY_DICT', null, 'flag1', '备用1', '0', 'string', '文本框', 140, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21215, 'METL_UNIFY_DICT', null, 'flag2', '备用2', '0', 'string', '文本框', 150, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21216, 'METL_UNIFY_DICT', null, 'dict_category', '字典类别', '0', 'string', '查找框', 160, 'DICT_CATEGORY', '1', '1', '0', '0', '1', '1', '1', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21218, 'METL_UNIFY_DICT', null, 'belong_obj', '所属对象', '0', 'string', '文本框', 170, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 250, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21161, 'eova_menu_code', null, 'config', '配置', '0', 'string', 'JSON框', 170, null, '0', '0', '0', '0', '1', '1', '0', '0', '0', null, null, null, null, 130, 60, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (1, 'eova_object_code', null, 'id', 'ID', '1', 'number', '自增框', 10, null, '0', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (2, 'eova_object_code', null, 'code', '编码', '0', 'string', '文本框', 20, null, '1', '1', '0', '1', '1', '0', '0', '1', '0', null, 'eovacode', null, null, 200, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (3, 'eova_object_code', null, 'name', '名称', '0', 'string', '文本框', 30, null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (4, 'eova_object_code', null, 'view_name', '视图', '0', 'string', '文本框', 40, null, '1', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, 70, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (5, 'eova_object_code', null, 'table_name', '数据表', '0', 'string', '文本框', 50, null, '1', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, 80, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (6, 'eova_object_code', null, 'pk_name', '主键', '0', 'string', '文本框', 60, null, '0', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, 70, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (7, 'eova_object_code', null, 'data_source', '数据源', '0', 'string', '下拉框', 70, 'DATABASE', '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 70, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (8, 'eova_object_code', null, 'is_single', '单选/多选', '0', 'number', '复选框', 80, null, '0', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, 70, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (9, 'eova_object_code', null, 'is_show_num', '显示行号', '0', 'number', '复选框', 90, null, '0', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, 70, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (10, 'eova_object_code', null, 'default_order', '默认排序', '0', 'string', '文本域', 100, null, '0', '1', '0', '1', '1', '1', '0', '0', '0', '例如：id desc (默认按ID倒序)', null, 'create_date desc', null, 70, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (11, 'eova_object_code', null, 'filter', '过滤条件', '0', 'string', '文本域', 110, null, '0', '1', '0', '1', '1', '1', '0', '0', '0', '例如：status = 1 (只显示状态为1的数据)', null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (12, 'eova_object_code', null, 'diy_js', '依赖JS', '0', 'string', '文本域', 130, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', '自定义JS文件路径', null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (13, 'eova_object_code', null, 'is_celledit', '行内编辑', '0', 'number', '复选框', 80, null, '0', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, 70, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (14, 'eova_object_code', null, 'biz_intercept', '业务拦截器', '0', 'string', '文本域', 120, null, '0', '1', '0', '1', '1', '1', '0', '0', '0', '继承：com.eova.core.meta.MetaObjectIntercept', null, 'com.metl.intercept.MetlMOIntercept', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (50, 'eova_field_code', null, 'id', 'ID', '1', 'number', '自增框', 10, null, '0', '0', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (51, 'eova_field_code', null, 'object_code', '对象编码', '0', 'string', '查找框', 20, 'EOVA_FIELD_OBJECT_CODE', '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, 'eova_user_code', null, 150, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (52, 'eova_field_code', null, 'en', '字段名', '0', 'string', '文本框', 40, null, '1', '1', '0', '1', '1', '1', '1', '1', '0', '数据库的字段名', null, null, null, 120, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (53, 'eova_field_code', null, 'cn', '中文名', '0', 'string', '文本框', 30, null, '1', '1', '0', '1', '1', '1', '1', '1', '0', '字段对应的中文描述', null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (54, 'eova_field_code', null, 'is_auto', '自增长', '0', 'number', '复选框', 110, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 70, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (55, 'eova_field_code', null, 'data_type', '字段类型', '0', 'string', '下拉框', 60, 'EOVA_FIELD_DATA_TYPE', '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, 'string', null, 70, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (56, 'eova_field_code', null, 'type', '控件类型', '0', 'string', '下拉框', 70, 'EOVA_FIELD_TYPE', '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '文本框', null, 70, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (57, 'eova_field_code', null, 'order_num', '排序', '0', 'number', '文本框', 20, null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '0', null, 50, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (58, 'eova_field_code', null, 'exp', '表达式', '0', 'string', '查找框', 410, 'DICT_CATEGORY', '0', '1', '0', '1', '1', '1', '1', '0', '0', '查找框和下拉框需需要表达式', null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (59, 'eova_field_code', null, 'is_query', '允许查询', '0', 'number', '复选框', 200, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 70, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (60, 'eova_field_code', null, 'is_show', '允许显示', '0', 'number', '复选框', 210, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 70, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (61, 'eova_field_code', null, 'is_order', '允许排序', '0', 'number', '复选框', 280, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 70, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (62, 'eova_field_code', null, 'is_add', '允许新增', '0', 'number', '复选框', 240, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 70, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (63, 'eova_field_code', null, 'is_update', '允许修改', '0', 'number', '复选框', 250, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 70, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (64, 'eova_field_code', null, 'is_required', '是否必填', '0', 'number', '复选框', 270, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 70, 20, null);
commit;
prompt 100 records committed...
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (65, 'eova_field_code', null, 'defaulter', '默认值', '0', 'string', '文本域', 420, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', '缺省默认值', null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (66, 'eova_field_code', null, 'width', '宽度', '0', 'number', '文本框', 90, null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, '130', null, 50, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (67, 'eova_field_code', null, 'height', '高度', '0', 'number', '文本框', 100, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '80', null, 50, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (68, 'eova_field_code', null, 'is_multiple', '是否有多项', '0', 'number', '复选框', 290, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 70, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (69, 'eova_field_code', null, 'is_edit', '允许表内编辑', '0', 'number', '复选框', 260, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 75, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (70, 'eova_field_code', null, 'placeholder', '输入提示', '0', 'string', '文本域', 400, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', 'input的placeholder属性', null, null, null, 230, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (71, 'eova_field_code', null, 'formatter', '格式化器', '0', 'string', '文本域', 440, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', '格式化的JS,参考EasyUI datagrid formatter', null, null, null, 130, 150, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (72, 'eova_field_code', null, 'validator', 'UI校验器', '0', 'string', '文本域', 430, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', 'UI校验规则', null, null, null, 130, 60, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (73, 'eova_field_code', null, 'is_disable', '是否禁用', '0', 'number', '复选框', 220, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 70, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (100, 'eova_menu_code', null, 'id', 'ID', '1', 'number', '自增框', 10, null, '0', '0', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 40, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (101, 'eova_menu_code', null, 'code', '编码', '0', 'string', '文本框', 40, null, '1', '1', '1', '1', '1', '1', '0', '1', '0', null, 'eovacode', null, null, 200, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (102, 'eova_menu_code', null, 'name', '名称', '0', 'string', '文本框', 10, null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 180, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (103, 'eova_menu_code', null, 'type', '类型', '0', 'string', '文本框', 20, null, '0', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 120, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (104, 'eova_menu_code', null, 'icon', '图标', '0', 'string', '图标框', 60, null, '0', '0', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (105, 'eova_menu_code', null, 'order_num', '序号', '0', 'number', '文本框', 90, null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, 30, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (106, 'eova_menu_code', null, 'parent_id', '父节点', '0', 'number', '文本框', 90, null, '0', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 100, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (107, 'eova_menu_code', null, 'is_del', '是否隐藏', '0', 'number', '复选框', 160, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (109, 'eova_menu_code', null, 'biz_intercept', '业务拦截器', '0', 'string', '文本域', 120, null, '0', '0', '0', '1', '1', '1', '0', '0', '0', '继承：模版业务拦截器', null, null, null, 300, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (110, 'eova_menu_code', null, 'url', '自定义功能', '0', 'string', '文本域', 150, null, '0', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (111, 'eova_menu_code', null, 'filter', '过滤条件', '0', 'string', '文本域', 110, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', '例如：status = 1 (只显示状态为1的数据)', null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (112, 'eova_menu_code', null, 'diy_js', '依赖JS', '0', 'string', '文本域', 130, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', '自定义JS文件路径', null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (150, 'eova_button_code', null, 'is_del', '是否隐藏', '0', 'number', '复选框', 300, null, '0', '1', '0', '1', '0', '1', '1', '1', '0', null, null, null, null, 60, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (151, 'eova_button_code', null, 'icon', 'ICON', '0', 'string', '图标框', 30, null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, 'function(value,row,index,field){if(value){return''<span class="tree-icon tree-file ''+value+''"></span>''}return value}', 30, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (152, 'eova_button_code', null, 'id', 'ID', '1', 'number', '自增框', 10, null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, 50, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (153, 'eova_button_code', null, 'menu_code', '菜单编码', '0', 'string', '查找框', 20, 'EOVA_BUTTON_MENU_CODE', '0', '1', '0', '1', '1', '1', '0', '1', '0', null, 'eovacode', null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (154, 'eova_button_code', null, 'name', '功能名称', '0', 'string', '文本框', 40, null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (155, 'eova_button_code', null, 'ui', 'UI路径', '0', 'string', '文本域', 100, null, '1', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, 280, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (156, 'eova_button_code', null, 'bs', 'BS路径', '0', 'string', '文本域', 200, null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 250, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (157, 'eova_button_code', null, 'order_num', '序号', '0', 'number', '文本框', 60, null, '0', '1', '0', '1', '1', '1', '1', '1', '0', '按钮的显示顺序', 'digits', '10', null, 50, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (158, 'eova_button_code', null, 'group_num', '分组号', '0', 'number', '文本框', 70, null, '0', '1', '0', '1', '1', '1', '1', '1', '0', 'Toolbar分组号', 'digits', '0', null, 50, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (159, 'eova_button_code', null, 'is_base', '是否基础功能', '0', 'number', '复选框', 80, null, '0', '0', '0', '1', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (200, 'eova_user_code', null, 'nickname', '昵称', '0', 'string', '文本框', 10, null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (201, 'eova_user_code', null, 'login_id', '登录帐号', '0', 'string', '文本框', 20, null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (202, 'eova_user_code', null, 'login_pwd', '登录密码', '0', 'string', '文本框', 30, null, '0', '0', '0', '0', '1', '0', '0', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (203, 'eova_user_code', null, 'rid', '角色', '0', 'number', '下拉框', 40, 'EOVA_USER_RID', '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (204, 'eova_user_code', null, 'id', 'ID', '1', 'number', '自增框', 0, null, '0', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (205, 'eova_user_code', null, 'hotel_id', '所属酒店', '0', 'number', '下拉框', 50, 'HOTEL', '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (220, 'eova_role_code', null, 'id', 'ID', '1', 'number', '自增框', 0, null, '0', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (221, 'eova_role_code', null, 'name', '角色名', '0', 'string', '文本框', 0, null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (222, 'eova_role_code', null, 'info', '角色描述', '0', 'string', '文本框', 0, null, '0', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 230, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (240, 'eova_dict_code', null, 'id', 'ID', '1', 'number', '自增框', 10, null, '0', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (241, 'eova_dict_code', null, 'value', '值', '0', 'string', '文本框', 20, null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (242, 'eova_dict_code', null, 'name', '名称', '0', 'string', '文本框', 30, null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (243, 'eova_dict_code', null, 'object', '对象', '0', 'string', '文本框', 40, null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (244, 'eova_dict_code', null, 'field', '字段', '0', 'string', '文本框', 50, null, '1', '1', '0', '1', '1', '1', '0', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (260, 'eova_log_code', null, 'id', 'id', '1', 'number', '自增框', 10, null, '0', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (261, 'eova_log_code', null, 'user_id', '操作用户', '0', 'number', '查找框', 20, 'EOVA_USER', '1', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (262, 'eova_log_code', null, 'type', '日志类型', '0', 'number', '文本框', 30, 'EOVA_LOG_TYPE', '1', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (263, 'eova_log_code', null, 'ip', '操作IP', '0', 'string', '文本框', 40, null, '1', '1', '0', '1', '1', '1', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (264, 'eova_log_code', null, 'info', '详情', '0', 'string', '文本框', 50, null, '1', '1', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 400, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (280, 'eova_task_code', null, 'id', 'ID', '1', 'number', '自增框', 10, null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, 50, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (281, 'eova_task_code', null, 'state', '状态', '0', 'number', '下拉框', 20, 'EOVA_TASK_STATE', '1', '1', '0', '1', '0', '0', '0', '0', '0', null, null, '0', null, 50, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (282, 'eova_task_code', null, 'name', '名称', '0', 'string', '文本框', 30, null, '1', '1', '0', '1', '1', '1', '1', '1', '0', '任务简称', null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (283, 'eova_task_code', null, 'exp', '表达式', '0', 'string', '文本域', 40, null, '0', '1', '0', '1', '1', '1', '1', '1', '0', 'Quartz表达式', null, '0 0 0/1 * * ?', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (284, 'eova_task_code', null, 'class', '实现类', '0', 'string', '文本域', 50, null, '1', '1', '0', '1', '1', '1', '1', '1', '0', 'Job实现类', null, null, null, 230, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (285, 'eova_task_code', null, 'info', '说明', '0', 'string', '文本域', 60, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', '任务的详细描述', null, null, null, 330, 50, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (2040, 'meta_template', null, 'meta', 'meta', '0', 'string', '文本框', 90, null, '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21544, 'METL_DATABASE', null, 'validation_query', '测试查询', '0', 'string', '文本域', 250, null, '0', '1', '0', '0', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21792, 'eova_task_code', null, 'create_date', '创建时间', '0', 'string', '时间框', 80, null, '1', '1', '0', '1', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21791, 'eova_task_code', null, 'config_info', '配置信息', '0', 'string', 'JSON框', 70, null, '0', '0', '0', '0', '0', '1', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21369, 'METL_DATABASE', null, 'oid', '对象主键', '0', 'string', '文本框', 10, null, '0', '0', '1', '0', '0', '1', '0', '0', '0', null, null, 'sys_guid() ', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21370, 'METL_DATABASE', null, 'ocode', '对象代码', '0', 'string', '文本框', 20, null, '1', '1', '1', '1', '1', '1', '0', '1', '0', null, 'remote[/common/notExistValueByTable?name=ocode&table=metl_database&ds=metl, oid]', null, null, 80, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21371, 'METL_DATABASE', null, 'oname', '对象名称', '0', 'string', '文本框', 30, null, '1', '1', '0', '0', '1', '1', '1', '1', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21372, 'METL_DATABASE', null, 'odescribe', '对象描述', '0', 'string', '文本域', 40, null, '0', '0', '0', '0', '1', '1', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21373, 'METL_DATABASE', null, 'oorder', '对象排序', '0', 'number', '文本框', 50, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, '50000', null, 80, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21374, 'METL_DATABASE', null, 'simple_spell', '对象简拼', '0', 'string', '文本框', 60, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21375, 'METL_DATABASE', null, 'full_spell', '对象全拼', '0', 'string', '文本域', 70, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21376, 'METL_DATABASE', null, 'create_date', '创建时间', '0', 'string', '时间框', 80, null, '0', '1', '0', '1', '0', '0', '0', '0', '0', null, null, 'to_char(sysdate,''yyyymmddhh24miss'')', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21377, 'METL_DATABASE', null, 'update_date', '更新时间', '0', 'string', '文本框', 90, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, 'to_char(sysdate,''yyyymmddhh24miss'')', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21378, 'METL_DATABASE', null, 'create_user', '创建人', '0', 'string', '文本框', 100, null, '0', '1', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 100, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21379, 'METL_DATABASE', null, 'update_user', '更新人', '0', 'string', '文本框', 110, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21380, 'METL_DATABASE', null, 'expand', '扩展信息', '0', 'string', 'JSON框', 50000, null, '0', '0', '0', '0', '1', '1', '0', '0', '0', null, null, '{}', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21381, 'METL_DATABASE', null, 'is_disable', '是否禁用', '0', 'string', '复选框', 130, null, '1', '1', '0', '0', '1', '1', '1', '1', '0', null, null, '0', null, 80, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21382, 'METL_DATABASE', null, 'flag1', '备用1', '0', 'string', '文本框', 140, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21383, 'METL_DATABASE', null, 'flag2', '备用2', '0', 'string', '文本框', 150, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21384, 'METL_DATABASE', null, 'organization_name', '机构名称', '0', 'string', '文本域', 160, null, '1', '1', '0', '0', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21385, 'METL_DATABASE', null, 'organization_code', '机构代码', '0', 'string', '文本框', 170, null, '1', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21386, 'METL_DATABASE', null, 'type', '数据库类型', '0', 'string', '下拉框', 180, 'DATABASE_TYPE', '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, 'oracle', null, 80, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21387, 'METL_DATABASE', null, 'access_way', '访问方式', '0', 'string', '下拉框', 190, 'METL_DATABASE_ACCESS_WAY', '0', '1', '0', '1', '1', '1', '1', '1', '0', null, null, 'Native', null, 80, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21388, 'METL_DATABASE', null, 'jndi', 'JNDI名称', '0', 'string', '文本框', 200, null, '0', '1', '0', '0', '1', '1', '1', '0', '0', null, null, null, null, 80, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21389, 'METL_DATABASE', null, 'url', '连接串', '0', 'string', '文本域', 210, null, '1', '1', '0', '0', '1', '1', '1', '0', '0', null, null, null, null, 300, 60, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21390, 'METL_DATABASE', null, 'username', '用户名', '0', 'string', '文本框', 220, null, '1', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 80, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21391, 'METL_DATABASE', null, 'password', '密码', '0', 'string', '文本框', 230, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 80, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21414, 'METL_DATABASE', null, 'status', '状态', '0', 'string', '下拉框', 240, 'LINK_STATUS', '1', '1', '1', '0', '0', '1', '0', '0', '0', null, null, '0', null, 80, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21648, 'R_JOB', null, 'run_status', '运行状态', '0', 'string', '下拉框', 71, 'JOB_RUN_STATUS', '1', '1', '1', '0', '1', '1', '0', '0', '0', null, null, null, null, 60, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21649, 'V_JOB_PARAMS', null, 'id_job', '作业', '0', 'number', '查找框', 10, 'KETTLE_JOB', '1', '1', '1', '1', '1', '1', '0', '0', '0', null, null, null, null, 200, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21650, 'V_JOB_PARAMS', null, 'ocode', '参数名称', '0', 'string', '文本域', 20, null, '1', '1', '1', '1', '1', '1', '0', '0', '0', null, null, null, null, 150, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21651, 'V_JOB_PARAMS', null, 'oname', '参数描述', '0', 'string', '文本域', 30, null, '1', '1', '1', '0', '1', '1', '0', '0', '0', null, null, null, null, 250, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21652, 'V_JOB_PARAMS', null, 'param_default', '默认值', '0', 'string', '文本域', 40, null, '0', '1', '1', '0', '1', '1', '0', '0', '0', null, null, null, null, 250, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21653, 'V_JOB_PARAMS', null, 'value', '变量值', '0', 'string', '文本域', 50, null, '0', '1', '0', '0', '1', '1', '1', '0', '0', null, null, null, null, 250, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21671, 'R_JOB', null, 'last_update', '最后更新时间', '0', 'string', '时间框', 72, null, '0', '1', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 150, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21672, 'JOB_LOG', null, 'oid', '对象主键', '0', 'string', '文本框', 10, null, '0', '0', '0', '1', '1', '1', '1', '1', '0', null, null, 'sys_guid() ', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21673, 'JOB_LOG', null, 'ocode', '对象代码', '0', 'string', '文本框', 20, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21674, 'JOB_LOG', null, 'oname', '对象名称', '0', 'string', '文本框', 30, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21675, 'JOB_LOG', null, 'odescribe', '对象描述', '0', 'string', '文本域', 40, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21676, 'JOB_LOG', null, 'oorder', '对象排序', '0', 'number', '文本框', 50, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21677, 'JOB_LOG', null, 'simple_spell', '对象简拼', '0', 'string', '文本框', 60, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21678, 'JOB_LOG', null, 'full_spell', '对象全拼', '0', 'string', '文本域', 70, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21679, 'JOB_LOG', null, 'create_date', '创建时间', '0', 'string', '文本框', 80, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, 'to_char(sysdate,''yyyymmddhh24miss'')', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21680, 'JOB_LOG', null, 'update_date', '更新时间', '0', 'string', '文本框', 90, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, 'to_char(sysdate,''yyyymmddhh24miss'')', null, 130, 20, null);
commit;
prompt 200 records committed...
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21681, 'JOB_LOG', null, 'create_user', '创建人', '0', 'string', '文本框', 100, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21682, 'JOB_LOG', null, 'update_user', '更新人', '0', 'string', '文本框', 110, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21683, 'JOB_LOG', null, 'expand', '扩展信息', '0', 'string', '文本域', 120, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, '''{}''', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21684, 'JOB_LOG', null, 'is_disable', '是否禁用', '0', 'string', '文本框', 130, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, '''0''', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21685, 'JOB_LOG', null, 'flag1', '备用1', '0', 'string', '文本框', 140, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21686, 'JOB_LOG', null, 'flag2', '备用2', '0', 'string', '文本框', 150, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21687, 'JOB_LOG', null, 'id_job', '作业ID', '0', 'number', '文本框', 160, null, '1', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 40, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21688, 'JOB_LOG', null, 'job_name', '作业名称', '0', 'string', '文本框', 170, null, '1', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 230, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21689, 'JOB_LOG', null, 'start_date', '开始时间', '0', 'string', '时间框', 180, null, '1', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21690, 'JOB_LOG', null, 'end_date', '结束时间', '0', 'string', '时间框', 190, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21691, 'JOB_LOG', null, 'result', '运行结果', '0', 'string', '下拉框', 200, 'JOB_RUN_STATUS', '1', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 60, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21692, 'JOB_LOG', null, 'log_file', '日志文件', '0', 'string', '文本域', 210, null, '0', '1', '0', '1', '1', '1', '1', '0', '0', null, null, null, 'function(value, row, index, field) {' || chr(13) || '' || chr(10) || '    if (value) {' || chr(13) || '' || chr(10) || '        return ''<a onclick="window.open(\''/common/downloadJdlj?fileDir=''+encodeURI(value)+''\'');" style="color:red;cursor: pointer;">下载</a>'';' || chr(13) || '' || chr(10) || '    }' || chr(13) || '' || chr(10) || '    return value;' || chr(13) || '' || chr(10) || '}', 60, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21711, 'eova_log_code', null, 'create_date', '创建时间', '0', 'string', '时间框', 60, null, '1', '1', '0', '0', '0', '0', '0', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21752, 'METL_KETTLE_LOG', null, 'oid', '对象主键', '0', 'string', '文本框', 10, null, '0', '0', '0', '1', '1', '1', '1', '1', '0', null, null, 'sys_guid() ', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21753, 'METL_KETTLE_LOG', null, 'ocode', '对象代码', '0', 'string', '文本框', 20, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21754, 'METL_KETTLE_LOG', null, 'oname', '对象名称', '0', 'string', '文本框', 30, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21755, 'METL_KETTLE_LOG', null, 'odescribe', '对象描述', '0', 'string', '文本域', 40, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21756, 'METL_KETTLE_LOG', null, 'oorder', '对象排序', '0', 'number', '文本框', 50, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, '5000000', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21757, 'METL_KETTLE_LOG', null, 'simple_spell', '对象简拼', '0', 'string', '文本框', 60, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21758, 'METL_KETTLE_LOG', null, 'full_spell', '对象全拼', '0', 'string', '文本域', 70, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21759, 'METL_KETTLE_LOG', null, 'create_date', '创建时间', '0', 'string', '文本框', 80, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, 'to_char(sysdate,''yyyymmddhh24miss'')', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21760, 'METL_KETTLE_LOG', null, 'update_date', '更新时间', '0', 'string', '文本框', 90, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, 'to_char(sysdate,''yyyymmddhh24miss'')', null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21761, 'METL_KETTLE_LOG', null, 'create_user', '创建人', '0', 'string', '文本框', 100, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21762, 'METL_KETTLE_LOG', null, 'update_user', '更新人', '0', 'string', '文本框', 110, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
insert into EOVA_FIELD (ID, OBJECT_CODE, PO_CODE, EN, CN, IS_AUTO, DATA_TYPE, TYPE, ORDER_NUM, EXP, IS_QUERY, IS_SHOW, IS_DISABLE, IS_ORDER, IS_ADD, IS_UPDATE, IS_EDIT, IS_REQUIRED, IS_MULTIPLE, PLACEHOLDER, VALIDATOR, DEFAULTER, FORMATTER, WIDTH, HEIGHT, CONFIG)
values (21763, 'METL_KETTLE_LOG', null, 'expand', '扩展信息', '0', 'string', '文本域', 120, null, '0', '0', '0', '1', '1', '1', '1', '0', '0', null, null, null, null, 130, 20, null);
commit;
prompt 225 records loaded
prompt Loading EOVA_LOG...
prompt Table is empty
prompt Loading EOVA_MENU...
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (10363, 'diy_cron', 'cron', 'diy', 'icon-bell', 20, 10264, '0', null, '/plugins/cron/index.htm', '{}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (10343, 'list_kettle_log', 'kettle日志', 'single_grid', 'icon-bookdelete', 30, 10283, '0', null, null, '{"objectCode":"METL_KETTLE_LOG"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (53, 'list_project', '项目管理', 'single_grid', 'icon-applicationosxhome', 30, 2, '0', null, null, '{"objectCode":"METL_PROJECT"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (10283, 'dir_job', '作业管理', 'dir', 'icon-applicationformedit', 1, 3, '0', null, null, '{}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (10284, 'list_job', '作业管理', 'single_grid', 'icon-applicationviewtile', 1, 10283, '0', null, null, '{"objectCode":"R_JOB"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (10227, 'dir_conf', '配置管理', 'dir', 'icon-borderdraw', 15, 3, '0', null, null, '{}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (10229, 'list_database', '数据库管理', 'single_grid', 'icon-databaseconnect', 1, 10227, '0', null, null, '{"objectCode":"METL_DATABASE"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (10181, 'dir_dict', '字典管理', 'dir', 'icon-book', 10, 3, '0', null, null, '{}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (10182, 'list_unify_dict', '统一字典', 'single_grid', 'icon-bookaddresses', 10, 10181, '0', null, null, '{"objectCode":"METL_UNIFY_DICT"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (1, 'eova', '平台维护', 'dir', 'icon-bricks', 40, 0, '0', null, null, null, null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (2, 'sys', '系统管理', 'dir', 'icon-cog', 30, 0, '0', null, null, null, null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (3, 'biz', '综合业务', 'dir', 'icon-plugin', 10, 0, '0', null, null, null, null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (20, 'eova_menu', '菜单管理', 'single_tree', 'icon-applicationsidetree', 1, 1, '0', 'com.eova.core.menu.MenuIntercept', null, '{"objectCode":"eova_menu_code","treegrid":{"iconField":"icon","parentField":"parent_id","treeField":"name"}}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (21, 'eova_button', '按钮管理', 'tree_grid', 'icon-layout', 2, 1, '0', null, null, '{"objectCode":"eova_button_code"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (22, 'eova_object', '元数据管理', 'master_slave_grid', 'icon-databasetable', 3, 1, '0', 'com.eova.core.object.ObjectIntercept', null, '{"fields":["object_code"],"objectCode":"eova_object_code","objectField":"code","objects":["eova_field_code"]}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (23, 'eova_dictionary', '字典管理', 'single_grid', 'icon-bookopen', 5, 1, '0', null, null, '{"objectCode":"eova_dict_code"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (24, 'eova_icon', '图标实例', 'diy', 'icon-applicationviewicons', 6, 1, '0', null, '/toIcon', null, null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (25, 'eova_task', '定时调度', 'single_grid', 'icon-clock', 4, 10283, '0', null, null, '{"objectCode":"eova_task_code"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (50, 'sys_auth_user', '用户管理', 'single_grid', 'icon-group', 10, 2, '0', null, null, '{"objectCode":"eova_user_code"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (51, 'sys_auth_role', '角色管理', 'single_grid', 'icon-groupkey', 20, 2, '0', null, null, '{"objectCode":"eova_role_code"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (52, 'sys_log', '系统日志', 'single_grid', 'icon-tablemultiple', 1000, 2, '0', null, null, '{"objectCode":"eova_log_code"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (1001, 'biz_demo_users', '单表CRUD', 'single_grid', 'icon-grouplink', 1, 1000, '0', null, null, '{"objectCode":"player_code"}', null, '0', 'where status = 1 or status = 2', '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (1002, 'biz_demo_tool', '富文本编辑', 'single_grid', 'icon-controller', 1, 1000, '0', null, null, '{"objectCode":"item_code"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (1003, 'biz_demo_usersitem', '下拉和查找', 'single_grid', 'icon-controller', 1, 1000, '0', null, null, '{"objectCode":"users_item_code"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (1004, 'biz_demo_usersview', '多表视图', 'single_grid', 'icon-applicationviewcolumns', 1, 1000, '0', null, null, '{"objectCode":"v_users_code"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (1005, 'biz_demo_userscell', '表格单元格编辑', 'single_grid', 'icon-applicationviewcolumns', 1, 1000, '0', null, null, '{"objectCode":"celledit_users_code"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (1006, 'biz_demo_import', '导入导出', 'single_grid', 'icon-arrowswitch', 1, 1000, '0', null, null, '{"objectCode":"player_code"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (1007, 'biz_users_exp', '非自增主键拓展表', 'single_grid', 'icon-applicationdouble', 1, 1000, '0', null, null, '{"objectCode":"users_exp_code"}', '/ui/js/diy/test.js', '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (1008, 'biz_comment', '评论管理', 'single_grid', 'icon-comments', 10, 1000, '0', null, null, '{"objectCode":"COMMENTS"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (1009, 'biz_product', '产品管理', 'single_grid', 'icon-box', 1, 1000, '0', null, null, '{"objectCode":"product"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (1010, 'biz_hotelzz', '酒店管理', 'master_slave_grid', 'icon-building', 1, 1000, '0', null, null, '{"fields":["hotel_id","hotel_id"],"objectCode":"hotel","objectField":"id","objects":["hotel_bed","hotel_stock"]}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (1011, 'biz_caidan', '三级菜单', 'dir', null, 1, 1000, '0', null, null, '{}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (1012, 'biz_4j', '四级目录', 'dir', null, 1, 1011, '0', null, null, '{}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (1013, 'biz_4j_test1', '仅显有功能目录', 'single_grid', 'icon-applicationosxcascade', 1, 1012, '0', null, null, '{"objectCode":"player_code"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (1014, 'biz_demo_area', '区域管理', 'single_tree', 'icon-applicationsidetree', 0, 1000, '0', null, null, '{"objectCode":"biz_demo_area"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (10276, 'diy_druid', 'druid', 'diy', 'icon-colorswatch', 1, 10264, '0', null, '/druid/index.html', '{}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (10264, 'dir_assist', '辅助工具', 'dir', 'icon-bulletwrenchred', 50, 3, '0', null, null, '{}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (10285, 'list_job_params', '作业参数设置', 'single_grid', 'icon-applicationformedit', 10000, 10283, '0', null, null, '{"objectCode":"V_JOB_PARAMS"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (10303, 'list_job_log', '作业日志', 'single_grid', 'icon-bookaddresseserror', 20, 10283, '0', null, null, '{"objectCode":"JOB_LOG"}', null, '0', null, '0');
insert into EOVA_MENU (ID, CODE, NAME, TYPE, ICON, ORDER_NUM, PARENT_ID, IS_COLLAPSE, BIZ_INTERCEPT, URL, CONFIG, DIY_JS, IS_DEL, FILTER, IS_NEW_TAB)
values (10364, 'diy_json', 'JSON', 'diy', 'icon-applicationtilehorizontal', 30, 10264, '0', null, '/plugins/json/index.htm', '{}', null, '0', null, '0');
commit;
prompt 40 records loaded
prompt Loading EOVA_MENU_OBJECT...
prompt Table is empty
prompt Loading EOVA_OBJECT...
insert into EOVA_OBJECT (ID, CODE, NAME, VIEW_NAME, TABLE_NAME, PK_NAME, DATA_SOURCE, IS_SINGLE, IS_CELLEDIT, IS_SHOW_NUM, IS_FIRST_LOAD, FILTER, DEFAULT_ORDER, DIY_CARD, DIY_JS, BIZ_INTERCEPT)
values (10303, 'METL_KETTLE_LOG', 'kettle日志', null, 'metl_kettle_log', 'oid', 'metl', '1', '0', '1', '1', null, 'start_time desc', null, null, null);
insert into EOVA_OBJECT (ID, CODE, NAME, VIEW_NAME, TABLE_NAME, PK_NAME, DATA_SOURCE, IS_SINGLE, IS_CELLEDIT, IS_SHOW_NUM, IS_FIRST_LOAD, FILTER, DEFAULT_ORDER, DIY_CARD, DIY_JS, BIZ_INTERCEPT)
values (11, 'METL_PROJECT', '项目', null, 'metl_project', 'oid', 'eova', '1', '0', '1', '1', null, 'create_date desc', null, null, 'com.oss.intercept.MetlMOIntercept');
insert into EOVA_OBJECT (ID, CODE, NAME, VIEW_NAME, TABLE_NAME, PK_NAME, DATA_SOURCE, IS_SINGLE, IS_CELLEDIT, IS_SHOW_NUM, IS_FIRST_LOAD, FILTER, DEFAULT_ORDER, DIY_CARD, DIY_JS, BIZ_INTERCEPT)
values (10243, 'R_JOB', '作业', 'v_job', 'r_job', 'id_job', 'kettle', '0', '1', '1', '1', null, 'last_update desc', null, null, 'com.oss.intercept.JobIntercept');
insert into EOVA_OBJECT (ID, CODE, NAME, VIEW_NAME, TABLE_NAME, PK_NAME, DATA_SOURCE, IS_SINGLE, IS_CELLEDIT, IS_SHOW_NUM, IS_FIRST_LOAD, FILTER, DEFAULT_ORDER, DIY_CARD, DIY_JS, BIZ_INTERCEPT)
values (10206, 'METL_DATABASE', '数据库管理', null, 'metl_database', 'oid', 'metl', '1', '1', '1', '1', null, 'oorder asc', null, null, 'com.oss.intercept.DatabaseIntercept');
insert into EOVA_OBJECT (ID, CODE, NAME, VIEW_NAME, TABLE_NAME, PK_NAME, DATA_SOURCE, IS_SINGLE, IS_CELLEDIT, IS_SHOW_NUM, IS_FIRST_LOAD, FILTER, DEFAULT_ORDER, DIY_CARD, DIY_JS, BIZ_INTERCEPT)
values (10161, 'METL_UNIFY_DICT', '统一字典', null, 'metl_unify_dict', 'oid', 'metl', '0', '1', '1', '1', null, 'dict_category asc,oorder asc', null, null, 'com.oss.intercept.UnifyDictIntercept');
insert into EOVA_OBJECT (ID, CODE, NAME, VIEW_NAME, TABLE_NAME, PK_NAME, DATA_SOURCE, IS_SINGLE, IS_CELLEDIT, IS_SHOW_NUM, IS_FIRST_LOAD, FILTER, DEFAULT_ORDER, DIY_CARD, DIY_JS, BIZ_INTERCEPT)
values (1, 'meta_template', '元对象模版数据', null, 'eova_template', 'id', 'eova', '1', '0', '1', '1', null, null, null, null, null);
insert into EOVA_OBJECT (ID, CODE, NAME, VIEW_NAME, TABLE_NAME, PK_NAME, DATA_SOURCE, IS_SINGLE, IS_CELLEDIT, IS_SHOW_NUM, IS_FIRST_LOAD, FILTER, DEFAULT_ORDER, DIY_CARD, DIY_JS, BIZ_INTERCEPT)
values (2, 'eova_menu_code', '菜单', null, 'eova_menu', 'id', 'eova', '0', '1', '1', '1', 'where id > 0 ', 'order_num asc', null, null, 'com.eova.core.menu.MenuIntercept');
insert into EOVA_OBJECT (ID, CODE, NAME, VIEW_NAME, TABLE_NAME, PK_NAME, DATA_SOURCE, IS_SINGLE, IS_CELLEDIT, IS_SHOW_NUM, IS_FIRST_LOAD, FILTER, DEFAULT_ORDER, DIY_CARD, DIY_JS, BIZ_INTERCEPT)
values (3, 'eova_object_code', '对象', null, 'eova_object', 'id', 'eova', '0', '0', '1', '1', 'where id > 0 ', 'id desc', null, null, 'com.eova.core.object.ObjectIntercept');
insert into EOVA_OBJECT (ID, CODE, NAME, VIEW_NAME, TABLE_NAME, PK_NAME, DATA_SOURCE, IS_SINGLE, IS_CELLEDIT, IS_SHOW_NUM, IS_FIRST_LOAD, FILTER, DEFAULT_ORDER, DIY_CARD, DIY_JS, BIZ_INTERCEPT)
values (4, 'eova_field_code', '字段', null, 'eova_field', 'id', 'eova', '1', '1', '1', '1', null, 'order_num', null, null, null);
insert into EOVA_OBJECT (ID, CODE, NAME, VIEW_NAME, TABLE_NAME, PK_NAME, DATA_SOURCE, IS_SINGLE, IS_CELLEDIT, IS_SHOW_NUM, IS_FIRST_LOAD, FILTER, DEFAULT_ORDER, DIY_CARD, DIY_JS, BIZ_INTERCEPT)
values (5, 'eova_button_code', '按钮', null, 'eova_button', 'id', 'eova', '0', '0', '1', '1', 'where id > 0', 'order_num asc', null, null, null);
insert into EOVA_OBJECT (ID, CODE, NAME, VIEW_NAME, TABLE_NAME, PK_NAME, DATA_SOURCE, IS_SINGLE, IS_CELLEDIT, IS_SHOW_NUM, IS_FIRST_LOAD, FILTER, DEFAULT_ORDER, DIY_CARD, DIY_JS, BIZ_INTERCEPT)
values (6, 'eova_user_code', '用户', null, 'eova_user', 'id', 'eova', '1', '0', '1', '1', null, 'id desc', null, null, 'com.eova.core.user.UserIntercept');
insert into EOVA_OBJECT (ID, CODE, NAME, VIEW_NAME, TABLE_NAME, PK_NAME, DATA_SOURCE, IS_SINGLE, IS_CELLEDIT, IS_SHOW_NUM, IS_FIRST_LOAD, FILTER, DEFAULT_ORDER, DIY_CARD, DIY_JS, BIZ_INTERCEPT)
values (7, 'eova_role_code', '角色管理', null, 'eova_role', 'id', 'eova', '1', '0', '1', '1', null, 'id desc', null, null, null);
insert into EOVA_OBJECT (ID, CODE, NAME, VIEW_NAME, TABLE_NAME, PK_NAME, DATA_SOURCE, IS_SINGLE, IS_CELLEDIT, IS_SHOW_NUM, IS_FIRST_LOAD, FILTER, DEFAULT_ORDER, DIY_CARD, DIY_JS, BIZ_INTERCEPT)
values (8, 'eova_dict_code', '字典管理', null, 'eova_dict', 'id', 'eova', '1', '0', '1', '1', null, 'id desc', null, null, null);
insert into EOVA_OBJECT (ID, CODE, NAME, VIEW_NAME, TABLE_NAME, PK_NAME, DATA_SOURCE, IS_SINGLE, IS_CELLEDIT, IS_SHOW_NUM, IS_FIRST_LOAD, FILTER, DEFAULT_ORDER, DIY_CARD, DIY_JS, BIZ_INTERCEPT)
values (9, 'eova_log_code', '操作日志', null, 'eova_log', 'id', 'eova', '1', '0', '1', '1', null, 'id desc', null, null, null);
insert into EOVA_OBJECT (ID, CODE, NAME, VIEW_NAME, TABLE_NAME, PK_NAME, DATA_SOURCE, IS_SINGLE, IS_CELLEDIT, IS_SHOW_NUM, IS_FIRST_LOAD, FILTER, DEFAULT_ORDER, DIY_CARD, DIY_JS, BIZ_INTERCEPT)
values (10, 'eova_task_code', '定时调度', null, 'eova_task', 'id', 'eova', '1', '0', '1', '1', null, 'create_date desc', null, null, 'com.eova.core.task.TaskIntercept');
insert into EOVA_OBJECT (ID, CODE, NAME, VIEW_NAME, TABLE_NAME, PK_NAME, DATA_SOURCE, IS_SINGLE, IS_CELLEDIT, IS_SHOW_NUM, IS_FIRST_LOAD, FILTER, DEFAULT_ORDER, DIY_CARD, DIY_JS, BIZ_INTERCEPT)
values (10244, 'V_JOB_PARAMS', '作业参数', 'v_job_params', null, 'id_job', 'kettle', '1', '1', '1', '1', null, null, null, null, 'com.oss.intercept.JobParamsIntercept');
insert into EOVA_OBJECT (ID, CODE, NAME, VIEW_NAME, TABLE_NAME, PK_NAME, DATA_SOURCE, IS_SINGLE, IS_CELLEDIT, IS_SHOW_NUM, IS_FIRST_LOAD, FILTER, DEFAULT_ORDER, DIY_CARD, DIY_JS, BIZ_INTERCEPT)
values (10263, 'JOB_LOG', '作业日志', null, 'job_log', 'oid', 'kettle', '1', '0', '1', '1', null, 'start_date desc', null, null, null);
commit;
prompt 17 records loaded
prompt Loading EOVA_ROLE...
insert into EOVA_ROLE (ID, NAME, INFO)
values (1, '超级管理员', '开发者权限(禁止作为业务权限)');
insert into EOVA_ROLE (ID, NAME, INFO)
values (2, '管理员', '管理所有可用功能');
insert into EOVA_ROLE (ID, NAME, INFO)
values (3, '测试', '测试人员');
insert into EOVA_ROLE (ID, NAME, INFO)
values (51, 'kettle使用者', 'kettle使用者');
commit;
prompt 4 records loaded
prompt Loading EOVA_ROLE_BTN...
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4097, 1, 11145);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4007, 1, 11010);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4008, 1, 11143);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4009, 1, 11144);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4010, 1, 11013);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4011, 1, 11123);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4012, 1, 11011);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4013, 1, 11012);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4014, 1, 11083);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4015, 1, 80);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4016, 1, 81);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4017, 1, 82);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4018, 1, 83);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4019, 1, 86);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4020, 1, 87);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4021, 1, 88);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4022, 1, 11023);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4023, 1, 11027);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4024, 1, 11103);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4025, 1, 11107);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4026, 1, 11014);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4027, 1, 11018);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4028, 1, 10751);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4029, 1, 10752);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4030, 1, 10753);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4031, 1, 10754);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4032, 1, 10755);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4033, 1, 10756);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4034, 1, 10828);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4035, 1, 10829);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4036, 1, 10830);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4037, 1, 10831);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4038, 1, 10832);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4039, 1, 10975);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4040, 1, 120);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4041, 1, 121);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4042, 1, 122);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4043, 1, 123);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4044, 1, 124);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4045, 1, 125);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4046, 1, 100);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4047, 1, 101);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4048, 1, 102);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4049, 1, 103);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4050, 1, 104);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4051, 1, 105);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4052, 1, 106);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4053, 1, 146);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4054, 1, 147);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4055, 1, 148);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4056, 1, 149);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4057, 1, 150);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4058, 1, 140);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4059, 1, 1);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4060, 1, 3);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4061, 1, 4);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4062, 1, 9);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4063, 1, 8);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4064, 1, 7);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4065, 1, 40);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4066, 1, 41);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4067, 1, 42);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4068, 1, 43);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4069, 1, 44);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4070, 1, 45);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4071, 1, 46);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4072, 1, 20);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4073, 1, 21);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4074, 1, 22);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4075, 1, 23);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4076, 1, 29);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4077, 1, 28);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4078, 1, 25);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4079, 1, 26);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4080, 1, 27);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4081, 1, 60);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4082, 1, 61);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4083, 1, 62);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4084, 1, 63);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4085, 1, 64);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4086, 1, 65);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4005, 1, 11003);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4006, 1, 11063);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4134, 51, 11003);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4135, 51, 11063);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4136, 51, 11010);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4137, 51, 11143);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4138, 51, 11144);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4139, 51, 11013);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4140, 51, 11011);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4141, 51, 11012);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4142, 51, 11083);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4143, 51, 80);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4144, 51, 81);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4145, 51, 82);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4146, 51, 83);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4147, 51, 86);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4148, 51, 87);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4149, 51, 88);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4150, 51, 11023);
commit;
prompt 100 records committed...
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4151, 51, 11027);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4152, 51, 11103);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4153, 51, 11107);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4154, 51, 10828);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4155, 51, 10829);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4156, 51, 10830);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4157, 51, 10831);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4158, 51, 10832);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4159, 51, 10975);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4160, 51, 11145);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4161, 51, 11146);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (4098, 1, 11146);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (2859, 3, 11010);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (2857, 3, 11003);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (2858, 3, 11007);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1202, 2, 1053);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1203, 2, 1054);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1204, 2, 1055);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1205, 2, 1056);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1206, 2, 1018);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1207, 2, 1019);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1208, 2, 1020);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1209, 2, 1021);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1210, 2, 1022);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1211, 2, 1023);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1212, 2, 1065);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1213, 2, 1066);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1214, 2, 1067);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1215, 2, 1068);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1216, 2, 1069);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1217, 2, 1070);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1218, 2, 1059);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1219, 2, 1012);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1220, 2, 1013);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1221, 2, 1014);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1222, 2, 1015);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1223, 2, 1016);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1224, 2, 1017);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1225, 2, 1006);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1226, 2, 1007);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1227, 2, 1008);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1228, 2, 1009);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1229, 2, 1010);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1230, 2, 1011);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1231, 2, 1000);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1232, 2, 1001);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1233, 2, 1002);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1234, 2, 1003);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1235, 2, 1004);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1236, 2, 1005);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1237, 2, 1024);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1238, 2, 1025);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1239, 2, 1026);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1240, 2, 1027);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1241, 2, 1028);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1242, 2, 1029);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1255, 2, 1036);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1256, 2, 1037);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1257, 2, 1038);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1258, 2, 1039);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1259, 2, 1040);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1260, 2, 1041);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1261, 2, 1071);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1262, 2, 1042);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1263, 2, 1043);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1264, 2, 1044);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1265, 2, 1045);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1266, 2, 1046);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1267, 2, 1047);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1268, 2, 1048);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1269, 2, 1049);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1270, 2, 1050);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1271, 2, 1051);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1272, 2, 1052);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1273, 2, 1030);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1274, 2, 1031);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1275, 2, 1032);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1276, 2, 1033);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1277, 2, 1034);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1278, 2, 1035);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1279, 2, 120);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1280, 2, 121);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1281, 2, 122);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1282, 2, 123);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1283, 2, 124);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1284, 2, 125);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1285, 2, 100);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1286, 2, 101);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1287, 2, 102);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1288, 2, 103);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1289, 2, 104);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1290, 2, 105);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1291, 2, 106);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1292, 2, 140);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1368, 31, 10753);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1369, 31, 10754);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1370, 31, 10755);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1371, 31, 10756);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1366, 31, 10751);
insert into EOVA_ROLE_BTN (ID, RID, BID)
values (1367, 31, 10752);
commit;
prompt 200 records loaded
prompt Loading EOVA_TASK...
insert into EOVA_TASK (ID, STATE, NAME, EXP, CLASS, INFO, OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, CONFIG_INFO)
values (122, 0, '项目状态监测', '0 */1 * * * ?', 'com.oss.job.ProjectChackExamine', '项目状态监测', '657E922F8A0544C2A680949FCE34D0C3', null, null, null, null, null, null, '20170612094500', '20170612094500', null, null, null, '0', null, null, null);
insert into EOVA_TASK (ID, STATE, NAME, EXP, CLASS, INFO, OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, CONFIG_INFO)
values (148, 0, '测试kettle作业运行', '*/20 * * * * ?', 'com.oss.job.KettleJobRunner', '测试kettle作业运行,按顺序执行，前一个失败则不执行后续作业', 'C4476F7A6FF54A56A4BB7A359798E421', null, null, null, null, null, null, '20170613181437', '20170613181437', null, null, null, '0', null, null, '{"作业id列表":[37,38,37]}');
insert into EOVA_TASK (ID, STATE, NAME, EXP, CLASS, INFO, OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, CONFIG_INFO)
values (121, 1, 'kettle作业管理', '*/10 * * * * ?', 'com.oss.job.JobManager', '进行作业状态更新，日志文件记录等', '1A2763192127443CBE2D6D4898168E63', null, null, null, null, null, null, '20170612094500', '20170612094500', null, null, null, '0', null, null, '{"是否写日志文件":true,"日志文件大小(M)":10,"日志文件路径":"/tmp/kettle-manager/logs/kettle"}');
insert into EOVA_TASK (ID, STATE, NAME, EXP, CLASS, INFO, OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, CONFIG_INFO)
values (149, 0, 'shell测试', '0 */1 * * * ?', 'com.oss.job.KettleJobRunner', '测试单个作业执行', '4968D3222156427A80A15F2407173F75', null, null, null, null, null, null, '20170613183516', '20170613183516', null, null, null, '0', null, null, '{"作业id列表":[36]}');
commit;
prompt 4 records loaded
prompt Loading EOVA_USER...
insert into EOVA_USER (ID, LOGIN_ID, LOGIN_PWD, NICKNAME, RID, HOTEL_ID)
values (1, 'admin', '89BDF69372C2EF53EA409CDF020B5694', '超级管理员', 1, 0);
insert into EOVA_USER (ID, LOGIN_ID, LOGIN_PWD, NICKNAME, RID, HOTEL_ID)
values (2, 'eova', '89BDF69372C2EF53EA409CDF020B5694', '管理员', 2, 0);
insert into EOVA_USER (ID, LOGIN_ID, LOGIN_PWD, NICKNAME, RID, HOTEL_ID)
values (3, 'test', '89BDF69372C2EF53EA409CDF020B5694', '测试', 3, 19);
insert into EOVA_USER (ID, LOGIN_ID, LOGIN_PWD, NICKNAME, RID, HOTEL_ID)
values (51, 'kettle', '1CAE7817908C2B19D8382E113E357E61', 'kettle使用者', 51, 0);
commit;
prompt 4 records loaded
prompt Loading EOVA_WIDGET...
insert into EOVA_WIDGET (ID, TYPE, VALUE, NAME, VERSION, PATH, DESCRIPTION, CONFIG)
values (17, 1, '定时框', '定时框', '1', null, null, null);
insert into EOVA_WIDGET (ID, TYPE, VALUE, NAME, VERSION, PATH, DESCRIPTION, CONFIG)
values (1, 1, '文本框', '文本框', '1', null, null, null);
insert into EOVA_WIDGET (ID, TYPE, VALUE, NAME, VERSION, PATH, DESCRIPTION, CONFIG)
values (2, 1, '下拉框', '下拉框', '1', null, null, null);
insert into EOVA_WIDGET (ID, TYPE, VALUE, NAME, VERSION, PATH, DESCRIPTION, CONFIG)
values (3, 1, '查找框', '查找框', '1', null, null, null);
insert into EOVA_WIDGET (ID, TYPE, VALUE, NAME, VERSION, PATH, DESCRIPTION, CONFIG)
values (4, 1, '时间框', '时间框', '1', null, null, null);
insert into EOVA_WIDGET (ID, TYPE, VALUE, NAME, VERSION, PATH, DESCRIPTION, CONFIG)
values (5, 1, '文本域', '文本域', '1', null, null, null);
insert into EOVA_WIDGET (ID, TYPE, VALUE, NAME, VERSION, PATH, DESCRIPTION, CONFIG)
values (6, 1, '编辑框', '编辑框', '1', null, null, null);
insert into EOVA_WIDGET (ID, TYPE, VALUE, NAME, VERSION, PATH, DESCRIPTION, CONFIG)
values (7, 1, '复选框', '复选框', '1', null, null, null);
insert into EOVA_WIDGET (ID, TYPE, VALUE, NAME, VERSION, PATH, DESCRIPTION, CONFIG)
values (8, 1, '自增框', '自增框', '1', null, null, null);
insert into EOVA_WIDGET (ID, TYPE, VALUE, NAME, VERSION, PATH, DESCRIPTION, CONFIG)
values (9, 1, '图片框', '图片框', '1', null, null, null);
insert into EOVA_WIDGET (ID, TYPE, VALUE, NAME, VERSION, PATH, DESCRIPTION, CONFIG)
values (10, 1, '图标框', '图标框', '1', null, null, null);
insert into EOVA_WIDGET (ID, TYPE, VALUE, NAME, VERSION, PATH, DESCRIPTION, CONFIG)
values (11, 1, '文件框', '文件框', '1', null, null, null);
insert into EOVA_WIDGET (ID, TYPE, VALUE, NAME, VERSION, PATH, DESCRIPTION, CONFIG)
values (12, 1, '日期框', '日期框', '1', null, null, null);
insert into EOVA_WIDGET (ID, TYPE, VALUE, NAME, VERSION, PATH, DESCRIPTION, CONFIG)
values (13, 2, '密码框', '密码框', '1', '/widget/password/index.html', '我的密码框，系统不给，自己造一个，大家一起爽歪歪', null);
insert into EOVA_WIDGET (ID, TYPE, VALUE, NAME, VERSION, PATH, DESCRIPTION, CONFIG)
values (14, 2, '数字框', '数字框', '1', '/widget/number/index.html', 'number', null);
insert into EOVA_WIDGET (ID, TYPE, VALUE, NAME, VERSION, PATH, DESCRIPTION, CONFIG)
values (15, 2, '颜色框', '颜色框', '1', '/widget/color/index.html', 'color', null);
insert into EOVA_WIDGET (ID, TYPE, VALUE, NAME, VERSION, PATH, DESCRIPTION, CONFIG)
values (16, 1, 'JSON框', 'JSON框', '1', null, null, null);
commit;
prompt 17 records loaded
prompt Loading METL_DATABASE...
insert into METL_DATABASE (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, ORGANIZATION_NAME, ORGANIZATION_CODE, TYPE, ACCESS_WAY, JNDI, URL, USERNAME, PASSWORD, STATUS, VALIDATION_QUERY)
values ('559A88034DFB4F74A95169DB2A9AB0FD', 'eova', 'EOVA库', null, 20, 'EOVAK', 'EOVAKU', '20160527233602', '20160528180125', '超级管理员', '超级管理员', null, '0', null, null, '马进举', 'jinjuma@yeah.net', null, 'Native', null, null, null, null, '1', null);
insert into METL_DATABASE (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, ORGANIZATION_NAME, ORGANIZATION_CODE, TYPE, ACCESS_WAY, JNDI, URL, USERNAME, PASSWORD, STATUS, VALIDATION_QUERY)
values ('E3E0187BCA1348FCAEBC6331E5985F50', 'metl', 'METL库', null, 30, 'METLK', 'METLKU', '20160527145525', '20160527234527', '超级管理员', '超级管理员', null, '0', null, null, '马进举', 'jinjuma@yeah.net', null, 'Native', null, null, null, null, '1', null);
insert into METL_DATABASE (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, ORGANIZATION_NAME, ORGANIZATION_CODE, TYPE, ACCESS_WAY, JNDI, URL, USERNAME, PASSWORD, STATUS, VALIDATION_QUERY)
values ('E6FE57302AA04409AA5DC621836B1E25', 'kettle', 'kettle库', null, 40, 'KETTLEK', 'KETTLEKU', '20160527145710', '20160728153831', '超级管理员', '超级管理员', null, '0', null, null, '马进举', 'jinjuma@yeah.net', null, 'Native', null, null, null, null, '1', null);
commit;
prompt 3 records loaded
prompt Loading METL_KETTLE_LOG...
prompt Table is empty
prompt Loading METL_PROJECT...
insert into METL_PROJECT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, URL, PASSWORD, STATUS)
values ('51910F3D810A4AC18AED678F19FE1BF3', 'KM_LOCALHOST_82', '本地JOB', null, 10, 'BDJOB', 'BENDIJOB', '20170226103325', '20170226164805', '超级管理员', '超级管理员', '""', '0', null, null, 'http://localhost:82', null, '1');
insert into METL_PROJECT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, URL, PASSWORD, STATUS)
values ('F17AA35869F64309B148001A09C30DF3', 'KM_LOCALHOST_86', '本地JOB_86', null, 20, 'BDJOB_86', 'BENDIJOB_86', '20170226143104', '20170303210534', '超级管理员', '超级管理员', null, '0', null, null, 'http://127.0.0.1:86', '34567ikhfrtyuik,', '2');
commit;
prompt 2 records loaded
prompt Loading METL_TASK_TIMING...
prompt Table is empty
prompt Loading METL_UNIFY_DICT...
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('DCE42C3BD015437B9707802CB5E5CF5A', 'WHETHER', '逻辑判断', '通用逻辑判断字典，建议非特殊情况都使用该字典', 30, 'LJPD', 'LUOJIPANDUAN', '20160524201222', '20160604004826', '超级管理员', '超级管理员', '{}', '0', null, null, 'DICT_CATEGORY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('3111E6E98B654E8E88894391FA1C113B', '0', '否', null, 10, 'F', 'FOU', '20160524201410', '20160526102009', '超级管理员', '超级管理员', null, '0', null, null, 'WHETHER', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('9A65E67CF2FC4CDBBBCB1F09369C148D', '1', '是', null, 20, 'S', 'SHI', '20160524201423', '20160526102009', '超级管理员', '超级管理员', null, '0', null, null, 'WHETHER', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('EE601D0D053E4F14A129A88E508AD933', 'ENCODING', '控制编码', '常见字符编码格式', 60, 'KZBM', 'KONGZHIBIANMA', '20160527131054', '20160527131105', '超级管理员', '超级管理员', null, '0', null, null, 'DICT_CATEGORY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('56CED973BDD74A7888E9C8C6AC016C4E', 'UTF-8', 'UTF-8', null, 10, 'UTF-8', 'UTF-8', '20160527131243', '20160527131243', '超级管理员', null, null, '0', null, null, 'ENCODING', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('6A53C4C7465242849A445784F068B000', 'GBK', 'GBK', null, 20, 'GBK', 'GBK', '20160527131316', '20160527131316', '超级管理员', null, null, '0', null, null, 'ENCODING', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('CF52AA5538AB4E4ABFD170F7E28DDCFD', 'oracle', 'oracle', null, 10, 'ORACLE', 'ORACLE', '20160527133353', '20160613125113', '超级管理员', '超级管理员', '{"validationQuery":"select 1 from dual"}', '0', null, null, 'DATABASE_TYPE', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('B932DC680E4A4656AA9DE9AF9A709824', 'mysql', 'mysql', null, 20, 'MYSQL', 'MYSQL', '20160527133412', '20160613125206', '超级管理员', '超级管理员', '{"validationQuery":"select 1"}', '0', null, null, 'DATABASE_TYPE', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('EF29D46F564B449A9197F3334DFBDD32', 'PostgreSQL', 'PostgreSQL', null, 30, 'POSTGRESQL', 'POSTGRESQL', '20160527133447', '20160613125206', '超级管理员', '超级管理员', '{"validationQuery":"select 1"}', '0', null, null, 'DATABASE_TYPE', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('1BC37801320C4305AB6E1B03DFBB62BE', 'JNDI', 'JNDI', null, 20, 'JNDI', 'JNDI', '20160527133811', '20160528184059', '超级管理员', '超级管理员', null, '0', null, null, 'METL_DATABASE_ACCESS_WAY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('ADEE0A06649148F5813327BD52F6B5A8', 'Native', 'Native', null, 10, 'NATIVE', 'NATIVE', '20160527133946', '20160527134050', '超级管理员', '超级管理员', null, '0', null, null, 'METL_DATABASE_ACCESS_WAY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('8218B78E29F4408EA5E277E3B763ABBC', 'LINK_STATUS', '连接状态', '用于数据库、ftp等服务的连接状态记录', 40, 'LJZT', 'LIANJIEZHUANGTAI', '20160527152626', '20160604013843', '超级管理员', '超级管理员', '{}', '0', null, null, 'DICT_CATEGORY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('4C5F9D89130A43A09C106919D5716D42', '0', '未知', '没有测试过', 1000, 'WZ', 'WEIZHI', '20160527152737', '20160527152737', '超级管理员', null, null, '0', null, null, 'LINK_STATUS', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('ABEFAF6C294F4ABAA8E46ACB171A5ADF', '1', '成功', '成功，测试时间参考更新时间，若修改关键配置需要将相关状态置为未知', 1000, 'CG', 'CHENGGONG', '20160527152835', '20160527153104', '超级管理员', '超级管理员', null, '0', null, null, 'LINK_STATUS', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('0559815554FC4C52A2CD8D82B81B41CD', '2', '失败', '失败，查看日志', 1000, 'SB', 'SHIBAI', '20160527152918', '20160527153104', '超级管理员', '超级管理员', null, '0', null, null, 'LINK_STATUS', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('2F71E657E74245639543D2FBE5E34505', 'KETTLE_JOB', 'kettle作业', 'Kettle作业名称和id的字典', 50000, 'kettleZY', 'kettleZUOYE', '20160628093252', '20161110165849', '超级管理员', '超级管理员', '{"sql":"select id_job as id,name as 名称,description as 描述 from r_job;ds=kettle"}', '0', null, null, 'DICT_CATEGORY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('EE6C8E8DD0D646A88A9BF0D38F7EBCDC', 'StartFailed', '启动失败', null, 60, 'QDSB', 'QIDONGSHIBAI', '20160801180318', '20160801180359', '超级管理员', '超级管理员', '{}', '0', null, null, 'JOB_RUN_STATUS', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('4996DC6A599241569C82A9ABB121C6EA', 'user_info_crypt_pwd', '用户信息加密密码', null, 50000, 'YHXXJMMM', 'YONGHUXINXIJIAMIMIMA', '20160823170742', '20160823173444', '超级管理员', '超级管理员', '{"pwd":"34567ikhfrtyuik,"}', '0', null, null, 'GENERAL_CONFIG', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('45AD980F436F4239B7C5913AA3926CBC', 'kettle_druid', 'kettle的druid配置', '包含druid数据源配置模板和配置路径', 50000, 'KETTLEDDRUIDPZ', 'KETTLEDEDRUIDPEIZHI', '20160612174447', '20160824120210', '超级管理员', '超级管理员', '{"configTemplate":{"value":"#ds=${name}\n${name}/converter=com.alibaba.druid.support.simplejndi.DruidDataSourceConverter\n${name}/type=javax.sql.DataSource\n${name}/url=${url}\n${name}/username=${user}\n${name}/password=${pwd}\n${name}/maxActive=50\n${name}/minIdle=10\n${name}/initialSize=5\n${name}/validationQuery=select 1 from dual\n${name}/maxWait=10000\n${name}/removeabandoned=true\n${name}/removeabandonedtimeout=60\n${name}/logabandoned=false\n${name}/filters=stat,config,log4j\n${name}/connectionProperties=druid.log.stmt.executableSql=true;druid.stat.logSlowSql=true;config.decrypt=true;config.decrypt.key=${decryptKey}\n\n","describe":"druid数据源配置模板"},"configPath":[]}', '0', null, null, 'GENERAL_CONFIG', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('9FAB02BD83B14D309574BB6B138D034E', 'SCHEDULER_TYPE', '定时类型', null, 20060, 'DSLX', 'DINGSHILEIXING', '20160608131813', '20160608151127', '超级管理员', '超级管理员', '{}', '0', null, null, 'DICT_CATEGORY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('B3E2D55FA8AA4A7F9C2F00ABAD8B7D4E', '3', '周', null, 40, 'Z', 'ZHOU', '20160608132105', '20160719174353', '超级管理员', '超级管理员', '{}', '0', null, null, 'SCHEDULER_TYPE', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('D3A0D5A55C6942A0A7B2268054D09E06', '4', '月', null, 50, 'Y', 'YUE', '20160608132130', '20160719174353', '超级管理员', '超级管理员', '{}', '0', null, null, 'SCHEDULER_TYPE', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('74CCB9BB1C774C9789E729BD779117A8', '0', '不需要定时', null, 10, 'BXYDS', 'BUXUYAODINGSHI', '20160608131906', '20160719174353', '超级管理员', '超级管理员', '{}', '0', null, null, 'SCHEDULER_TYPE', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('91F8B3AFF15D4E038BED941A81B11985', '1', '时间间隔', null, 20, 'SJJG', 'SHIJIANJIANGE', '20160608132004', '20160719174353', '超级管理员', '超级管理员', '{}', '0', null, null, 'SCHEDULER_TYPE', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('1A88F8C2E25C4BFBB5DBE19914395C38', '2', '天', null, 30, 'T', 'TIAN', '20160608132031', '20160719174353', '超级管理员', '超级管理员', '{}', '0', null, null, 'SCHEDULER_TYPE', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('AB44F94F87394E6EA4B350BD04D68956', 'StopFailed', '异常停止', null, 70, 'YCTZ', 'YICHANGTINGZHI', '20160803214429', '20160803214438', '超级管理员', '超级管理员', '{}', '0', null, null, 'JOB_RUN_STATUS', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('35B834E54B9C45BCB66E657F1FBB5A3B', 'KETTLE_JOB_TYPE', 'kettle作业类别', null, 50000, 'KETTLEZYLB', 'KETTLEZUOYELEIBIE', '20170610203006', '20170610204909', '超级管理员', '超级管理员', '{}', '0', null, null, 'DICT_CATEGORY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('99C7129784FF4774BABBEC617A4EF01B', 'shell', 'shell作业', 'linux脚本', 10, 'SHELLZY', 'SHELLZUOYE', '20170610203521', '20170611182928', '超级管理员', '超级管理员', '{}', '0', null, null, 'KETTLE_JOB_TYPE', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('434164AB7C0D44A2B302CB7F1F3EF516', 'javascript', 'JS作业', null, 30, 'JSZY', 'JSZUOYE', '20170610204017', '20170612093222', '超级管理员', '超级管理员', '{}', '0', null, null, 'KETTLE_JOB_TYPE', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('F225D34D92DF41FBBC03F1EE71CFF18A', 'general', '常规作业', '直接在kettle中设计的作业默认类别', 1, 'CGZY', 'CHANGGUIZUOYE', '20170610204833', '20170612093204', '超级管理员', '超级管理员', '{}', '0', null, null, 'KETTLE_JOB_TYPE', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('B3EB322AC64148C69B6F2CF3A0D0AEED', 'km', 'KM作业', '就是基于我开发的KettleUtil插件开发的作业', 40, 'KMZY', 'KMZUOYE', '20170614092017', '20170614095818', '超级管理员', '超级管理员', '{}', '0', null, null, 'KETTLE_JOB_TYPE', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('9E2D66212AD644259193A24BCA5AF092', 'sql', 'sql作业', '先支持oracle吧', 20, 'SQLZY', 'SQLZUOYE', '20170611162223', '20170611231607', '超级管理员', '超级管理员', '{}', '0', null, null, 'KETTLE_JOB_TYPE', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('BD01A8A69AE24D5384E876E861F097C1', 'PROJECT', '项目', null, 1020, 'XM', 'XIANGMU', '20170226103557', '20170226103822', '超级管理员', '超级管理员', '{"sql":"select ocode ID,oname CN from metl_project where is_disable=''0'' order by oorder asc,ocode asc;ds=metl"}', '0', null, null, 'DICT_CATEGORY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('DE4C4BC691724D6889E576303904BB26', 'repository', '资源库', null, 50000, 'ZYK', 'ZIYUANKU', '20170226142756', '20170226142756', '超级管理员', null, '{}', '0', null, null, 'DICT_CATEGORY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('D99B2CA85EC44E3883823C7D9CB93D4D', 'KETTLE_DEFAULT', '默认资源库', null, 50000, 'MRZYK', 'MORENZIYUANKU', '20170226142920', '20170226170734', '超级管理员', '超级管理员', '{}', '0', null, null, 'repository', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('28E3876EAD2746419CE8ABC97D48D9DB', 'JOB_RUN_STATUS', '作业运行状态', null, 50000, 'ZYYXZT', 'ZUOYEYUNXINGZHUANGTAI', '20160728231058', '20160728231058', '超级管理员', null, '{}', '0', null, null, 'DICT_CATEGORY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('716435C781CE4045ACB04427C7DB3F0E', 'Waiting', '等待中', null, 40, 'DDZ', 'DENGDAIZHONG', '20160728231130', '20160728232705', '超级管理员', '超级管理员', '{}', '0', null, null, 'JOB_RUN_STATUS', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('E32A141CB0C540519E2286F4B8FB7A9C', 'Halting', '犹豫的', null, 50, 'YYD', 'YOUYUDE', '20160728231311', '20160728232705', '超级管理员', '超级管理员', '{}', '0', null, null, 'JOB_RUN_STATUS', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('AC23281282344D57BD486FFC11AA53DB', 'Running', '运行中', null, 20, 'YXZ', 'YUNXINGZHONG', '20160728231354', '20160728232705', '超级管理员', '超级管理员', '{}', '0', null, null, 'JOB_RUN_STATUS', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('DEA51A2FE3824A77985BDF8B55B7FB6B', 'Stopped', '停止的', null, 10, 'TZD', 'TINGZHIDE', '20160728232430', '20160728232705', '超级管理员', '超级管理员', '{}', '0', null, null, 'JOB_RUN_STATUS', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('C7976A2962404AE29E517F4DCB4AFDEF', 'Finished', '完成的', null, 30, 'WCD', 'WANCHENGDE', '20160728232501', '20160728232705', '超级管理员', '超级管理员', '{}', '0', null, null, 'JOB_RUN_STATUS', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('977C5FF51FF7405F9301B0A669AC3C78', 'KETTLE_JOB_STATUS', 'kettle作业状态', null, 20000, 'KETTLEZYZT', 'KETTLEZUOYEZHUANGTAI', '20160616112838', '20160616112923', '超级管理员', '超级管理员', '{}', '0', null, null, 'DICT_CATEGORY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('14443F9F3683414C96A7D74C4BFD511E', '1', '草案', null, 10, 'CA', 'CAOAN', '20160616113048', '20160616113426', '超级管理员', '超级管理员', '{}', '0', null, null, 'KETTLE_JOB_STATUS', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('4E50E7353BF04C808088552658B5362C', '2', '产品', null, 20, 'CP', 'CHANPIN', '20160616113108', '20160616113241', '超级管理员', '超级管理员', '{}', '0', null, null, 'KETTLE_JOB_STATUS', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('E851EA13D2D045F68FAFBAD11A5EB1EB', '0', '未知', null, 1, 'WZ', 'WEIZHI', '20160616114119', '20160616114132', '超级管理员', '超级管理员', '{}', '0', null, null, 'KETTLE_JOB_STATUS', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('2C9DFF84CD194EC9990D52EE60CA03D8', 'EOVA_FIELD_OBJECT_CODE', '字段_对象编码', null, 50000, 'ZD_DXBM', 'ZIDUAN_DUIXIANGBIANMA', '20160603185631', '20160603185631', '超级管理员', null, '{"sql":"select code 编码,name 名称 from eova_object where id > -1 order by id desc;ds=eova"}', '0', null, null, 'DICT_CATEGORY', 'eova.eova_field.object_code');
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('A7057520143E4A96A51ACF7C0901BF44', 'EOVA_FIELD_DATA_TYPE', '字段_字段类型', null, 50000, 'ZD_ZDLX', 'ZIDUAN_ZIDUANLEIXING', '20160603185631', '20160603185631', '超级管理员', null, '{"sql":"select value ID,name CN from eova_dict where object = ''eova_field'' and field = ''data_type'';ds=eova"}', '0', null, null, 'DICT_CATEGORY', 'eova.eova_field.data_type');
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('BA3F1119AE334546AB09C3129AEFC5B9', 'EOVA_FIELD_TYPE', '字段_控件类型', null, 50000, 'ZD_KJLX', 'ZIDUAN_KONGJIANLEIXING', '20160603185631', '20160603185631', '超级管理员', null, '{"sql":"select value ID,name CN from eova_widget;ds=eova"}', '0', null, null, 'DICT_CATEGORY', 'eova.eova_field.type');
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('6F3E373FC43440E8900354C4B6FAB318', 'EOVA_BUTTON_MENU_CODE', '按钮_菜单编码', null, 50000, 'AN_CDBM', 'ANNIU_CAIDANBIANMA', '20160603185631', '20160603185631', '超级管理员', null, '{"sql":"select code 菜单编码,name 菜单名称 from eova_menu where 1=1;ds=eova"}', '0', null, null, 'DICT_CATEGORY', 'eova.eova_button.menu_code');
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('09C92AA68F0741BA8CC4EFCD1AAEC8E4', 'EOVA_USER_RID', '用户_角色', null, 50000, 'YH_JS', 'YONGHU_JIAOSE', '20160603185631', '20160603185631', '超级管理员', null, '{"sql":"select id ID,name CN from eova_role where 1=1;ds=eova"}', '0', null, null, 'DICT_CATEGORY', 'eova.eova_user.rid');
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('E2BD3A0C4C214945B4768F91FC348329', 'EOVA_USER', 'EOVA用户', null, 20040, 'CZRZ_CZYH', 'CAOZUORIZHI_CAOZUOYONGHU', '20160603185631', '20160604120755', '超级管理员', '超级管理员', '{"sql":"select id UID,nickname 用户名 from eova_user where 1=1;ds=eova"}', '0', null, null, 'DICT_CATEGORY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('6914BAAFADF948C4B418EE95174B9573', 'EOVA_LOG_TYPE', '操作日志_日志类型', null, 50000, 'CZRZ_RZLX', 'CAOZUORIZHI_RIZHILEIXING', '20160603185631', '20160603185631', '超级管理员', null, '{"sql":"select value ID,name CN from eova_dict where object = ''eova_log'' and field = ''type'';ds=eova"}', '0', null, null, 'DICT_CATEGORY', 'eova.eova_log.type');
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('B278564D9C35448AAC46E39E3F4D8D63', 'EOVA_TASK_STATE', '定时调度_状态', null, 50000, 'DSDD_ZT', 'DINGSHIDIAODU_ZHUANGTAI', '20160603185631', '20160603185631', '超级管理员', null, '{"sql":"select value ID,name CN from eova_dict where object = ''eova_job'' and field = ''state'';ds=eova"}', '0', null, null, 'DICT_CATEGORY', 'eova.eova_task.state');
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('5765AA90F6FF4DD38503D6FA02BB88E8', 'GENERAL_CONFIG', '一般配置', null, 80, 'YBPZ', 'YIBANPEIZHI', '20160612172745', '20160612175246', '超级管理员', '超级管理员', '{}', '0', null, null, 'DICT_CATEGORY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('6F5D1AC502444762A6BED1DB887084AB', 'DATABASE', '数据库', null, 1000, 'SJK', 'SHUJUKU', '20160530124650', '20161110204243', '超级管理员', '超级管理员', '{"sql":"select ocode ID,oname CN from metl_database where status=''1'' and is_disable=''0'' order by oorder asc;ds=metl"}', '0', null, null, 'DICT_CATEGORY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('817DE243ADE34CFCB5AC427A8A062655', 'DATA_OBJECT', '数据对象', null, 20010, 'SJDX', 'SHUJUDUIXIANG', '20160603185631', '20161111152354', '超级管理员', '超级管理员', '{"sql":"select ocode ID,oname 名称 from metl_data_object where is_disable=''0'' order by oorder asc;ds=metl"}', '0', null, null, 'DICT_CATEGORY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('EE406AC64FF640B4BC21726D69D6E82A', '3', '星期三', null, 40, 'XQS', 'XINGQISAN', '20160608132512', '20160608132657', '超级管理员', '超级管理员', '{}', '0', null, null, 'WEEK_DAY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('735843A374A548FBA0770CA759A32BE1', '6', '星期六', null, 70, 'XQL', 'XINGQILIU', '20160608132550', '20160608132657', '超级管理员', '超级管理员', '{}', '0', null, null, 'WEEK_DAY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('A926C002379C48A0A922190929FD445B', 'DATABASE_TYPE', '数据库类型', null, 1010, 'SJKLX', 'SHUJUKULEIXING', '20160603185631', '20170226103639', '超级管理员', '超级管理员', '{}', '0', null, null, 'DICT_CATEGORY', 'metl.metl_database.type');
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('FB60402C3BED4408908924FFF0180849', 'METL_DATABASE_ACCESS_WAY', '数据库管理_访问方式', null, 50000, 'AJKGL_FWFS', 'ASHUJUKUGUANLI_FANGWENFANGSHI', '20160603185631', '20160603185631', '超级管理员', null, '{}', '0', null, null, 'DICT_CATEGORY', 'metl.metl_database.access_way');
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('32CB61028B9941D1B0F95AD0209B4EF3', 'WEEK_DAY', '星期', null, 70, 'XQ', 'XINGQI', '20160608132337', '20160608132345', '超级管理员', '超级管理员', '{}', '0', null, null, 'DICT_CATEGORY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('F25A37C642F3474C9E7010BB7A0F8006', '0', '星期天', null, 10, 'XQT', 'XINGQITIAN', '20160608132426', '20160719180914', '超级管理员', '超级管理员', '{}', '0', null, null, 'WEEK_DAY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('0224E0879E6A4287A7F53B87AEE0C59B', '1', '星期一', null, 20, 'XQY', 'XINGQIYI', '20160608132441', '20160608132657', '超级管理员', '超级管理员', '{}', '0', null, null, 'WEEK_DAY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('7C0D5B4D196D482586FE2866FC3A886F', '2', '星期二', null, 30, 'XQE', 'XINGQIER', '20160608132457', '20160608132657', '超级管理员', '超级管理员', '{}', '0', null, null, 'WEEK_DAY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('8957ABEE682A464B84166A236ABF8F1B', '4', '星期四', null, 50, 'XQS', 'XINGQISI', '20160608132524', '20160608132657', '超级管理员', '超级管理员', '{}', '0', null, null, 'WEEK_DAY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('E5DD1DB536134724B717EAB7F1B0D814', '5', '星期五', null, 60, 'XQW', 'XINGQIWU', '20160608132536', '20160608132657', '超级管理员', '超级管理员', '{}', '0', null, null, 'WEEK_DAY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('78D647DBFD04494987E8B07294B2E973', 'SUCCESS_FAILED', '成败', '通用字典，描述成功或失败', 20, 'CB', 'CHENGBAI', '20160628095805', '20161108223126', '超级管理员', '超级管理员', '{}', '0', null, null, 'DICT_CATEGORY', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('5922D5F00DD547C1BB0CF4FD08304206', 'unknow', '未知', null, 10, 'WZ', 'WEIZHI', '20160628095929', '20160628095929', '超级管理员', null, '{}', '0', null, null, 'SUCCESS_FAILED', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('3CC0378B52404F30819904D9C22D2815', 'success', '成功', null, 20, 'CG', 'CHENGGONG', '20160628100051', '20160628100121', '超级管理员', '超级管理员', '{}', '0', null, null, 'SUCCESS_FAILED', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('EA096C729D6340F28116ADEB6EDC78DD', 'failed', '失败', null, 30, 'SB', 'SHIBAI', '20160628100107', '20160628100121', '超级管理员', '超级管理员', '{}', '0', null, null, 'SUCCESS_FAILED', null);
insert into METL_UNIFY_DICT (OID, OCODE, ONAME, ODESCRIBE, OORDER, SIMPLE_SPELL, FULL_SPELL, CREATE_DATE, UPDATE_DATE, CREATE_USER, UPDATE_USER, EXPAND, IS_DISABLE, FLAG1, FLAG2, DICT_CATEGORY, BELONG_OBJ)
values ('7AF93E0C1E8348B8AE3FE905885B3D98', 'DICT_CATEGORY', '字典类别', null, 10, 'ZDLB', 'ZIDIANLEIBIE', '20160524194904', '20160805222803', '超级管理员', '超级管理员', '{}', '0', null, null, 'DICT_CATEGORY', 'metl.metl_unify_dict.dict_category');
commit;
prompt 71 records loaded
prompt Enabling triggers for EOVA_BUTTON...
alter table EOVA_BUTTON enable all triggers;
prompt Enabling triggers for EOVA_DICT...
alter table EOVA_DICT enable all triggers;
prompt Enabling triggers for EOVA_FIELD...
alter table EOVA_FIELD enable all triggers;
prompt Enabling triggers for EOVA_LOG...
alter table EOVA_LOG enable all triggers;
prompt Enabling triggers for EOVA_MENU...
alter table EOVA_MENU enable all triggers;
prompt Enabling triggers for EOVA_MENU_OBJECT...
alter table EOVA_MENU_OBJECT enable all triggers;
prompt Enabling triggers for EOVA_OBJECT...
alter table EOVA_OBJECT enable all triggers;
prompt Enabling triggers for EOVA_ROLE...
alter table EOVA_ROLE enable all triggers;
prompt Enabling triggers for EOVA_ROLE_BTN...
alter table EOVA_ROLE_BTN enable all triggers;
prompt Enabling triggers for EOVA_TASK...
alter table EOVA_TASK enable all triggers;
prompt Enabling triggers for EOVA_USER...
alter table EOVA_USER enable all triggers;
prompt Enabling triggers for EOVA_WIDGET...
alter table EOVA_WIDGET enable all triggers;
prompt Enabling triggers for METL_DATABASE...
alter table METL_DATABASE enable all triggers;
prompt Enabling triggers for METL_KETTLE_LOG...
alter table METL_KETTLE_LOG enable all triggers;
prompt Enabling triggers for METL_PROJECT...
alter table METL_PROJECT enable all triggers;
prompt Enabling triggers for METL_TASK_TIMING...
alter table METL_TASK_TIMING enable all triggers;
prompt Enabling triggers for METL_UNIFY_DICT...
alter table METL_UNIFY_DICT enable all triggers;
set feedback on
set define on
prompt Done.
