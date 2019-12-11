yhqxxx
===
* 用户权限信息
 select qx.dm,qx.mc from sys_qx_qxxx qx where qx.yxx='1' and qx.dm in (
 select jq.qx from sys_qx_jsqxgl jq
 inner join sys_qx_yhjsgl yj on jq.js=yj.js
 inner join sys_qx_jsxx js on js.dm=yj.js
 where (yj.yh=#p_1# or js.dm='lsyh') and js.yxx='1' and yj.yxx='1' and jq.yxx='1'
 )

insertJsqx
===
* 插入角色权限关联信息
insert into sys_qx_jsqxgl( cjrxm, cjrdm, cjrdwmc, cjrdwdm, js, qx) 
values (#cjrxm#, #cjrdm#, #cjrdwmc#, #cjrdwdm#, #js#, #qx#)

insertJsqxHzqx
===
* 插入角色权限关联信息,含子权限
insert into sys_qx_jsqxgl( cjrxm, cjrdm, cjrdwmc, cjrdwdm, js, qx) 
select #cjrxm#, #cjrdm#, #cjrdwmc#, #cjrdwdm#, #js#, t.dm from sys_qx_qxxx t 
where t.dm like #qx#||'%'