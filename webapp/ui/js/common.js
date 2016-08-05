/**
 * jQuery Eova Common
 */
(function ($) {

    /**
     * 拓展全局静态方法
     */
    $.extend({
        /** 同步Post **/
        syncPost: function (url, data, success) {
            $.ajax({
                async: false,
                type: 'POST',
                url: url,
                data: data,
                success: success,
                dataType: "json"
            });
        },
        /** 同步获取JSON **/
        syncGetJson: function (url, success) {
            $.ajax({
                async: false,
                type: 'GET',
                url: url,
                success: success,
                dataType: "json"
            });
        },
        /** Html转义 **/
        encodeHtml: function (s) {
            return (typeof s != "string") ? s :
                s.replace(/"|&|'|<|>|[\x00-\x20]|[\x7F-\xFF]|[\u0100-\u2700]/g,
                    function ($0) {
                        var c = $0.charCodeAt(0), r = ["&#"];
                        c = (c == 0x20) ? 0xA0 : c;
                        r.push(c);
                        r.push(";");
                        return r.join("");
                    });
        },
        /** 获取URL参数 **/
        getUrlPara: function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return;
        },
        /** 获取URL QueryString **/
        getUrlParas: function () {
        	var url = location.href;
        	if(url.indexOf("?") == -1){
        		return;
        	}
        	return url.substring(url.indexOf("?")+1,url.length); 
        },
        /** 获取Form参数对象-用于Post请求 **/
        getFormParasObj: function (form) {
        	var o = {};
    		$.each(form.serializeArray(), function(index) {
    			if (o[this['name']]) {
    				o[this['name']] = o[this['name']] + "," + this['value'];
    			} else {
    				o[this['name']] = this['value'];
    			}
    		});
    		return o;
        },
        /** 获取Form参数字符-用于get请求 **/
        getFormParasStr: function (form) {
        	var o = "";
        	$.each(form.serializeArray(), function(index) {
        		var key = this['name'], val = this['value'];
        		if(val && val.length > 0){
        			o = o + key + "=" + val + "&";        			
        		}
        	});
        	return o.substring(0, o.length-1); 
        },
        /** 获取浏览器类型 **/
        getBrowser: function() {
        	var explorer = window.navigator.userAgent;
			if (explorer.indexOf("MSIE") >= 0) {
				return 'ie';
			} else if (explorer.indexOf("Firefox") >= 0) {
				return 'firefox';
			} else if (explorer.indexOf("Chrome") >= 0) {
				return 'chrome';
			} else if (explorer.indexOf("Opera") >= 0) {
				return 'opera';
			} else if (explorer.indexOf("Safari") >= 0) {
				return 'safari';
			}
        }
    });
})(jQuery);