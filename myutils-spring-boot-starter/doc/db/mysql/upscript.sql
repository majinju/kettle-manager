
---------------------------------------------------------------------
------------系统升级部署脚本（不换用户），先完整备份线上库，避免数据丢失------------------------
---------------------------------------------------------------------
---表结构变化、数据规则变化还是需要单独变更
---本脚本默认线上库用户为sjsj2_kf，将本地数据库导入到sjsj2中，然后支持本脚本进行数据库升级，若用户不一致需要修改本脚本
---本脚本在sjsj2_kf（即本地库的备份库）用户下执行

----本地会新增，线上存在的数据全部以线上为准的场景，将本地新增的插入线上库----------
--编号生成,将新增变化插入原库
insert into sjsj2.sys_sjgl_bhsc
select * from sjsj2_kf.sys_sjgl_bhsc t
where not exists (
        select 1 from sjsj2.sys_sjgl_bhsc t1 where t1.id=t.id
    );

--新增的应用
insert into sjsj2.sys_qx_app(ID,CJSJ,GXSJ,YXX,PX,KZXX,CJRXM,CJRDM,CJRDWMC,CJRDWDM,DM,MC,MS,JP,QP,SJY,LB,BB,DZ,ZT,MM,ZDDLMS,JCGJZ,FWDK,TZDK)
select ID,CJSJ,GXSJ,YXX,PX,KZXX,CJRXM,CJRDM,CJRDWMC,CJRDWDM,DM,MC,MS,JP,QP,SJY,LB,BB,DZ,ZT,MM,ZDDLMS,JCGJZ,FWDK,TZDK from sjsj2_kf.sys_qx_app t
where not exists (
        select 1 from sjsj2.sys_qx_app t1 where t1.id=t.id
    );

-----线上存在修改部分数据的场景，且应以线上为准的。
-----增量相关表数据，本地开发过程中不能物理删除，只能进行逻辑删除，不然升级时无法判断删除的数据，线上相关数据不会被删除。
-----通过主键和更新时间过滤先删除线上本地存在的数据，然后增量导入本地数据，本地存在的，线上进行修改时必须同步修改本地相关数据，后续其他部署都是以本地数据为准

--删除本地存在且本地更新时间不比线上更新时间小的数据项
-- select *
delete
from sjsj2.sys_sjgl_tyzd t where exists (
                                         select 1 from sjsj2_kf.sys_sjgl_tyzd t1 where t1.id=t.id and t1.gxsj>t.gxsj
                                     );
insert into sjsj2.sys_sjgl_tyzd
select * from sjsj2_kf.sys_sjgl_tyzd t
where not exists (
        select 1 from sjsj2.sys_sjgl_tyzd t1 where t1.id=t.id
    );

--大字典
select *
-- delete
from sjsj2.sys_sjgl_dzd t where exists (
                                        select 1 from sys_sjgl_dzd t1 where t1.id=t.id and t1.gxsj>t.gxsj
                                    );
insert into sjsj2.sys_sjgl_dzd
select * from sjsj2_kf.sys_sjgl_dzd t
where not exists (
        select 1 from sjsj2.sys_sjgl_dzd t1 where t1.id=t.id
    );

--文档资料
delete from sjsj2.sys_sjgl_grbj t where exists (
                                                select 1 from sjsj2_kf.sys_sjgl_grbj t1 where t1.id=t.id and t1.gxsj>t.gxsj
                                            );
insert into sjsj2.sys_sjgl_grbj
select * from sjsj2_kf.sys_sjgl_grbj t
where not exists (
        select 1 from sjsj2.sys_sjgl_grbj t1 where t1.id=t.id
    );

--数据字段
select *
-- delete
from sjsj2.sys_sjgl_sjzd t where
    exists (
            select 1 from sjsj2_kf.sys_sjgl_sjzd t1 where t1.id=t.id and t1.gxsj>t.gxsj
        )
-- and t.id in ('3E2EBF693D9147B6B838B33B8DECD184')
;
insert into sjsj2.sys_sjgl_sjzd
select * from sjsj2_kf.sys_sjgl_sjzd t
where not exists (
        select 1 from sjsj2.sys_sjgl_sjzd t1 where t1.id=t.id
    )
