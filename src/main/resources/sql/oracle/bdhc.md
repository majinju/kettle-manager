selectHmBdhm
===
* 查询-号码-比对号码
select hm.hczjlx, hm.hczjhm, hm.qcbz, hm.id, hm.jssj
  from sys_bdhc_xm xm
 inner join sys_bdhc_rw rw
    on rw.ssxm = xm.id
 inner join sys_bdhc_hm hm
    on hm.ssrw = rw.id
 where xm.yxx = '1'
   and rw.yxx = '1'
   and hm.yxx = '1'
   and hm.jssj > to_char(sysdate, 'yyyymmddhh24miss')

