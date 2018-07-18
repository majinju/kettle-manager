<style>
.tag_times {
	display: inline-block;
	height: 20px;
	border: 1px solid #95B8E7;
	vertical-align: middle;
	float: left;
	height: 20px;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	width: 176px;
	padding-left: 2px;
}
.tag_to{
	width: 10px;
	line-height:20px;
	border: 0px;
	float: left;
}
.tag_time_icon {
  display: inline-block;
  width: 20px;
  height: 20px;
  background-image: url(/ui/eova/css/eova_icon.png);
  background-repeat: no-repeat;
  background-color: #ECF3FF;
  border: 0;
  cursor: pointer;
  background-position: center -60px;
  float:right;
}
</style>
<div class="tag_times">
<input id="start_${id}" name="start_${name}" value="${dateUtil.getDateTimeStr('yyyy-MM-dd',-30) }" style="width: 70px;" type="text" onFocus="var end=$dp.$('end_${id}');WdatePicker({onpicked:function(){end.focus();},maxDate:'#F{$dp.$D(\'end_${id}\')}'})"/>
<div class="tag_to">-</div>
<input id="end_${id}" name="end_${name}" style="width: 70px;" type="text" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'start_${id}\')}'})"/>
<i class="tag_time_icon" title="点击文本框选择时间"></i>
</div>