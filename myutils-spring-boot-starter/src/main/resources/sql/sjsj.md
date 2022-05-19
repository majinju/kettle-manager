说明：数据世界

findSjdx
===
* 获取数据对象
```sql
select t.*,qx.dm auth_code from sys_sjgl_sjdx t
left join sys_qx_qxxx qx on qx.sjdx=t.id and qx.yxx='1'
where t.yxx='1' 
-- @ if(!isEmpty(sys.dlsjdxdm)){
  and t.dxdm=#{sys.dlsjdxdm}
-- @} else if(!isEmpty(sys.authCode)){
  and qx.dm=#{sys.authCode}
-- @} else if(!isEmpty(sjdx.id)){
  and t.id=#{sjdx.id}
-- @} else if(!isEmpty(sjdx.dxdm)){
  and t.dxdm=#{sjdx.dxdm}
-- @} else{
  and t.id=''
-- @}
```

updateSjzd
===
* 更新数据字段
```sql
update sys_sjgl_sjzd t set yxx='0',gxsj=#{globalUse("util.expDate14")}
where t.yxx='1' and t.sjdx in (#{join(sys.ids)})
```

findUser
===
* 获取用户信息
```sql
select * from sys_qx_yhxx where yxx='1' 
-- @ if(!isEmpty(id)){
    and id=#{id}
-- @}else if(!isEmpty(sfzh)){
    and sfzh=#{sfzh}
-- @}else if(!isEmpty(yhdm)){
    and yhdm=#{yhdm}
-- @}else if(!isEmpty(wxyhid)){
    and wxyhid=#{wxyhid}
-- @}else{
    and id=''
-- @}
```

findJgxx
===
* 获取机构信息
```sql
select * from sys_qx_jgxx where yxx='1' 
-- @ if(!isEmpty(ssjg)){
    and id=#{ssjg}
-- @}else{
    and id=''
-- @}
```

findJsxx
===
* 获取角色信息
```sql
select t.js from sys_qx_yhjsgl t where yxx='1' 
-- @ if(!isEmpty(p1)){
    and yh=#{p1}
-- @}else{
    and id=''
-- @}
```

findYhqxxx
===
* 用户权限信息
```sql
  select distinct qx.dm, qx.mc
  from sys_qx_qxxx qx
  inner join sys_qx_jsqxgl jq
  on qx.dm = jq.qx
  and jq.yxx = '1'
  inner join sys_qx_jsxx js
  on js.dm = jq.js
  and js.yxx = '1'
  where qx.yxx = '1'
  and (js.dm in (
  'ADMIN_DLYH_LSYH'
  -- @if(p1.yhdm!='lsyh'){
  ,'ADMIN_DLYH'
  -- @}
  )
  -- @for(e in p1.jsMap){
  or js.dm like #{e.key+'%'}
  -- @}
  )
```

findYhDxQxYs
===
* 用户相关的对象和权限代码的映射
```sql
  select dx.dxdm,max(qx.dm) qxm
  from sys_qx_qxxx qx
  inner join sys_qx_jsqxgl jq
  on qx.dm = jq.qx
  and jq.yxx = '1'
  inner join sys_qx_jsxx js
  on js.dm = jq.js
  and js.yxx = '1'
  inner join sys_sjgl_sjdx dx
  on qx.sjdx=dx.id
  where qx.yxx = '1'
  and (js.dm in (
  'ADMIN_DLYH_LSYH'
  -- @if(p1.yhdm!='lsyh'){
  ,'ADMIN_DLYH'
  -- @}
  )
  -- @for(e in p1.jsMap){
  or js.dm like #{e.key+'%'}
  -- @}
  )
  and qx.sjdx is not null
  group by dx.dxdm
```

insertJsqx
===
* 插入角色权限关联信息
```sql
  insert into sys_qx_jsqxgl( cjrxm, cjrdm, cjrdwmc, cjrdwdm, js, qx)
  values (#{user.cjrxm}, #{user.cjrdm}, #{user.cjrdwmc}, #{user.cjrdwdm},#{yobj.js}, #{sql.changeNode.dm})
```

insertJsqxHzqx
===
* 插入角色权限关联信息,含子权限
```sql
  insert into sys_qx_jsqxgl( cjrxm, cjrdm, cjrdwmc, cjrdwdm, js, qx)
  select #{user.cjrxm}, #{user.cjrdm}, #{user.cjrdwmc}, #{user.cjrdwdm}, #{yobj.js}, t.dm from sys_qx_qxxx t
  where t.dm like #{sql.changeNode.dm+'%'}
```

insertBlob
===
* 插入大字段
```sql
insert into sys_sjgl_blob(id,nr) values (#{p1},#{p2})
```

deleteSjzd
===
* 删除数据字段
```sql
delete from sys_sjgl_sjzd t 
where yxx='0' and t.sjdx in (#{join(sys.ids)})
```
