drop table eova_button;
drop table eova_dict;
drop table eova_field;
drop table eova_log;
drop table eova_menu;
drop table eova_menu_object;
drop table eova_object;
drop table eova_role;
drop table eova_role_btn;
drop table eova_task;
drop table eova_user;
drop table eova_widget;

drop sequence seq_eova_button;
drop sequence seq_eova_dict;
drop sequence seq_eova_field;
drop sequence seq_eova_log;
drop sequence seq_eova_menu;
drop sequence seq_eova_menu_object;
drop sequence seq_eova_object;
drop sequence seq_eova_role;
drop sequence seq_eova_role_btn;
drop sequence seq_eova_task;
drop sequence seq_eova_user;
drop sequence seq_eova_widget;

create sequence seq_eova_button increment by 1 start with 10711 maxvalue 9999999999;
create sequence seq_eova_dict increment by 1 start with 1011 maxvalue 9999999999;
create sequence seq_eova_field increment by 1 start with 21141 maxvalue 9999999999;
create sequence seq_eova_log increment by 1 start with 121 maxvalue 9999999999;
create sequence seq_eova_menu increment by 1 start with 10141 maxvalue 9999999999;
create sequence seq_eova_menu_object increment by 1 start with 01 maxvalue 9999999999;
create sequence seq_eova_object increment by 1 start with 10141 maxvalue 9999999999;
create sequence seq_eova_role increment by 1 start with 31 maxvalue 9999999999;
create sequence seq_eova_role_btn increment by 1 start with 1141 maxvalue 9999999999;
create sequence seq_eova_task increment by 1 start with 121 maxvalue 9999999999;
create sequence seq_eova_user increment by 1 start with 31 maxvalue 9999999999;
create sequence seq_eova_widget increment by 1 start with 151 maxvalue 9999999999;

create table eova_button(
    id NUMBER(10) NOT NULL,
    menu_code VARCHAR2(255) NOT NULL,
    name VARCHAR2(255) NOT NULL,
    icon VARCHAR2(255),
    ui VARCHAR2(255),
    bs VARCHAR2(500),
    order_num NUMBER(10),
    group_num NUMBER(10),
    is_base CHAR(1),
    is_del CHAR(1)
);

alter table eova_button add constraint pk_eova_button primary key(id);
comment on column eova_button.menu_code is '菜单Code';
comment on column eova_button.name is '按钮名称';
comment on column eova_button.icon is '图标';
comment on column eova_button.ui is '按钮UI路径';
comment on column eova_button.bs is '按钮BS路径';
comment on column eova_button.order_num is '排序号';
comment on column eova_button.group_num is '分组号';
comment on column eova_button.is_base is '是否基础功能';
comment on column eova_button.is_del is '是否删除';
alter table eova_button modify order_num default '0';
alter table eova_button modify group_num default '0';
alter table eova_button modify is_base default '0';
alter table eova_button modify is_del default '0';

create table eova_dict(
    id NUMBER(10) NOT NULL,
    value VARCHAR2(50) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    object VARCHAR2(50) NOT NULL,
    field VARCHAR2(50) NOT NULL
);

alter table eova_dict add constraint pk_eova_dict primary key(id);

create table eova_field(
    id NUMBER(10) NOT NULL,
    object_code VARCHAR2(50) NOT NULL,
    po_code VARCHAR2(255),
    en VARCHAR2(50) NOT NULL,
    cn VARCHAR2(50) NOT NULL,
    is_auto CHAR(1),
    data_type VARCHAR2(20),
    type VARCHAR2(10),
    order_num NUMBER(10),
    exp VARCHAR2(800),
    is_query CHAR(1),
    is_show CHAR(1),
    is_disable CHAR(1),
    is_order CHAR(1),
    is_add CHAR(1),
    is_update CHAR(1),
    is_edit CHAR(1),
    is_required CHAR(1),
    is_multiple CHAR(1),
    placeholder VARCHAR2(255),
    validator VARCHAR2(255),
    defaulter VARCHAR2(255),
    formatter VARCHAR2(2000),
    width NUMBER(10),
    height NUMBER(10),
    config VARCHAR2(2000)
);

