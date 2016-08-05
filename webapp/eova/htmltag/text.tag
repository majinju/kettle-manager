<%
// name
if(isTrue(isQuery!)){
	name = QUERY + name;
}
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
<div class="eova-text" id="${id!}" name="${name!}" value="${value!}" data-options="${data}"></div>