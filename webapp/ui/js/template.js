//var wx = 0;
//var wy = 0;

$(document).ready(function(){
	console.log("document ready ...");
	
	// layout north 面板收缩时添加标题
	$(".layout-expand-north .panel-header .panel-title").html("快速查询");
	
	$('body').layout('panel','north').panel({
		onCollapse:function(){
			console.log('onCollapse redraw');
			// layout north 面板收缩时添加标题
			$(".layout-expand-north .panel-header .panel-title").html("快速查询");
		}
//		,onExpand:function(){
//			console.log('onExpand redraw');
//		},
//		onResize:function(width,height){
//			console.log('onResize redraw');
//		}
	});
	
	// 记录窗口初始大小
	wx = $(window).width();
	wy = $(window).height();
	
	// 监听 浏览器窗口 变动 事件,对子layout进行重绘
	$(window).resize(function(){
		console.log('window resize');
		//winredraw();
	});
});


//窗口重绘方法
var winredraw = function(){
	// 获取当前窗口的高度
	var x = $(window).width();
	var y = $(window).height();
	
	console.log('window resize ok, x-wx=[' + x + ',' + wx + '],y-wy=[' + y + ',' + wy +']');
	// 当窗口大小变动时，重绘子layout
	$('#gridLayout').layout('resize');
	console.log('gridLayout resize ok');

	// 储存当前窗口高度
	wx = x;
	wy = y;
};

//选中行检查
var isSelected = function(row){
 if (!row){
 	//$.messager.alert('提示', '请选择一条记录！', 'error');
 	$.slideMsg("请选择一条记录！");
 	return false;
 }
 return true;
};

// 弹出Dialog
var loadDialog = function(grid, name, url, width, height) {
	if(!width){
		width = 920;
	}
	if(!height){
		height = $(window).height() * 0.9;
	}
	// 弹出窗口
 	var dialog = parent.sy.modalDialog({
 		title : name,
 		url : url,
 		buttons : [ {
 			text : '&nbsp;&nbsp;确&nbsp;定&nbsp;&nbsp;',
 			handler : function() {
 				dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
 			}
 		},
  		{
 			text : '&nbsp;&nbsp;取&nbsp;消&nbsp;&nbsp;',
 			handler : function() {
 				dialog.dialog('close');
 			}
 		}  ]
 	}, width, height);
};

// 导入数据Dialog
var importDialog = function(grid, name, url) {
	// 弹出窗口
 	var dialog = parent.sy.modalDialog({
 		title : name,
 		url : url,
 		buttons : [ {
 			text : '确定',
 			handler : function() {
 				dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
 			}
 		} ]
 	}, 300, 180);
};

// 确认删除
var confirmDel = function($grid, objectCode, deleted){
	$.messager.confirm('请确认', '您要删除当前所选数据？', function(o) {
		if (o) {
			var json2 = JSON.stringify(deleted);
            console.log('delete数据' + json2);
            var $jq = $(this);
            $.syncPost('/grid/delete/' + objectCode, {rows: json2},
                    function (result, status) {
                        if (result.success) {
                        	$.slideMsg("删除成功！");
                        	if($grid.context.URL.indexOf('/single_tree') != -1){
                        		$grid.treegrid('load');
                        	} else {
                        		$grid.datagrid('load');
                        	}
                        } else {
                        	$.messager.alert("操作错误", result.msg ,'error');
                        }
                    });
		}
	});
};