alter table eova_field add constraint pk_eova_field primary key(id);
comment on column eova_field.id is 'ID';
comment on column eova_field.po_code is '持久化对象';
comment on column eova_field.en is '英文名';
comment on column eova_field.cn is '中文名';
comment on column eova_field.is_auto is '主键是否自增长';
comment on column eova_field.data_type is '数据类型';
comment on column eova_field.type is '控件类型';
comment on column eova_field.order_num is '排序索引';
comment on column eova_field.exp is '控件表达式';
comment on column eova_field.is_query is '是否可查询';
comment on column eova_field.is_show is '是否可显示';
comment on column eova_field.is_disable is '是否禁用';
comment on column eova_field.is_order is '是否可排序';
comment on column eova_field.is_add is '是否可新增字段';
comment on column eova_field.is_update is '是否可修改字段';
comment on column eova_field.is_edit is '是否可编辑字段';
comment on column eova_field.is_required is '是否必填';
comment on column eova_field.is_multiple is '是否多选项';
comment on column eova_field.placeholder is '输入提示';
comment on column eova_field.validator is 'UI校验表达式';
comment on column eova_field.defaulter is '默认值表达式';
comment on column eova_field.formatter is '格式化器';
comment on column eova_field.width is '控件宽度';
comment on column eova_field.height is '控件高度';
comment on column eova_field.config is '拓展配置';
alter table eova_field modify is_auto default '0';
alter table eova_field modify data_type default 'string';
alter table eova_field modify type default '文本框';
alter table eova_field modify order_num default '9';
alter table eova_field modify is_query default '0';
alter table eova_field modify is_show default '1';
alter table eova_field modify is_disable default '0';
alter table eova_field modify is_order default '1';
alter table eova_field modify is_add default '1';
alter table eova_field modify is_update default '1';
alter table eova_field modify is_edit default '1';
alter table eova_field modify is_required default '1';
alter table eova_field modify is_multiple default '0';
alter table eova_field modify width default '130';
alter table eova_field modify height default '20';

create table eova_log(
    id NUMBER(10) NOT NULL,
    user_id NUMBER(10) NOT NULL,
    type NUMBER(10) NOT NULL,
    ip VARCHAR2(255) NOT NULL,
    info VARCHAR2(500)
);

alter table eova_log add constraint pk_eova_log primary key(id);
comment on column eova_log.user_id is '操作用户';
comment on column eova_log.type is '日志类型';
comment on column eova_log.ip is '操作IP';
comment on column eova_log.info is '操作详情';

create table eova_menu(
    id NUMBER(10) NOT NULL,
    code VARCHAR2(255) NOT NULL,
    name VARCHAR2(100) NOT NULL,
    type VARCHAR2(20) NOT NULL,
    icon VARCHAR2(255),
    order_num NUMBER(10),
    parent_id NUMBER(10),
    is_collapse CHAR(1),
    biz_intercept VARCHAR2(255),
    url VARCHAR2(255),
    config VARCHAR2(500),
    diy_js VARCHAR2(255),
    is_del CHAR(1),
    filter VARCHAR2(500)
);

alter table eova_menu add constraint pk_eova_menu primary key(id);
comment on column eova_menu.code is '编码';
comment on column eova_menu.name is '名称';
comment on column eova_menu.type is '菜单类型';
comment on column eova_menu.icon is '图标';
comment on column eova_menu.order_num is '序号';
comment on column eova_menu.parent_id is '父节点';
comment on column eova_menu.is_collapse is '是否折叠';
comment on column eova_menu.biz_intercept is '自定义业务拦截器';
comment on column eova_menu.url is '自定义URL';
comment on column eova_menu.config is '菜单配置JSON';
comment on column eova_menu.diy_js is '依赖JS文件';
comment on column eova_menu.is_del is '是否隐藏';
comment on column eova_menu.filter is '初始数据过滤条件';
alter table eova_menu modify order_num default '0';
alter table eova_menu modify parent_id default '0';
alter table eova_menu modify is_collapse default '0';
alter table eova_menu modify is_del default '0';

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

