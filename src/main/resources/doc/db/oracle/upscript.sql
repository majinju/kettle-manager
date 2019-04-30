
--系统升级部署脚本

----本地会新增，线上存在的数据全部以线上为准的场景，将本地新增的插入线上库，然后清空本地库，将线上库数据全量插入本地库----------
--编号生成
--将新增变化插入原库
insert into sjsj.sys_sjgl_bhsc
select * from sys_sjgl_bhsc t
where not exists (
select 1 from sjsj.sys_sjgl_bhsc t1 where t1.id=t.id
)
;
--清空本库
truncate table sys_sjgl_bhsc;
--全量更新原库数据到本库
insert into sys_sjgl_bhsc
select * from sjsj.sys_sjgl_bhsc;

----线上存在修改部分数据的场景，且应以线上为准的，先在本地表中删除线上存在的数据项，再增量导入线上增量数据----------
--项目配置类字典应以线上为准,先删除应用配置类别的且线上存在的字典项
delete from sys_sjgl_tyzd t where t.zdlb like '%_APPCONFIG'
and exists (
select 1 from sjsj.sys_sjgl_tyzd t1 where t1.id=t.id
)
;
--导入线上新增的字典
insert into sys_sjgl_tyzd
select * from sjsj.sys_sjgl_tyzd t
where not exists (
select 1 from sys_sjgl_tyzd t1 where t1.id=t.id
)
;

-----增量相关表数据，本地开发过程中不能全量删除，只能进行逻辑删除，不然升级时无法判断删除的数据，会反向更新回来。
-----增量：通过主键过滤只导入线上新增的数据，本地存在的，线上进行修改时必须同步修改本地相关数据----------
--线上新增的对象的字段导入
insert into sys_sjgl_sjzd
select * from sjsj.sys_sjgl_sjzd t
where not exists (
select 1 from sys_sjgl_sjdx t1 where t1.id=t.sjdx
)
;
--导入线上新增的对象
insert into sys_sjgl_sjdx
select * from sjsj.sys_sjgl_sjdx t
where not exists (
select 1 from sys_sjgl_sjdx t1 where t1.id=t.id
)
;
--导入线上新增的角色授权
insert into sys_qx_jsqxgl
select * from sjsj.sys_qx_jsqxgl t
where not exists (
select 1 from sys_qx_jsqxgl t1 where t1.id=t.id
)
;
--导入线上新增的用户授权
insert into sys_qx_yhjsgl
select * from sjsj.sys_qx_yhjsgl t
where not exists (
select 1 from sys_qx_yhjsgl t1 where t1.id=t.id
)
;
--导入线上新增的角色
insert into sys_qx_jsxx
select * from sjsj.sys_qx_jsxx t
where not exists (
select 1 from sys_qx_jsxx t1 where t1.id=t.id
)
;
--导入线上新增的用户
insert into sys_qx_yhxx
select * from sjsj.sys_qx_yhxx t
where not exists (
select 1 from sys_qx_yhxx t1 where t1.id=t.id
)
;
--导入线上新增的用户
insert into sys_qx_qxxx
select * from sjsj.sys_qx_qxxx t
where not exists (
select 1 from sys_qx_qxxx t1 where t1.id=t.id
)
;
--导入线上新增的文件
insert into sys_sjgl_file
select * from sjsj.sys_sjgl_file t
where not exists (
select 1 from sys_sjgl_file t1 where t1.id=t.id
)
;


-------全量：清空本地库，全量将上线库数据插入本地库-----------------------------------
--员工
--清空本库
truncate table jcga_jcyg_jcxx;
--全量更新原库数据到本库
insert into jcga_jcyg_jcxx
select * from sjsj.jcga_jcyg_jcxx;

--员工关系
truncate table jcga_jcyg_shgx;
insert into jcga_jcyg_shgx
select * from sjsj.jcga_jcyg_shgx;

truncate table sys_log_fwzr;
insert into sys_log_fwzr
select * from sjsj.sys_log_fwzr;

truncate table sys_log_htrz;
insert into sys_log_htrz
select * from sjsj.sys_log_htrz;

truncate table sys_qx_app;
insert into sys_qx_app
select * from sjsj.sys_qx_app;

truncate table sys_qx_fwq;
insert into sys_qx_fwq
select * from sjsj.sys_qx_fwq;

truncate table sys_sjgl_sjzt;
insert into sys_sjgl_sjzt
select * from sjsj.sys_sjgl_sjzt;
update sys_sjgl_sjzt t set t.yhm='sjsj1' where t.id='394A0D538356436E83D3F9AC390D1514';

truncate table sys_sjgl_yhzdy;
insert into sys_sjgl_yhzdy
select * from sjsj.sys_sjgl_yhzdy;

truncate table sys_xmgl_rwxx;
insert into sys_xmgl_rwxx
select * from sjsj.sys_xmgl_rwxx;

truncate table sys_yxjk_jkrw;
insert into sys_yxjk_jkrw
select * from sjsj.sys_yxjk_jkrw;

truncate table sys_yxjk_xx;
insert into sys_yxjk_xx
select * from sjsj.sys_yxjk_xx;

truncate table sys_yxjk_zdysql;
insert into sys_yxjk_zdysql
select * from sjsj.sys_yxjk_zdysql;

truncate table sys_qx_jgxx;
insert into sys_qx_jgxx
select * from sjsj.sys_qx_jgxx t;