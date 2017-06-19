(function($) {
	/*
	后台分页结果
	JSONObject json = new JSONObject();
	json.put("total", page.getTotalCount());
	json.put("rows", page.getResult());
	前台使用
	<div>
    	<input type="text" id="zgnmk_txt" name="zgnmk_txt"/> 
		<input type="hidden" name="zgnmk" id="zgnmk" value="${vo.gnmk}"/>
		<a href="javascript:void(0);" class="search_down_list_clear" data-id="zgnmk_txt">清除</a>
    </div>
    js控制
    function gnmkSearch(sjxh){
		$("#gnmkMc").searchDownList({
			url: "<c:url value='/wtjy/wtjy.do?method=getGnmkZd&zgnmk="+sjxh+"'/>",
		    nameKey: 'mc',
		    valueKey: 'xh',
		    searchKey: 'searchKey',
		    width: "650",
		    onSelect: function(data){
		    },
		    ajaxError: function(){
		    	Util.warn('搜索失败！');
		    }
		});
	}
	 */
	// 搜索下拉列表 后台提供数据
	var _searchDownList = {
		init : function(options, elem) {
			var self = this;
			self.options = $.extend({}, $.fn.searchDownList.options, options);
			self.textInput = $(elem);
			self.valueInput = self.options.valueInputId ? $("#"
					+ self.options.valueInputId) : self.textInput.next("input");
			self.defaultVal = self.valueInput.val();
			self.param = {
				pageSize : self.options.pageNum,
				currentPageNo : 1
			};
			self.render();
		},
		render : function() {
			var self = this;
			var time = new Date().getTime();
			var html = [
					'<div class="search_down_list_ctn" id="searchDownList' + time + '">',
					'    <div class="search_down_list_inner">', '        <ul></ul>',
					'    </div>', '    <div class="search_down_list_pager">',
					'    </div>', '</div>' ].join('');

			$("#searchDownList" + self.textInput.data("time")).remove(); // 二次渲染的时候清除之前的
			self.textInput.data("time", time);

			self.box = $(html).appendTo("body");

			self.addEvents();
		},
		renderPage : function(key, total, pageCurrent) {
			var self = this;
			var pageSum = Math.ceil(total / self.options.pageNum);
			var $page = self.box.find('.search_down_list_pager').empty();
			pageCurrent = pageCurrent || 1;

			if (pageSum == 0) {
				$('<span>没有记录！</span>').appendTo($page);
				return;
			}

			$('<span><i>' + pageCurrent + '</i>/<b>' + pageSum + '</b></span>')
					.appendTo($page);

			if (pageSum > 1 && pageCurrent > 1)
				$(
						'<a href="javascript:void(null)" class="prev1 btn1 btn1_back btn1_small">上一页</a>')
						.appendTo($page).click(function() {
							self.getData(key, pageCurrent - 1);
						});

			if (pageSum > 1 && pageCurrent < pageSum)
				$(
						'<a href="javascript:void(null)" class="next1 btn1 btn1_back btn1_small">下一页</a>')
						.appendTo($page).click(function() {
							self.getData(key, pageCurrent + 1);
						});
		},
		renderList : function(data) {
			var self = this, itemStr = '';
			for (var i = 0, l = data.length; i < l; i++) {
				var _item = data[i], _li = [];
				itemStr += '<li title="' + _item[self.options.nameKey] + '"';

				for ( var key in _item) {
					if (_item.hasOwnProperty(key))
						_li.push(' data-' + key + '="'
								+ (_item[key] + '').replace('\n', '') + '"');
				}

				itemStr += _li.join('');
				itemStr += '>' + data[i][self.options.nameKey] + '</li>';
			}
			self.box.find('ul').html(itemStr);
			setTimeout(function() {
				self.position();
			}, 0);
		},
		position : function() {
			var self = this;
			self.box.hide();
			var wh = $(window).height(), bh = document.body.scrollHeight;
			var width, height, top, left, itop;
			var total = self.box.find("li").length;
			var domHeight = wh > bh ? wh : bh;
			var boxHeight = self.box.height();
			var offset = self.textInput.offset();
			self.box.show();

			width = self.textInput.outerWidth();
			height = self.textInput.outerHeight();
			top = offset.top + height;
			left = offset.left;
			itop = 0 - (height + 18) / 2;

			if (top + boxHeight > domHeight) {
				top = offset.top - boxHeight;
				itop = boxHeight + (height - 18) / 2;
			}

			self.box.css({
				left : left,
				top : top,
				width : self.options.width || width - 2
			});
		},
		addEvents : function() {
			var self = this;
			self.textInput.unbind();

			self.textInput.focus(function() {
				if (!self.box.is(':hidden'))
					return;

				var val = $(this).val();
				$(".search_down_list_ctn").not(self.box).hide();
				self.box.show();
				self.getData(val);
				setTimeout(function() {
					self.position();
				}, 0);
			}).click(function(e) {
				e.stopPropagation();
			}).bind("keyup", function() {
				var val = $(this).val();
				self.valueInput.val('');
				self.getData(val);
			});

			self.box.click(function(e) {
				e.stopPropagation();
			});

			self.box.find("ul").on("click", "li", function(e) {
				e.stopPropagation();

				var $li = $(this);
				var val = $li.data(self.options.valueKey.toLowerCase());
				var txt = $li.data(self.options.nameKey.toLowerCase());

				self.options.onSelect && self.options.onSelect(val);
				self.valueInput.val(val);
				self.textInput.val(txt);
				self.box.hide();
			});

			$("html").bind("click", function() {
				self.box.hide();
			});

			$(window).resize(function() {
				// self.textInput.blur();
				// self.box.hide();
				self.position();
			});
		},
		getData : function(key, pageno) {
			var self = this;
			pageno = pageno || 1;
			self.param[self.options.searchKey] = key;
			self.param['currentPageNo'] = pageno;
			$.extend(self.param, self.textInput.data('param'));
			if(self.options.url==undefined){
				self.renderPage(key, self.options.data.length, pageno);
				self.renderList(self.options.data);
			}else{
				$.ajax({
					url : self.options.url,
					type : "post",
					data : self.param,
					dataType : "text",
					success : function(data) {
						data = typeof (data) == "object" ? data : eval("(" + data
								+ ")");
						self.renderPage(key, data.total, pageno);
						self.renderList(data.rows);
					},
					error : function() {
						self.options.ajaxError && self.options.ajaxError();
					}
				});
			}
		}
	};

	$.fn.searchDownList = function(options) {
		return this.each(function() {
			var preloader = derive(_searchDownList);
			preloader.init(options, this);
		});
	};

	$.fn.searchDownList.options = {
		paged : false,
		pageNum : 5,
		nameKey : '',
		valueKey : '',
		searchKey : '',
		onSelect : function() {
		}
	};

})(jQuery);

