///<jscompress sourcefile="syExtJavascript.js" />
var sy = sy || {};

/**
 * 去字符串空格
 * 
 * @author 孙宇
 */
sy.trim = function(str) {
	return str.replace(/(^\s*)|(\s*$)/g, '');
};
sy.ltrim = function(str) {
	return str.replace(/(^\s*)/g, '');
};
sy.rtrim = function(str) {
	return str.replace(/(\s*$)/g, '');
};

/**
 * 判断开始字符是否是XX
 * 
 * @author 孙宇
 */
sy.startWith = function(source, str) {
	var reg = new RegExp("^" + str);
	return reg.test(source);
};
/**
 * 判断结束字符是否是XX
 * 
 * @author 孙宇
 */
sy.endWith = function(source, str) {
	var reg = new RegExp(str + "$");
	return reg.test(source);
};

/**
 * iframe自适应高度
 * 
 * @author 孙宇
 * 
 * @param iframe
 */
sy.autoIframeHeight = function(iframe) {
	iframe.style.height = iframe.contentWindow.document.body.scrollHeight + "px";
};

/**
 * 设置iframe高度
 * 
 * @author 孙宇
 * 
 * @param iframe
 */
sy.setIframeHeight = function(iframe, height) {
	iframe.height = height;
};
///<jscompress sourcefile="syExtJquery.js" />
var sy = sy || {};
sy.data = sy.data || {};// 用于存放临时的数据或者对象

/**
 * 屏蔽右键
 * 
 * @author 孙宇
 * 
 * @requires jQuery
 */
$(document).bind('contextmenu', function() {
	// return false;
});

/**
 * 禁止复制
 * 
 * @author 孙宇
 * 
 * @requires jQuery
 */
$(document).bind('selectstart', function() {
	// return false;
});

/**
 * @author 孙宇
 * 
 * 增加命名空间功能
 * 
 * 使用方法：sy.ns('jQuery.bbb.ccc','jQuery.eee.fff');
 */
sy.ns = function() {
	var o = {}, d;
	for ( var i = 0; i < arguments.length; i++) {
		d = arguments[i].split(".");
		o = window[d[0]] = window[d[0]] || {};
		for ( var k = 0; k < d.slice(1).length; k++) {
			o = o[d[k + 1]] = o[d[k + 1]] || {};
		}
	}
	return o;
};

/**
 * 将form表单元素的值序列化成对象
 * 
 * @example sy.serializeObject($('#formId'))
 * 
 * @author 孙宇
 * 
 * @requires jQuery
 * 
 * @returns object
 */
sy.serializeObject = function(form) {
	var o = {};
	$.each(form.serializeArray(), function(index) {
//		if (this['value'] != undefined && this['value'].length > 0) {// 如果表单项的值非空，才进行序列化操作
			// 空值也需要获得，否则会影响业务。
//		}
		if (o[this['name']]) {
			o[this['name']] = o[this['name']] + "," + this['value'];
		} else {
			o[this['name']] = this['value'];
		}
	});
	console.log('from post:' + o);
	return o;
};

/**
 * 增加formatString功能
 * 
 * @author 孙宇
 * 
 * @example sy.formatString('字符串{0}字符串{1}字符串','第一个变量','第二个变量');
 * 
 * @returns 格式化后的字符串
 */
sy.formatString = function(str) {
	for ( var i = 0; i < arguments.length - 1; i++) {
		str = str.replace("{" + i + "}", arguments[i + 1]);
	}
	return str;
};

/**
 * 接收一个以逗号分割的字符串，返回List，list里每一项都是一个字符串
 * 
 * @author 孙宇
 * 
 * @returns list
 */
sy.stringToList = function(value) {
	if (value != undefined && value != '') {
		var values = [];
		var t = value.split(',');
		for ( var i = 0; i < t.length; i++) {
			values.push('' + t[i]);/* 避免他将ID当成数字 */
		}
		return values;
	} else {
		return [];
	}
};

/**
 * JSON对象转换成String
 * 
 * @param o
 * @returns
 */
