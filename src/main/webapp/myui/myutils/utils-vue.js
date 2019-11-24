/**
 * 需要引入的js脚本文件
 */
var scriptList=[
      serviceAddr+"myui/vue/vue.js",
      serviceAddr+"myui/jquery/jquery.tmpl.min.js",
      serviceAddr+"myui/myutils/idcard.js",
      serviceAddr+"myui/myutils/operate-vue.js?time=20191012",
      serviceAddr+"myui/bootstrap/js/bootstrap.js",
      serviceAddr+"myui/SelectPag/selectpage.js?time=20171207",
//      serviceAddr+"myui/SelectMenu/selectmenu.js",
      serviceAddr+"myui/myframe/frame.js?time=20171217",
      serviceAddr+"myui/layer/layer.js",
      serviceAddr+"myui/My97DatePicker/WdatePicker.js",
      serviceAddr+"myui/jquery/jquery.ajaxupload.js",
      serviceAddr+"myui/jquery/jquery.download.js",
      serviceAddr+"myui/nice-validator/dist/jquery.validator.js?local=zh-CN",
      serviceAddr+"myui/ueditor/ueditor.config.js",
      serviceAddr+"myui/ueditor/ueditor.all.min.js",
      serviceAddr+"myui/ueditor/zh-cn.js",
      serviceAddr+"myui/myutils/shuiyin.js",
      serviceAddr+"myui/myutils/page-vue.js",
      serviceAddr+"myui/jsoneditor/jsoneditor.js",
      //md编辑器相关 satrt
      serviceAddr+"myui/editor.md/editormd.js",
      serviceAddr+"myui/editor.md/lib/marked.min.js",
      serviceAddr+"myui/editor.md/lib/prettify.min.js",
      serviceAddr+"myui/editor.md/lib/raphael.min.js",
      serviceAddr+"myui/editor.md/lib/underscore.min.js",
      serviceAddr+"myui/editor.md/lib/sequence-diagram.min.js",
      serviceAddr+"myui/editor.md/lib/flowchart.min.js",
      serviceAddr+"myui/editor.md/lib/jquery.flowchart.min.js",
      //md编辑器相关 end
      serviceAddr+"myui/zTree_v3/js/jquery.ztree.all.js",
      serviceAddr+"myui/echarts/echarts-4.2.1-rc.1.js"
   ];
/**
 * 需要引入的css脚本文件
 */
var cssList=[
      serviceAddr+"myui/myutils/utils.css?time=20171111",
      serviceAddr+"myui/bootstrap/css/bootstrap.min.css",
      serviceAddr+"myui/myframe/frame.css?time=20171111",
      serviceAddr+"myui/font-awesome/css/font-awesome.css",
      serviceAddr+"myui/SelectPag/selectpage.bootstrap3.css",
      serviceAddr+"myui/jsoneditor/jsoneditor.css",
      serviceAddr+"myui/editor.md/css/editormd.css",
//      serviceAddr+"myui/SelectMenu/selectmenu.css",
      serviceAddr+"myui/zTree_v3/css/zTreeStyle/zTreeStyle.css"
   ];

//执行引入css脚本操作
for(var i = 0;i<cssList.length;i++){
	document.write('<link rel="stylesheet" type="text/css" href="'+cssList[i]+'">');
}
//执行引入js脚本操作
for(var i = 0;i<scriptList.length;i++){
	document.write('<script language="javascript" src="'+scriptList[i]+'" > <\/script>');
}
$(function() {
    initValidator();
	//必填标记
	$("label.required").prepend("<span class='required'>*</span>");
	//zdlb字典
    $(".zdRecord").zdRecord();
//    $(".zdSelectPage").zdSelectPage();
    $(".zdTranslate").zdTranslate();
    // 绑定图片上传事件
	if($(".uploadFile").length > 0){
		$(".uploadFile").uploadFile();
	}
});
function initValidator(){
    if(!$.validator){
        return;
    }
    $.validator.config({
        rules: {
            // 身份证
            idcard: function(element) {
                return idCardNoUtil.checkIdCardNo(element.value) || "请填写正确的身份证号码";
            },
            mobile: [/^1[3-9]\d{9}$/, "请填写有效的手机号"],
            chinese: [/^[\u0391-\uFFE5]+$/, "请填写中文字符"]
        }
    });
}
/**
 * 小工具
 * @param $
 */
