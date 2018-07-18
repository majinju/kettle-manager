<div class="eova-file">
	<input type="text" id="${id!}" name="${name!}" value="${value!}" style="width: 158px;"><img src="${isEmpty(value!) ? '' : IMG + filedir + '/' + value	}" style="width: 20px; height: 20px;">
	<input type="file" id="${id!}_file" name="${name!}_file" accept="image/*" style="left: 49px; top: 216px; width: 190px;border:1px solid red;cursor: pointer;">
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
	
	var myfun = function(){
		var $this = $(this);
		console.log($this.val());
		$this.siblings('input').val($this.val());
		var reader = new FileReader();
		var files = $this.prop('files');
		reader.readAsDataURL(files[0]);
		reader.onload = function(e) {
			$('.eova-file img').attr('src', e.target.result);
		}
		
		$.ajaxFileUpload({
			url : '/upload/img?name=${name!}_file&filedir=${filedir}',
			secureuri : false,
			fileElementId : '${id!}_file',
			dataType : 'json',
			success : function(data, status) {
				// 将返回数据转换为JSON对象
				json = eval(data);
				var msg = json.msg;
				if (json.success) {
					$input.val(json.fileName);
					console.log("图片上传成功！");
				} else {
					alert(msg);
				}
			},
			error : function(data, status, e) {
				alert('网络异常，请稍后再试！');
			}
		});
	}
	
	// 异步传图(动态绑定事件)
	$(document).on("change","#${id!}_file", myfun);
	
	// init file
//		$("#${id!}_file").replaceWith($("#${id!}_file").val('').clone(true));
//		var file = document.getElementById("${id!}_file");
//		file.outerHTML = file.outerHTML;
//		var $file = $("#${id!}_file");
//     $file.val("");
//     var newJqObj = $file.clone();
//     newJqObj[0]
//     var domObj = $file[0];
//     domObj.outerHTML = domObj.outerHTML;
    
//     $file.before(newJqObj);
//     $file.remove();
});
</script>