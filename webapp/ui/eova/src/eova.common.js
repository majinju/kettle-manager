(function ($) {

    /**
     * 拓展全局静态方法
     */
    $.extend({
        /**
         * 继承原型
         * @param SubType 子类
         * @param SuperType 父类
         */
        extendPrototype: function (SubType, SuperType) {
            var temp = function () {
            };
            temp.prototype = SuperType.prototype;
            SubType.prototype = new temp();
            SubType.prototype.constructor = SubType;
        },
        /**
         * 获取HTML参数
         * @param box 控件对象
         * @returns {undefined}
         */
        getHtmlOptions: function(box){
            var htmlOptions = undefined;
            var strOptions = box.$dom.data('options');
            if(strOptions){
                htmlOptions = eval('({' + strOptions + '})');
            }
            return htmlOptions;
        },
        // 初始化Eova控件
        eovaInit: function (jq ,EovaType, eovaKey, options) {
            var list = [];
            jq.each(function () {
                // 单例实例化
                var obj = $.data(this, eovaKey);
                if (!obj) {
                    obj = new EovaType(this, options);
                    $.data(this, eovaKey, obj);
                }

                list.push(obj);
            });

            if (list.length == 1) {
                return list[0];
            }

            return list;
        },
        // Tip 警告
        tipwarn: function($el , msg){
            var $tip = $el.tooltip({
                position: 'bottom',
                deltaY : -6,
                showEvent: null,
                hideEvent: 'mousemove',
                content: '<span><span class="pd5 icon-exclamation">&nbsp;</span>'+ msg +'</span>',
                onShow: function () {
                    $(this).tooltip('tip').css({
                        'border': '1px solid transparent',
                        'background-color': '#fffcef',
                        'border-color': '#ffbb76',
                        'color': '#db7c22'});
                }
            }).tooltip('show');
            setTimeout(function () {
                $tip.tooltip('destroy');
            }, 3000);
            return $tip;
        },
        // Nice 校验处理
        validation: function(e, current){
            // 当前字段未验证通过，Tip提示
            if(!current.isValid){
                var tip = $.tipwarn($(current.element).parent(), current.msg);
                // 开始输入销毁提示
                $(current.element).keydown(function(event){
                    tip.tooltip('destroy');
                    $(this).unbind("keydown");
                });
            }
        },
        // 右下角弹窗提示
        slideMsg: function(str,$pjq){
        	var $jq = $;
        	if($pjq){
        		$jq = $pjq;
        	}
            $jq.messager.show({
                title:'操作提示',
                msg:str,
                timeout:1500,
                showType:'slide'
            });
        },
        // 弹窗提示
        alert: function($pjq, msg){
        	if(!msg || msg == null || msg == ""){
        		msg = "服务异常，请稍后再试！";
        	}
        	
            if(msg.startsWith('info')){
            	msg = msg.replace("info:", "");
            	$pjq.messager.alert('提示', msg, 'info');
            } else if(msg.startsWith('warn')){
            	msg = msg.replace("warn:", "");
            	$pjq.messager.alert('警告', msg, 'warning');
            } else if(msg.startsWith('error')){
            	msg = msg.replace("error:", "");
            	$pjq.messager.alert('错误', msg, 'error');
            } else {
            	$pjq.messager.alert('错误', msg, 'error');
            }
        },
        // Grid 导出为
        gridToExcel: (function () {
            var uri = 'data:application/vnd.ms-excel;base64,';
            var template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>';
            var base64 = function (s) {
                return window.btoa(unescape(encodeURIComponent(s)))
            };
            var format = function (s, c) {
                return s.replace(/{(\w+)}/g,
                        function (m, p) {
                            return c[p];
                        })
            };

            return function ($grid, name) {

                // 拼接Excel Header
                var s = "<tr>";
                var fields = $grid.datagrid('getColumnFields');
                for (var i = 0; i < fields.length; i++) {
                    var field = fields[i];
                    console.log(field);
                    // 复选框不导出
                    if(field == 'ck'){
                    	continue;
                    }
                    var col = $grid.datagrid('getColumnOption', field);
                    var title = col.title;
                    if(!title) title = ''; 
                    
                    s=s + "<td>" + title + "</td>";
                }
                s = s + "</tr>";
                
                
                var rows = $grid.datagrid('getRows');
                for(var x = 0; x < rows.length; x++){
                	var row = rows[x];
                	console.log(row);
                	s = s + "<tr>";
                	for (var i = 0; i < fields.length; i++) {
                        var field = fields[i];
                     	// 复选框不导出
                        if(field == 'ck'){
                        	continue;
                        }
                        s=s + "<td>" + row[field] + "</td>";
                	}
                	s = s + "</tr>";
                }

                var ctx = {
                    worksheet: name || 'Worksheet',
                    table: s
                }
                window.location.href = uri + base64(format(template, ctx));
            }
        })(),
        // 截取字符串，多余的部分用...代替  
		clipStr : function(str, len) {
			var s = "";
			for ( var i = 0; i < str.length; i++) {
				s += str.charAt(i);
				if (i + 1 == len) {
					return s + "...";
				}
			}
			return s;
		}  
    });

    /**
	 * 拓展EasyUI DataGrid编辑器
	 */
    $.extend($.fn.datagrid.defaults.editors, {
        eovatext: {
            init: function(container, options) {
                var editor = $('<div class="eova-text" name="'+ options.name +'"></div>').appendTo(container);
                editor.eovatext(options);
                return editor;
            },
            getValue: function(jq) {
                return $(jq).eovatext().getValue();
            },
            setValue: function(jq, value) {
                $(jq).eovatext().setValue(value);
            },
            resize: function(jq, value) {
                $(jq).eovatext().setWidth(value);
            }
        },
        eovatime: {
            init: function(container, options) {
                var editor = $("<div class=\"eova-time\"></div>").appendTo(container);
                editor.eovatime(options);
                return editor;
            },
            getValue: function(jq) {
                return $(jq).eovatime().getValue();
            },
            setValue: function(jq, value) {
                $(jq).eovatime().setValue(value);
            },
            resize: function(jq, value) {
                $(jq).eovatime().setWidth(value);
            }
        },
        eovacombo: {
            init: function(container, options) {
                var editor = $("<div class=\"eova-combo\"></div>").appendTo(container);
                editor.eovacombo(options);
                return editor;
            },
            destroy: function(jq) {
                $(jq).eovacombo().destroy();
            },
            getText: function(jq) {
                return $(jq).eovacombo().getText();
            },
            getValue: function(jq) {
                return $(jq).eovacombo().getValue();
            },
            setValue: function(jq, value) {
            	var texts = [];
            	if(value && value != ""){
            		if(value.indexOf(',') == -1 ){
                		texts = [value];
                	} else {
                		texts = value.split(',');
                	}
            	}
            	
                $(jq).eovacombo().setTexts(texts);
            },
            resize: function(jq, value) {
                $(jq).eovacombo().setWidth(value);
            }
        },
        eovafind: {
            init: function(container, options) {
                var editor = $("<div class=\"eova-find\"></div>").appendTo(container);
                editor.eovafind(options);
                return editor;
            },
            getText: function(jq) {
                return $(jq).eovafind().getText();
            },
            getValue: function(jq) {
                return $(jq).eovafind().getValue();
            },
            setValue: function(jq, value) {
                $(jq).eovafind().setText(value);
            },
            resize: function(jq, value) {
                $(jq).eovafind().setWidth(value);
            }
        },
        eovacheck: {
            init: function(container, options) {
                var editor = $("<div class=\"eova-check\"></div>").appendTo(container);
                editor.eovacheck(options);
                return editor;
            },
            getValue: function(jq) {
                return $(jq).eovacheck().getChecked();
            },
            setValue: function(jq, value) {
                $(jq).eovacheck().setChecked(value);
            },
            resize: function(jq, value) {
                //$(jq).eovatext().setWidth(value);
            }
        }
    });

    /**
     * Grid Cell Edit extend
     */
    $.extend($.fn.datagrid.methods, {
        editCell: function (jq, param) {
            return jq.each(function () {
                var opts = $(this).datagrid('options');
                var fields = $(this).datagrid('getColumnFields', true).concat($(this).datagrid('getColumnFields'));
                for (var i = 0; i < fields.length; i++) {
                    var col = $(this).datagrid('getColumnOption', fields[i]);
                    col.editor1 = col.editor;
                    if (fields[i] != param.field) {
                        col.editor = null;
                    }
                }
                $(this).datagrid('beginEdit', param.index);
                var ed = $(this).datagrid('getEditor', param);
                if (ed) {
                    if ($(ed.target).hasClass('textbox-f')) {
                        $(ed.target).textbox('textbox').focus();
                    } else {
                        $(ed.target).focus();
                    }
                }
                for (var i = 0; i < fields.length; i++) {
                    var col = $(this).datagrid('getColumnOption', fields[i]);
                    col.editor = col.editor1;
                }
            });
        },
        enableCellEditing: function (jq) {
            return jq.each(function () {
                var dg = $(this);
                var opts = dg.datagrid('options');
                opts.oldOnClickCell = opts.onClickCell;
                opts.onClickCell = function (index, field) {
                    if (opts.editIndex != undefined) {

                        if (dg.datagrid('validateRow', opts.editIndex)) {

                            var $validataZone = $('#' + opts.id).parent();
                            if(!$validataZone.isValid()){
                                // 校验失败
                                return;
                            }
                            dg.datagrid('endEdit', opts.editIndex);
                            opts.editIndex = undefined;
                        } else {
                            return;
                        }
                    }
                    dg.datagrid('selectRow', index).datagrid('editCell', {
                        index: index,
                        field: field
                    });
                    opts.editIndex = index;
                    opts.oldOnClickCell.call(this, index, field);
                }
            });
        }
    });

    // 屏蔽控件
    $.fn.mask = function () {
        if($(this).data("mask") == 1){
            return;
        }
        var divHtml = '<div class="divMask" style="position: absolute; width: 100%; height: 22px; left: 0px; top: -3px; background: #DADADA; opacity: 0.5; filter: alpha(opacity=0)"> </div>';
        $(this).wrap('<span style="position: relative"></span>');
        $(this).parent().append(divHtml);
        $(this).data("mask", 1);
    }
    //取消屏蔽
    $.fn.unmask = function () {
        if($(this).data("mask") == 1){
            $(this).parent().find(".divMask").remove();
            $(this).unwrap();
            $(this).data("mask", 0);
        }
    }

})(jQuery);