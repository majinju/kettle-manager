说明：数据世界

updateSjzd
===
* 更新数据字段
```sql
update sys_sjgl_sjzd t 
set yxx='0',gxsj=#{globalUse("util.expDate14")}
where t.yxx='1' and t.sjdx in (#{join(sys.ids)})
```
