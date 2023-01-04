说明：sql模板演示

select
===
* 查询演示
```sql
select
-- @ pageTag(){
       t.*
-- @}
from SYS_SJGL_TYZD_DEMO t
-- @where(){
-- @if(!isEmpty(yobj.dm)){
and dm=#{yobj.dm}
-- @}
-- @if(!isEmpty(yobj.mc)){
and mc like #{"%"+yobj.mc+"%"}
-- @}
-- @}
```

insert
===
* 新增演示
```sql
insert into SYS_SJGL_TYZD_DEMO(dm,mc,cjrdm)
--此处只为演示自定义设置参数，其实更简单的是直接传入myParams，则可以采用user.id获取用户代码，user.jgxx获取用户的机构信息
values(#{p1.dm},#{p1.mc},,#{p1.cjrdm})
```

update
===
* 更新演示
```sql
update SYS_SJGL_TYZD_DEMO t
-- 此写法兼容各种数据库，也可以直接写对应数据库的函数
set t.gxsj = #{globalUse("util.expDate14")}
-- @if(!isEmpty(yobj.mc)){
, mc = #{yobj.mc}
-- @}
```

plsc
===
* 批量删除演示
```sql
delete from SYS_SJGL_TYZD_DEMO t
-- 此处可以像查询一样采用where标签避免条件为空报错，但因为是删除操作不允许条件为空，若所有条件都为空就让他报错，避免误删所有数据
-- myParams的参数说明请查看参数说明文档，里面包含了系统所有常用参数
where t.cjrdm = #{user.id}
-- @if(!isEmpty(yobj.dm)){
and dm=#{yobj.dm}
-- @}
-- @if(!isEmpty(yobj.id)){
and id = #{yobj.id}
-- @}
-- @if(!isEmpty(sys.ids)){
and id in #{join(sys.ids)}
-- @}
```
