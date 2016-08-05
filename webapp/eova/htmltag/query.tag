<%var count = 0;%>
<%// 默认返回false防止浏览器自动提交表单%>
<form id="${id}" onsubmit="return false;">
	<div id="eova-query" class="eova-form">
		<%for(item in items){%>
		
			<%// 只输出允许查询的条件,count累计一共有多少个查询条件%>
			<%if(!isTrue(item.is_query)){continue;}%>
			<%count++;%>
			
			<div class="eova-form-field" title="${item.cn}[${item.en}]">
			<div class="eova-form-lbl">${item.cn}:${item.value!}</div>
				<%if(item.type == "下拉框"){%>
					<div><#combo id="${item.en}" name="${item.en}" value="${item.value!}" code="${item.object_code}" field="${item.en}" isQuery="true" multiple="${item.is_multiple}" /></div>
				<%}else if(item.type == "查找框"){%>
                   	<div><#find id="${item.en}" name="${item.en}" value="${item.value!}" code="${item.object_code}" isQuery="true" field="${item.en}" multiple="${item.is_multiple}" isNoN="true" /></div>
				<%}else if(item.data_type == "time"||item.type == "时间框"){%>
					<div><#times id="${item.en}" name="${item.en}" value="${item.value!}" code="${item.object_code }" isQuery="true" /></div>
				<%}else if(item.type == "数字框"){%>
					<div><#number id="${item.en}" name="${item.en}" value="${item.value!}" code="${item.object_code }" isQuery="true" /></div>
				<%}else if(item.type == "复选框"){%>
					<div><#check id="${item.en}" name="${item.en}" value="${item.value!}" isQuery="true" /></div>
				<%}else {%>
					<%// 默认为文本框%>
					<div>
						<#text isQuery="true" id="${item.en}" name="${item.en}" value="${item.value!}" isNoN="true" />
					</div>
				<%}%>
			</div>
		<%}%>
	</div>
</form>
<script>
var x = $("#eova-query").width();
console.log(x);
var max = parseInt(x/290);
console.log('每行最多能显示：'+ max);
if(max != 0){
	var count = ${count};
	var zs = parseInt(count / max); 
	var ys = count % max;
	if(ys > 0){
		zs++;
	}
	// 计算完整显示所需高度
	var y = 40 + 25 * zs;
	$("#eova-query").parent().parent().css("height", y + "px");
	//console.log('ys'+ ys);
	//console.log('共需：'+ zs);
	//console.log('height：'+ y);
}

$('div[class="eova-text"]').eovatext();
$('div[class="eova-time"]').eovatime();
$('div[class="eova-combo"]').eovacombo();
$('div[class="eova-find"]').eovafind();
</script>