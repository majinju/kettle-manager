///<jscompress sourcefile="eova.common.js" />
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
        eovatiming: {
            init: function(container, options) {
                var editor = $("<div class=\"eova-timing\"></div>").appendTo(container);
                editor.eovatiming(options);
                return editor;
            },
            getText: function(jq) {
                return $(jq).eovatiming().getText();
            },
            setText: function(jq,text) {
                $(jq).eovatiming().setText(text);
            },
            getValue: function(jq) {
                return $(jq).eovatiming().getValue();
            },
            setValue: function(jq, value) {
                $(jq).eovatiming().setValue(value);
            },
            resize: function(jq, value) {
                $(jq).eovatiming().setWidth(value);
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
                    dg
//                    .datagrid('selectRow', index)
                    .datagrid('editCell', {
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
///<jscompress sourcefile="eova.text.js" />
(function ($) {

    TEXTBOX = "textbox";

    $.fn.eovatext = function (options) {
//        $.eovaInit(this, TextBox, TEXTBOX, options);
        var list = [];
        this.each(function () {
            // 单例实例化
            var obj = $.data(this, TEXTBOX);
            if (!obj) {
                obj = new TextBox(this, options);
                // 初始化UI
                obj.render();
                obj.bindEvents();
                $.data(this, TEXTBOX, obj);
            } else {
            	// 覆盖参数
            	$.extend(obj.options, options);
            	$.data(this, TEXTBOX, obj);
            }

            list.push(obj);
        });

        if (list.length == 1) {
            return list[0];
        }

        return list;
    };

    /**
     * 文本框构造函数
     * @param {Object} dom 选择
     * @param {Object} options 参数
     */
    var TextBox = $.fn.eovatext.TextBox = function (dom, options) {
        this.$dom = $(dom);
        this.defaults = {
            width: 180,
            btnTitle: '点击清空文本',
            btnIcon: '',
            isReadonly: false,
            disable: false,
            required: false,
            // 事件
            onChange : function() {}
        };
        // 参数优先级：默认参数 > HTML参数 > JS参数
        this.options = $.extend({}, this.defaults, $.getHtmlOptions(this), options);

        this.name = this.$dom.attr('name');
        this.$dom.removeAttr('name');

        this.value = this.$dom.attr('value');
        this.$dom.removeAttr('value');

        console.log(this.options);
    };

    /**
     * 渲染UI
     */
    TextBox.prototype.render = function () {
        var $textbox = $("<input type='text' autocomplete='off' />").appendTo(this.$dom);// 文本显示
        var $btn = $("<i class='ei'></i>").appendTo(this.$dom);// 添加按钮

        $btn.attr('title', this.options.btnTitle);
        if (this.name) {
            $textbox.attr("name", this.name);
        }
        if (this.value) {
            $textbox.attr("value", this.value);
        }
        if(this.options.placeholder){
            $textbox.attr('placeholder', this.options.placeholder);
            $textbox.attr('title', this.options.placeholder);
        }
        if(this.options.required){
            $textbox.attr('required', 'required');
        }
        if (this.options.isReadonly) {
            $textbox.attr('readonly', 'readonly');
            $textbox.css('cursor', 'pointer');
        }
        if (this.options.disable) {
            // 灰色遮罩实现禁用
            this.$dom.mask();
        }

        this.$textbox = $textbox;
        this.$btn = $btn;

        // 初始宽度
        this.setWidth(this.options.width);
    };
    
    /**
     * 绑定事件
     */
    TextBox.prototype.bindEvents = function () {
        var $textbox = this.$textbox;
        var onChange = this.options.onChange;
        this.$textbox.bind('change', onChange);
        this.$btn.bind('click', function () {
            $textbox.val('');
            onChange();
        });
    };
    /**
     * 设置禁用
     * @param flag
     */
    TextBox.prototype.disable = function (flag) {
        if(flag){
            // 灰色遮罩实现禁用
            this.$dom.mask();
        }else{
            this.$dom.unmask();
        }
    };
    /**
     * 获取值
     * @returns {*}
     */
    TextBox.prototype.getValue = function () {
        return this.$textbox.val();
    };
    /**
     * 设置值
     * @param value
     */
    TextBox.prototype.setValue = function (value) {
        this.$textbox.val(value);
    };
    /**
     * 获取宽度
     * @returns {*}
     */
    TextBox.prototype.getWidth = function () {
        return this.options.width + 20;
    };
    /**
     * 设置宽度
     * @param width
     */
    TextBox.prototype.setWidth = function (width) {
        this.$textbox.outerWidth(width - 22);
    };
    /**
     * 设置只读
     * @param width
     */
    TextBox.prototype.readonly = function (isTrue) {
        if (isTrue) {
            this.$textbox.attr("readonly", true);
        }

    };


})(jQuery);
///<jscompress sourcefile="eova.combo.js" />
(function ($) {

    // import
    var TextBox = $.fn.eovatext.TextBox;

    COMBOBOX = "combobox";

    /**
     * 选中value所在项
     * @param comboBox
     * @param value
     */
    function selectByValue (comboBox, value) {
        // 多选：准备好所有待选中项的value
        if (comboBox.options.multiple) {
            var values = comboBox.getValues();
            // 该项是否已经选中
            for ( var i = 0; i < values.length; i++) {
                if (values[i] == value) {
                    return;
                }
            }
            // 没选中添加到待选中列表
            values.push(value);
            comboBox.setValues(values);
        } else {
            // 单选：仅选中一项
            comboBox.setValues([ value ]);
        }
    };

    /**
     * 取消value所在项
     * @param comboBox
     * @param value
     */
    function unselectByValue (comboBox, value) {
        var values = comboBox.getValues();
        for ( var i = 0; i < values.length; i++) {
            if (values[i] == value) {
                // 排除选中项
                values.splice(i, 1);
                comboBox.setValues(values);
                break;
            }
        }
    };

    /**
     * 设置下拉面板滚动条位置
     * @param {Object} jq
     * @param {Object} value
     */
    function scrollTo(jq, value) {
        var panel = $(jq).combo("panel");
        var item = panel.find("div.combobox-item[value=" + value + "]");
        if (item.length) {
            if (item.position().top <= 0) {
                var h = panel.scrollTop() + item.position().top;
                panel.scrollTop(h);
            } else {
                if (item.position().top + item.outerHeight() > panel.height()) {
                    var h = panel.scrollTop() + item.position().top
                        + item.outerHeight() - panel.height();
                    panel.scrollTop(h);
                }
            }
        }
    };

    $.fn.eovacombo = function (options) {
//        $.eovaInit(this, FindBox, FINDBOX, options);

        var list = [];
        this.each(function () {
            // 单例实例化
            var obj = $.data(this, COMBOBOX);
            if (!obj) {
                obj = new ComboBox(this, options);
                // 初始化UI
                obj.render();
                obj.reload();
                obj.bindEvents();
                $.data(this, COMBOBOX, obj);
            } else {
            	// 覆盖参数
            	$.extend(obj.options, options);
            	$.data(this, COMBOBOX, obj);
            }

            list.push(obj);
        });

        if (list.length == 1) {
            return list[0];
        }

        return list;

    };

    /**
     * 下拉框 继承 文本框
     * @type {ComboBox}
     */
    var ComboBox = $.fn.eovacombo.ComboBox = function (dom, options) {
        TextBox.apply(this, arguments);
        this.defaults = {
            btnTitle: '点击选择内容',
            btnIcon: '',
            isReadonly: true,
            multiple : false,// 多选
            separator : ",",// 多选值的分隔符号
            editable : true,// 可编辑
            valueField: 'id',
            textField: 'cn',
            ignores:'',//忽略部分选项
            // 事件
            onChange : function(oldValue, newValue) {}
        };
        // 参数优先级：父参数 > 子默认参数 > HTML参数 > JS参数
        this.options = $.extend({}, this.options, this.defaults, $.getHtmlOptions(this), options);
        console.log(this.options);
    }
    /**
     * 下拉框 继承 文本框 原型方法
     */
    $.extendPrototype(ComboBox, TextBox);

    /**
     * 重写渲染
     */
    ComboBox.prototype.render = function () {
        // 添加隐藏框
        var $valuebox = $("<input type='hidden' />").appendTo(this.$dom);
        var $textbox = $("<input type='text' />").appendTo(this.$dom);// 文本显示
        var $btn = $("<i class='ei'></i>").appendTo(this.$dom);// 添加按钮
        var $panel = $("<div class='eova-combo-panel'></div>").appendTo("body"); // 添加到body保证不被遮盖
//        $("<div value=''>&nbsp;</div>").appendTo($panel); 屏蔽默认项，默认项由服务端控制默认第一项

        $btn.attr('title', this.options.btnTitle);
        $panel.css('cursor', 'pointer');
        if (this.name) {
            $valuebox.attr("name", this.name);
        }
        if (this.value) {
            $valuebox.attr("value", this.value);
        }
        if(this.options.placeholder){
            $textbox.attr('placeholder', this.options.placeholder);
        }
        if(this.options.required){
            $textbox.attr('required', 'required');
        }
        if (this.options.disable) {
            // 灰色遮罩实现禁用
            this.$dom.mask();
        }
        if (this.options.isReadonly) {
            $textbox.attr('readonly', 'readonly');
            $textbox.css('cursor', 'pointer');
            $textbox.attr('title', this.options.btnTitle);
        }

        this.$valuebox = $valuebox;
        this.$textbox = $textbox;
        this.$btn = $btn;
        this.$panel = $panel;

        // 初始宽度
        this.setWidth(this.options.width);
    };
    /**
     * 重写事件绑定
     */
    ComboBox.prototype.bindEvents = function () {
        //var comboBox = this;
        var $textbox = this.$textbox;
        var $panel = this.$panel;
        //var $btn = this.$btn;

        $panel.unbind(".eovacombo");
        
        // 弹出下拉面板Panel
        this.$dom.click(function (e) {

            // 先关闭 所有已展开下拉
            if ($('.eova-combo-panel').is(":visible")) {
                $('.eova-combo-panel').hide();
            }

            var offset = $textbox.offset();
            var height = 200;
            if(offset.top+221>document.body.scrollHeight){
            	if(offset.top<221){
            		if(offset.top<document.body.scrollHeight-offset.top){
            			height = document.body.scrollHeight - offset.top -21;
            		}else{
            			height = offset.top;
                		offset.top = -21;
            		}
            	}else{
                	offset.top = offset.top-221;
            	}
            }
            $panel.css({
                position: 'absolute',
                left: offset.left - 1,
                top: offset.top + 21,
                height: height,
                overflow: 'auto',
                width: $(this).width()
            });
            $panel.show();

            console.log('.eova-combo click');
            e.stopPropagation();
        });

        // 点击面板阻止事件
        $panel.bind("mousedown.eovacombo", function(e) {
			return false;
		});
        // 点击其它部分关闭Panel
        $(document).unbind(".eovacombo").bind("mousedown.eovacombo", function (e) {
            if ($('.eova-combo-panel').is(":visible")) {
            	$('.eova-combo-panel').hide();
            }
        });
    };
    /**
     * 销毁控件
     */
    ComboBox.prototype.destroy = function () {
        // 删除控件DOM
        this.$dom.remove();
        // 删除面板(面板添在body里，需要单独删除)
        this.$panel.remove();
    };

    /**
     * 重写值操作，自动更新text和css
     * @param value
     * @returns {*}
     */
    ComboBox.prototype.reload = function () {
        var comboBox = this;
        var options = this.options;
        var url = options.url;
        if (!url) {
        	url = this.$dom.attr('url');
        }

        if (!url) {
            $("<div>数据未加载</div>").appendTo(comboBox.$panel);
            return;
        }


        // 同步请求，保证数据先加载，再赋值
        $.ajax({
            type: 'get',
            async: true,
            url: url,
            dataType: "json",
            success: function (json) {
                comboBox.$panel.empty();// 清空下拉面板选项
//                $("<div value=\"\">&nbsp;</div>").appendTo(comboBox.$panel);
                $.each(json, function (index, obj) {
                    if(options.ignores.indexOf(','+obj[options.valueField]+',')==-1){
                    	// 字符串长度格式化
                    	var text = $.clipStr(obj[options.textField], 11);
                        $("<div value=\"" + obj[options.valueField] + "\" title='"+
                                text+"["+obj[options.valueField] +"]"+"'>" 
                                + text + "</div>").appendTo(comboBox.$panel);
    //                    $("<div value=\"" + obj[options.valueField] + "\">" + text + "</div>").appendTo(comboBox.$panel);
                    }
                });
                var panel = comboBox.$panel.children('div');
                // 选择下拉项
                panel.unbind(".eovacombo").bind("mousedown.eovacombo", function (e) {
                    var selectItem = $(this);//单击选中的选项
                    var value = selectItem.attr('value');

                    // 多选
                    if (options.multiple) {
                        if (selectItem.hasClass("eova-combo-selected")) {
                            // 反选
                            unselectByValue(comboBox, value);
                        } else {
                            // 选中
                            selectByValue(comboBox, value);
                        }
                    } else {
                        // 单选，选完立即隐藏panel
                        selectByValue(comboBox, value);
                        comboBox.$panel.hide();
                    }

                    console.log('reload combo panel div click');
                    e.stopPropagation();
                });

                // 根据值刷新选中项
                if(comboBox.getValue()){
                	if (options.multiple) {
                		comboBox.setValues(comboBox.getValues());
                    } else {
                    	comboBox.setValue(comboBox.getValue());
                    }
                }

                // 更新面板到缓存
                $.data(this, COMBOBOX, comboBox);
            },
            error: function () {
                alert('下拉框加载数据失败,URL=' + url);
            }
        });
    };
    /**
     * 获取值
     * @returns {*}
     */
    ComboBox.prototype.getValue = function () {
        return this.$valuebox.val();
    };
    /**
     * 获取值
     * @returns {*|Array|Node}
     */
    ComboBox.prototype.getValues = function () {
        var val = this.$valuebox.val();
        if(val == ''){
            return [];
        }
        return val.split(this.options.separator);
    };
    /**
     * 设置值
     * @param value 单项
     */
    ComboBox.prototype.setValue = function (value) {
    	this.setValues([value]);
    };
    /**
     * 设置值
     * @param values 多项
     */
    ComboBox.prototype.setValues = function (values) {
        // 清空所有选中项
        this.$panel.children().removeClass('eova-combo-selected');

        // 重新根据值选中所有项
        var vals = [], txts = [];
        for ( var i = 0; i < values.length; i++) {
            var val = values[i];
            // value 匹配项
            var $item = this.$panel.children("div[value='"+ val +"']");

            vals.push(val);
            txts.push($item.text());

            // 选中匹配项
            $item.addClass('eova-combo-selected');
        }

        // 获取当前值
        var oldValues = this.getValues();

        // 更新值
        this.$valuebox.val(vals.join(this.options.separator));
        // 更新文本
        this.$textbox.val(txts.join(this.options.separator));

        //若设置值数组与原值数组不相等，则将设置值数组、原值数组返回给onChange事件作为参数，并响应事件
        var options = this.options;
        if (options.multiple) {
            // 多选 值数量不等就触发
            if (values.length != oldValues.length) {
                options.onChange.call(this.$dom, oldValues, values);
            }
        } else {
            // 单选 值不等才触发
            if (values[0] != oldValues[0]) {
                options.onChange.call(this.$dom, oldValues[0], values[0]);
            }
        }

    };
    /**
     * 获取显示文本
     * @returns {*}
     */
    ComboBox.prototype.getText = function () {
        return this.$textbox.val();
    };
    /**
     * 获取显示文本
     * @returns {*}
     */
    ComboBox.prototype.getTexts = function () {
        var val = this.$textbox.val();
        if(val == ''){
            return [];
        }
        return val.split(this.options.separator);
    };
    /**
     * 设置显示文本
     * @param text
     */
    ComboBox.prototype.setText = function (text) {
        return this.setTexts([text]);
    };
    /**
     * 设置显示文本
     * @param text
     */
    ComboBox.prototype.setTexts = function (texts) {
//        var p = this.$panel;
//        var to = setTimeout(function(){
//            if(p.children("div").length>=texts.length){
//                clearTimeout(to);
//            }
//        }, 50);
        // 清空所有选中项
        this.$panel.children().removeClass('eova-combo-selected');

        // 重新根据文本选中所有项
        var vals = [], txts = [];
        for ( var i = 0; i < texts.length; i++) {
            var text = texts[i];
            // value 匹配项
            var $item = this.$panel.children("div:contains('"+ text +"')");

            vals.push($item.attr("value"));
            txts.push(text);

            // 选中匹配项
            $item.addClass('eova-combo-selected');
        }

        // 更新值
        this.$valuebox.val(vals.join(this.options.separator));
        // 更新文本
        this.$textbox.val(txts.join(this.options.separator));
    };

})(jQuery);
///<jscompress sourcefile="eova.find.js" />
;(function ($) {

    // import
    var TextBox = $.fn.eovatext.TextBox;

    FINDBOX = "findbox";

    $.fn.eovafind = function (options) {
//        $.eovaInit(this, FindBox, FINDBOX, options);

        var list = [];
        this.each(function () {
            // 单例实例化
            var obj = $.data(this, FINDBOX);
            if (!obj) {
                obj = new FindBox(this, options);
                // 初始化UI
                obj.render();
                obj.bindEvents();
                obj.init();
                $.data(this, FINDBOX, obj);
            } else {
            	// 覆盖参数
            	$.extend(obj.options, options);
            	$.data(this, FINDBOX, obj);
            }

            list.push(obj);
        });

        if (list.length == 1) {
            return list[0];
        }

        return list;

    };

    var FindBox = $.fn.eovafind.FindBox = function (dom, options) {
        TextBox.apply(this, arguments);
        this.defaults = {
            width: 180,
            btnTitle: '点击查找内容',
            isReadonly: true,

            // 事件
            onChange : function(oldValue, newValue) {}
        };
        // 参数优先级：父参数 > 子默认参数 > HTML参数 > JS参数
        this.options = $.extend({}, this.options, this.defaults, $.getHtmlOptions(this), options);
        // 编码
        this.code = this.$dom.attr('code');
        this.$dom.removeAttr('code');
        // 字段名
        this.field = this.$dom.attr('field');
        this.$dom.removeAttr('field');
    }

    $.extendPrototype(FindBox, TextBox);

    /**
     * 重写渲染
     */
    FindBox.prototype.render = function () {
        // 添加隐藏框
        var $valuebox = $("<input type='hidden' />").appendTo(this.$dom);
        var $textbox = $("<input type='text' />").appendTo(this.$dom);// 文本显示
        var $btn = $("<i class='ei'></i>").appendTo(this.$dom);// 添加按钮

        $btn.attr('title', this.options.btnTitle);
        if (this.name) {
            $valuebox.attr("name", this.name);
        }
        if (this.value) {
            $valuebox.val(this.value);
        }
        if(this.options.placeholder){
            $textbox.attr('placeholder', this.options.placeholder);
        }
        if(this.options.required){
            $textbox.attr('required', 'required');
        }
        if (this.options.disable) {
            // 灰色遮罩实现禁用
            this.$dom.mask();
        }

        $textbox.attr('readonly', 'readonly');
        $textbox.css('cursor', 'pointer');
        $textbox.attr('title', this.options.btnTitle);

        this.$valuebox = $valuebox;
        this.$textbox = $textbox;
        this.$btn = $btn;

        // 初始宽度
        this.setWidth(this.options.width);
    };

    /**
     * 初始化数据，将值转换成对应字符串
     */
    FindBox.prototype.init = function() {
        var $valuebox = this.$valuebox;
        var $textbox = this.$textbox;

        if ($valuebox.val()) {
            var url = '/widget/findCnByEn/' + this.code + '-' + this.field + '-' + this.value;
            $.ajax({
                url: url,
                dataType: 'json',
                success: function (json) {
                	var textField = json.text_field;
                	var txts = [];
                	$.each(eval(json.data), function (index, obj) {
                        txts.push(obj[textField]);
                    });
                    $textbox.val(txts.join(','));
                }
            });
        }
    }

    /**
     * 重写事件绑定
     */
    FindBox.prototype.bindEvents = function () {
        var findBox = this;
        var options = this.options;
        var $valuebox = this.$valuebox;
        var $textbox = this.$textbox;
        var $dom = this.$dom;
        this.$textbox.bind('click', function () {
            var url = $dom.attr('url');
            if (!url) {
                url = options.url;
            }
            // 弹出查询选择Diglog
            eova_findDialog(findBox, url );
        });
        // 点按钮和文本框都触发事件
        this.$btn.bind('click', function(){
            $textbox.trigger('click');
        });
    };

    /**
     * 获取值
     * @returns {*}
     */
    FindBox.prototype.getValue = function () {
        return this.$valuebox.val();
    };
    /**
     * 设置值
     * @param value
     */
    FindBox.prototype.setValue = function (value) {
        this.$valuebox.val(value);
    };
    /**
     * 获取显示文本
     * @returns {*}
     */
    FindBox.prototype.getText = function () {
        return this.$textbox.val();
    };
    /**
     * 设置显示文本
     * @param text
     */
    FindBox.prototype.setText = function (text) {
        this.$textbox.val(text);
    };

    // Find 查询框
    var eova_findDialog = function(findBox, url) {
        var w=window.innerWidth
        || document.documentElement.clientWidth
        || document.body.clientWidth;

        var h=window.innerHeight
        || document.documentElement.clientHeight
        || document.body.clientHeight;
        // 弹出窗口
        var dialog = window.sy.modalDialog({
            title : '请选择数据',
            url : url,
            buttons : [ {
                id : 'find_ok',
                text : '确定',
                handler : function() {
                    dialog.find('iframe').get(0).contentWindow.selectData(dialog, findBox);
                    // 初始化焦点
                    window.focus();
                }
            } ]
        },w*2/3,h-10);
    };

})(jQuery);
(function ($) {

    // import
    var TextBox = $.fn.eovatext.TextBox;

    TIMINGBOX = "timingbox";

    $.fn.eovatiming = function (options) {
//        $.eovaInit(this, TimingBox, TIMINGBOX, options);

        var list = [];
        this.each(function () {
            // 单例实例化
            var obj = $.data(this, TIMINGBOX);
            if (!obj) {
                obj = new TimingBox(this, options);
                // 初始化UI
                obj.render();
                obj.bindEvents();
                obj.init();
                $.data(this, TIMINGBOX, obj);
            } else {
                // 覆盖参数
                $.extend(obj.options, options);
                $.data(this, TIMINGBOX, obj);
            }

            list.push(obj);
        });

        if (list.length == 1) {
            return list[0];
        }

        return list;

    };

    var TimingBox = $.fn.eovatiming.TimingBox = function (dom, options) {
        TextBox.apply(this, arguments);
        this.defaults = {
            width: 180,
            btnTitle: '点击配置定时',
            isReadonly: true,

            // 事件
            onChange : function(oldValue, newValue) {}
        };
        // 参数优先级：父参数 > 子默认参数 > HTML参数 > JS参数
        this.options = $.extend({}, this.options, this.defaults, $.getHtmlOptions(this), options);
    }

    $.extendPrototype(TimingBox, TextBox);

    /**
     * 重写渲染
     */
    TimingBox.prototype.render = function () {
        // 添加隐藏框
        var $valuebox = $("<input type='hidden' />").appendTo(this.$dom);
        var $textbox = $("<input type='text' />").appendTo(this.$dom);// 文本显示
        var $btn = $("<i class='ei'></i>").appendTo(this.$dom);// 添加按钮

        $btn.attr('title', this.options.btnTitle);
        if (this.name) {
            $valuebox.attr("name", this.name);
        }
        if (this.value) {
            $valuebox.val(this.value);
        }
        if(this.options.placeholder){
            $textbox.attr('placeholder', this.options.placeholder);
        }
        if(this.options.required){
            $textbox.attr('required', 'required');
        }
        if (this.options.disable) {
            // 灰色遮罩实现禁用
            this.$dom.mask();
        }

        $textbox.attr('readonly', 'readonly');
        $textbox.css('cursor', 'pointer');
        $textbox.attr('title', this.options.btnTitle);

        this.$valuebox = $valuebox;
        this.$textbox = $textbox;
        this.$btn = $btn;

        // 初始宽度
        this.setWidth(this.options.width);
    };
    /**
     * 重写事件绑定
     */
    TimingBox.prototype.bindEvents = function () {
        var findBox = this;
        var options = this.options;
        var $valuebox = this.$valuebox;
        var $textbox = this.$textbox;
        var $dom = this.$dom;
        this.$textbox.bind('click', function () {
            var url = $dom.attr('url');
            if (!url) {
                url = options.url;
            }
            // 弹出查询选择Diglog
            eova_timingDialog(findBox, url );
        });
        // 点按钮和文本框都触发事件
        this.$btn.bind('click', function(){
            $textbox.trigger('click');
        });
    };
    /**
     * 初始化数据，将值转换成对应字符串
     */
    TimingBox.prototype.init = function() {
        var $valuebox = this.$valuebox;
        var $textbox = this.$textbox;

        if ($valuebox.val()) {
            var url = '/timing/timingShow/' + this.value;
            $.ajax({
                url: url,
                dataType: 'text',
                success: function (text) {
                    $textbox.val(text);
                    $textbox.attr("title",text);
                }
            });
        }
    }

    /**
     * 获取值
     * @returns {*}
     */
    TimingBox.prototype.getValue = function () {
        return this.$valuebox.val();
    };
    /**
     * 设置值
     * @param value
     */
    TimingBox.prototype.setValue = function (value) {
        this.$valuebox.val(value);
        this.$dom.attr('url',"/timing/toTiming/"+value);
        if (value) {
            var $textbox = this.$textbox;
            var url = '/timing/timingShow/' + value;
            $.ajax({
                url: url,
                dataType: 'text',
                success: function (text) {
                    $textbox.val(text);
                    $textbox.attr("title",text);
                }
            });
        }
    };
    /**
     * 获取显示文本
     * @returns {*}
     */
    TimingBox.prototype.getText = function () {
        return this.$textbox.val();
    };
    /**
     * 设置显示文本
     * @param text
     */
    TimingBox.prototype.setText = function (text) {
        this.$textbox.val(text);
        this.$textbox.attr("title",text);
    };

    // 定时配置弹出框
    var eova_timingDialog = function(timingBox, url) {
        // 弹出窗口
        var dialog = window.sy.modalDialog({
            title : '任务定时配置',
            url : url,
            buttons : [ {
                id : 'ok',
                text : '确定',
                handler : function() {
                    dialog.find('iframe').get(0).contentWindow.ok(dialog, timingBox);
                    // 初始化焦点
                    window.focus();
                }
            },{
                id : 'cancel',
                text : '取消',
                handler : function() {
                    dialog.find('iframe').get(0).contentWindow.cancel(dialog, timingBox);
                    // 初始化焦点
                    window.focus();
                }
            } ]
        },400,260);
    };

})(jQuery);
///<jscompress sourcefile="eova.auto.js" />
(function ($) {

    // import
    var TextBox = $.fn.eovatext.TextBox;

    AUTOBOX = "autobox";

    $.fn.eovaauto = function (options) {
//        $.eovaInit(this, FindBox, FINDBOX, options);

        var list = [];
        this.each(function () {
            // 单例实例化
            var obj = $.data(this, AUTOBOX);
            if (!obj) {
                obj = new AutoBox(this, options);
                // 初始化UI
                obj.render();
                // 置灰文本框
                obj.$textbox.css('background-color', '#EBEBE4')
                obj.bindEvents();
                $.data(this, AUTOBOX, obj);
            } else {
            	// 覆盖参数
            	$.extend(obj.options, options);
            	$.data(this, AUTOBOX, obj);
            }

            list.push(obj);
        });

        if (list.length == 1) {
            return list[0];
        }

        return list;

    };


    var AutoBox = $.fn.eovaauto.AutoBox = function (dom, options) {
        TextBox.apply(this, arguments);
        this.defaults = {
            btnTitle: '自增长字段',
            disable: true
        };
        // 用户参数 覆盖 默认参数 覆盖父类参数
        this.options = $.extend({}, this.options, this.defaults, options);
    }

    $.extendPrototype(AutoBox, TextBox);

    /**
     * 重写事件绑定
     */
    AutoBox.prototype.bindEvents = function () {

    };


})(jQuery);
///<jscompress sourcefile="eova.icon.js" />
(function ($) {

    // import
    var TextBox = $.fn.eovatext.TextBox;

    ICONBOX = "iconbox";

    $.fn.eovaicon = function (options) {

        var list = [];
        this.each(function () {
            // 单例实例化
            var obj = $.data(this, ICONBOX);
            if (!obj) {
                obj = new IconBox(this, options);
                // 初始化UI
                obj.render();
                obj.bindEvents();
                $.data(this, ICONBOX, obj);
            } else {
            	// 覆盖参数
            	$.extend(obj.options, options);
            	$.data(this, ICONBOX, obj);
            }

            list.push(obj);
        });

        if (list.length == 1) {
            return list[0];
        }

        return list;

    };


    var IconBox = $.fn.eovaicon.IconBox = function (dom, options) {
        TextBox.apply(this, arguments);
        this.defaults = {
            btnTitle: '点击选择图标',
            isReadonly: true
        };
        // 用户参数 覆盖 默认参数 覆盖父类参数
        this.options = $.extend({}, this.options, this.defaults, options);

    }

    $.extendPrototype(IconBox, TextBox);

    /**
     * 重写事件绑定
     */
    IconBox.prototype.bindEvents = function () {
        var $textbox = this.$textbox;
        var $btn = this.$btn;
        $btn.bind('click', function () {
            $btn.addClass("ext-icon-zoom");
            eova_iconDialog($textbox, $btn);
        });
        // 点按钮和文本框都触发事件
        this.$textbox.bind('click', function(){
            $btn.trigger('click');
        });
    };


})(jQuery);
///<jscompress sourcefile="eova.time.js" />
(function ($) {

    // import
    var TextBox = $.fn.eovatext.TextBox;

    TIMEBOX = "timebox";

    $.fn.eovatime = function (options) {
//        $.eovaInit(this, FindBox, FINDBOX, options);

        var list = [];
        this.each(function () {
            // 单例实例化
            var obj = $.data(this, TIMEBOX);
            if (!obj) {
                obj = new TimeBox(this, options);
                // 初始化UI
                obj.render();
                obj.bindEvents();
                obj.$dom.attr('onClick', "WdatePicker({dateFmt:'"+ obj.options.format +"'})");
                $.data(this, TIMEBOX, obj);
            } else {
            	// 覆盖参数
            	$.extend(obj.options, options);
            	$.data(this, TIMEBOX, obj);
            }

            list.push(obj);
        });

        if (list.length == 1) {
            return list[0];
        }

        return list;

    };


    var TimeBox = $.fn.eovatime.TimeBox = function (dom, options) {
        TextBox.apply(this, arguments);
        this.defaults = {
            btnTitle: '点击选择时间',
            isReadonly: true,
            format: 'yyyy-MM-dd HH:mm:ss'
        };
        // 参数优先级：父参数 > 子默认参数 > HTML参数 > JS参数
        this.options = $.extend({}, this.options, this.defaults, $.getHtmlOptions(this), options);
    }

    $.extendPrototype(TimeBox, TextBox);

    /**
     * 重写事件绑定
     */
    TimeBox.prototype.bindEvents = function () {
        var $textbox = this.$textbox;
        // 点按钮和文本框都触发事件
        this.$btn.bind('click', function(){
            $textbox.trigger('click');
        });
    };


})(jQuery);
///<jscompress sourcefile="eova.check.js" />
(function ($) {

    CHECKBOX = "checkbox";

    $.fn.eovacheck = function (options) {
        var list = [];
        this.each(function () {
            // 单例实例化
            var obj = $.data(this, CHECKBOX);
            if (!obj) {
                obj = new CheckBox(this, options);
                // 初始化UI
                obj.render();
                $.data(this, CHECKBOX, obj);
            } else {
            	// 覆盖参数
            	$.extend(obj.options, options);
            	$.data(this, CHECKBOX, obj);
            }

            list.push(obj);
        });

        if (list.length == 1) {
            return list[0];
        }

        return list;
    };

    /**
     * 构造函数
     * @param {Object} dom 选择
     * @param {Object} options 参数
     */
    var CheckBox = $.fn.eovacheck.CheckBox = function (dom, options) {
        this.$dom = $(dom);
        this.defaults = {
            isCheck: false,
            disable: false
        };
        // HTML参数覆盖覆盖默认参数
        var htmlOptions = undefined;
        var strOptions = this.$dom.data('options');
        if(strOptions){
            //console.log(strOptions);
            htmlOptions = eval('({' + strOptions + '})');

            // 获取参数后移除参数
            this.$dom.removeAttr('data-options');
        }
        // 参数优先级：JS参数 > HTML参数 > 默认参数
        this.options = $.extend({}, this.defaults, htmlOptions, options);

        this.name = this.$dom.attr('name');
        this.value = this.$dom.attr('value');
    };

    /**
     * 渲染UI
     */
    CheckBox.prototype.render = function () {
        var $checkbox = $("<input type='checkbox' />").appendTo(this.$dom);

        if (this.name) {
            $checkbox.attr("name", this.name);
        }
        if (this.value) {
            $checkbox.attr("value", this.value);
        }
        if (this.options.isCheck) {
            this.setChecked(true);
        }
        if (this.options.disable) {
            $checkbox.attr('disabled', 'disabled');
        }

        this.$checkbox = $checkbox;
    };

    /**
     * 获取值
     * @returns {*}
     */
    CheckBox.prototype.getChecked = function () {
        return this.$checkbox.prop('checked');
    };
    /**
     * 设置值
     * @param value
     */
    CheckBox.prototype.setChecked = function (flag) {
        this.$checkbox.prop('checked', flag);
    };
    /**
     * 设置只读
     * @param width
     */
    CheckBox.prototype.readonly = function (flag) {
        if (flag) {
            this.$checkbox.attr("readonly", true);
        }

    };

})(jQuery);

/*
* 使用方法: 
 * 开启:MaskUtil.mask(); 
 * 关闭:MaskUtil.unmask(); 
 *  
 * MaskUtil.mask('其它提示文字...'); 
 */  

var MaskUtil = (function() {
    var $mask, $maskMsg;
    var defMsg = '正在处理，请稍待。。。';
    function init() {
        if (!$mask) {
            $mask = $("<div class=\"datagrid-mask mymask\"></div>").appendTo(
                    "body");
        }
        if (!$maskMsg) {
            $maskMsg = $(
                    "<div class=\"datagrid-mask-msg mymask\">" + defMsg
                            + "</div>").appendTo("body").css({
                'font-size' : '12px'
            });
        }
        $mask.css({
            width : "100%",
            height : $(document).height()
        });
        var scrollTop = $(document.body).scrollTop();
        $maskMsg.css({
            left : ($(document.body).outerWidth(true) - 190) / 2,
            top : (($(window).height() - 45) / 2) + scrollTop
        });
    }
    return {
        mask : function(msg) {
            init();
            $mask.show();
            $maskMsg.html(msg || defMsg).show();
        },
        unmask : function() {
            $mask.hide();
            $maskMsg.hide();
        }
    }
}()); 

