--导出之前清理日志表
--truncate table  SYS_LOG_FWZR;
--truncate table  SYS_LOG_HTZR;

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