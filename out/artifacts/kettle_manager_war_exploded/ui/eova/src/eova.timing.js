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
     * 初始化数据，将值转换成对应字符串
     */
    TimingBox.prototype.init = function() {
        var $valuebox = this.$valuebox;
        var $textbox = this.$textbox;

        if ($valuebox.val()) {
            var url = '/metl/data_task/timingShow/' + this.value;
            $.ajax({
                url: url,
                dataType: 'text',
                success: function (text) {
                    $textbox.val(text);
                }
            });
        }
    }
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
        this.$dom.attr('url',"/metl/data_task/toTiming/"+value);
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
    };

    // 定时配置弹出框
    var eova_findDialog = function(timingBox, url) {
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
            } ]
        },650,600);
    };

})(jQuery);