create table eova_object(
    id NUMBER(10) NOT NULL,
    code VARCHAR2(100) NOT NULL,
    name VARCHAR2(100) NOT NULL,
    view_name VARCHAR2(255),
    table_name VARCHAR2(255),
    pk_name VARCHAR2(50) NOT NULL,
    data_source VARCHAR2(50),
    is_single CHAR(1),
    is_celledit CHAR(1),
    is_show_num CHAR(1),
    is_first_load CHAR(1),
    filter VARCHAR2(500),
    default_order VARCHAR2(255),
    diy_card VARCHAR2(255),
    diy_js VARCHAR2(255),
    biz_intercept VARCHAR2(255)
);

alter table eova_object add constraint pk_eova_object primary key(id);
comment on column eova_object.code is '对象编码';
comment on column eova_object.name is '对象名称';
comment on column eova_object.view_name is '查询数据视图';
comment on column eova_object.table_name is '保存数据主表';
comment on column eova_object.pk_name is '主键';
comment on column eova_object.data_source is '数据源';
comment on column eova_object.is_single is '是否单选';
comment on column eova_object.is_celledit is '是否可行内编辑';
comment on column eova_object.is_show_num is '是否显示行号';
comment on column eova_object.is_first_load is '是否初始加载数据';
comment on column eova_object.filter is '初始数据过滤条件';
comment on column eova_object.default_order is '默认排序字段(desc)';
comment on column eova_object.diy_card is '自定义卡片面板';
comment on column eova_object.diy_js is '依赖JS文件';
comment on column eova_object.biz_intercept is '自定义业务拦截器';
alter table eova_object modify data_source default 'main';
alter table eova_object modify is_single default '1';
alter table eova_object modify is_celledit default '0';
alter table eova_object modify is_show_num default '1';
alter table eova_object modify is_first_load default '1';

create table eova_role(
    id NUMBER(10) NOT NULL,
    name VARCHAR2(255) NOT NULL,
    info VARCHAR2(255)
);

alter table eova_role add constraint pk_eova_role primary key(id);
comment on column eova_role.name is '角色名';
comment on column eova_role.info is '角色描述';

create table eova_role_btn(
    id NUMBER(10) NOT NULL,
    rid NUMBER(10) NOT NULL,
    bid NUMBER(10) NOT NULL
);

alter table eova_role_btn add constraint pk_eova_role_btn primary key(id);
comment on column eova_role_btn.rid is '角色';
comment on column eova_role_btn.bid is '功能';

create table eova_task(
    id NUMBER(10) NOT NULL,
    state NUMBER(10) NOT NULL,
    name VARCHAR2(255) NOT NULL,
    exp VARCHAR2(50) NOT NULL,
    class VARCHAR2(255) NOT NULL,
    info VARCHAR2(255)
);

alter table eova_task add constraint pk_eova_task primary key(id);
comment on column eova_task.state is '状态：0=停止，1=启动';
comment on column eova_task.name is '名称';
comment on column eova_task.exp is '表达式';
comment on column eova_task.class is '实现类';
comment on column eova_task.info is '说明';
alter table eova_task modify state default '0';

create table eova_user(
    id NUMBER(10) NOT NULL,
    login_id VARCHAR2(30) NOT NULL,
    login_pwd VARCHAR2(50) NOT NULL,
    nickname VARCHAR2(255),
    rid NUMBER(10),
    hotel_id NUMBER(10)
);

alter table eova_user add constraint pk_eova_user primary key(id);
comment on column eova_user.login_id is '帐号';
comment on column eova_user.login_pwd is '密码';
comment on column eova_user.nickname is '中文名';
comment on column eova_user.rid is '角色ID';
comment on column eova_user.hotel_id is '所属酒店';
alter table eova_user modify rid default '0';
alter table eova_user modify hotel_id default '0';

