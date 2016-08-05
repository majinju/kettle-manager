<%if(item.type == "下拉框"){%>
	<div><#combo id="${item.en}" name="${item.en}" code="${item.object_code}" field="${item.en}" value="${item.value!item.defaulter}" isNoN="${item.is_required!}" multiple="${item.is_multiple}" disable="${item.is_disable!}" /></div>
<%} else if(item.type == "查找框"){%>
    <div><#find id="${item.en}" name="${item.en}" code="${item.object_code}" field="${item.en}" value="${item.value!item.defaulter}" isNoN="${item.is_required!}" multiple="${item.is_multiple}" disable="${item.is_disable!}" /></div>
<%} else if(item.data_type == "string" && item.type == "时间框"){%>
    <div><#time id="${item.en}" name="${item.en}" value="${isEmpty(item.value!) ? '' : strutil.formatDate(date(item.value,'yyyyMMddHHmmss'), 'yyyy-MM-dd HH:mm:ss')}" isNoN="${item.is_required!}" disable="${item.is_disable!}" options="format:'yyyy-MM-dd HH:mm:ss'" /></div>
<%} else if(item.type == "时间框"){%>
<div><#time id="${item.en}" name="${item.en}" value="${isEmpty(item.value!) ? '' : strutil.formatDate(item.value, 'yyyy-MM-dd HH:mm:ss')}" isNoN="${item.is_required!}" disable="${item.is_disable!}" options="format:'yyyy-MM-dd HH:mm:ss'" /></div>
<%} else if(item.type == "日期框"){%>
    <div><#time id="${item.en}" name="${item.en}" value="${isEmpty(item.value!) ? '' : strutil.formatDate(item.value, 'yyyy-MM-dd')}" isNoN="${item.is_required!}" disable="${item.is_disable!}" options="format:'yyyy-MM-dd'"/></div>
<%} else if(item.type == "文本域"){%>
	<div><#texts id="${item.en}" name="${item.en}" value="${item.value!item.defaulter}" isNoN="${item.is_required!}" placeholder="${item.placeholder!}" validator="${item.validator!}" style="width:758px;height:${item.height!20}px;" disable="${item.is_disable!}" /></div>
<%} else if(item.type == "编辑框"){%>
	<div><#edit id="${item.en}" name="${item.en}" value="${item.value!item.defaulter}" isNoN="${item.is_required!}" style="width: 758px;height:150px;margin-bottom: 5px;float: left;" disable="${item.is_disable!}" /></div>
<%} else if(item.type == "JSON框"){%>
	<div><#json id="${item.en}" name="${item.en}" value="${item.value!item.defaulter}" isNoN="${item.is_required!}" style="width: 758px;height:250px;margin-bottom: 5px;float: left;" disable="${item.is_disable!}" /></div>
<%} else if(item.type == "复选框"){%>
	<div><#check id="${item.en}" name="${item.en}" value="${item.value!item.defaulter}" isNoN="${item.is_required!}" disable="${item.is_disable!}" /></div>
<%} else if(item.type == "图片框"){%>
	<div><#img1 id="${item.en}" name="${item.en}" value="${item.value!item.defaulter}" isNoN="${item.is_required!}" filedir="${item.config.filedir!}" options="disable : ${item.is_disable!'false'}" /></div>
<%} else if(item.type == "文件框"){%>
	<div><#file id="${item.en}" name="${item.en}" value="${item.value!item.defaulter}" isNoN="${item.is_required!}" disable="${item.is_disable!}" filedir="${item.config.filedir!}" /></div>
<%} else if(item.type == "图标框"){%>
    <div><#icon id="${item.en}" name="${item.en}" value="${item.value!item.defaulter}" isNoN="${item.is_required!}" disable="${item.is_disable!}" /></div>
<%} else if(item.type == "文本框"){%>
    <div><#text id="${item.en}" name="${item.en}" value="${item.value!item.defaulter}" placeholder="${item.placeholder!}" isNoN="${item.is_required!}" validator="${item.validator!}" options="" disable="${item.is_disable!}" /></div>
<%} else if(item.type == "密码框"){%>
    <div><#pwd id="${item.en}" name="${item.en}" value="${item.value!item.defaulter}" placeholder="${item.placeholder!}" isNoN="${item.is_required!}" validator="${item.validator!}" options="" disable="${item.is_disable!}" /></div>
<%} else if(item.type == "定时框"){%>
    <div><#timing id="${item.en}" name="${item.en}" code="${item.object_code}" field="${item.en}" value="${item.value!item.defaulter}" isNoN="${item.is_required!}" multiple="${item.is_multiple}" disable="${item.is_disable!}" /></div>
<%} else {// 默认为文本框%>
    <%for(widget in widgets){%>
	    <%if(widget.value == item.type){%>
	    <div><%include(widget.path, {'field' : item}){}%></div>
	    <%}%>
    <%}%>
<%}%>