selectHmBdhm
===
* 查询-号码-比对号码
select hm.hczjlx, hm.hczjhm
--,hm.hczjlx||'_'||hm.hczjhm bdhm
  from sys_bdhc_xm xm
 inner join sys_bdhc_rw rw
    on rw.ssxm = xm.id
 inner join sys_bdhc_hm hm
    on hm.ssrw = rw.id
 where xm.yxx = '1'
   and rw.yxx = '1'
   and hm.yxx = '1'
   and hm.jssj > to_char(sysdate, 'yyyymmddhh24miss')

selectHmByHchm
===
* 查询-号码-基于核查号码
select hm.id      hm_id,
       hm.cjsj    hm_cjsj,
       hm.gxsj    hm_gxsj,
       hm.yxx     hm_yxx,
       hm.px      hm_px,
       hm.kzxx    hm_kzxx,
       hm.cjrxm   hm_cjrxm,
       hm.cjrdm   hm_cjrdm,
       hm.cjrdwmc hm_cjrdwmc,
       hm.cjrdwdm hm_cjrdwdm,
       hm.mc      hm_mc,
       hm.ms      hm_ms,
       hm.lb      hm_lb,
       hm.ssrw    hm_ssrw,
       hm.ssxm    hm_ssxm,
       hm.hczjlx  hm_hczjlx,
       hm.hczjhm  hm_hczjhm,
       hm.qcbz    hm_qcbz,
       hm.zzjlx   hm_zzjlx,
       hm.zzjhm   hm_zzjhm,
       hm.kssj    hm_kssj,
       hm.jssj    hm_jssj,
       hm.bz      hm_bz,
       hm.hmykzj  hm_hmykzj,
       hm.flag01  hm_flag01,
       hm.flag02  hm_flag02,
       hm.flag03  hm_flag03,
       hm.flag04  hm_flag04,
       hm.flag05  hm_flag05,
       hm.flag06  hm_flag06,
       hm.flag07  hm_flag07,
       hm.flag08  hm_flag08,
       hm.flag09  hm_flag09,
       hm.flag10  hm_flag10,
       xm.px      xm_px,
       xm.kzxx    xm_kzxx,
       xm.cjrxm   xm_cjrxm,
       xm.cjrdm   xm_cjrdm,
       xm.cjrdwmc xm_cjrdwmc,
       xm.cjrdwdm xm_cjrdwdm,
       xm.mc      xm_mc,
       xm.ms      xm_ms,
       xm.lb      xm_lb,
       xm.dj      xm_dj,
       xm.bdzy    xm_bdzy,
       xm.pczy    xm_pczy,
       xm.zl      xm_zl,
       xm.ql      xm_ql,
       xm.ssdw    xm_ssdw,
       xm.scmb    xm_scmb,
       xm.bz      xm_bz,
       rw.px      rw_px,
       rw.kzxx    rw_kzxx,
       rw.cjrxm   rw_cjrxm,
       rw.cjrdm   rw_cjrdm,
       rw.cjrdwmc rw_cjrdwmc,
       rw.cjrdwdm rw_cjrdwdm,
       rw.cjrlxfs rw_cjrlxfs,
       rw.sqsj    rw_sqsj,
       rw.mc      rw_mc,
       rw.ms      rw_ms,
       rw.ssxm    rw_ssxm,
       rw.sy      rw_sy,
       rw.bdzy    rw_bdzy,
       rw.pczy    rw_pczy,
       rw.fhzy    rw_fhzy,
       rw.jczy    rw_jczy,
       rw.bz      rw_bz,
       rw.shrxm   rw_shrxm,
       rw.shrzjhm rw_shrzjhm,
       rw.shdw    rw_shdw,
       rw.shsj    rw_shsj
  from sys_bdhc_xm xm
 inner join sys_bdhc_rw rw
    on rw.ssxm = xm.id
 inner join sys_bdhc_hm hm
    on hm.ssrw = rw.id
 where xm.yxx = '1'
   and rw.yxx = '1'
   and hm.yxx = '1'
   and hm.jssj > to_char(sysdate, 'yyyymmddhh24miss')
   and hm.hczjlx = #p_1#
   and hm.hczjhm = #p_2#
   
selectZyzdysByZylb
===
* 基于资源类别查询资源字段映射
select zd.*
from sys_sjgl_sjzd zd
inner join sys_sjgl_sjdx dx on dx.id=zd.sjdx
where dx.dxdm = 'SYS_BDHC_JG_'||#p_1#
and zd.zddm like 'flag%' and zd.yxx='1'
order by zd.px asc

selectZyzdwysByZylb
===
* 基于资源类别查询资源字段未映射的字段
select zd.*
from sys_sjgl_sjzd zd
inner join sys_sjgl_sjdx dx on dx.id=zd.sjdx
where dx.dxdm = 'SYS_BDHC_JG_'||#p_1#
and zd.zddm like 'flag%' and zd.yxx='0'
order by zd.px asc
 
updateSjzdById
===
* 基于主键更新数据字段
update sys_sjgl_sjzd zd set zd.yxx='1',zd.zdmc=#p_1# where zd.id=#p_2#

selectHmxggz
===
* 查询号码相关规则字段
select gz.*, gzzd.sjzd, gzzd.hdyzgz, gzzd.hdzhgz
  from sys_bdhc_gz gz
  left join sys_bdhc_gzzd gzzd
    on gzzd.gz = gz.id
   and gzzd.yxx = '1'
 where gz.yxx = '1'
   and (gz.ssxm like '%'||#hm_ssxm#||'%' or gz.ssxm is null)
   and (gz.ssrw like '%'||#hm_ssrw#||'%' or gz.ssrw is null)
   and (gz.zylb like '%'||#jg_zylb#||'%' or gz.zylb is null)
   and (gz.hcfs = #jg_hcfs# or gz.hcfs is null)
 order by gz.dj, gz.px, gz.gxsj desc,gz.id, gzzd.px, gzzd.gxsj desc






