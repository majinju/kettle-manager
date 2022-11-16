
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
