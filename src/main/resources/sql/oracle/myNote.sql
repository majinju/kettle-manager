-- 远程导入数据
--imp userid=sjsj/sjsj fromuser=sjsj touser=sjsj ignore=y file=d:\sjsj.dmp commit buffer=512000000
--导出备份数据
--exp sjsj/sjsj@127.0.0.1/mydb file=d:\sjsj.dmp owner=('sjsj')
----------密码加密解密-------
select des_en('123456','123asdzxc') from dual;
select des_en('zxcvbnm,.','123asdzxc') from dual;
--数据载体
--update sys_sjgl_sjzt t set t.mm=des_en(t.mm,'5zIcmw5qVZs=');
select des_de(t.mm,'5zIcmw5qVZs='),t.* from sys_sjgl_sjzt t;
--解密，改密码，加密
update sys_sjgl_sjzt t set t.mm=des_de(t.mm,'5zIcmw5qVZs=') where t.mm is not null;
select t.rowid,t.* from sys_sjgl_sjzt t;
update sys_sjgl_sjzt t set t.mm=des_en(t.mm,'5zIcmw5qVZs=') where t.mm is not null;
--用户
--update sys_qx_yhxx t set t.yhmm=des_en(t.yhmm,'YA3EPe3fj/XrUtXDBr0y/Q==');
select des_de(t.yhmm,'YA3EPe3fj/XrUtXDBr0y/Q=='),t.* from sys_qx_yhxx t;
--应用
--update sys_qx_app t set t.mm=des_en(t.mm,'YA3EPe3fj/XrUtXDBr0y/Q==') where t.mm is not null;
select des_de(t.mm,'YA3EPe3fj/XrUtXDBr0y/Q=='),t.* from sys_qx_app t;
--服务器
--update sys_qx_fwq t set t.mm=des_en(t.mm,'YA3EPe3fj/XrUtXDBr0y/Q==') where t.mm is not null;
select des_de(t.mm,'YA3EPe3fj/XrUtXDBr0y/Q=='),t.* from sys_qx_fwq t;

--修改一级密码,修改一级密码需要修改应用配置文件和kettle的配置文件。
--数据载体
select des_en(des_de(t.mm,des_en('123456','123asdzxc')),des_en('123456','1qaz2wsx3')) xmm,des_de(t.mm,'5zIcmw5qVZs=') zmm,t.* from sys_sjgl_sjzt t where t.mm is not null;
--用户
select des_en(des_de(t.yhmm,des_en('zxcvbnm,.','123asdzxc')),des_en('zxcvbnm,.','1qaz2wsx3')) xmm,des_de(t.yhmm,'YA3EPe3fj/XrUtXDBr0y/Q==') zmm,t.* from sys_qx_yhxx t where t.yhmm is not null;
--应用
select des_en(des_de(t.mm,des_en('zxcvbnm,.','123asdzxc')),des_en('zxcvbnm,.','1qaz2wsx3')) xmm,des_de(t.mm,'YA3EPe3fj/XrUtXDBr0y/Q==') zmm,t.* from sys_qx_app t where t.mm is not null;
--服务器
select des_en(des_de(t.mm,des_en('zxcvbnm,.','123asdzxc')),des_en('zxcvbnm,.','1qaz2wsx3')) xmm,des_de(t.mm,'YA3EPe3fj/XrUtXDBr0y/Q==') zmm,t.* from sys_qx_fwq t where t.mm is not null;
/**
--执行密码一级密码修改操作
update sys_sjgl_sjzt t set t.mm=des_en(des_de(t.mm,des_en('123456','123asdzxc')),des_en('123456','1qaz2wsx3')) where t.mm is not null;
update sys_qx_yhxx t set t.yhmm=des_en(des_de(t.yhmm,des_en('zxcvbnm,.','123asdzxc')),des_en('zxcvbnm,.','1qaz2wsx3')) where t.yhmm is not null;
update sys_qx_app t set t.mm=des_en(des_de(t.mm,des_en('zxcvbnm,.','123asdzxc')),des_en('zxcvbnm,.','1qaz2wsx3')) where t.mm is not null;
update sys_qx_fwq t set t.mm=des_en(des_de(t.mm,des_en('zxcvbnm,.','123asdzxc')),des_en('zxcvbnm,.','1qaz2wsx3')) where t.mm is not null;
*/

