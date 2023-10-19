
-- -------------------------------------------------------------------
-- ---------- 系统升级部署脚本（不换用户），先完整备份线上库，避免数据丢失------------------------
-- -------------------------------------------------------------------
-- - 表结构变化、数据规则变化还是需要单独变更
-- - 本脚本默认线上库用户为sjsj2_zs，将本地数据库导入到sjsj2_dev中，然后支持本脚本进行数据库升级，若用户不一致需要修改本脚本
-- - 本脚本在sjsj2_dev（即本地库的备份库）用户下执行

-- -- 本地会新增，线上存在的数据全部以线上为准的场景，将本地新增的插入线上库----------
-- 编号生成,将新增变化插入原库
insert into sjsj2_zs.sys_sjgl_bhsc
select * from sjsj2_dev.sys_sjgl_bhsc t
where not exists (
        select 1 from sjsj2_zs.sys_sjgl_bhsc t1 where t1.id=t.id
    );

-- 新增的应用
insert into sjsj2_zs.sys_qx_app(ID,CJSJ,GXSJ,YXX,PX,KZXX,CJRXM,CJRDM,CJRDWMC,CJRDWDM,DM,MC,MS,JP,QP,SJY,LB,BB,DZ,ZT,MM,ZDDLMS,FWDK,TZDK)
select ID,CJSJ,GXSJ,YXX,PX,KZXX,CJRXM,CJRDM,CJRDWMC,CJRDWDM,DM,MC,MS,JP,QP,SJY,LB,BB,DZ,ZT,MM,ZDDLMS,FWDK,TZDK from sjsj2_dev.sys_qx_app t
where not exists (
        select 1 from sjsj2_zs.sys_qx_app t1 where t1.id=t.id
    );

-- --- 线上存在修改部分数据的场景，且应以线上为准的。
-- --- 增量相关表数据，本地开发过程中不能物理删除，只能进行逻辑删除，不然升级时无法判断删除的数据，线上相关数据不会被删除。
-- --- 通过主键和更新时间过滤先删除线上本地存在的数据，然后增量导入本地数据，本地存在的，线上进行修改时必须同步修改本地相关数据，后续其他部署都是以本地数据为准

-- 删除本地存在且本地更新时间不比线上更新时间小的数据项
select *
-- delete
from sjsj2_zs.sys_sjgl_tyzd t where exists (
                                         select 1 from sjsj2_dev.sys_sjgl_tyzd t1 where t1.id=t.id and t1.gxsj>t.gxsj
                                     );
insert into sjsj2_zs.sys_sjgl_tyzd(ID,CJSJ,GXSJ,YXX,PX,KZXX,CJRXM,CJRDM,CJRDWMC,CJRDWDM,DM,MC,MS,JP,QP,ZDLB,BZZD,LBSQL,SJLY,UPNODE,CACHE,SJDJ,MD5)
select ID,CJSJ,GXSJ,YXX,PX,KZXX,CJRXM,CJRDM,CJRDWMC,CJRDWDM,DM,MC,MS,JP,QP,ZDLB,BZZD,LBSQL,SJLY,UPNODE,CACHE,SJDJ,MD5 from sjsj2_dev.sys_sjgl_tyzd t
where not exists (
        select 1 from sjsj2_zs.sys_sjgl_tyzd t1 where t1.id=t.id
    )
      -- and t.gxsj>='20221005092822'
order by t.gxsj desc;

-- 大字典
select *
-- delete
from sjsj2_zs.sys_sjgl_dzd t where exists (
                                           select 1 from sjsj2_dev.sys_sjgl_dzd t1 where t1.id=t.id and t1.gxsj>t.gxsj
                                       );
insert into sjsj2_zs.sys_sjgl_dzd(id,dm,px,zdlb,mc,ms,bzzd,cjsj,gxsj,sjly,upnode,yxx,cjrxm,cjrdm,cjrdwmc,cjrdwdm,kzxx,sjdj)
select id,dm,px,zdlb,mc,ms,bzzd,cjsj,gxsj,sjly,upnode,yxx,cjrxm,cjrdm,cjrdwmc,cjrdwdm,kzxx,sjdj from sjsj2_dev.sys_sjgl_dzd t
where not exists (
        select 1 from sjsj2_zs.sys_sjgl_dzd t1 where t1.id=t.id
    )
      -- and t.gxsj>='20221005092822'
