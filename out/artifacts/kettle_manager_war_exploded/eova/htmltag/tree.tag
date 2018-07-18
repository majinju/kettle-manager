<div style="padding:5px">
	<ul class="easyui-tree" id="${id}" ></ul>
</div>
<script>
$(function() {
	$('#${id}').tree({
		url : '/showTree/0',
		parentField : 'pid',
		animate : true,
		onClick : nodeClick
	});
});
</script>