(function($) {
    /**
     * 表单序列化JSON
     */
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
	/**
	 * 通过ajax包含一个页面到指定对象
	 */
    $.fn.includePage = function(opts) {
        this.each(function() {
	        var self = $(this);
	        var url = self.attr("data-src");
	        if(opts.url){
	        	url = opts.url;
	        }
	        if(url){
	            $.ajax({
	                url : url,
	                type : "post",
	                async :false,
	                data : opts.param,
	                dataType : "text",
	                success : function(data) {
	                    if(data!='null'){
	                        self.html(data);
	                        self.show();
	                    }else{
	                        self.hide();
	                    }
	                },
	                error : function() {
	                    alert("加载页面失败");
	                }
	            });
	        }
		});
    };
    /**
     * 
     */
    $.fn.ellipsis = function() {
        this.each(
			function() {
				var _this = $(this);
				var text = _this.text();
				var html = _this.html();
				if(text.indexOf("  ")==-1&&html.indexOf("checkbox")==-1){
					_this.attr("title",text);
					_this.addClass("ellipsis");
//					_this.html("<div class='ellipsis'>"+html+"</div>");
				}
			}
    	);
    };
	
    /**
     * 根据zdlb生成字典记录
     */
    $.fn.zdRecord = function() {
        this.each(function(){
            var zdObj = $(this);
            var zdlb = zdObj.attr("zdlb");
            var isAll = zdObj.attr("isAll");
            if(isAll){
            	var input="<input type='checkbox' onchange='checkboxAll(this)'/>";
            	zdObj.before(input);
                zdObj.before("全部"+" ");
            }
            //支持多选
            var selectedVal = ","+zdObj.attr("value").replace(/[\[ \]]/g,"")+",";
            $.ajax({
                   type:"POST",
                   data:{"map['zdlb']":zdlb},
                   url:serviceAddr+"common/zdList.do",
                   dataType: "json",
                   success:function(data){
                       for(var i = 0;i<data.length;i++){
                           var zd = data[i];
                           zdObj.val(zd.dm);
                           if(selectedVal.indexOf(","+zd.dm+",")>-1){
                               zdObj.attr("checked","checked");
                           }else{
                               zdObj.removeAttr("checked");
                           }
                           var obj = zdObj[0].outerHTML;
                           zdObj.before(obj);
                           zdObj.before(zd.mc+" ");
                       }
                       zdObj.remove();
                   },
                   error:function(){
                       alert("加载字典失败："+zdlb);
                   }
            });
        });
    };
    /**
     * 字典翻译
     */
    $.fn.zdTranslate = function() {
        this.each(function(){
            var zdObj = $(this);
            var zdlb = zdObj.attr("zdlb");
            if(zdObj[0].nodeName=='INPUT'){
                zdObj.val(zdMcByDm(zdlb,zdObj.val()));
            }else{
                zdObj.text(zdMcByDm(zdlb,zdObj.text()));
            }
        });
    }
    /**
     * 根据zdlb生成字典选择
     */
    $.fn.changeSelectPageData = function(zdlb,otherParam) {
		var _this = $(this);
		_this.getPlugin().option.data = serviceAddr+"common/zdSearch.do?autoCount=true&zdlb="
		    +zdlb+"&otherParam="+encodeURI(otherParam||"")+"&otherParam="+encodeURI(otherParam||"");
    };
    
    /**
     * 文件上传
     */
    $.fn.uploadFile = function() {
        this.each(function(){
            var _this = $(this);
        	var upurl = serviceAddr+"common/upload.do";
        	var ywdm = _this.attr("ywdm");
            var wjlb = _this.attr("wjlb");
        	var glid = _this.attr("glid");
        	
        	new Ajax_upload(_this, {
                action : upurl,
        		data: {}, 
        		name : 'file',
        		autoSubmit : true,
        		responseType : 'json',
        		onSubmit : function(file, ext) {
        			var type = ext[0];
        			//获取附加类型
        			if (!(type && /^(jpg|jpeg|gif|png|bmp|doc|docx|xlsx|xls|mp4|txt)$/.test(type.toLowerCase()))) {
        				//alert("文件格式不正确，仅支持jpg,jpeg,gif,png,bmp,doc,docx,xlsx,xls,mp4,txt格式");
        			    alertInfo("该文件格式不支持上传");
        				return false;
        			}
        			if(!wjlb){
        			    alertInfo("请设置文件类别");
    					return false;
    				}
        			if(!ywdm){
        			    alertInfo("请设置业务代码");
        				return false;
        			}
        			if(glid==null){
        				glid = "";
        			}
        			
        			this.setData({wjlb:wjlb,ywdm:ywdm,glid:glid});
        			// 上传中
        			this.disable();
                    //遮罩层
        		},
        		onComplete : function(file, data) {
        			this.enable();        			
        			if (data.status ){
                        if(_this.attr("callBack")){
                        	eval(_this.attr("callBack")+'(data.data)');
                        }else{
                        	alertInfo("上传成功");
                        }                        
        			}else{
                        alertError("上传失败："+data.msg);
        			}
        		}
        	});
        });
    };
})(jQuery);

