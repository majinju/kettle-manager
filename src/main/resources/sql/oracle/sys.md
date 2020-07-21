yhqxxx
===
* 用户权限信息
select qx.dm, qx.mc
  from sys_qx_qxxx qx
 inner join sys_qx_jsqxgl jq
    on qx.dm = jq.qx
   and jq.yxx = '1'
 inner join sys_qx_yhjsgl yj
    on jq.js = yj.js
   and yj.yxx = '1'
 inner join sys_qx_jsxx js
    on js.dm = yj.js
   and js.yxx = '1'
 where qx.yxx = '1'
   and (js.dm = 'lsyh'
   or js.dm in (
        @for(js in p_1){
           #js.js#  #text(jsLP.last?")":"," )#
        @}
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