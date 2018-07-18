<%
// data-options
var data = "";
if(!isEmpty(options!)){
	data = data + options;
}
if(!isEmpty(placeholder!)){
	data = data + ", placeholder : '" + placeholder + "'";
}
if(!isEmpty(disable!)){
	data = data +  ", disable : " + disable ;
}
if(strutil.startWith(data, ",")){
	data = strutil.subString (data,1);
}
%>
<div class="eova-check" id="${id!}" name="${(isQuery!)=='true' ? QUERY+name:name}" data-options="${data!}"></div>
<script>
var val = '${value!}';
var flag = false;
if(val == '1' || val == 'true'){
	flag = true;
}
$('#${id!}').eovacheck().setChecked(flag);
</script>