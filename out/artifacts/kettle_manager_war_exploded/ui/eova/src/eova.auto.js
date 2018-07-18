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