<table id="${id}" width="auto" height="auto"></table>
<script>
// var ${'$'+id};
var $myGrid_${id};
var objectCode_${id} = '${objectCode!}';// medaobject code
$(function () {
	
    // init param
    var id = "${id!}";
    var masterId = "${masterId!}";
    var $grid = $("#" + id);
    var $masterGrid;
    if(masterId != ""){
    	$masterGrid = $("#" + masterId);
    }

    var fromData = {};
    var formId = '${formId!}';
    if(formId != ''){
        fromData = sy.serializeObject($('#'+formId));
    }
    
    var menuCode = '${menuCode!}';// medaobject code
    var toolbar = '${toolbar!}';// grid ref toolbar
    var isPaging = eval('${isPaging!true}');// is show pagination
    var url = "${url!}";// diy grid load data url
    var objectJson = '${objectJson!}';// object is json
    var fieldsJson = '${fieldsJson!}';// fiedlds is json
    var configJson = '${configJson!}';// config is json
    
    if (url == '') {
        url = '/grid/query/' + objectCode_${id};
        if(menuCode != ''){
        	url = url + '-' + menuCode;
        }
    }
    var paras = $.getUrlParas();
    // 是否含有关联查询条件
    if(paras && paras.indexOf('query_') != -1){
    	url = url + '?' + paras;
    }
    
    // console.log(objectCode_${id} + 'isFirstLoad' + isFirstLoad);

    var config, object, fields;

    if(configJson != '') {
        config = JSON.parse(configJson);
    }
    if(objectJson != '') {
        object = JSON.parse(objectJson);
    } else {
        $.syncGetJson('/meta/object/' + objectCode_${id}, function (json) {
            object = json;
        });
    }
    if(fieldsJson != '') {
        fields = JSON.parse(fieldsJson);
    } else  {
        $.syncGetJson('/meta/fields/' + objectCode_${id}, function (json) {
            fields = json;
        });
    }
//    console.log(object);
//    console.log(fields);

    // 当前对象是否允许初始加载数据
    var isFirstLoad = false;
    var isFirstLoadNow = eval('${isFirstLoad!true}');
	// 必须当前业务和对象都允许加载数据
    if(isFirstLoadNow && object.is_first_load){
    	isFirstLoad = true;
    }

    var cols = [];
    var validators = {};
    // 批量选择框
    if (!object.is_single) {
        var attr = new Object;
        attr.field = 'ck';
        attr.checkbox = true;
        cols.push(attr);
    }
    // 字段属性
    $.each(fields, function (i, f) {
        if (!f.is_show) {
            // continue;
            return true;
        }

        var attr = new Object;
        attr.field = f.en;
        attr.title = f.cn;
        attr.width = f.width ? f.width : 150;

        if (f.is_order) {
            attr.sortable = true;
        }

        if (f.formatter != null) {
            attr.formatter = new Function('return ' + f.formatter)();
        } else {
            // 默认格式化处理
            if (f.type == '复选框') {
                attr.align = 'center';
                attr.formatter = function (value, row, index, field) {
                    var ck = '<span class="ck0">□</span>';
                    if (value) {
                        ck = '<span class="ck1">☑</span>';
                    }
                    return ck;
                };
            }
            if (f.type == '文本框' || f.type == '编辑框' || f.type == '文本域') {
                attr.formatter = function (value, row, index, field) {
                    if (value && value.length > 10) {
                    	//alert($.encodeHtml(value));
                        return '<span title="' + $.encodeHtml(value) + '">' + $.encodeHtml(value) + '</span>'
                    }
                    return value;
                }
            }else if (f.data_type == "string" && f.type == '时间框') {
                attr.formatter = function (value, row, index, field) {
                    if (value && value.length == 14) {
                        return value.time14Totime19();
                    }
                    return value;
                }
            }else if (f.type == '定时框') {
                attr.formatter = function (value, row, index, field) {
                    if (value) {
                        var url = '/timing/timingShow/' + value;
                        var t = value;
                        $.ajax({
                            async:false,
                            url: url,
                            dataType: 'text',
                            success: function (text) {
                                t = text;
                            }
                        });
                        return '<span title="' + $.encodeHtml(t) + '">' + $.encodeHtml(t) + '</span>';
                    }
                    return value;
                }
            }
        }
        // Grid Cell Editor,对象和字段允许行内编辑自增，自增长禁止编辑
        if (object.is_celledit && f.is_edit) {
        	if(object.is_auto && object.is_auto == true){
        		return;
        	}
            var editor = new Object;
            editor.type = f.editor;
            // 构造参数
            editor.options = {};
            if (f.type == '下拉框') {
                editor.options = {
                    url: '/widget/comboJson/' + objectCode_${id} + '-' + f.en, valueField: 'id', textField: 'cn', multiple: f.is_multiple
                }
            } else if (f.type == '查找框') {
                editor.options = {
                    url: '/widget/find?code=' + objectCode_${id} + '&field=' + f.en + '&multiple=' + f.is_multiple
                }
            } else if (f.type == '定时框') {
                editor.options = {
                        url: '/metl/data_task/toTiming'
                 }
                editor.type = "eovatiming";
            } else if (f.type == '日期框') {
                editor.options = {
            		format: 'yyyy-MM-dd'
                }
            } else if (f.data_type == "string" && f.type == '时间框') {
                editor.options = {
                	format: 'yyyyMMddHHmmss'
                }
                editor.type = "eovatime";
            }
            editor.options['name'] = f.en;
            
            attr.editor = editor;
            
         	// validator
            var rule = '';
            if(f.is_required){
                rule = f.cn + ':required;';
            }
            if(f.validator){
                rule = rule + f.validator;
            }
            if(rule != ''){
    	        validators[f.en] = { rule: rule };
            }
        }

        cols.push(attr);
    });

    console.log({"cols":cols});

	// 默认排序
	var sortName = null,sortOrder = 'asc';
	if(object.default_order){
		var defaultOrder = object.default_order.split(' ');
		sortName = defaultOrder[0];
		if(defaultOrder.length > 1){
			sortOrder = defaultOrder[1];
		}
	}

    var selectIndex;
    $myGrid_${id} = $grid.datagrid({
        fit: true,
        border: false,
        striped: true,
        align: 'right',
        autoRowHeight: true,
        collapsible: false,
        remoteSort: true,
        multiSort: false,
        rownumbers: object.is_show_num,
        showFooter: true,
       
        ctrlSelect: true,
        singleSelect: object.is_single,
        selectOnCheck: true,
        checkOnSelect: true,

        toolbar: toolbar ? '#' + toolbar : null,
        pagination: isPaging,
        pageSize: 15,
        pageList: [15, 30, 50, 100, 200, 500, 1000, 2000],

        idField: object.pk_name,
        sortName: sortName,
        sortOrder: sortOrder,

        url: url,
        method: 'post',
        columns: [cols],
        // frozenColumns: [[{field:'diy_fun',title:'操作'}]],
        queryParams:fromData,

        onHeaderContextMenu: function (e, field) {
            e.preventDefault();
            if (!cmenu) {
                createColumnMenu();
            }
            cmenu.menu('show', {
                left: e.pageX,
                top: e.pageY
            });
        },
        onBeforeLoad: function () {
            // 阻止初始化加载数据
            if (!isFirstLoad) {
                isFirstLoad = true;
                return false;
            }
        },
        onLoadSuccess: function (data) {
            $myGrid_${id}.datagrid("clearSelections");
            if (object.is_celledit && data.total < 1) {
                // 暂时禁用，初始化不加载空行，使用Grid 分页栏按钮添加！
                $myGrid_${id}.datagrid('insertRow', {index: 0, row: {}});
            }
        },
        onRowContextMenu: function (e, rowIndex, rowData) {
            e.preventDefault();
            if('${showRowMenu!true}'!='true'){
                return;
            }
            if (!rowMenu) {
                createRowMenu();
            }
            selectIndex = rowIndex;
            rowMenu.menu('show', {
                left: e.pageX,
                top: e.pageY
            });
        }
    });
    
//     ${'$'+id} = $myGrid_${id};

    // 开启编辑模式
    if (object.is_celledit) {
        $myGrid_${id}.datagrid('enableCellEditing');
    }

    var rowMenu;
    function createRowMenu() {
        rowMenu = $('<div/>').appendTo('body');
        rowMenu.menu({
            id: 'rowMenu',
            onClick: function (item) {
                console.log('click menu' + item.text);
            }
        });
        rowMenu.menu('appendItem', {
            text: '刷新',
            name: 'reload',
            iconCls: 'pagination-load',
            onclick: function () {
                $myGrid_${id}.datagrid('reload');
            }
        });
        rowMenu.menu('appendItem', {
            text: '导出所有数据',
            name: 'exportAll',
            iconCls: 'icon-pageexcel',
            onclick: function () {
                window.location.href = '/grid/export/' + objectCode_${id};
            }
        });
        rowMenu.menu('appendItem', {
            text: '导出本页数据',
            name: 'exportAll',
            iconCls: 'icon-pageexcel',
            onclick: function () {
            	// 导出Xls
                $.gridToExcel($myGrid_${id}, objectCode_${id});
            }
        });
        if (object.is_celledit) {
        	var rowData = {};
        	if($masterGrid){
	        	// 获取主表选中行
	        	var gridSelectRow = $masterGrid.datagrid('getSelected');
        		if(gridSelectRow){
        			// 初始添加关键字段
                    var val = gridSelectRow[config.objectField];
        			rowData[config.fields[0]] = val;
        			rowData[config.fields[0]+'_val'] = val;
        		}
        	}
        	
        	rowMenu.menu('appendItem', {
                text: '删除行',
                name: 'delete',
                iconCls: 'icon-tabledelete',
                onclick: function () {
                	console.log('删除行，索引=' +  selectIndex);
					$myGrid_${id}.datagrid('deleteRow', selectIndex);
                }
            });
            rowMenu.menu('appendItem', {
                text: '新增行',
                name: 'add',
                iconCls: 'icon-tableadd',
                onclick: function () {
                    $myGrid_${id}.datagrid('insertRow', {
                        index: 0,
                        row: rowData
                    });
                }
            });
            rowMenu.menu('appendItem', {
                text: '保存数据',
                name: 'save',
                iconCls: 'icon-tablesave',
                onclick: function () {
                    saveTable_${id}();
                }
            });
//            rowMenu.menu('appendItem', {
//                text: '回滚数据',
//                name: 'reject',
//                iconCls: 'icon-undo',
//                onclick: function () {
//                    //$myGrid_${id}.datagrid('rejectChanges');
//                    console.log('回滚数据');
//                }
//            });
        }
    }

    var cmenu;
    function createColumnMenu() {
        cmenu = $('<div/>').appendTo('body');
        // 初始化菜单
        cmenu.menu();
        <%// 仅超级管理员可见%>
        <%if(session.user.rid == 1){%>
        cmenu.menu('appendItem', {
            text: '编辑元字段',
            name: 'editmeta',
            iconCls: 'icon-tableedit',
            onclick: function () {
                window.open('/meta/edit/' + objectCode_${id});
            }
        });
        cmenu.menu('appendItem', {
            text: '编辑元对象',
            name: 'editmeta',
            iconCls: 'icon-tableedit',
            onclick: function () {
                loadDialog($myGrid_${id}, '修改元对象', '/form/update/eova_object_code-' + object.id);
            }
        });
        <%}%>
    }
    
    if (object.is_celledit) {
    	// validator init
        var $form = $('#${id}').parent();// get datagrid-view dom is validata zone
        $form.validator({
            debug: false,
            stopOnError: true,
            focusInvalid : false,
            showOk: false,
            timely: 0,
            msgMaker: false,
            fields: validators
        });
        $form.on("validation", $.validation);    	
    }
//    var pager = $myGrid_${id}.datagrid('getPager');
//    pager.pagination({
//        buttons: [
//            {
//                iconCls: 'icon-tableadd',
//                handler: function () {
//                    $myGrid_${id}.datagrid('insertRow', {
//                        index: 0,
//                        row: {}
//                    });
//                }
//            },
//            {
//                iconCls: 'icon-tabledelete',
//                handler: function () {
//                    alert('tabledelete');
//                }
//            },
//            {
//                iconCls: 'icon-tablesave',
//                handler: function () {
//                    alert('save');
//                }
//            }
//        ]
//    });
});
var saveTable_${id} = function(){
    var inserted = $myGrid_${id}.datagrid('getChanges', 'inserted');
    var deleted = $myGrid_${id}.datagrid('getChanges', 'deleted');
    var updated = $myGrid_${id}.datagrid('getChanges', 'updated');

    var isOk = true;
    var errorMsg = '';
    if (inserted.length > 0) {
        var json1 = JSON.stringify(inserted);
        console.log('保存add数据' + json1);
        $.syncPost('/grid/add/' + objectCode_${id}, {rows: json1},
                function (result, status) {
                    if (!result.success) {
                        isOk = false;
                        errorMsg += result.msg + '<br>';
                    }
                });
    }
    if (updated.length > 0) {
        var json3 = JSON.stringify(updated);
        console.log('保存update数据' + json3);
        $.syncPost('/grid/update/' + objectCode_${id}, {rows: json3},
                function (result, status) {
                    if (!result.success) {
                        isOk = false;
                        errorMsg += result.msg + '<br>';
                    }
                });
    }
    if (deleted.length > 0) {
        var json2 = JSON.stringify(deleted);
        console.log('保存delete数据' + json2);
        $.syncPost('/grid/delete/' + objectCode_${id}, {rows: json2},
                function (result, status) {
                    if (!result.success) {
                        isOk = false;
                        errorMsg += result.msg + '<br>';
                    }
                });
    }

    if (isOk) {
        $.slideMsg("保存成功！");
        // 确认改动
        $myGrid_${id}.datagrid('acceptChanges');
        console.log('标记更改');
    } else {
        $.alert($, errorMsg);
    }
}
var dialogSaveTable_${id} = function($dialog, $grid, $pjq) {
    saveTable_${id}();
    $dialog.dialog('destroy');
};

</script>