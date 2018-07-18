<div class="eova-file">
	<input type="text" id="${id!}" name="${name!}" value="${value!}" style="width: 158px;"><i class="ei"></i>
	<input type="file" id="${id!}_file" name="${name!}_file" style="left: 49px; top: 216px; width: 190px;border:1px solid red;cursor: pointer;">
</div>
<script>
$(function() {
	
	var $input = $('#${id!}');
	
	var htmlOptions = eval('({${options!}})');
	if (htmlOptions.disable) {
        // 灰色遮罩实现禁用
        $input.parent().mask();
    }
	
	// init input file
	$('.eova-file').each(function() {
		var offset = $(this).find('input[type=text]').offset();
		$(this).find('input[type=file]').css({
			left : offset.left-1,
			top : offset.top-1,
			width : $(this).width()
		});
	});
	
	// 异步上传(动态绑定事件)
	$(document).on("change","#${id!}_file",function(){
		var $this = $(this);
		console.log($this.val());
		$this.siblings('input').val($this.val());
		
		$.ajaxFileUpload({
			url : '/upload/file?name=${name!}_file',
			secureuri : false,
			fileElementId : '${id!}_file',
			dataType : 'json',
			success : function(data, status) {
				// 将返回数据转换为JSON对象
				json = eval(data);
				var msg = json.msg;
				if (json.success) {
					$input.val(json.fileName);
					console.log("上传成功！");
				} else {
					alert(msg);
				}
			},
			error : function(data, status, e) {
				alert('网络异常，请稍后再试！');
			}
		});
	});
});
</script>