--更新创建人信息为系统管理员，便于权限控制
update sys_sjgl_grbj t
   set t.cjrxm   = '系统管理员',
       t.cjrdm   = 'BC5D77315CA84C6C807988E3CD17E70D',
       t.cjrdwmc = '临时机构',
       t.cjrdwdm = '141B1AFC7E634176BDA7DB7F491A9004';

--因为Navicat导出没有导出主键，需要单独执行此语句建立主键
/*
alter table JCGA_JCYG_JCXX  add constraint PK_JCGA_JCYG_JCXX  primary key (ID);
alter table JCGA_JCYG_SHGX  add constraint PK_JCGA_JCYG_SHGX  primary key (ID);
alter table SYS_LOG_FWZR    add constraint PK_SYS_LOG_FWZR    primary key (ID);
alter table SYS_LOG_HTRZ    add constraint PK_SYS_LOG_HTRZ    primary key (ID);
alter table SYS_LOG_SJSCCW add constraint PK_SYS_LOG_SJSCCW primary key (ID);
alter table SYS_LOG_SJLZRZ add constraint PK_SYS_LOG_SJLZRZ primary key (ID);
alter table SYS_QX_APP      add constraint PK_SYS_QX_APP      primary key (ID);
alter table SYS_QX_FWQ      add constraint PK_SYS_QX_FWQ      primary key (ID);
alter table SYS_QX_JGXX     add constraint PK_SYS_QX_JGXX     primary key (ID);
alter table SYS_QX_JSQXGL   add constraint PK_SYS_QX_JSQXGL   primary key (ID);
alter table SYS_QX_JSXX     add constraint PK_SYS_QX_JSXX     primary key (ID);
alter table SYS_QX_QXXX     add constraint PK_SYS_QX_QXXX     primary key (ID);
alter table SYS_QX_YHJSGL   add constraint PK_SYS_QX_YHJSGL   primary key (ID);
alter table SYS_QX_YHXX     add constraint PK_SYS_QX_YHXX     primary key (ID);
alter table SYS_SJGL_BHSC   add constraint PK_SYS_SJGL_BHSC   primary key (ID);
alter table SYS_SJGL_FILE   add constraint PK_SYS_SJGL_FILE   primary key (ID);
alter table SYS_SJGL_SJDX   add constraint PK_SYS_SJGL_SJDX   primary key (ID);
alter table SYS_SJGL_SJZD   add constraint PK_SYS_SJGL_SJZD   primary key (ID);
alter table SYS_SJGL_SJZT   add constraint PK_SYS_SJGL_SJZT   primary key (ID);
alter table SYS_SJGL_TYZD   add constraint PK_SYS_SJGL_TYZD   primary key (ID);
alter table SYS_SJGL_DZD   add constraint PK_SYS_SJGL_DZD   primary key (ID);
alter table SYS_SJGL_YHZDY  add constraint PK_SYS_SJGL_YHZDY  primary key (ID);
alter table SYS_XMGL_RWXX   add constraint PK_SYS_XMGL_RWXX   primary key (ID);
alter table SYS_YXJK_JKRW   add constraint PK_SYS_YXJK_JKRW   primary key (ID);
alter table SYS_YXJK_XX     add constraint PK_SYS_YXJK_XX     primary key (ID);
alter table SYS_YXJK_ZDYSQL add constraint PK_SYS_YXJK_ZDYSQL primary key (ID);
alter table sys_sjgl_blob add constraint PK_sys_sjgl_blob primary key (ID);
alter table SYS_SJGL_GRBJ add constraint PK_SYS_SJGL_GRBJ primary key (ID);
*/