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