sy.jsonToString = function(o) {
	var r = [];
	if (typeof o == "string")
		return "\"" + o.replace(/([\'\"\\])/g, "\\$1").replace(/(\n)/g, "\\n").replace(/(\r)/g, "\\r").replace(/(\t)/g, "\\t") + "\"";
	if (typeof o == "object") {
		if (!o.sort) {
			for ( var i in o)
				r.push(i + ":" + sy.jsonToString(o[i]));
			if (!!document.all && !/^\n?function\s*toString\(\)\s*\{\n?\s*\[native code\]\n?\s*\}\n?\s*$/.test(o.toString)) {
				r.push("toString:" + o.toString.toString());
			}
			r = "{" + r.join() + "}";
		} else {
			for ( var i = 0; i < o.length; i++)
				r.push(sy.jsonToString(o[i]));
			r = "[" + r.join() + "]";
		}
		return r;
	}
	return o.toString();
};

/**
 * Create a cookie with the given key and value and other optional parameters.
 * 
 * @example sy.cookie('the_cookie', 'the_value');
 * @desc Set the value of a cookie.
 * @example sy.cookie('the_cookie', 'the_value', { expires: 7, path: '/', domain: 'jquery.com', secure: true });
 * @desc Create a cookie with all available options.
 * @example sy.cookie('the_cookie', 'the_value');
 * @desc Create a session cookie.
 * @example sy.cookie('the_cookie', null);
 * @desc Delete a cookie by passing null as value. Keep in mind that you have to use the same path and domain used when the cookie was set.
 * 
 * @param String
 *            key The key of the cookie.
 * @param String
 *            value The value of the cookie.
 * @param Object
 *            options An object literal containing key/value pairs to provide optional cookie attributes.
 * @option Number|Date expires Either an integer specifying the expiration date from now on in days or a Date object. If a negative value is specified (e.g. a date in the past), the cookie will be deleted. If set to null or omitted, the cookie will be a session cookie and will not be retained when the the browser exits.
 * @option String path The value of the path atribute of the cookie (default: path of page that created the cookie).
 * @option String domain The value of the domain attribute of the cookie (default: domain of page that created the cookie).
 * @option Boolean secure If true, the secure attribute of the cookie will be set and the cookie transmission will require a secure protocol (like HTTPS).
 * @type undefined
 * 
 * @name sy.cookie
 * @cat Plugins/Cookie
 * @author Klaus Hartl/klaus.hartl@stilbuero.de
 * 
 * Get the value of a cookie with the given key.
 * 
 * @example sy.cookie('the_cookie');
 * @desc Get the value of a cookie.
 * 
 * @param String
 *            key The key of the cookie.
 * @return The value of the cookie.
 * @type String
 * 
 * @name sy.cookie
 * @cat Plugins/Cookie
 * @author Klaus Hartl/klaus.hartl@stilbuero.de
 */
sy.cookie = function(key, value, options) {
	if (arguments.length > 1 && (value === null || typeof value !== "object")) {
		options = $.extend({}, options);
		if (value === null) {
			options.expires = -1;
		}
		if (typeof options.expires === 'number') {
			var days = options.expires, t = options.expires = new Date();
			t.setDate(t.getDate() + days);
		}
		return (document.cookie = [ encodeURIComponent(key), '=', options.raw ? String(value) : encodeURIComponent(String(value)), options.expires ? '; expires=' + options.expires.toUTCString() : '', options.path ? '; path=' + options.path : '', options.domain ? '; domain=' + options.domain : '', options.secure ? '; secure' : '' ].join(''));
	}
	options = value || {};
	var result, decode = options.raw ? function(s) {
		return s;
	} : decodeURIComponent;
	return (result = new RegExp('(?:^|; )' + encodeURIComponent(key) + '=([^;]*)').exec(document.cookie)) ? decode(result[1]) : null;
};

/**
 * 改变jQuery的AJAX默认属性和方法
 * 
 * @author 孙宇
 * 
 * @requires jQuery
 * 
 */
$.ajaxSetup({
	type : 'POST',
	error : function(XMLHttpRequest, textStatus, errorThrown) {
		try {
			parent.$.messager.progress('close');
			parent.$.messager.alert('错误', XMLHttpRequest.responseText);
		} catch (e) {
			alert(XMLHttpRequest.responseText);
		}
	}
});

/**
 * 解决class="iconImg"的img标记，没有src的时候，会出现边框问题
 * 
 * @author 孙宇
 * 
 * @requires jQuery
 */
$(function() {
	$('.iconImg').attr('src', sy.pixel_0);
});
///<jscompress sourcefile="syExtEasyUI.js" />
var sy = sy || {};

/**
 * 更改easyui加载panel时的提示文字
 * 
 * @author 孙宇
 * 
 * @requires jQuery,EasyUI
 */
$.extend($.fn.panel.defaults, {
	loadingMessage : '加载中....'
});

/**
 * 更改easyui加载grid时的提示文字
 * 
 * @author 孙宇
 * 
 * @requires jQuery,EasyUI
 */
$.extend($.fn.datagrid.defaults, {
	loadMsg : '数据加载中....'
});

/**
 * panel关闭时回收内存，主要用于layout使用iframe嵌入网页时的内存泄漏问题
 * 
 * @author 孙宇
 * 
 * @requires jQuery,EasyUI
 * 
 */
$.extend($.fn.panel.defaults, {
	onBeforeDestroy : function() {
		var frame = $('iframe', this);
		try {
			if (frame.length > 0) {
				for (var i = 0; i < frame.length; i++) {
					frame[i].src = '';
					frame[i].contentWindow.document.write('');
					frame[i].contentWindow.close();
				}
				frame.remove();
				if (navigator.userAgent.indexOf("MSIE") > 0) {// IE特有回收内存方法
					try {
						CollectGarbage();
					} catch (e) {
					}
				}
			}
		} catch (e) {
		}
	}
});

/**
 * 防止panel/window/dialog组件超出浏览器边界
 * 
 * @author 孙宇
 * 
 * @requires jQuery,EasyUI
 */
sy.onMove = {
	onMove : function(left, top) {
		var l = left;
		var t = top;
		if (l < 1) {
			l = 1;
		}
		if (t < 1) {
			t = 1;
		}
		var width = parseInt($(this).parent().css('width')) + 14;
		var height = parseInt($(this).parent().css('height')) + 14;
		var right = l + width;
		var buttom = t + height;
		var browserWidth = $(window).width();
		var browserHeight = $(window).height();
		if (right > browserWidth) {
			l = browserWidth - width;
		}
		if (buttom > browserHeight) {
			t = browserHeight - height;
		}
		$(this).parent().css({/* 修正面板位置 */
			left : l,
			top : t
		});
	}
};
$.extend($.fn.dialog.defaults, sy.onMove);
$.extend($.fn.window.defaults, sy.onMove);
$.extend($.fn.panel.defaults, sy.onMove);

/**
 * 
 * 通用错误提示
 * 
 * 用于datagrid/treegrid/tree/combogrid/combobox/form加载数据出错时的操作
 * 
 * @author 孙宇
 * 
 * @requires jQuery,EasyUI
 */
sy.onLoadError = {
	onLoadError : function(XMLHttpRequest) {
		if (parent.$ && parent.$.messager) {
			parent.$.messager.progress('close');
			parent.$.messager.alert('错误', XMLHttpRequest.responseText);
		} else {
			$.messager.progress('close');
			$.messager.alert('错误', XMLHttpRequest.responseText);
		}
	}
};
$.extend($.fn.datagrid.defaults, sy.onLoadError);
$.extend($.fn.treegrid.defaults, sy.onLoadError);
$.extend($.fn.tree.defaults, sy.onLoadError);
$.extend($.fn.combogrid.defaults, sy.onLoadError);
$.extend($.fn.combobox.defaults, sy.onLoadError);
$.extend($.fn.form.defaults, sy.onLoadError);

/**
 * 扩展combobox在自动补全模式时，检查用户输入的字符是否存在于下拉框中，如果不存在则清空用户输入
 * 
 * @author 孙宇
 * 
 * @requires jQuery,EasyUI
 */
$.extend($.fn.combobox.defaults, {
	onHidePanel : function() {
		var _options = $(this).combobox('options');
		if (_options.mode == 'remote') {/* 如果是自动补全模式 */
			var _data = $(this).combobox('getData');/* 下拉框所有选项 */
			var _value = $(this).combobox('getValue');/* 用户输入的值 */
			var _b = false;/* 标识是否在下拉列表中找到了用户输入的字符 */
			for (var i = 0; i < _data.length; i++) {
				if (_data[i][_options.valueField] == _value) {
					_b = true;
				}
			}
			if (!_b) {/* 如果在下拉列表中没找到用户输入的字符 */
				$(this).combobox('setValue', '');
			}
		}
	}
});

/**
 * 扩展combogrid在自动补全模式时，检查用户输入的字符是否存在于下拉框中，如果不存在则清空用户输入
 * 
 * @author 孙宇
 * 
 * @requires jQuery,EasyUI
 */
$.extend($.fn.combogrid.defaults, {
	onHidePanel : function() {
		var _options = $(this).combogrid('options');
		if (_options.mode == 'remote') {/* 如果是自动补全模式 */
			var _data = $(this).combogrid('grid').datagrid('getData').rows;/* 下拉框所有选项 */
			var _value = $(this).combogrid('getValue');/* 用户输入的值 */
			var _b = false;/* 标识是否在下拉列表中找到了用户输入的字符 */
			for (var i = 0; i < _data.length; i++) {
				if (_data[i][_options.idField] == _value) {
					_b = true;
				}
			}
			if (!_b) {/* 如果在下拉列表中没找到用户输入的字符 */
				$(this).combogrid('setValue', '');
			}
		}
	}
});

/**
 * 扩展validatebox，添加新的验证功能
 * 
 * @author 孙宇
 * 
 * @requires jQuery,EasyUI
 */
$.extend($.fn.validatebox.defaults.rules, {
	eqPwd : {/* 验证两次密码是否一致功能 */
		validator : function(value, param) {
			return value == $(param[0]).val();
		},
		message : '密码不一致！'
	}
});

/**
 * 扩展tree和combotree，使其支持平滑数据格式
 * 
 * @author 孙宇
 * 
 * @requires jQuery,EasyUI
 * 
 */
sy.loadFilter = {
	loadFilter : function(data, parent) {
		var opt = $(this).data().tree.options;
		var idField, textField, parentField;
		if (opt.parentField) {
			idField = opt.idField || 'id';
			textField = opt.textField || 'text';
			parentField = opt.parentField || 'pid';
			var i, l, treeData = [], tmpMap = [];
			for (i = 0, l = data.length; i < l; i++) {
				tmpMap[data[i][idField]] = data[i];
			}
			for (i = 0, l = data.length; i < l; i++) {
				if (tmpMap[data[i][parentField]] && data[i][idField] != data[i][parentField]) {
					if (!tmpMap[data[i][parentField]]['children'])
						tmpMap[data[i][parentField]]['children'] = [];
					data[i]['text'] = data[i][textField];
					tmpMap[data[i][parentField]]['children'].push(data[i]);
				} else {
					data[i]['text'] = data[i][textField];
					treeData.push(data[i]);
				}
			}
			return treeData;
		}
		return data;
	}
};
$.extend($.fn.combotree.defaults, sy.loadFilter);
$.extend($.fn.tree.defaults, sy.loadFilter);

/**
 * 扩展treegrid，使其支持平滑数据格式
 * 
 * @author 孙宇
 * 
 * @requires jQuery,EasyUI
 * 
 */
$.extend($.fn.treegrid.defaults, {
	loadFilter : function(data, parentId) {
		var opt = $(this).data().treegrid.options;
		var idField, treeField, parentField;
		if (opt.parentField) {
			idField = opt.idField || 'id';
			treeField = opt.textField || 'text';
			parentField = opt.parentField || 'pid';
			var i, l, treeData = [], tmpMap = [];
			for (i = 0, l = data.length; i < l; i++) {
				tmpMap[data[i][idField]] = data[i];
			}
			for (i = 0, l = data.length; i < l; i++) {
				if (tmpMap[data[i][parentField]] && data[i][idField] != data[i][parentField]) {
					if (!tmpMap[data[i][parentField]]['children'])
						tmpMap[data[i][parentField]]['children'] = [];
					data[i]['text'] = data[i][treeField];
					tmpMap[data[i][parentField]]['children'].push(data[i]);
				} else {
					data[i]['text'] = data[i][treeField];
					treeData.push(data[i]);
				}
			}
			return treeData;
		}
		return data;
	}
});

/**
 * 创建一个模式化的dialog
 * 
 * @author 孙宇
 * 
 * @requires jQuery,EasyUI
 * 
 */
sy.modalDialog = function(options, width, height) {
	// 默认大小设置
	if(width == undefined){
		width = 640;
	}
	if(height == undefined){
		height = 600;
	}
	var opts = $.extend({
		title : '&nbsp;',
		width : width,
		height : height,
		modal : true,
		resizable : true,
		collapsible : true,
		maximizable : true,
		onClose : function() {
			$(this).dialog('destroy');
		}
	}, options);
	opts.modal = true;// 强制此dialog为模式化，无视传递过来的modal参数
	if (options.url) {
		opts.content = '<iframe id="" src="' + options.url + '" allowTransparency="true" scrolling="auto" width="100%" height="98%" frameBorder="0" name=""></iframe>';
	}
	return $('<div/>').dialog(opts);
};

/**
 * 等同于原form的load方法，但是这个方法支持{data:{name:''}}形式的对象赋值
 */
$.extend($.fn.form.methods, {
	loadData : function(jq, data) {
		return jq.each(function() {
			load(this, data);
		});

		function load(target, data) {
			if (!$.data(target, 'form')) {
				$.data(target, 'form', {
					options : $.extend({}, $.fn.form.defaults)
				});
			}
			var opts = $.data(target, 'form').options;

			if (typeof data == 'string') {
				var param = {};
				if (opts.onBeforeLoad.call(target, param) == false)
					return;

				$.ajax({
					url : data,
					data : param,
					dataType : 'json',
					success : function(data) {
						_load(data);
					},
					error : function() {
						opts.onLoadError.apply(target, arguments);
					}
				});
			} else {
				_load(data);
			}
			function _load(data) {
				var form = $(target);
				var formFields = form.find("input[name],select[name],textarea[name]");
				formFields.each(function() {
					var name = this.name;
					var value = jQuery.proxy(function() {
						try {
							return eval('this.' + name);
						} catch (e) {
							return "";
						}
					}, data)();
					var rr = _checkField(name, value);
					if (!rr.length) {
						var f = form.find("input[numberboxName=\"" + name + "\"]");
						if (f.length) {
							f.numberbox("setValue", value);
						} else {
							$("input[name=\"" + name + "\"]", form).val(value);
							$("textarea[name=\"" + name + "\"]", form).val(value);
							$("select[name=\"" + name + "\"]", form).val(value);
						}
					}
					_loadCombo(name, value);
				});
				opts.onLoadSuccess.call(target, data);
				$(target).form("validate");
			}

			function _checkField(name, val) {
				var rr = $(target).find('input[name="' + name + '"][type=radio], input[name="' + name + '"][type=checkbox]');
				rr._propAttr('checked', false);
				rr.each(function() {
					var f = $(this);
					if (f.val() == String(val) || $.inArray(f.val(), val) >= 0) {
						f._propAttr('checked', true);
					}
				});
				return rr;
			}

			function _loadCombo(name, val) {
				var form = $(target);
				var cc = [ 'combobox', 'combotree', 'combogrid', 'datetimebox', 'datebox', 'combo' ];
				var c = form.find('[comboName="' + name + '"]');
				if (c.length) {
					for (var i = 0; i < cc.length; i++) {
						var type = cc[i];
						if (c.hasClass(type + '-f')) {
							if (c[type]('options').multiple) {
								c[type]('setValues', val);
							} else {
								c[type]('setValue', val);
							}
							return;
						}
					}
				}
			}
		}
	}
});

/**
 * 更换主题
 * 
 * @author 孙宇
 * @requires jQuery,EasyUI
 * @param themeName
 */
sy.changeTheme = function(themeName) {
	var $easyuiTheme = $('#easyuiTheme');
	var url = $easyuiTheme.attr('href');
	var href = url.substring(0, url.indexOf('themes')) + 'themes/' + themeName + '/easyui.css';
	$easyuiTheme.attr('href', href);

	var $iframe = $('iframe');
	if ($iframe.length > 0) {
		for (var i = 0; i < $iframe.length; i++) {
			var ifr = $iframe[i];
			try {
				$(ifr).contents().find('#easyuiTheme').attr('href', href);
			} catch (e) {
				try {
					ifr.contentWindow.document.getElementById('easyuiTheme').href = href;
				} catch (e) {
				}
			}
		}
	}

	sy.cookie('easyuiTheme', themeName, {
		expires : 7
	});
};

/**
 * 滚动条
 * 
 * @author 孙宇
 * @requires jQuery,EasyUI
 */
sy.progressBar = function(options) {
	if (typeof options == 'string') {
		if (options == 'close') {
			$('#syProgressBarDiv').dialog('destroy');
		}
	} else {
		if ($('#syProgressBarDiv').length < 1) {
			var opts = $.extend({
				title : '&nbsp;',
				closable : false,
				width : 300,
				height : 60,
				modal : true,
				content : '<div id="syProgressBar" class="easyui-progressbar" data-options="value:0"></div>'
			}, options);
			$('<div id="syProgressBarDiv"/>').dialog(opts);
			$.parser.parse('#syProgressBarDiv');
		} else {
			$('#syProgressBarDiv').dialog('open');
		}
		if (options.value) {
			$('#syProgressBar').progressbar('setValue', options.value);
		}
	}
};
