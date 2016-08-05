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