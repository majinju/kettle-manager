
---------------------------------------------------------------------
------------系统升级部署脚本（不换用户），先完整备份线上库，避免数据丢失------------------------
---------------------------------------------------------------------
---表结构变化、数据规则变化还是需要单独变更
---本脚本默认线上库用户为sjsj1，将本地数据库导入到sjsj中，然后支持本脚本进行数据库升级，若用户不一致需要修改本脚本
---本脚本在sjsj（即本地库的备份库）用户下执行

----本地会新增，线上存在的数据全部以线上为准的场景，将本地新增的插入线上库----------
--编号生成,将新增变化插入原库
insert into sjsj1.sys_sjgl_bhsc
select * from sys_sjgl_bhsc t
where not exists (
select 1 from sjsj1.sys_sjgl_bhsc t1 where t1.id=t.id
);
--新增的应用
insert into sjsj1.sys_qx_app
select * from sys_qx_app t
where not exists (
select 1 from sjsj1.sys_qx_app t1 where t1.id=t.id
);

----线上存在修改部分数据的场景，且应以线上为准的----------
--项目配置类字典应以线上为准,删除除配置类信息和本地不存在的字典项之外的数据
delete from sjsj1.sys_sjgl_tyzd t where t.zdlb not like '%_APPCONFIG'
and exists (
select 1 from sys_sjgl_tyzd t1 where t1.id=t.id
);
--导入本地的字典
insert into sjsj1.sys_sjgl_tyzd
select * from sys_sjgl_tyzd t
where not exists (
select 1 from sjsj1.sys_sjgl_tyzd t1 where t1.id=t.id
)
;
/*
delete from sjsj1.sys_sjgl_grbj t where exists (
select 1 from sys_sjgl_grbj t1 where t1.id=t.id
);
--导入本地的
insert into sjsj1.sys_sjgl_grbj
select * from sys_sjgl_grbj t
where not exists (
select 1 from sjsj1.sys_sjgl_grbj t1 where t1.id=t.id
)
;
*/

-----增量相关表数据，本地开发过程中不能物理删除，只能进行逻辑删除，不然升级时无法判断删除的数据，线上相关数据不会被删除。
-----增量：通过主键过滤先删除线上本地存在的数据，然后增量导入本地数据，本地存在的，线上进行修改时必须同步修改本地相关数据----------
--删除本地存在的对象的字段
delete from sjsj1.sys_sjgl_sjzd t where 
exists (
select 1 from sys_sjgl_sjdx t1 where t1.id=t.sjdx
and t1.dxdm like 'SYS_%'
);
--导入本地字段
insert into sjsj1.sys_sjgl_sjzd
select * from sys_sjgl_sjzd t
where not exists (
select 1 from sjsj1.sys_sjgl_sjzd t1 where t1.id=t.id
);

--删除本地存在的对象
delete from sjsj1.sys_sjgl_sjdx t where 
exists (
select 1 from sys_sjgl_sjdx t1 where t1.id=t.id
and t1.dxdm like 'SYS_%'
);
--导入本地对象
insert into sjsj1.sys_sjgl_sjdx
select * from sys_sjgl_sjdx t
where not exists (
select 1 from sjsj1.sys_sjgl_sjdx t1 where t1.id=t.id
);

--删除本地存在的角色权限关联
delete from sjsj1.sys_qx_jsqxgl t where 
exists (
select 1 from sys_qx_jsqxgl t1 where t1.id=t.id
);
--导入本地角色权限关联
insert into sjsj1.sys_qx_jsqxgl
select * from sys_qx_jsqxgl t
where not exists (
select 1 from sjsj1.sys_sjgl_sjdx t1 where t1.id=t.id
);

--删除本地存在的用户授权
delete from sjsj1.sys_qx_yhjsgl t where 
exists (
select 1 from sys_qx_yhjsgl t1 where t1.id=t.id
);
--导入本地用户授权
insert into sjsj1.sys_qx_yhjsgl
select * from sys_qx_yhjsgl t
where not exists (
select 1 from sjsj1.sys_qx_yhjsgl t1 where t1.id=t.id
);
/*
--删除本地存在的角色
delete from sjsj1.sys_qx_jsxx t where 
exists (
select 1 from sys_qx_jsxx t1 where t1.id=t.id
);
*/
--导入本地角色
insert into sjsj1.sys_qx_jsxx
select * from sys_qx_jsxx t
where not exists (
select 1 from sjsj1.sys_qx_jsxx t1 where t1.id=t.id
);
/*
--删除本地存在的用户
delete from sjsj1.sys_qx_yhxx t where 
exists (
select 1 from sys_qx_yhxx t1 where t1.id=t.id
);
*/
--导入本地用户
insert into sjsj1.sys_qx_yhxx
select * from sys_qx_yhxx t
where not exists (
select 1 from sjsj1.sys_qx_yhxx t1 where t1.id=t.id
);
--删除本地存在的权限
delete from sjsj1.sys_qx_qxxx t where 
exists (
select 1 from sys_qx_qxxx t1 where t1.id=t.id
);
--导入本地权限
insert into sjsj1.sys_qx_qxxx
select * from sys_qx_qxxx t
where not exists (
select 1 from sjsj1.sys_qx_qxxx t1 where t1.id=t.id
);
/*
--删除本地存在的文件
delete from sjsj1.sys_sjgl_file t where 
exists (
select 1 from sys_sjgl_file t1 where t1.id=t.id
);
--导入本地文件
insert into sjsj1.sys_sjgl_file
select * from sys_sjgl_file t
where not exists (
select 1 from sjsj1.sys_sjgl_file t1 where t1.id=t.id
);
*/
--删除本地存在的大字段表数据
delete from sjsj1.sys_sjgl_blob t where 
exists (
select 1 from sys_sjgl_blob t1 where t1.id=t.id
);
--导入本地大字段表数据
insert into sjsj1.sys_sjgl_blob
select * from sys_sjgl_blob t
where not exists (
select 1 from sjsj1.sys_sjgl_blob t1 where t1.id=t.id
);