(function($) {
	// 表单序列化JSON
	$.fn.formToJson = function() {
		var serializeObj = {};
		var array = this.serializeArray();
		// var str=this.serialize();
		$(array).each(
				function() {
					if (serializeObj[this.name]) {
						if ($.isArray(serializeObj[this.name])) {
							serializeObj[this.name].push(this.value);
						} else {
							serializeObj[this.name] = [
									serializeObj[this.name], this.value ];
						}
					} else {
						serializeObj[this.name] = this.value;
					}
				});
		return serializeObj;
	};
	// 搜索下拉列表清空
	$.fn.searchDownList_clear = function() {
		return this.each(function() {
			$(this).click(function() {
				var sb = $("#" + $(this).attr("data-id"));
				sb.val("");
				sb.next().val("");
			});
		});
	};
	////字典排序////
	$.fn.filedOder = function() {
		this.each(function() {
			$(this).attr("title", "点击可以设置排序方式");
			$(this).append('<i class="" title=""></i>');
			$(this).attr("data-order", "");
			$(this).click(function() {
				var fi = $(this).find("i");
				if (fi.attr("class") == '') {
					fi.addClass("desc");
					fi.attr("title", "当前是降序");
					$(this).attr("data-order", "desc");
				} else if (fi.attr("class") == 'desc') {
					fi.removeClass("desc");
					fi.addClass("asc");
					fi.attr("title", "当前是升序");
					$(this).attr("data-order", "asc");
				} else if (fi.attr("class") == 'asc') {
					fi.removeClass("asc");
					fi.attr("title", "");
					$(this).attr("data-order", "");
				}
			});
		});
	};
	////我要建议////
	$.fn.wyjy = function() {
		this.each(function() {
			$(this).attr("style", "font-size: 0.8em;color: red;text-decoration: underline;cursor: pointer;");
			$(this).click(function() {
				var url="/datamonitor/wtjy/wtjy.do?method=editWtjy&gnmk="+$(this).attr("data-gnmk");
				popUpWin({"url":url});
			});
		});
	};
})(jQuery);