/**
 * 字典列表缓存，避免频繁向后台请求
 */
var zdListCache = {};
/**
 * 获取字典列表
 * @param zdlb 字典类别
 */
function zdList(zdlb){
    if(zdListCache[zdlb+"_cache"]){
        //不支持获取列表
        return null;
    }
    if(zdListCache[zdlb]==null){
        $.ajax({
            type:"POST",
            async:false,
            data:{"zdlb":zdlb},
            url:serviceAddr+"common/zdList.do",
            dataType: "json",
            success:function(result){
                if(result.status){
                    zdListCache[zdlb] = result.data;
                }else{
                    //不支持获取列表
                    zdListCache[zdlb+"_cache"] = true;
                    zdListCache[zdlb] = {};
                }
            },
            error:function(){
                alert("加载字典失败："+zdlb);
            }
            });
    }
    if(zdListCache[zdlb+"_cache"]){
        //不支持获取列表
        return null;
    }else{
        return zdListCache[zdlb];
    }
}
/**
 * 获取字典对象
 * @param zdlb 字典类别
 * @param dm 字典代码
 */
function zdObj(zd,cache){
    var zdlb = zd.zdlb;
    var dm = zd.dm;
    var obj = null;
	if(!zdlb){
	    //参数为空
	    return null;
	}
	if(cache==undefined){
	    //默认走缓存
	    cache=true;
	}
    var zl = zdList(zdlb);
    if(zl&&cache){
        //获取了字典列表
        for(var i in zl){
            if(zl[i].dm==dm){
                obj = zl[i];
                break;
            }
        }
    }else if(zdListCache[zdlb][dm]&&cache){
        //该字典的具体字典项已经缓存。
        obj = zdListCache[zdlb][dm];
    }else{
        zd['e_cache']=cache;
        //不支持获取列表
        $.ajax({
            type:"POST",
            async:false,
            data:zd,
            url:serviceAddr+"common/zdObj.do",
            dataType: "json",
            success:function(result){
                if(result.status){
                    zdListCache[zdlb][dm] = result.data;
                    obj = result.data;
                }else{
                    obj = {"dm":dm,"mc":dm};
                    zdListCache[zdlb][dm] = obj;
                }
            },
            error:function(){
                alertInfo("加载字典失败："+zdlb+"->"+dm);
            }
         });
    }
    return obj;
}

