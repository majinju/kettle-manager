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