// 移除空白字符
function delHtmlTag(str) {
	var str = str.replace(/<\/?[^>]*>/gim, "");// 去掉所有的html标记
	var result = str.replace(/(^\s+)|(\s+$)/g, "");// 去掉前后空格
	return result.replace(/\s/g, "");// 去除文章中间空格
}

// 获取URL参数
function getUrlString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
}
// 实现深拷贝
function clone(o) {
	var k, ret = o, b;
	if (o && ((b = (o instanceof Array)) || o instanceof Object)) {
		ret = b ? [] : {};
		for (k in o) {
			if (o.hasOwnProperty(k)) {
				ret[k] = clone(o[k]);
			}
		}
	}
	return ret;
};

/**
 * 弹出窗口
 * 
 * @param param
 *            包含参数的对象
 * @param resizable
 *            是否支持缩放
 */
function popUpWin(param) {
	var name = param.name || '';
	var resizable = param.resizable || 'yes';
	var width = param.width || 800;
	var height = param.height || 500;
	var left = param.left || (screen.availWidth - width) / 2;
	var top = param.top || (screen.availHeight - height) / 2;
	window
			.open(
					param.url,
					name,
					'toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable='
							+ resizable
							+ ',copyhistory=yes,width='
							+ width
							+ ',height='
							+ height
							+ ',screenX='
							+ left
							+ ',screenY=' + top + '');
	// + ',left='+ left + ', top=' + top
}
/**
 * 弹出全屏窗口
 * 
 * @param param
 *            包含参数的对象
 * @param resizable
 *            是否支持缩放
 */
function popUpFillWin(param) {
	var name = param.name || '';
	var resizable = param.resizable || 'yes';
	var left = param.left || 0;
	var top = param.top || 0;
	var width = param.width || screen.availWidth;
	var height = param.height || screen.availHeight - 60;
	window.open(
					param.url,
					name,
					'toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable='
							+ resizable
							+ ',copyhistory=yes,width='
							+ width
							+ ',height='
							+ height
							+ ',screenX='
							+ left
							+ ',screenY=' + top + '');
	// + ',left=' + left + ', top=' + top
}

/**
 * 创建一个具有指定原型的对象
 */
var derive = Object.create ? Object.create : function() {
	var T = function() {}; 
	return function(obj) { 
		T.prototype = obj; 
		return new T;
	};
}();
/**
 * 时间对象的格式化
 */
Date.prototype.format = function(format) {
	var o = {
		"M+" : this.getMonth() + 1, // month
		"d+" : this.getDate(), // day
		"h+" : this.getHours(), // hour
		"m+" : this.getMinutes(), // minute
		"s+" : this.getSeconds(), // second
		"q+" : Math.floor((this.getMonth() + 3) / 3), // quarter
		"S" : this.getMilliseconds()
	};

	if (/(y+)/.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	}

	for (var k in o) {
		if (new RegExp("(" + k + ")").test(format)) {
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
		}
	}
	return format;
};

//添加指定的天数,并返回新的日期
Date.prototype.addDays = function (days) {
    var nd = new Date(this);
    nd.setDate(nd.getDate() + days);
    return nd;
};

//添加指定的小时,并返回新的日期
Date.prototype.addHours = function (hours) {
    var nd = new Date(this);
    nd.setHours(nd.getHours() + parseInt(hours));
    return nd;
};
/**
 * 将公安标准时间字符串转为普通显示时间格式
 * @returns {String} 转换结果
 */
String.prototype.time14Totime19 = function () {
	var str = this;
    var result = str.substring(0, 4)+"-"
    +str.substring(4, 6)+"-"
    +str.substring(6, 8)+" "
    +str.substring(8, 10)+":"
    +str.substring(10, 12)+":"
    +str.substring(12, 14);
    return result;
};
/**
 * 首字母大写
 * @returns {String} 转换结果
 */
String.prototype.upperCastFast = function () {
    var str = this;
    var result = str.substring(0, 1).toUpperCase()+str.substring(1);
    return result;
};

$(function() {
	$(".filed-order").filedOder();
	$(".search_down_list_clear").searchDownList_clear();
});
