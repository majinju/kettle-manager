## 数据世界

```sql
--- 导出之前清理日志表
 /*
 truncate table  SYS_LOG_FWZR;
 truncate table  SYS_LOG_HTRZ;
 truncate table  SYS_LOG_SJLZRZ;
 truncate table  SYS_LOG_SJSCCW;
 truncate table  sys_log_jhjl;
 truncate table  sys_ptgl_xtxx;
 -- truncate table  SYS_BDHC_JG;
 -- truncate table  SYS_BDHC_WXJG;
 */

 -- 清除删除的权限的授权信息
 select *
 -- delete
 from sys_qx_jsqxgl t
 where not exists (
         select 1 from sys_qx_qxxx q where q.id=t.qx
     );
 select *
 -- delete
 from sys_qx_qxxx t
 where not exists (
         select 1 from sys_qx_qxxx q where q.id=t.qx
     );
 -- 清理无用字段
 select *
 -- delete
 from sys_sjgl_sjzd t
 where not exists (
         select 1 from sys_sjgl_sjdx t1 where t1.id=t.sjdx
     );


 -- 字典导出
 select * from sys_sjgl_tyzd t
 where t.yxx='1'
 --  and t.dm='MyMenu'
   and (
         ((t.dm like 'SYS_SJGL_ZNJH%'
              -- or t.dm like 'SYS%'
              ) and t.zdlb='SYS_COMMON_ZDLB')
         or t.zdlb  in (
         select dm from sys_sjgl_tyzd t
         where t.yxx='1'
           and ((t.dm like 'SYS_SJGL_ZNJH%'
                    -- or t.dm like 'SYS%'
                    ) and t.zdlb='SYS_COMMON_ZDLB')
     )
     );

 -- 数据对象
 select * from sys_sjgl_sjdx t
 where t.yxx = '1' and ( -- t.DXDM like 'V_XMGL_GZTJ'
     -- or t.DXDM like 'SYS%'
         t.dxdm in ('SYS_LOG_JHJL','SYS_ZNJH_CTDY','SYS_SJGL_ZNJH')
     );

 -- 数据字段
 select zd.* from
     sys_sjgl_sjzd zd
         inner join sys_sjgl_sjdx t on t.id=zd.SJDX
 where t.yxx = '1' and (
 -- t.DXDM like 'V_XMGL_GZTJ'
     -- or t.DXDM like 'SYS%'
         t.dxdm in ('SYS_LOG_JHJL','SYS_ZNJH_CTDY','SYS_SJGL_ZNJH')
     );

 -- 权限相关
 select t.* from sys_qx_qxxx t
 where t.yxx = '1' and (t.dm like 'KFZFW_ZNJH%'
     -- or t.dm like 'SYS%'
     );


 -- 相关sql
 select * from SYS_SJGL_DZD t
 where t.yxx = '1' and (t.dm like 'XXXX%'
     -- or t.dm like 'SYS%'
     );
 -- 表在Navicat中选中导出表和结构即可。
 -- 视图需要逐个导出。
```

## mysql备份

1. 'date_format(now(),_utf8mb4\\\'%Y%m%d%H%i%S\\\')'  --》  (date_format(now(), '%Y%m%d%H%i%S'))
2. 'replace(uuid(),_utf8mb4\\\'-\\\',_utf8mb4\\\'\\\')'  --》 (REPLACE(UUID(),'-',''))