create table eova_widget(
    id NUMBER(10) NOT NULL,
    type NUMBER(10) NOT NULL,
    value VARCHAR2(50) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    version VARCHAR2(5),
    path VARCHAR2(50),
    description VARCHAR2(3000),
    config VARCHAR2(3000)
);

alter table eova_widget add constraint pk_eova_widget primary key(id);
comment on column eova_widget.type is '控件类型：1=EOVA控件，2=DIY控件';
comment on column eova_widget.value is '控件值';
comment on column eova_widget.name is '名称';
comment on column eova_widget.version is '版本号';
comment on column eova_widget.path is '路径';
comment on column eova_widget.description is '介绍';
comment on column eova_widget.config is '控件配置信息JSON';
alter table eova_widget modify type default '1';
alter table eova_widget modify version default '1.0';


drop table area;
drop table comments;
drop table dicts;
drop table hotel;
drop table hotel_bed;
drop table hotel_stock;
drop table item;
drop table order_item;
drop table orders;
drop table product;
drop table users;
drop table users_exp;
drop table users_item;

drop sequence seq_area;
drop sequence seq_comment;
drop sequence seq_dicts;
drop sequence seq_hotel;
drop sequence seq_hotel_bed;
drop sequence seq_hotel_stock;
drop sequence seq_item;
drop sequence seq_order_item;
drop sequence seq_orders;
drop sequence seq_product;
drop sequence seq_users;
drop sequence seq_users_exp;
drop sequence seq_users_item;

create sequence seq_area increment by 1 start with 34081 maxvalue 9999999999;
create sequence seq_comment increment by 1 start with 21 maxvalue 9999999999;
create sequence seq_dicts increment by 1 start with 631 maxvalue 9999999999;
create sequence seq_hotel increment by 1 start with 31 maxvalue 9999999999;
create sequence seq_hotel_bed increment by 1 start with 41 maxvalue 9999999999;
create sequence seq_hotel_stock increment by 1 start with 61 maxvalue 9999999999;
create sequence seq_item increment by 1 start with 71 maxvalue 9999999999;
create sequence seq_order_item increment by 1 start with 61 maxvalue 9999999999;
create sequence seq_orders increment by 1 start with 41 maxvalue 9999999999;
create sequence seq_product increment by 1 start with 301 maxvalue 9999999999;
create sequence seq_users increment by 1 start with 311 maxvalue 9999999999;
create sequence seq_users_exp increment by 1 start with 311 maxvalue 9999999999;
create sequence seq_users_item increment by 1 start with 61 maxvalue 9999999999;

create table area(
    id NUMBER(10) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    pid NUMBER(10) NOT NULL,
    lv NUMBER(10) NOT NULL
);

alter table area add constraint pk_area primary key(id);
comment on column area.id is 'ID';
comment on column area.name is '名称';
comment on column area.pid is '父级';
comment on column area.lv is '级别：1=省，2=市，3=区';

create table comments(
    id NUMBER(10) NOT NULL,
    order_id NUMBER(10) NOT NULL,
    score NUMBER(10) NOT NULL,
    info VARCHAR2(255),
    create_time DATE NOT NULL
);

alter table comments add constraint pk_comments primary key(id);
comment on column comments.id is 'ID';
comment on column comments.order_id is '订单ID';
comment on column comments.score is '评分';
comment on column comments.info is '评价';
comment on column comments.create_time is '创建时间';

create table dicts(
    id NUMBER(10) NOT NULL,
    value VARCHAR2(50) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    object VARCHAR2(50) NOT NULL,
    field VARCHAR2(50) NOT NULL,
    ext VARCHAR2(255)
);

alter table dicts add constraint pk_dicts primary key(id);
comment on column dicts.ext is '扩展Json';

create table hotel(
    id NUMBER(10) NOT NULL,
    name VARCHAR2(255) NOT NULL,
    tel VARCHAR2(255) NOT NULL,
    address VARCHAR2(255) NOT NULL,
    state NUMBER(10),
    score NUMBER(10),
    create_time DATE NOT NULL,
    province NUMBER(10),
    city NUMBER(10),
    region NUMBER(10)
);

