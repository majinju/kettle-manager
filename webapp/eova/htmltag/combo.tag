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
var queryUrl = "";
// 编码 或 表达式 必须存在其一
if(!isEmpty(code) || !isEmpty(exp)){
	// 存在自定义URL
	if(!isEmpty(url!)){
		// 自定义URL
		queryUrl = url;
	} else {
		queryUrl = "/widget/comboJson";
		if(!isEmpty(code) && !isEmpty(field)){
			// 存在编码和字段
			queryUrl = queryUrl +"/"+  code +"-"+ field;
		} else if(!isEmpty(exp)){
			// 存在自定义表达式
			queryUrl = queryUrl + "?exp=" + exp; 
		}
	}
}

// 将URL作为属性放置于值所在的隐藏文本框上，方面级联时JS修改URL
%>
<div class="eova-combo" id="${id!}" name="${name!}" value="${value!}" url="${queryUrl!}" data-options="${data}"></div>
<script>
$('#${id!}').eovacombo({
    valueField : 'id',
    textField : 'cn',
    multiple : ${multiple!false}
});
</script>