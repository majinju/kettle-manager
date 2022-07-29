说明：sql模板演示

findSysDate
===
* 获取十四位时间
```sql
select #{globalUse("util.expDate14")} #{globalUse("util.expDefaultFrom")}
```

findDemo
===
* 查询演示
```sql
select 
-- @ pageTag(){
       t.*
-- @}
from ${sjdx.jtdx} t
-- @where(){
/*
for(var e in fields){
var field = e.value;
if(!isEmpty(yobj[field.zddm])){
 */
    and ${field.zddm} = #{yobj['${field.zddm}']}
/*
}
}
*/
-- @}
```

updateDemo
===
* 查询演示
```sql
update ${sjdx.jtdx} t set t.gxsj=#{globalUse("util.expDate14")},t.mc='${sys.editTableData.~size+sys.editTableData[0].id}'

```