alter table hotel add constraint pk_hotel primary key(id);
comment on column hotel.id is 'ID';
comment on column hotel.name is '酒店名';
comment on column hotel.tel is '电话';
comment on column hotel.address is '详细地址';
comment on column hotel.state is '用户状态：1=普通商户，2=签约商户';
comment on column hotel.score is '积分';
comment on column hotel.create_time is '创建时间';
comment on column hotel.province is '省';
comment on column hotel.city is '市';
comment on column hotel.region is '区';
alter table hotel modify state default '1';
alter table hotel modify score default '0';

create table hotel_bed(
    id NUMBER(10) NOT NULL,
    hotel_id NUMBER(10) NOT NULL,
    sizes NUMBER(10) NOT NULL,
    num NUMBER(10)
);

alter table hotel_bed add constraint pk_hotel_bed primary key(id);
comment on column hotel_bed.id is 'ID';
comment on column hotel_bed.hotel_id is '酒店';
comment on column hotel_bed.sizes is '床铺尺码';
comment on column hotel_bed.num is '数量';
alter table hotel_bed modify num default '1';

create table hotel_stock(
    id NUMBER(10) NOT NULL,
    hotel_id NUMBER(10) NOT NULL,
    category NUMBER(10) NOT NULL,
    num NUMBER(10)
);

alter table hotel_stock add constraint pk_hotel_stock primary key(id);
comment on column hotel_stock.id is 'ID';
comment on column hotel_stock.hotel_id is '酒店';
comment on column hotel_stock.category is '商品类型';
comment on column hotel_stock.num is '存货量';
alter table hotel_stock modify num default '1';

create table item(
    id NUMBER(10) NOT NULL,
    name VARCHAR2(255) NOT NULL,
    info VARCHAR2(1000),
    img VARCHAR2(255)
);

alter table item add constraint pk_item primary key(id);
comment on column item.name is '名称';
comment on column item.info is '介绍';
comment on column item.img is '物品图片';

create table order_item(
    id NUMBER(10) NOT NULL,
    order_id NUMBER(10) NOT NULL,
    product_id NUMBER(10) NOT NULL,
    product VARCHAR2(128) NOT NULL,
    price VARCHAR2(10) NOT NULL,
    num NUMBER(10) NOT NULL
);

alter table order_item add constraint pk_order_item primary key(id);
comment on column order_item.id is '编号';
comment on column order_item.order_id is '订单ID';
comment on column order_item.product_id is '产品ID';
comment on column order_item.product is '产品';
comment on column order_item.price is '单价';
comment on column order_item.num is '购买数量';
alter table order_item modify price default '0';
alter table order_item modify num default '1';

create table orders(
    id NUMBER(10) NOT NULL,
    hotel_id NUMBER(10),
    pay_id NUMBER(10),
    state NUMBER(10),
    money VARCHAR2(10),
    score VARCHAR2(10),
    memo VARCHAR2(256),
    create_user_id NUMBER(10) NOT NULL,
    update_user_id NUMBER(10) NOT NULL,
    create_time DATE NOT NULL,
    update_time DATE NOT NULL,
    is_invoice CHAR(1),
    additional_info VARCHAR2(1000),
    address VARCHAR2(500),
    consignee VARCHAR2(50),
    tel VARCHAR2(20)
);

alter table orders add constraint pk_orders primary key(id);
comment on column orders.id is '编号';
comment on column orders.hotel_id is '所属酒店';
comment on column orders.pay_id is '支付ID';
comment on column orders.state is '订单状态：10=待支付,20=已支付,30=已发货,40=已收货';
comment on column orders.money is '应付金额';
comment on column orders.score is '消耗积分';
comment on column orders.memo is '备注';
comment on column orders.create_user_id is '创建用户ID';
comment on column orders.update_user_id is '最后更新用户ID';
comment on column orders.create_time is '创建时间';
comment on column orders.update_time is '更新时间';
comment on column orders.is_invoice is '是否开票';
comment on column orders.additional_info is '订单补充信息(JSON格式)';
comment on column orders.address is '收货地址';
comment on column orders.consignee is '收货人';
comment on column orders.tel is '联系方式';
alter table orders modify hotel_id default '0';
alter table orders modify pay_id default '0';
alter table orders modify state default '10';
alter table orders modify money default '0.00';
alter table orders modify score default '0.00';
alter table orders modify is_invoice default '0';

