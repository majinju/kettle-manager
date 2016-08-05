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
        // 弹出窗口
        var dialog = parent.sy.modalDialog({
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
        },650,600);
    };

})(jQuery);