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

// 默认URL
var url = "/timing/toTiming";
if(!isEmpty(value)){
    url = url + "/" + value;
}
%>
<div class="eova-timing" id="${id!}" name="${name}" value="${value!}" url="${url}" code="${code!}" field="${field!}" data-options="${data}"></div>