create table product(
    id NUMBER(10) NOT NULL,
    type NUMBER(10),
    category NUMBER(10) NOT NULL,
    stuff NUMBER(10) NOT NULL,
    sizes NUMBER(10) NOT NULL,
    name VARCHAR2(255) NOT NULL,
    img VARCHAR2(255),
    test_price VARCHAR2(22),
    price VARCHAR2(22),
    cost_score NUMBER(10),
    score NUMBER(10),
    stock NUMBER(10),
    create_time DATE NOT NULL,
    update_time DATE
);

alter table product add constraint pk_product primary key(id);
comment on column product.id is 'ID';
comment on column product.type is '产品类型：1=租赁商品，2=积分商品';
comment on column product.category is '分类';
comment on column product.stuff is '材料';
comment on column product.sizes is '尺码';
comment on column product.name is '名称';
comment on column product.img is '商品图片';
comment on column product.test_price is '试用单价';
comment on column product.price is '商品单价';
comment on column product.cost_score is '消耗积分：购买商品需消耗的积分';
comment on column product.score is '奖励积分';
comment on column product.stock is '库存';
comment on column product.create_time is '创建时间';
comment on column product.update_time is '更新时间';
alter table product modify type default '1';
alter table product modify test_price default '0';
alter table product modify price default '0';
alter table product modify cost_score default '0';
alter table product modify score default '0';
alter table product modify stock default '1';
alter table product modify update_time default SYSDATE;

create table users(
    id NUMBER(10) NOT NULL,
    status NUMBER(10),
    login_id VARCHAR2(255),
    login_pwd VARCHAR2(255),
    nickname VARCHAR2(255),
    reg_time DATE,
    info VARCHAR2(255),
    tag VARCHAR2(255)
);

alter table users add constraint pk_users primary key(id);
comment on column users.status is '状态';
comment on column users.login_id is '登录账户';
comment on column users.login_pwd is '录登密码';
comment on column users.nickname is '昵称';
comment on column users.reg_time is '注册时间';
comment on column users.info is '备注';
comment on column users.tag is '标签';
alter table users modify status default '0';
alter table users modify reg_time default SYSDATE;

create table users_exp(
    users_id NUMBER(10) NOT NULL,
    exp NUMBER(10),
    avg NUMBER(10),
    qq VARCHAR2(255)
);

alter table users_exp add constraint pk_users_exp primary key(users_id);
comment on column users_exp.exp is '经验值';
comment on column users_exp.avg is '年龄';
comment on column users_exp.qq is 'QQ';
alter table users_exp modify exp default '0';
alter table users_exp modify avg default '0';

create table users_item(
    id NUMBER(10) NOT NULL,
    users_id NUMBER(10) NOT NULL,
    item_id NUMBER(10) NOT NULL
);

alter table users_item add constraint pk_users_item primary key(id);
comment on column users_item.id is 'ID';
comment on column users_item.users_id is '艺人';
comment on column users_item.item_id is '道具';

CREATE or replace VIEW  v_users  as
select users.id           AS id,
       users.status       AS status,
       users.login_id     AS login_id,
       users.login_pwd    AS login_pwd,
       users.nickname     AS nickname,
       users.reg_time     AS reg_time,
       users.info         AS info,
       users_exp.users_id AS users_id,
       users_exp.exp      AS exp,
       users_exp.avg      AS avg,
       users_exp.qq       AS qq
  from users
  left join users_exp
    on users.id = users_exp.users_id;

-- 删除回收站 BIN$**
purge recyclebin;