/**
 * 获取字典名称
 * @param zdlb 字典类别
 * @param dm 字典代码
 */
function zdMcByDm(zdlb,dm){
    var obj = zdObj({zdlb:zdlb,dm:dm});
    if(obj==null){
        return dm;
    }else{
        return obj.mc;
    }
}

/**
 * 获取字典名称多个
 * @param zdlb 字典类别
 * @param dm 字典代码
 */
function zdMcByDmMore(zdlb,dm){
	var mc = "";
	if(dm){
		var dms = (dm+"").split(",");
		for(var i=0;i<dms.length;i++){
		    if(isEmpty(dms[i])){
                mc += "、";
                continue;
		    }
		    mc += "、"+zdMcByDm(zdlb,dms[i]);
		}
	}
    return mc.substring(1);
}
/**
 * 打开layer弹窗
 * @param param 包含参数的对象{"url":url,"name":name,"width":1000,"height":600}
 */
function popUpWinLayer(param){
    var width = param.width || "800px";
    var height = param.height || "500px";
    var perContent  = layer.open({
                  type: 2,
                  title: param.name||'',
                  shadeClose: true,
                  shade: false,
                  maxmin: true, //开启最大化最小化按钮
                  area: [width, height],
                  content: param.url
            });
    return perContent;
}
/**
 * 
 * @param param {"url":url,"name":name}
 * @returns {___anonymous_perContent}
 */
function popUpFullWinLayer(param){
    var perContent = popUpWinLayer(param);
    layer.full(perContent);
    return perContent;
}
/**
 * 弹出窗口
 * @param param 包含参数的对象{"url":url,"name":name,"width":1000,"height":600}
 */
