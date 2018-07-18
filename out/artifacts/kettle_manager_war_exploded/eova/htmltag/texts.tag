<%
// name
if(isTrue(isQuery!)){
	name = QUERY + name;
}
%>
<textarea class="eova-texts" id="${id!}" name="${name}" placeholder="${placeholder!}" ${htmlattrs!} 
style="${style!};border: 1px solid #95B8E7;" ${isTrue(disable!) ? 'disabled' : ''} >${value!}</textarea>