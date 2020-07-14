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

--机构层级修正
select * from sys_qx_jgxx t ;
update sys_qx_jgxx t set t.jgcj=1 where t.sjjg is null;
update sys_qx_jgxx t set t.jgcj=2 where t.sjjg in(
select t1.id from sys_qx_jgxx t1 where t1.jgcj=1
);
update sys_qx_jgxx t set t.jgcj=3 where t.sjjg in(
select t1.id from sys_qx_jgxx t1 where t1.jgcj=2
);