function popUpWin(param) {
	var name = param.name || '';
	var resizable = param.resizable || 'yes';
	var width = param.width || 800;
	var height = param.height || 500;
	var left = param.left || (screen.availWidth - width) / 2;
	var top = param.top || (screen.availHeight - height) / 2;
	window.open(param.url,name,
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
 * 弹出最大化窗口
 * @param param 包含参数的对象{"url":url,"name":name,"width":1000,"height":600}
 */
function popUpFillWin(param) {
    param.left = param.left || 0;
    param.top = param.top || 0;
    param.width = param.width || screen.availWidth;
    param.height = param.height || screen.availHeight - 50;
    popUpWin(param);
}
/**
 * 异常提示
 * @param msg 提示消息
 */
function alertError(msg){
    layer.alert(msg ? msg : "数据处理异常！", { 
        icon:2                  
    });
}
/**
 * 一般提示
 * @param msg 提示消息
 */
function alertInfo(msg){
    layer.alert(msg, { 
        time: 10000, 
        icon:0                  
    });
}
/**
 * 提示后，进行其他操作
 * @param data
 * @param end
 */
function alertByResult(result,end,options){
    if(options&&options.jgts==false){
        //结果不提示
        if(end){
            end();
        }
    }else{
        layer.alert(result.msg ? result.msg : "操作成功！", {
            shade:0.3,
            icon:result.status?1:2,
            end:end
        });
    }
}

function ajax(url,options){
    if(!options){
        options = {};
    }
    if(options.qrts!=false){
        layer.alert("你确定要提交吗？", {
            icon: 3,
            btn:["确定","取消"],
            yes:function(index,layero){
                myAjax(url,options);
            },btn2:function(){//取消按钮事件
                if(typeof options.qxbtn ==="function"){
                    options.qxbtn();
                }
            }
        });
    }else{
        myAjax(url,options);
    }
}
function myAjax(url,options){
    var loadindex = layer.load(0,{
        shade: [0.3]
    });
    $.ajax({
        type: "POST",
        url: url,
        data: options.fromdata,
        dataType: "json",
        success: function (result) {
            qqjgcl(result,options,loadindex)
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            var result = {status:false,msg:"请求出错"};
            qqjgcl(result,options,loadindex);
        }
    });
}
/**
 * 请求结果处理
 * @param result
 * @param options
 * @param loadindex
 */
function qqjgcl(result,options,loadindex){
    alertByResult(result,function(){
        if (result.status) {
            if(options.success){
                options.success(result);
            }
        } else {
            if(options.error){
                options.error(result);
            }
        }
    },options);
    layer.close(loadindex);
}

function redict(result){
//    window.location=serviceAddr+"myui/common/"+result.data+".jsp?msg="+result.msg;
    window.location=serviceAddr+"myui/common/500.jsp?msg="+result.msg;
}

function checkboxAll(obj){
	var checked = obj.checked;
	var checkName = $(obj).next("input").attr("name");
	if(checked){
		$("input[name="+checkName+"]").attr("checked","checked");
	}else{
		$("input[name="+checkName+"]").removeAttr("checked");
	}
};

/**
 * 移除空白字符
 */
function delHtmlTag(str) {
	str = str.replace(/<\/?[^>]*>/gim, "");// 去掉所有的html标记
	var result = str.replace(/(^\s+)|(\s+$)/g, "");// 去掉前后空格
	return result.replace(/\s/g, "");// 去除文章中间空格
}

/**
 * 获取URL参数
 */
function getUrlString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
}
/**
 * 实现深拷贝
 */
function clone(obj) {
    var copy = null;
    switch(typeof obj){
        case 'number': 
        case 'string': 
        case 'boolean': 
        copy = obj;
        break;
        case 'object': 
        if (obj == null) {
            copy = null;
        } else if (toString.apply(obj) === '[object Array]') {
            copy = [];
            for (var i in obj) {
                copy.push(clone(obj[i]));
            };
        } else if (toString.apply(obj) === '[object Object]') {
            copy = {};
            for (var j in obj) {
                copy[j] = clone(obj[j]);
            }
        } else {
            copy = obj;
        }
    }
    return copy;
}

/**
 * 部分低版本浏览器不支持Object.values方法
 * @param obj
 * @returns {Array}
 */
if (!Object.values) Object.values = function(obj) {
    if (obj !== Object(obj))
        throw new TypeError('Object.values called on a non-object');
    var val=[],key;
    for (key in obj) {
        if (Object.prototype.hasOwnProperty.call(obj,key)) {
            val.push(obj[key]);
        }
    }
    return val;
}

/**
 * 判断字符串是否为空
 * @param str 要判断的字符串
 * @returns 空：true，非空：false
 */
function isEmpty(str){
    if(str==null||str==""){
        return true;
    }else{
        return false;
    }
}
/**
 * 是否是非负整数
 * @param str
 * @returns 非负整数：true，否则：false
 */
function isNumber(str){
    return (/^(\+|-)?\d+$/.test( str ))&& str>=0;
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
//添加指定的天数,并返回新的日期
Date.prototype.addDays = function (days) {
    var nd = new Date(this);
    nd.setDate(nd.getDate() + parseInt(days));
    return nd;
};
//添加指定的小时,并返回新的日期
Date.prototype.addHours = function (hours) {
    var nd = new Date(this);
    nd.setHours(nd.getHours() + parseInt(hours));
    return nd;
};
/**
 * 时间字符串解析为date
 * @param dataStr
 */
Date.parseDate = function(dateStr) {
    if(!dateStr){
        return null;
    }
    var d = new Date();
    if(dateStr.length==8){
        d.setFullYear(dateStr.substring(0, 4),dateStr.substring(4, 6)-1,dateStr.substring(6, 8));
        d.setHours(0,0,0);
    }else if(dateStr.length==10){
        d.setFullYear(dateStr.substring(0, 4),dateStr.substring(5, 7)-1,dateStr.substring(8, 10));
        d.setHours(0,0,0);
    }else if(dateStr.length==12){
        d.setFullYear(dateStr.substring(0, 4),dateStr.substring(4, 6)-1,dateStr.substring(6, 8));
        d.setHours(str.substring(8, 10),dateStr.substring(10, 12),0);
    }else if(dateStr.length==14){
        d.setFullYear(dateStr.substring(0, 4),dateStr.substring(4, 6)-1,dateStr.substring(6, 8));
        d.setHours(dateStr.substring(8, 10),dateStr.substring(10, 12),dateStr.substring(12, 14));
    }else if(dateStr.length==19){
        d.setFullYear(dateStr.substring(0, 4),dateStr.substring(5, 7)-1,dateStr.substring(8, 10));
        d.setHours(dateStr.substring(11, 13),dateStr.substring(14, 16),dateStr.substring(17, 19));
    }
    return d;
}
/**
 * 时间对象的格式化
 */
Date.prototype.format = function(format) {
	var o = {
		"M+" : this.getMonth() + 1, // month
		"d+" : this.getDate(), // day
		"H+" : this.getHours(), // hour
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
/**
 * 时间格式化
 */
function dateFormat(dateStr,fmt){
    var d = Date.parseDate(dateStr);
    if(d){
        return d.format(fmt);
    }else{
        return "";
    }
}

String.prototype.startWith=function(str){     
  var reg=new RegExp("^"+str);     
  return reg.test(this);        
};
String.prototype.endWith=function(str){     
  var reg=new RegExp(str+"$");     
  return reg.test(this);        
};
String.prototype.trim = function() {
	  var str = this.replace(/^\s\s*/, ''),
	  ws = /\s/,
	  i = str.length;
	  while (ws.test(str.charAt(--i)));
	  return str.slice(0, i + 1);
};


////////////////关于IE8不支持Object.keys（）的处理/////////////////////////
var DONT_ENUM =  "propertyIsEnumerable,isPrototypeOf,hasOwnProperty,toLocaleString,toString,valueOf,constructor".split(","),
    hasOwn = ({}).hasOwnProperty;
for (var i in {toString: 1}){
    DONT_ENUM = false;
}
Object.keys = Object.keys || function(obj){//ecma262v5 15.2.3.14
    var result = [];
    for(var key in obj ) if(hasOwn.call(obj,key)){
        result.push(key) ;
    }
    if(DONT_ENUM && obj){
        for(var i = 0 ;key = DONT_ENUM[i++]; ){
            if(hasOwn.call(obj,key)){
                result.push(key);
            }
        }
    }
    return result;
};
function extend(dst) {
    var h = dst.$$hashKey;
    for (var i = 1, ii = arguments.length; i < ii; i++) {
        var obj = arguments[i];
        if (obj) {
            var keys = Object.keys(obj);
            for (var j = 0, jj = keys.length; j < jj; j++) {
                var key = keys[j];
                dst[key] = obj[key];
            }
        }
    }
    setHashKey(dst, h);
    return dst;
}
////////////////关于IE8不支持Object.keys（）的处理/////////////////////////

/**
 * 参数预处理
 */
function preParam(_params){
	for(var key in _params){
		if(typeof _params[key] == "string"){
			_params[key] = _params[key].trim();
		}
		if(key.endWith("']_text")){
			_params[key.replace("']_text","_text']")] = _params[key];
			delete _params[key];
		}else if(key.endWith("_text")){
			_params["map['"+key+"']"] = _params[key].toString();
		}
	}
    return _params;
};
/**
 * 字符串的方法名转为方法
 * @param strFun
 * @returns 方法不存在：false，存在：方法本身
 */
function strFunToFun(strFun){
    if(strFun){
        try{
            var f = eval(strFun);
            if(typeof(f)!='function'){
                console.warn(strFun+"不是一个方法");
            }else{
                return f;
            }
        }catch (e) {
            console.warn(strFun+"不是一个方法:"+e.message);
        }
    }
    return false;
}
/**
 * 我的规则验证
 * @param value 值
 * @param rules 规则
 * @returns {String} 消息内容，为空时表示验证通过
 */
function myGzyz(value,rules,field){
    if(!rules){
        return;
    }
    var msg = null;
    if(!value){
        if(rules.indexOf("notNull")>-1){
            msg = "该值不能为空";
        }
    }else{
        var zdlb = null;
        var ruleArr = rules.replace("；", ";").split(";");
        for(var i in ruleArr){
            var rule = ruleArr[i];
            if(!rule){
                continue;
            }
            var rr = rule.split(":");
            switch (rr[0]) {
            case "notNull":
                break;
            case "mustBe":
                if(value!=rr[1]){
                    var val = rr[1];
                    if(zdlb){
                        val = zdObj({zdlb:zdlb,dm:val}).mc;
                    }
                    msg = "该值必须为："+val;
                }
                break;
            case "length":
                if(value.length<rr[1]){
                    msg = "该值长度不得小于："+rr[1];
                }else if(value.length>rr[2]){
                    msg = "该值长度不得大于："+rr[2];
                }
                break;
            case "number":
                if(!isNumber(value)){
                    msg = "该值要求是数字";
                }else if(value>rr[1]){
                    msg = "该值超出大小限制："+rr[1];
                }
                break;
            case "null":
                if(value){
                    msg = "该值必须为空";
                }
                break;
            case "date":
                if(value.length==8||value.length==10||value.length==14||value.length==19){
                }else{
                    msg = "该值必须是时间格式";
                }
                break;
            case "zzbds":
                //正则表达式
                eval("var bds = /"+rr[1]+"/gm");
                if(!bds.test(value)){
                    msg = rr[2];
                }
                break;
            case "sfzh":
                if(!idCardNoUtil.checkIdCardNo(value)){
                    msg = "该值不是正确的身份证号码";
                }
                break;
            case "zdpd":
                //字典判断
                if(zdObj({zdlb:rr[1],dm:value},false).mc=='0'){
                    msg = "远程判断未通过:"+rr[2];
                }
                break;
            case "zd":
                //字典判断
                var kzxx = field.kzxx;
                if(typeof kzxx == "string"){
                    eval("kzxx="+kzxx);
                    field.kzxx = kzxx;
                }
                if(field&&field.kzxx["字典数据"]){
                    break;
                }
                var zdArr = value.split(",");
                for(var i in zdArr){
                    if(zdObj({zdlb:rr[1],dm:zdArr[i]})==null){
                        msg = "该字典项不存在:"+zdArr[i];
                    }
                }
                zdlb = rr[1];
                break;
            default:
                msg = "规则不支持:"+rr[0];
            }
            if(msg){
                break;
            }
        }
    }
    if(msg){
        console.info(field.zdmc+"验证未通过："+msg);
    }
    return msg;
}
/**
 * 当前输入焦点
 */
var dqsrjd = null;
/**
 * 自定义验证规则
 * @param field 字段信息
 * @param event 事件对象
 */
function zdyyzgz(field, value,srkj){
    var pagemodel = srkj.pagemodel;
    var rules = field.hdyzgz;
    var msg;
    if(pagemodel!='search'){
        msg = myGzyz(value,rules,field);
    }else{
        var kzxx = field.kzxx;
        if(typeof kzxx == "string"){
            eval("kzxx="+kzxx);
            field.kzxx = kzxx;
        }
        msg = myGzyz(value,kzxx['查询验证规则'],field);
    }
    if(msg){
        layer.tips(msg, srkj.$el, {tips:[2, '#c00'],shift:6});
        if(dqsrjd!=srkj){
            dqsrjd=srkj;
            $(srkj.$el).find("input:first").focus();
        }
        return false;
    }else{
        return true;
    }
}
/**
 * 对整个表单进行校验
 * @param _this vue对象
 */
function myValidFrom(_this,module,fromdata){
    var fields = _this.fields;
    var pagemodel = _this.pagemodel;
    var msg = null;
    var srkj = null;
    if(pagemodel=='add'){
        var fromid = _this.fromid;
        var fromTarget = _this.$root.frommap[fromid];
        var updatedata = _this._data.updatedata;
        for(var i in fromTarget){
            msg = myGzyz(updatedata[i],fromTarget[i].field.hdyzgz,fromTarget[i].field);
            if(msg){
                srkj = fromTarget[i].srkj;
                break;
            }
        }
    }else if(pagemodel=='edit'){
        var fromid = _this.fromid;
        var fromTarget = _this.$root.frommap[fromid];
        var updatedata = _this._data.updatedata;
        for(var i in updatedata){
            if(fromTarget[i]){
                msg = myGzyz(updatedata[i],fromTarget[i].field.hdyzgz,fromTarget[i].field);
                if(msg){
                    srkj = fromTarget[i].srkj;
                    break;
                }
            }
        }
    }else if("saveList"==module){
        var fromid = _this.listFromid;
        var fromTarget = _this.$root.frommap[fromid];
        var listEditData = _this.listEditData;
        for(var row in listEditData){
            for(var i in listEditData[row]){
                var target = fromTarget["led."+row+"."+i];
                if(target){
                    msg = myGzyz(listEditData[row][i],target.field.hdyzgz,target.field);
                    if(msg){
                        srkj = target.srkj;
                        break;
                    }
                }
            }
            if(msg){
                break;
            }
        }
    }else if("queryFrom"==module){
        var fromid = _this.queryFromid;
        var fromTarget = _this.$root.frommap[fromid];
        for(var i in fromTarget){
            var kzxx = fromTarget[i].field.kzxx;
            if(typeof kzxx == "string"){
                eval("kzxx="+kzxx);
                fromTarget[i].field.kzxx = kzxx;
            }
            msg = myGzyz(fromdata[i],kzxx['查询验证规则'],fromTarget[i].field);
            if(msg){
                srkj = fromTarget[i].srkj;
                break;
            }
        }
    }
    if(msg){
        dqsrjd=srkj;
        $(srkj.$el).find("input:first").focus();
        layer.tips(msg, srkj.$el, {tips:[2, '#c00'],shift:6});
        return false;
    }else{
        return true;
    }
}
/**
 * 时间格式化
 */
function vueTimeGsh(value,_this){
    if(_this.pagemodel=='search'){
        //查询模式，将时间转为精确到天，一般查询不用精确到时分秒，需要的特殊情况请自定义方法。
        return dateFormat(value,'yyyy-MM-dd HH:mm:ss');
    }
    var qdgs = _this.WdatePicker.dateFmt;
    return dateFormat(value,qdgs);
}
/**
 * 时间反格式化：默认处理所有时间在数据库中存储的都是14位字符串
 */
function vueTimeFgsh(value,_this,event){
    if(_this.pagemodel=='search'){
        //查询模式，将时间转为精确到天，一般查询不用精确到时分秒，需要的特殊情况请自定义方法。
        return dateFormat(value,'yyyyMMddHHmmss');
    }
    var hdgs = _this.WdatePicker.hdgs;
    return dateFormat(value,hdgs);
}
/**
 * 组建编辑参数
 */
function editUrl(sjdx,row){
    var p = {};
    p[sjdx.zjzd]=row[sjdx.zjzd];
    return encodeURI(JSON.stringify(p));
}
/**
 * json对象编码
 */
function jsonEncode(obj){
    return encodeURI(JSON.stringify(obj)).replace(/\+/g,"%2B");
}
/**
 * 多级key是否在对象中存在
 * @param obj
 * @param keys
 */
function keyExist(obj,keys){
    var keyArr = keys.split(".");
    for(var i in keyArr){
        if(obj[keyArr[i]]){
            obj = obj[keyArr[i]];
        }else{
            return null;
        }
    }
    return obj;
}
/**
 * 字典格式化-图标
 * @param data
 * @returns {String}
 */
function zdFormatIcon(data){
    var val = data.mc;
    if(data.wjlx=='icon'){
        val = data.sclj+" "+data.mc;
    }else{
        val = "<img src='common/download.do?id="+data.dm+"' style='height:16px;'/> "+data.mc;
    }
    return val;
}
