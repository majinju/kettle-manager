/*!
 * jquery.fn.upload.js
 * @author ydr.me
 * @version 1.2
 */

(function ($) {

    var prefix = 'jquery-upload',
        win = window,
        doc = win.document,
        body = doc.body,

        // 是否支持HTML5的 input 的 files 属性
        isSupportFiles = doc.createElement("input").files === null || "files" in doc.createElement("input"),
        // isSupportFiles = false,

        // 是否支持HTML5的 FormData 对象
        isSupportFormData = !! window.FormData,
        // isSupportFormData = false,

        isHTML5 = isSupportFiles && isSupportFormData,
        // isHTML5 = false,

        // 空函数
        emptyFn = function() {},

        // 默认参数
        defaults = {
            // 留空表示提交到当前页面
            action: "",
            // 头信息
            headers: {},
            // 传递额外数据（键值对字符串）
            data: null,
            // 留空表示默认读取表单文件的name值
            name: "",
            // 完成回调，无论成功还是失败
            oncomplete: $.noop,
            // 成功回调
            onsuccess: $.noop,
            // 失败回调
            onerror: $.noop,
            // 进度回调
            onprogress: $.noop
        };

    $.fn.upload = function(settings) {
        var isOperiaction = $.type(settings) === 'string',
            options = isOperiaction ? {} : $.extend({}, defaults, settings),
            args = [].slice.call(arguments);

        return this.each(function() {
            var upload = $(this).data(prefix);
            if (!upload) {
                $(this).data(prefix, upload = new Upload(this, options));
            } else if (!isOperiaction) {
                upload.options = $.extend({}, upload.options, settings);
            }

            if (isOperiaction) {
                if(upload[settings]) upload[settings].apply(upload, args.slice(1));
            } else {
                upload._init();
            }
        });
    };


    // 默认参数
    $.fn.upload.defaults = defaults;
    $.support.inputFiles = isSupportFiles;
    $.support.formData = isSupportFormData;




    /////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////[ private ]//////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////


    var Upload = function(element, options) {
        this.element = element;
        this.options = options;
    };

    Upload.prototype = {
        _init: function() {
            if (!_isFileElement(this.element)) return;
            isHTML5 ? _html5.call(this) : _html4.call(this);
        },
        // 上传二进制
        // 对element无限制了
        blob: function(blob, filename) {
            _html5.call(this, blob, filename);
        },
        // 上传 files
        // 对element无限制了
        files: function(files) {
            _html5.call(this, files);
        },
        // 上传 file
        // 对element无限制了
        file: function(file) {
            _html5.call(this, file);
        }
    };




    function _html5(blobORfiles, filename) {
        var _this = this,
            argsLength = arguments.length,
            options = this.options,
            element = this.element,
            files, blob,
            // hasCallback = 0,
            i = 0,
            formData = new FormData();

        options.name = options.name || element.name || 'upload';

        if (argsLength === 0) files = element.files || [];
        else if (argsLength === 1) files = blobORfiles.length ? blobORfiles : [blobORfiles];
        else blob = blobORfiles;

        if (blob) {
            formData.append(options.name, blob, filename);
        } else {
            if (files && files.length && files.length > 1) {
                for (; i < files.length; i++) {
                    formData.append(options.name + '[]', files[i]);
                }
            } else if (files && files.length === 1) formData.append(options.name, files[i]);
            else return options.oncomplete.call(element);
        }

        for (i in options.data) {
            formData.append(i, options.data[i]);
        }

        $.ajax({
            // http://stackoverflow.com/questions/19126994/what-is-the-cleanest-way-to-get-the-progress-of-jquery-ajax-request
            xhr: function() {
                var xhr = $.ajaxSettings.xhr();
                xhr.upload.onprogress = $.proxy(options.onprogress, element);
                return xhr;
            },
            headers: options.headers,
            url: options.action,
            type: 'post',
            dataType: 'json',
            data: formData,
            // 不预处理 data
            processData: false,
            // 不发送 contentType 信息
            contentType: false
        }).done($.proxy(options.onsuccess, element)).fail($.proxy(options.onerror, element)).always($.proxy(options.oncomplete, element));


        // xhr.onloadend = $.proxy(options.oncomplete, element);
        // xhr.onload = function() {
        //     var response, json = {};
        //     if (!hasCallback && xhr.readyState == 4) {
        //         hasCallback = 1;
        //         response = xhr.responseText;
        //         if (xhr.status == 200) {
        //             try {
        //                 json = $.parseJSON(response);
        //             } catch (e) {}
        //             $.isEmptyObject(json) ?
        //                 options.onerror.call(element, json, xhr) :
        //                 options.onsuccess.call(element, json, xhr);
        //         } else {
        //             try {
        //                 json = $.parseJSON(response);
        //             } catch (e) {}
        //             options.onerror.call(element, json, xhr);
        //         }
        //     }
        // };
        // xhr.onerror = $.proxy(options.onerror, element);
        // xhr.upload.onprogress = $.proxy(options.onprogress, element);
        // xhr.open('POST', options.action);
        // xhr.responseType = "blob";
        // xhr.overrideMimeType("text/plain; charset=x-user-defined");
        // xhr.send(formData);
        // return xhr;
    }




    function _html4() {
        var _this = this,
            element = _this.element,
            options = _this.options,
            id = Date.now(),
            $iframe,
            $form,
            $button,
            $elementClone,
            html = '',
            i,
            json = {};


        if (!element.value) return options.oncomplete.call(element);
        options.name = options.name || element.name || 'upload';

        $(element).appendTo($form);
        $iframe = $('<iframe src="javascript:false" name="iframe-name-' + id + '" style="display:none;"></iframe>').appendTo(body);
        $form = $('<form action="' + options.action + '" method="post" enctype="multipart/form-data" target="iframe-name-' + id + '" style="display:none;"></form>').appendTo(body);
        $button = $('<input type="submit">').appendTo($form);
        $elementClone = $(element).clone(true, true).insertAfter(element);

        for (i in options.data) html += '<input type="hidden" name="' + i + '" value="' + options.data[i] + '">';
        if (html) $(html).appendTo($form);

        $iframe.load(function() {
            var content = $(this).contents().text();
            try {
                json = $.parseJSON(content);
            } catch (e) {}
            $.isEmptyObject(json) ?
                options.onerror.call(element, json) :
                options.onsuccess.call(element, json);
            done();
        }).error(function() {
            options.onerror.call(element, json);
            done();
        });

        $button.trigger('click');

        function done() {
            $iframe.remove();
            $form.remove();
            options.oncomplete.call(element, json);
        }
    }



    function _isFileElement(element) {
        return $(element).prop('tagName') === 'INPUT' && $(element).attr('type') === 'file';
    }

})(jQuery);