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
        var $textbox = $("<input type='text' autocomplete='off'/>").appendTo(this.$dom);// 文本显示
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
        this.$textbox.bind('change', this.options.onChange);
        this.$btn.bind('click', function () {
            $textbox.val('');
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
            this.$dom.clearMask();
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