-- and t.id in ('3E2EBF693D9147B6B838B33B8DECD184')
;

--删除本地存在的对象
select *
-- delete
from sjsj2.sys_sjgl_sjdx t where
    exists (
            select 1 from sjsj2_kf.sys_sjgl_sjdx t1 where t1.id=t.id and t1.gxsj>t.gxsj
        );
--导入本地对象
insert into sjsj2.sys_sjgl_sjdx
select * from sjsj2_kf.sys_sjgl_sjdx t
where not exists (
        select 1 from sjsj2.sys_sjgl_sjdx t1 where t1.id=t.id
    );

--删除本地存在的角色权限关联
delete from sjsj2.sys_qx_jsqxgl t where
    exists (
            select 1 from sjsj2_kf.sys_qx_jsqxgl t1 where t1.id=t.id and t1.gxsj>t.gxsj
        );
--导入本地角色权限关联
insert into sjsj2.sys_qx_jsqxgl
select * from sjsj2_kf.sys_qx_jsqxgl t
where not exists (
        select 1 from sjsj2.sys_sjgl_sjdx t1 where t1.id=t.id
    );

--删除本地存在的用户授权
delete from sjsj2.sys_qx_yhjsgl t where
    exists (
            select 1 from sjsj2_kf.sys_qx_yhjsgl t1 where t1.id=t.id and t1.gxsj>t.gxsj
        );
--导入本地用户授权
insert into sjsj2.sys_qx_yhjsgl
select * from sjsj2_kf.sys_qx_yhjsgl t
where not exists (
        select 1 from sjsj2.sys_qx_yhjsgl t1 where t1.id=t.id
    );

--删除本地存在的角色
delete from sjsj2.sys_qx_jsxx t where
    exists (
            select 1 from sjsj2_kf.sys_qx_jsxx t1 where t1.id=t.id and t1.gxsj>t.gxsj
        );
--导入本地角色
insert into sjsj2.sys_qx_jsxx
select * from sjsj2_kf.sys_qx_jsxx t
where not exists (
        select 1 from sjsj2.sys_qx_jsxx t1 where t1.id=t.id
    );

--删除本地存在的用户
delete from sjsj2.sys_qx_yhxx t where
    exists (
            select 1 from sjsj2_kf.sys_qx_yhxx t1 where t1.id=t.id and t1.gxsj>t.gxsj
        );
--导入本地用户
insert into sjsj2.sys_qx_yhxx
select * from sjsj2_kf.sys_qx_yhxx t
where not exists (
        select 1 from sjsj2.sys_qx_yhxx t1 where t1.id=t.id
    );

--删除本地存在的权限
delete from sjsj2.sys_qx_qxxx t where
    exists (
            select 1 from sjsj2_kf.sys_qx_qxxx t1 where t1.id=t.id and t1.gxsj>t.gxsj
        );
--导入本地权限
insert into sjsj2.sys_qx_qxxx
select * from sjsj2_kf.sys_qx_qxxx t
where not exists (
        select 1 from sjsj2.sys_qx_qxxx t1 where t1.id=t.id
    );

/*
--删除本地存在的文件
delete from sjsj2.sys_sjgl_file t where
exists (
select 1 from sjsj2_kf.sys_sjgl_file t1 where t1.id=t.id and t1.gxsj>t.gxsj
);
*/
--导入本地文件
insert into sjsj2.sys_sjgl_file
select * from sjsj2_kf.sys_sjgl_file t
where not exists (
        select 1 from sjsj2.sys_sjgl_file t1 where t1.id=t.id
    );

--删除本地存在的大字段表数据
delete from sjsj2.sys_sjgl_blob t where
    exists (
            select 1 from sjsj2_kf.sys_sjgl_blob t1 where t1.id=t.id and t1.gxsj>t.gxsj
        );
--导入本地大字段表数据
insert into sjsj2.sys_sjgl_blob
select * from sjsj2_kf.sys_sjgl_blob t
where not exists (
        select 1 from sjsj2.sys_sjgl_blob t1 where t1.id=t.id
    );
