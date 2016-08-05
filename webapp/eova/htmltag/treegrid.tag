<table id="${id}"></table>
<script>
$(function () {
    // init param
    var id = "${id!}";
    var masterId = "${masterId!}";
    var $treegrid = $("#" + id);
    var $masterGrid;
    if (masterId != "") {
        $masterGrid = $("#" + masterId);
    }

    var menuCode = '${menuCode!}';// medaobject code
    var objectCode = '${objectCode!}';// medaobject code
    var toolbar = '${toolbar!}';// grid ref toolbar
    var treeField = '${treeField!}';// medaobject code

    var url = '${url!}';// diy grid load data url
    var objectJson = '${objectJson!}';// object is json
    var fieldsJson = '${fieldsJson!}';// fiedlds is json
    var configJson = '${configJson!}';// config is json

    if (url == '') {
        url = '/treegrid/query/' + objectCode;
        if (menuCode != '') {
            url = url + '-' + menuCode;
        }
    }
    var paras = $.getUrlParas();
    // 是否含有关联查询条件
    if (paras && paras.indexOf('query_') != -1) {
        url = url + '?' + paras;
    }

    // console.log(objectCode + 'isFirstLoad' + isFirstLoad);

    var config, object, fields;

    if (configJson != '') {
        config = JSON.parse(configJson);
    }
    if (objectJson != '') {
        object = JSON.parse(objectJson);
    } else {
        $.syncGetJson('/meta/object/' + objectCode, function (json) {
            object = json;
        });
    }
    if (fieldsJson != '') {
        fields = JSON.parse(fieldsJson);
    } else {
        $.syncGetJson('/meta/fields/' + objectCode, function (json) {
            fields = json;
        });
    }
    //    console.log(object);
    //    console.log(fields);

    // 当前对象是否允许初始加载数据
    var isFirstLoad = false;
    var isFirstLoadNow = eval('${isFirstLoad!true}');
    // 必须当前业务和对象都允许加载数据
    if (isFirstLoadNow && object.is_first_load) {
        isFirstLoad = true;
    }

    var cols = [];
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
            if (f.type == '编辑框' || f.type == '文本域') {
                attr.formatter = function (value, row, index, field) {
                    if (value && value.length > 10) {
                        //alert($.encodeHtml(value));
                        return '<span title="' + $.encodeHtml(value) + '">' + $.encodeHtml(value) + '</span>'
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
            if (f.type == '下拉框') {
                editor.options = {
                    url: '/widget/comboJson/' + objectCode + '-' + f.en, valueField: 'id', textField: 'cn', multiple: f.is_multiple
                }
            } else if (f.type == '查找框') {
                editor.options = {
                    url: '/widget/find?code=' + objectCode + '&field=' + f.en + '&multiple=' + f.is_multiple
                }
            } else if (f.type == '日期框') {
                editor.options = {
                    format: 'yyyy-MM-dd'
                }
            }
            attr.editor = editor;
        }

        cols.push(attr);
    });

    console.log(cols);

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
    var $myGrid = $("#" + id).treegrid({
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

        toolbar: toolbar ? '#' + toolbar : null,

        sortName: sortName,
        sortOrder: sortOrder,
        idField: object.pk_name,
        treeField: treeField,

        url: url,
        method: 'post',
        columns: [cols],

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
        onRowContextMenu: function (e, rowIndex, rowData) {
            e.preventDefault();
            if (!rowMenu) {
                createRowMenu();
            }
            selectIndex = rowIndex;
            rowMenu.menu('show', {
                left: e.pageX,
                top: e.pageY
            });
        }
        
    })

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
             $myGrid.datagrid('reload');
         }
     });
     rowMenu.menu('appendItem', {
         text: '导出所有数据',
         name: 'exportAll',
         iconCls: 'icon-pageexcel',
         onclick: function () {
             window.location.href = '/grid/export/' + objectCode;
         }
     });
     rowMenu.menu('appendItem', {
         text: '导出本页数据',
         name: 'exportAll',
         iconCls: 'icon-pageexcel',
         onclick: function () {
         	// 导出Xls
             $.gridToExcel($myGrid, objectCode);
         }
     });
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
             window.open('/meta/edit/' + objectCode);
         }
     });
     cmenu.menu('appendItem', {
         text: '编辑元对象',
         name: 'editmeta',
         iconCls: 'icon-tableedit',
         onclick: function () {
             loadDialog($myGrid, '修改元对象', '/form/update/eova_object_code-' + object.id);
         }
     });
     <%}%>
     // 动态加载列作为菜单项目
     cmenu.menu('appendItem', {
text: 'other',
name: 'other',
iconCls: ''
     });
 }
});
</script>