-- 远程导入数据
--imp userid=sjsj/sjsj fromuser=sjsj touser=sjsj ignore=y file=d:\sjsj.dmp buffer=512000000
--导出备份数据
--exp sjsj/sjsj@127.0.0.1/mydb file=d:\sjsj.dmp owner=('sjsj')
----------密码加密解密-------
select des_en('123456','123asdzxc') from dual;
select des_en('zxcvbnm,.','123asdzxc') from dual;
--数据载体
--update sys_sjgl_sjzt t set t.mm=des_en(t.mm,'5zIcmw5qVZs=');
select des_de(t.mm,'5zIcmw5qVZs='),t.* from sys_sjgl_sjzt t;
--解密，改密码，加密
/*
update sys_sjgl_sjzt t set t.mm=des_de(t.mm,'5zIcmw5qVZs=') where t.mm is not null;
select t.rowid,t.* from sys_sjgl_sjzt t;
update sys_sjgl_sjzt t set t.mm=des_en(t.mm,'5zIcmw5qVZs=') where t.mm is not null;
*/
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

--修改系统部署根目录
update SYS_SJGL_SJZT t set t.ljc='/data'||t.ljc where t.dm='wjmrzt';
update sys_sjgl_tyzd t set t.mc='/data'||t.mc where t.mc like '/benma666%';