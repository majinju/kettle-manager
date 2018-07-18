<script type="text/javascript" src="/ui/js/jquery-upload.js"></script>
<div class="eova-file">
	<input type="text" id="${id!}" name="${name!}" value="${value!}" style="width: 158px;"><i class="ei" title="点击选择时间"></i><input type="file" id="${id!}_file" name="${name!}_file" accept="image/*" style="left: 49px; top: 216px; width: 190px;border:1px solid red;cursor: pointer;"><br><img src="${isEmpty(value!) ? '' : IMG + filedir + '/' + value	}" style="width: 178px; height: 178px;">
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
	
	// 异步传图(动态绑定事件)
	var myfun = function(){
		
		var $this_file = $("#${id!}_file");
		console.log($this_file.val());
		$input.val($this_file.val());
		var reader = new FileReader();
		var files = $this_file.prop('files');
		reader.readAsDataURL(files[0]);
		reader.onload = function(e) {
			$('.eova-file img').attr('src', e.target.result);
		}
	
		$input.val("Loading...");
		
		$('#${id!}_file').upload({
			action: '/upload/img?name=${name!}_file&filedir=${filedir}',
			name: "${name!}_file",
			onsuccess: function(json) {
				$input.val(json.fileName);
			}
		});
	};
	
	$(document).on("change","#${id!}_file", myfun);
	
});
</script>