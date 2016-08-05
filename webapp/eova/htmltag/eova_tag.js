
// 初始化事件,初始化设置背景
$(document).ready(function(){
	// 获取所有的eova下拉框
	var selects = $("select[eova_rediv]");
	// 自动绑定关联数据DIV
	selects.each(function(i){
		var divid = $(this).attr("eova_rediv");
		// alert(divid);
		var div = $("#" + divid);
		// 绑定数据
		eova_initComBo($(this), div);
	 });
});

//初始化构建下拉框required:true,
var eova_initComBo = function(select,div){
	var isEdit = false;
	if(select.attr("edit") == "true"){
		isEdit = true;
	}
	select.combo({
	    editable: isEdit
	});
	div.appendTo(select.combo('panel'));
	div.find('input').click(function(){
	    var v = $(this).val();
	    var s = $(this).next('span').text();
	    select.combo('setValue', v).combo('setText', s).combo('hidePanel');
	});
}

// 鼠标移入切换背景
var eova_onMouseOverBg = function(sp){
	sp.css("background-color","#BDD0EC");
};

// 鼠标移出切换背景
var eova_onMouseOutBg = function(sp){
	sp.css("background-color","#E0ECFF");
};

//清空文本框的值
var eova_clearVal = function(input, flag){
	if(flag) {
		input.val("");
		input.validatebox('validate')
	}
}

// ICON选择窗
var eova_iconDialog = function(input, span) {
	// 获取选中行
	// 弹出窗口
	var dialog = parent.sy.modalDialog({
		id : 'icon_ok',
		title : '修改ICON',
		url : '/toIcon',
		buttons : [ {
			text : '修改',
			handler : function() {
				dialog.find('iframe').get(0).contentWindow.selectIcon(dialog, input, span);
				// 初始化焦点
				window.focus();
			}
		} ]
	}, 572, 390);
};
