<form id="${id}" method="post" class="form">
	<div class="eova-form">
		<%for(item in items){%>
			<%if(item.type == "自增框"){%>
				<%// 只有编辑时显示自增框 %>
				<%if(isTrue(isUpdate!)){%>
				<div class="eova-form-field" title="${item.cn}[${item.en}]">
					<div class="eova-form-lbl">${item.cn}:</div>
					<div><div id="${item.en}" name="${item.en}" value="${item.value!}" class="eova-auto"></div></div>
                    <% // <#auto id="${item.en}" name="${item.en}" value="${item.value!}"/>%>
				</div>
				<%}%>
			<%continue;}%>
				
			<%// 该字段是否允许编辑%>
			<%if(isTrue(isUpdate!)){%>
				<%if(isTrue(item.is_update)){%>
					<div class="eova-form-field" title="${item.cn}[${item.en}]" style="${item.type == '文本域' || item.type == '编辑框' || item.type == 'JSON框' || item.type == '图片框' ? 'width:98%;' : ''}${item.type == '图片框' ? 'height: 205px;' : ''}" >
					<div class="eova-form-lbl${isTrue(item.is_required!) ? ' red' : ''}">${item.cn}</div>
					<#field item="${item}" widgets="${widgets!}" />
					</div>
				<%}%>
			<%} else {%>
				<%if(isTrue(item.is_add)){%>
					<div class="eova-form-field" title="${item.cn}[${item.en}]" style="${item.type == '文本域' || item.type == '编辑框' || item.type == 'JSON框' || item.type == '图片框' ? 'width:98%;' : ''}${item.type == '图片框' ? 'height: 205px;' : ''}" >
					<div class="eova-form-lbl${isTrue(item.is_required!) ? ' red' : ''}">${item.cn}</div>
					<#field item="${item}" widgets="${widgets!}" />
					</div>
				<%}%>
			<%}%>
		<%}%>
	</div>
</form>
<script>
$(function(){
    var $form = $('#${id}');
    $form.validator({
        debug: false,
        stopOnError: true,
        focusInvalid : false,
        showOk: false,
        timely: 0,
        msgMaker: false,
        fields: {
        <%for(item in items){%>
        	<%if(isTrue(item.is_required) || !isEmpty(item.validator)){%>
                ${item.en} : { rule: "${isTrue(item.is_required)?item.cn + ':required;' : ''}${item.validator!}" },
            <%}%>
        <%}%>
        }
    });
    $form.on("validation", $.validation);
});
</script>