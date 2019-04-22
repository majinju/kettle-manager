--导出之前清理日志表
--truncate table  SYS_LOG_FWZR;
--truncate table  SYS_LOG_HTRZ;

--批量给数据对象添加基础权限
insert into sys_qx_qxxx
  ( px,cjrxm, cjrdm, cjrdwmc, cjrdwdm, mc, dm, ms, lx, ssyy, bz, fqx, dzlx, dkfs)
select '110','管理员','admin','临时机构','99000001','详情权限',t.dm||'_XQQX','','03','myservice',
'',t.dm,'04','01' from sys_qx_qxxx t where t.dzlx='04' and  t.lx='01';
insert into sys_qx_qxxx
  ( px,cjrxm, cjrdm, cjrdwmc, cjrdwdm, mc, dm, ms, lx, ssyy, bz, fqx, dzlx, dkfs)
select '120','管理员','admin','临时机构','99000001','查询权限',t.dm||'_CXQX','','03','myservice',
'',t.dm,'04','01' from sys_qx_qxxx t where t.dzlx='04' and  t.lx='01';
insert into sys_qx_qxxx
  ( px,cjrxm, cjrdm, cjrdwmc, cjrdwdm, mc, dm, ms, lx, ssyy, bz, fqx, dzlx, dkfs)
select '130','管理员','admin','临时机构','99000001','新增权限',t.dm||'_XZQX','','03','myservice',
'',t.dm,'04','01' from sys_qx_qxxx t where t.dzlx='04' and  t.lx='01';
insert into sys_qx_qxxx
  ( px,cjrxm, cjrdm, cjrdwmc, cjrdwdm, mc, dm, ms, lx, ssyy, bz, fqx, dzlx, dkfs)
select '140','管理员','admin','临时机构','99000001','删除权限',t.dm||'_SCQX','','03','myservice',
'',t.dm,'04','01' from sys_qx_qxxx t where t.dzlx='04' and  t.lx='01';
insert into sys_qx_qxxx
  ( px,cjrxm, cjrdm, cjrdwmc, cjrdwdm, mc, dm, ms, lx, ssyy, bz, fqx, dzlx, dkfs)
select '150','管理员','admin','临时机构','99000001','修改权限',t.dm||'_XGQX','','03','myservice',
'',t.dm,'04','01' from sys_qx_qxxx t where t.dzlx='04' and  t.lx='01';
insert into sys_qx_qxxx
  ( px,cjrxm, cjrdm, cjrdwmc, cjrdwdm, mc, dm, ms, lx, ssyy, bz, fqx, dzlx, dkfs)
select '160','管理员','admin','临时机构','99000001','批量删除',t.dm||'_PLSC','','03','myservice',
'',t.dm,'04','01' from sys_qx_qxxx t where t.dzlx='04' and  t.lx='01';
insert into sys_qx_qxxx
  ( px,cjrxm, cjrdm, cjrdwmc, cjrdwdm, mc, dm, ms, lx, ssyy, bz, fqx, dzlx, dkfs)
select '170','管理员','admin','临时机构','99000001','编辑模式',t.dm||'_BJMS','','03','myservice',
'',t.dm,'04','01' from sys_qx_qxxx t where t.dzlx='04' and  t.lx='01';
insert into sys_qx_qxxx
  ( px,cjrxm, cjrdm, cjrdwmc, cjrdwdm, mc, dm, ms, lx, ssyy, bz, fqx, dzlx, dkfs)
select '180','管理员','admin','临时机构','99000001','配置对象',t.dm||'_PZDX','','03','myservice',
'',t.dm,'04','01' from sys_qx_qxxx t where t.dzlx='04' and  t.lx='01';
insert into sys_qx_qxxx
  ( px,cjrxm, cjrdm, cjrdwmc, cjrdwdm, mc, dm, ms, lx, ssyy, bz, fqx, dzlx, dkfs)
