--------------------------------------------
-- Export file for user KM                --
-- Created by jinju on 2016/8/3, 10:08:30 --
--------------------------------------------

spool km结构.log

prompt
prompt Creating table EOVA_BUTTON
prompt ==========================
prompt
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
  add constraint PK_EOVA_BUTTON primary key (ID)
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

prompt
prompt Creating table EOVA_DICT
prompt ========================
prompt
create table EOVA_DICT
(
  ID     NUMBER(10) not null,
  VALUE  VARCHAR2(50) not null,
  NAME   VARCHAR2(50) not null,
  OBJECT VARCHAR2(50) not null,
  FIELD  VARCHAR2(50) not null
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
alter table EOVA_DICT
  add constraint PK_EOVA_DICT primary key (ID)
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

prompt
prompt Creating table EOVA_FIELD
prompt =========================
prompt
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
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 128K
    next 8K
    minextents 1
    maxextents unlimited
  );
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
  add constraint PK_EOVA_FIELD primary key (ID)
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

prompt
prompt Creating table EOVA_LOG
prompt =======================
prompt
create table EOVA_LOG
(
  ID      NUMBER(10) not null,
  USER_ID NUMBER(10) not null,
  TYPE    NUMBER(10) not null,
  IP      VARCHAR2(255) not null,
  INFO    VARCHAR2(500)
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
comment on column EOVA_LOG.USER_ID
  is '操作用户';
comment on column EOVA_LOG.TYPE
  is '日志类型';
comment on column EOVA_LOG.IP
  is '操作IP';
comment on column EOVA_LOG.INFO
  is '操作详情';
alter table EOVA_LOG
  add constraint PK_EOVA_LOG primary key (ID)
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

prompt
prompt Creating table EOVA_MENU
prompt ========================
prompt
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
  FILTER        VARCHAR2(500)
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
alter table EOVA_MENU
  add constraint PK_EOVA_MENU primary key (ID)
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

prompt
prompt Creating table EOVA_MENU_OBJECT
prompt ===============================
prompt
create table EOVA_MENU_OBJECT
(
  ID          NUMBER(10) not null,
  MENU_CODE   VARCHAR2(50) not null,
  OBJECT_CODE VARCHAR2(50) not null,
  INDEXS      NUMBER(10) default '0'
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column EOVA_MENU_OBJECT.MENU_CODE
  is '菜单编码';
comment on column EOVA_MENU_OBJECT.OBJECT_CODE
  is '对象编码';
comment on column EOVA_MENU_OBJECT.INDEXS
  is '对象索引';
alter table EOVA_MENU_OBJECT
  add constraint PK_EOVA_MENU_OBJECT primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;

prompt
prompt Creating table EOVA_OBJECT
prompt ==========================
prompt
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
  add constraint PK_EOVA_OBJECT primary key (ID)
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

prompt
prompt Creating table EOVA_ROLE
prompt ========================
prompt
create table EOVA_ROLE
(
  ID   NUMBER(10) not null,
  NAME VARCHAR2(255) not null,
  INFO VARCHAR2(255)
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
comment on column EOVA_ROLE.NAME
  is '角色名';
comment on column EOVA_ROLE.INFO
  is '角色描述';
alter table EOVA_ROLE
  add constraint PK_EOVA_ROLE primary key (ID)
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

prompt
prompt Creating table EOVA_ROLE_BTN
prompt ============================
prompt
create table EOVA_ROLE_BTN
(
  ID  NUMBER(10) not null,
  RID NUMBER(10) not null,
  BID NUMBER(10) not null
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
comment on column EOVA_ROLE_BTN.RID
  is '角色';
comment on column EOVA_ROLE_BTN.BID
  is '功能';
alter table EOVA_ROLE_BTN
  add constraint PK_EOVA_ROLE_BTN primary key (ID)
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

prompt
prompt Creating table EOVA_TASK
prompt ========================
prompt
create table EOVA_TASK
(
  ID    NUMBER(10) not null,
  STATE NUMBER(10) default '0' not null,
  NAME  VARCHAR2(255) not null,
  EXP   VARCHAR2(50) not null,
  CLASS VARCHAR2(255) not null,
  INFO  VARCHAR2(255)
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
alter table EOVA_TASK
  add constraint PK_EOVA_TASK primary key (ID)
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

prompt
prompt Creating table EOVA_USER
prompt ========================
prompt
create table EOVA_USER
(
  ID        NUMBER(10) not null,
  LOGIN_ID  VARCHAR2(30) not null,
  LOGIN_PWD VARCHAR2(50) not null,
  NICKNAME  VARCHAR2(255),
  RID       NUMBER(10) default '0',
  HOTEL_ID  NUMBER(10) default '0'
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
  add constraint PK_EOVA_USER primary key (ID)
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

prompt
prompt Creating table EOVA_WIDGET
prompt ==========================
prompt
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
  add constraint PK_EOVA_WIDGET primary key (ID)
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

prompt
prompt Creating table METL_CHINESE_SPELL
prompt =================================
prompt
create table METL_CHINESE_SPELL
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
  FLAG2        VARCHAR2(200)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 3M
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table METL_CHINESE_SPELL
  is '数据库';
comment on column METL_CHINESE_SPELL.OID
  is '对象主键';
comment on column METL_CHINESE_SPELL.OCODE
  is '对象代码';
comment on column METL_CHINESE_SPELL.ONAME
  is '对象名称';
comment on column METL_CHINESE_SPELL.ODESCRIBE
  is '对象描述';
comment on column METL_CHINESE_SPELL.OORDER
  is '对象排序';
comment on column METL_CHINESE_SPELL.SIMPLE_SPELL
  is '对象简拼';
comment on column METL_CHINESE_SPELL.FULL_SPELL
  is '对象全拼';
comment on column METL_CHINESE_SPELL.CREATE_DATE
  is '创建时间';
comment on column METL_CHINESE_SPELL.UPDATE_DATE
  is '更新时间';
comment on column METL_CHINESE_SPELL.CREATE_USER
  is '创建人';
comment on column METL_CHINESE_SPELL.UPDATE_USER
  is '更新人';
comment on column METL_CHINESE_SPELL.EXPAND
  is '扩展信息';
comment on column METL_CHINESE_SPELL.IS_DISABLE
  is '是否禁用';
comment on column METL_CHINESE_SPELL.FLAG1
  is '备用1';
comment on column METL_CHINESE_SPELL.FLAG2
  is '备用2';
alter table METL_CHINESE_SPELL
  add constraint PK_METL_CHINESE_SPELL primary key (OID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_M_C_SPELL_CREATE_DATE on METL_CHINESE_SPELL (CREATE_DATE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_M_C_SPELL_ONAME on METL_CHINESE_SPELL (ONAME)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 384K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index IDX_M_C_SPELL_UPDATE_DATE on METL_CHINESE_SPELL (UPDATE_DATE)
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table METL_DATABASE
prompt ============================
prompt
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
  add constraint PK_METL_DATABASE primary key (OID)
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
create index IDX_M_DATABASE_CREATE_DATE on METL_DATABASE (CREATE_DATE)
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
create index IDX_M_DATABASE_UPDATE_DATE on METL_DATABASE (UPDATE_DATE)
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

prompt
prompt Creating table METL_TASK_TIMING
prompt ===============================
prompt
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
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
    maxextents unlimited
  );
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
  add constraint PK_METL_TASK_TIMING primary key (OID)
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
create index IDX_M_T_TIMING_CREATE_DATE on METL_TASK_TIMING (CREATE_DATE)
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
create index IDX_M_T_TIMING_UPDATE_DATE on METL_TASK_TIMING (UPDATE_DATE)
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

prompt
prompt Creating table METL_UNIFY_DICT
prompt ==============================
prompt
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
  add constraint PK_METL_UNIFY_DICT primary key (OID)
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
create index IDX_M_U_DICT_CREATE_DATE on METL_UNIFY_DICT (CREATE_DATE)
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
create index IDX_M_U_DICT_UPDATE_DATE on METL_UNIFY_DICT (UPDATE_DATE)
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

prompt
prompt Creating sequence SEQ_EOVA_BUTTON
prompt =================================
prompt
create sequence SEQ_EOVA_BUTTON
minvalue 1
maxvalue 9999999999
start with 11023
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_EOVA_DICT
prompt ===============================
prompt
create sequence SEQ_EOVA_DICT
minvalue 1
maxvalue 9999999999
start with 1051
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_EOVA_FIELD
prompt ================================
prompt
create sequence SEQ_EOVA_FIELD
minvalue 1
maxvalue 9999999999
start with 21671
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_EOVA_LOG
prompt ==============================
prompt
create sequence SEQ_EOVA_LOG
minvalue 1
maxvalue 9999999999
start with 3405
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_EOVA_MENU
prompt ===============================
prompt
create sequence SEQ_EOVA_MENU
minvalue 1
maxvalue 9999999999
start with 10303
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_EOVA_MENU_OBJECT
prompt ======================================
prompt
create sequence SEQ_EOVA_MENU_OBJECT
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_EOVA_OBJECT
prompt =================================
prompt
create sequence SEQ_EOVA_OBJECT
minvalue 1
maxvalue 9999999999
start with 10263
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_EOVA_ROLE
prompt ===============================
prompt
create sequence SEQ_EOVA_ROLE
minvalue 1
maxvalue 9999999999
start with 51
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_EOVA_ROLE_BTN
prompt ===================================
prompt
create sequence SEQ_EOVA_ROLE_BTN
minvalue 1
maxvalue 9999999999
start with 2871
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_EOVA_TASK
prompt ===============================
prompt
create sequence SEQ_EOVA_TASK
minvalue 1
maxvalue 9999999999
start with 121
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_EOVA_USER
prompt ===============================
prompt
create sequence SEQ_EOVA_USER
minvalue 1
maxvalue 9999999999
start with 51
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_EOVA_WIDGET
prompt =================================
prompt
create sequence SEQ_EOVA_WIDGET
minvalue 1
maxvalue 9999999999
start with 151
increment by 1
cache 20;

prompt
prompt Creating function F_GET_FULL_SPELL
prompt ==================================
prompt
CREATE OR REPLACE FUNCTION F_GET_FULL_SPELL
(
    p_chinese IN VARCHAR2 DEFAULT NULL
)
RETURN VARCHAR2
AS
  v_result VARCHAR2(500);
  v_Len    INTEGER;
  v_Temp   INTEGER;
  v_TempSpell VARCHAR2(100);
  v_chinese  VARCHAR2(150);
BEGIN
  v_result := '';
  v_Temp := 1;
  v_Len := length(replace(replace(Trim(p_chinese),'　',''),' ',''));---去掉全角空格、半角空格
  WHILE(v_Temp <= v_Len)
  LOOP
     BEGIN
        v_chinese := substr(replace(replace(Trim(p_chinese),'　',''),' ',''),v_Temp,1);
        v_TempSpell := '';
        FOR REC IN (SELECT t.full_spell FROM metl_chinese_spell t WHERE t.oname = v_chinese and t.is_disable='0' and rownum<2)
        LOOP
          v_TempSpell := REC.full_spell;
        END LOOP;
        v_result := v_result || nvl(v_TempSpell,v_chinese);
        v_Temp   := v_Temp + 1;
      END;
  END LOOP;
  Return Upper(Trim(v_result));
END
/*
获取给定字符串的中文全拼
*/
;
/

prompt
prompt Creating function F_GET_SIMPLE_SPELL
prompt ====================================
prompt
CREATE OR REPLACE FUNCTION F_GET_SIMPLE_SPELL
(
    p_chinese IN VARCHAR2 DEFAULT NULL
)
RETURN VARCHAR2
AS
  v_result VARCHAR2(500);
  v_Len    INTEGER;
  v_Temp   INTEGER;
  v_TempSpell VARCHAR2(100);
  v_chinese  VARCHAR2(150);
BEGIN
  v_result := '';
  v_Temp := 1;
  v_Len := length(replace(replace(Trim(p_chinese),'　',''),' ',''));---去掉全角空格、半角空格
  WHILE(v_Temp <= v_Len)
  LOOP
     BEGIN
        v_chinese := substr(replace(replace(Trim(p_chinese),'　',''),' ',''),v_Temp,1);
        v_TempSpell := '';
        FOR REC IN (SELECT t.simple_spell FROM metl_chinese_spell t WHERE t.oname = v_chinese and t.is_disable='0' and rownum<2)
        LOOP
          v_TempSpell := REC.simple_spell;
        END LOOP;
        v_result := v_result || nvl(v_TempSpell,v_chinese);
        v_Temp   := v_Temp + 1;
      END;
  END LOOP;
  Return Upper(Trim(v_result));
END
/*
获取给定字符串的中文简拼
*/
;
/

prompt
prompt Creating function MD5
prompt =====================
prompt
CREATE OR REPLACE FUNCTION MD5(in_str IN VARCHAR2)
RETURN VARCHAR2
IS
retval varchar2(32);
BEGIN
retval := utl_raw.cast_to_raw(DBMS_OBFUSCATION_TOOLKIT.MD5(INPUT_STRING => in_str));
--dbms_output.put_line('<'||in_str||'>的MD5:'||retval);
RETURN retval;
END;
/


spool off