order by t.gxsj desc;

-- 文档资料
delete from sjsj2_zs.sys_sjgl_grbj t where exists (
                                                   select 1 from sjsj2_dev.sys_sjgl_grbj t1 where t1.id=t.id and t1.gxsj>t.gxsj
                                               );
insert into sjsj2_zs.sys_sjgl_grbj
select * from sjsj2_dev.sys_sjgl_grbj t
where not exists (
        select 1 from sjsj2_zs.sys_sjgl_grbj t1 where t1.id=t.id
    );

-- 数据字段
select *
-- delete
from sjsj2_zs.sys_sjgl_sjzd t where
    exists (
            select 1 from sjsj2_dev.sys_sjgl_sjzd t1 where t1.id=t.id and t1.gxsj>t.gxsj
        )
-- and t.id in ('3E2EBF693D9147B6B838B33B8DECD184')
;
insert into sjsj2_zs.sys_sjgl_sjzd(zddm,zdmc,px,kjlx,zdkd,cxzs,cxms,lbzs,xzzs,bjzs,yxbj,bjbt,xqzs,bzzd,mbzs,yxx,sjdx,zdms,zdjp,zdqp,zdlx,zdcd,cxmrz,xzmrz,zdzdlb,ZDYWLB,zddx,zdfy,yxpx,cxbt,zydj,zdts,cssl,qcbh,cjsj,gxsj,id,kzxx)
select zddm,zdmc,px,kjlx,zdkd,cxzs,cxms,lbzs,xzzs,bjzs,yxbj,bjbt,xqzs,bzzd,mbzs,yxx,sjdx,zdms,zdjp,zdqp,zdlx,zdcd,cxmrz,xzmrz,zdzdlb,ZDYWLB,zddx,zdfy,yxpx,cxbt,zydj,zdts,cssl,qcbh,cjsj,gxsj,id,kzxx from sjsj2_dev.sys_sjgl_sjzd t
where not exists (
        select 1 from sjsj2_zs.sys_sjgl_sjzd t1 where t1.id=t.id
    )
-- and t.id in ('3E2EBF693D9147B6B838B33B8DECD184')
      --	 and t.gxsj>='20221026145848'
order by t.gxsj desc
;

-- 删除本地存在的对象
select *
-- delete
from sjsj2_zs.sys_sjgl_sjdx t where
    exists (
            select 1 from sjsj2_dev.sys_sjgl_sjdx t1 where t1.id=t.id and t1.gxsj>t.gxsj
        );
-- 导入本地对象
insert into sjsj2_zs.sys_sjgl_sjdx(dxdm,dxmc,px,dxms,dxzy,dxlb,dxlx,dxzt,dxgs,jtdx,zjzd,qxzd,zlzd,qczd,jyzd,pczd,yxxzd,fytjxs,mrpx,cscx,cxtj,bjxh,ljq,zddrsql,sqlmb,cjsj,gxsj,zydj,yxx,kzxx,cjrxm,cjrdm,cjrdwmc,cjrdwdm,dxjp,dxqp,id)
select dxdm,dxmc,px,dxms,dxzy,dxlb,dxlx,dxzt,dxgs,jtdx,zjzd,qxzd,zlzd,qczd,jyzd,pczd,yxxzd,fytjxs,mrpx,cscx,cxtj,bjxh,ljq,zddrsql,sqlmb,cjsj,gxsj,zydj,yxx,kzxx,cjrxm,cjrdm,cjrdwmc,cjrdwdm,dxjp,dxqp,id from sjsj2_dev.sys_sjgl_sjdx t
where not exists (
        select 1 from sjsj2_zs.sys_sjgl_sjdx t1 where t1.id=t.id
    )
      --	  and t.gxsj>='20221005092822'
order by t.gxsj desc
;

-- 删除本地存在的权限
delete from sjsj2_zs.sys_qx_qxxx t where
    exists (
            select 1 from sjsj2_dev.sys_qx_qxxx t1 where t1.id=t.id
                                                     and t1.gxsj>t.gxsj
        );