select '190','管理员','admin','临时机构','99000001','配置字段',t.dm||'_PZZD','','03','myservice',
'',t.dm,'04','01' from sys_qx_qxxx t where t.dzlx='04' and  t.lx='01';
insert into sys_qx_qxxx
  ( px,cjrxm, cjrdm, cjrdwmc, cjrdwdm, mc, dm, ms, lx, ssyy, bz, fqx, dzlx, dkfs)
select '210','管理员','admin','临时机构','99000001','导出当前页',t.dm||'_DCDQY','','03','myservice',
'',t.dm,'04','01' from sys_qx_qxxx t where t.dzlx='04' and  t.lx='01';
insert into sys_qx_qxxx
  ( px,cjrxm, cjrdm, cjrdwmc, cjrdwdm, mc, dm, ms, lx, ssyy, bz, fqx, dzlx, dkfs)
select '220','管理员','admin','临时机构','99000001','导出全部',t.dm||'_DCQB','','03','myservice',
'',t.dm,'04','01' from sys_qx_qxxx t where t.dzlx='04' and  t.lx='01';
insert into sys_qx_qxxx
  ( px,cjrxm, cjrdm, cjrdwmc, cjrdwdm, mc, dm, ms, lx, ssyy, bz, fqx, dzlx, dkfs)
select '230','管理员','admin','临时机构','99000001','批量上传',t.dm||'_SJPLSC','','03','myservice',
'',t.dm,'04','01' from sys_qx_qxxx t where t.dzlx='04' and  t.lx='01';
insert into sys_qx_qxxx
  ( px,cjrxm, cjrdm, cjrdwmc, cjrdwdm, mc, dm, ms, lx, ssyy, bz, fqx, dzlx, dkfs)
select '240','管理员','admin','临时机构','99000001','模板下载',t.dm||'_MBXZ','','03','myservice',
'',t.dm,'04','01' from sys_qx_qxxx t where t.dzlx='04' and  t.lx='01';

--字典迁移
insert into sys_sjgl_tyzd
  (id, cjsj, gxsj, yxx, px, cjrxm, cjrdm, cjrdwmc, cjrdwdm, dm, mc, ms, jp, qp, zdlb, bzzdlb, lbsql, sjly, upnode, cache)
select id, createdate, etldate, (case when isdel='0' then '1' else '0' end) yxx, px, 
'管理员','admin','临时机构','99000001',
dm, mc, ms, jp, qp, zdlb, bzzdlb, lbsql, sjly, upnode, cache from sys_zd_tyzd;

--文件迁移
insert into sys_sjgl_file
  (id, cjsj, gxsj, yxx, cjrxm, cjrdm, cjrdwmc, cjrdwdm, ywdm, glid, wjm, qcm, sclb, sclj, wjlx, wjlb)
select id, createdate, etldate, (case when isdel='0' then '1' else '0' end) yxx,
'管理员','admin','临时机构','99000001',
 ywdm, glid, wjm, qcm, sclb, sclj, wjlx, wjlb from sys_file_record;

--修正创建人信息
update jcga_jcyg_jcxx   t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update jcga_jcyg_shgx   t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_log_fwzr     t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_log_htrz     t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_qx_app       t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_qx_fwq       t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_qx_jgxx      t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_qx_jsqxgl    t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_qx_jsxx      t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_qx_qxxx      t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_qx_yhjsgl    t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_qx_yhxx      t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_sjgl_file    t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_sjgl_sjdx    t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_sjgl_sjzd    t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_sjgl_sjzt    t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_sjgl_tyzd    t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_sjgl_yhzdy   t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_xmgl_rwxx    t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_yxjk_jkrw    t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_yxjk_xx      t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';
update sys_yxjk_zdysql  t set t.cjrdm='BC5D77315CA84C6C807988E3CD17E70D',t.cjrxm='系统管理员',t.cjrdwdm='141B1AFC7E634176BDA7DB7F491A9004',t.cjrdwmc='临时机构';