-- 导入本地权限
insert into sjsj2_zs.sys_qx_qxxx(fqx,dm,mc,ms,lx,ssyy,zcsjd,bz,dzlx,dkfs,sjdx,dz,tb,px,yxx,gxsj,id,kzxx,cjsj,cjrxm,cjrdm,cjrdwmc,cjrdwdm,mcjp,mcqp)
select fqx,dm,mc,ms,lx,ssyy,zcsjd,bz,dzlx,dkfs,sjdx,dz,tb,px,yxx,gxsj,id,kzxx,cjsj,cjrxm,cjrdm,cjrdwmc,cjrdwdm,mcjp,mcqp from sjsj2_dev.sys_qx_qxxx t
where not exists (
        select 1 from sjsj2_zs.sys_qx_qxxx t1 where t1.id=t.id
    )
--		  and t.gxsj>='20221029121621'
order by t.gxsj desc
;


-- 删除本地存在的角色权限关联
delete from sjsj2_zs.sys_qx_jsqxgl t where
    exists (
            select 1 from sjsj2_dev.sys_qx_jsqxgl t1 where t1.id=t.id and t1.gxsj>t.gxsj
        );
-- 导入本地角色权限关联
insert into sjsj2_zs.sys_qx_jsqxgl
select * from sjsj2_dev.sys_qx_jsqxgl t
where not exists (
        select 1 from sjsj2_zs.sys_qx_jsqxgl t1 where t1.id=t.id
    );

-- 删除本地存在的用户授权
delete from sjsj2_zs.sys_qx_yhjsgl t where
    exists (
            select 1 from sjsj2_dev.sys_qx_yhjsgl t1 where t1.id=t.id and t1.gxsj>t.gxsj
        );
-- 导入本地用户授权
insert into sjsj2_zs.sys_qx_yhjsgl
select * from sjsj2_dev.sys_qx_yhjsgl t
where not exists (
        select 1 from sjsj2_zs.sys_qx_yhjsgl t1 where t1.id=t.id
    );

-- 删除本地存在的角色
delete from sjsj2_zs.sys_qx_jsxx t where
    exists (
            select 1 from sjsj2_dev.sys_qx_jsxx t1 where t1.id=t.id and t1.gxsj>t.gxsj
        );
-- 导入本地角色
insert into sjsj2_zs.sys_qx_jsxx
select * from sjsj2_dev.sys_qx_jsxx t
where not exists (
        select 1 from sjsj2_zs.sys_qx_jsxx t1 where t1.id=t.id
    );

-- 删除本地存在的用户
delete from sjsj2_zs.sys_qx_yhxx t where
    exists (
            select 1 from sjsj2_dev.sys_qx_yhxx t1 where t1.id=t.id and t1.gxsj>t.gxsj
        );
-- 导入本地用户
insert into sjsj2_zs.sys_qx_yhxx
select * from sjsj2_dev.sys_qx_yhxx t
where not exists (
        select 1 from sjsj2_zs.sys_qx_yhxx t1 where t1.id=t.id
    );
/*
-- 删除本地存在的文件
delete from sjsj2_zs.sys_sjgl_file t where
exists (
select 1 from sjsj2_dev.sys_sjgl_file t1 where t1.id=t.id and t1.gxsj>t.gxsj
);
*/
-- 导入本地文件
insert into sjsj2_zs.sys_sjgl_file
select * from sjsj2_dev.sys_sjgl_file t
where not exists (
        select 1 from sjsj2_zs.sys_sjgl_file t1 where t1.id=t.id
    );

-- 删除本地存在的大字段表数据
delete from sjsj2_zs.sys_sjgl_blob t where
    exists (
            select 1 from sjsj2_dev.sys_sjgl_blob t1 where t1.id=t.id and t1.gxsj>t.gxsj
        );
-- 导入本地大字段表数据
insert into sjsj2_zs.sys_sjgl_blob
select * from sjsj2_dev.sys_sjgl_blob t
where not exists (
        select 1 from sjsj2_zs.sys_sjgl_blob t1 where t1.id=t.id
    );
