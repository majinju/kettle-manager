/**
 * 需要引入的js脚本文件
 */
var scriptList=[
      serviceAddr+"aui/jquery/jquery.tmpl.min.js",
      serviceAddr+"aui/a-utils/idcard.js",
      serviceAddr+"aui/a-utils/operate.js",
      serviceAddr+"aui/bootstrap/js/bootstrap.min.js",
      serviceAddr+"aui/SelectPag/selectpage.js?time=20171207",
      serviceAddr+"aui/a-frame/frame.js?time=20171217",
      serviceAddr+"aui/layer/layer.js",
      serviceAddr+"aui/My97DatePicker/WdatePicker.js",
      serviceAddr+"aui/jquery/jquery.ajaxupload.js",
      serviceAddr+"aui/nice-validator/dist/jquery.validator.js?local=zh-CN",
      serviceAddr+"aui/ueditor/ueditor.config.js",
      serviceAddr+"aui/ueditor/ueditor.all.min.js",
      serviceAddr+"aui/ueditor/zh-cn.js",
      serviceAddr+"aui/shuiyin/shuiyin.js",
      serviceAddr+"aui/a-utils/page.js"
//      serviceAddr+"aui/zTree_v3/js/jquery.ztree.all.js"
   ];
/**
 * 需要引入的css脚本文件
 */
var cssList=[
      serviceAddr+"aui/bootstrap/css/bootstrap.min.css",
      serviceAddr+"aui/a-frame/frame.css?time=20171111",
      serviceAddr+"aui/font-awesome/css/font-awesome.css",
      serviceAddr+"aui/SelectPag/selectpage.bootstrap3.css",
      serviceAddr+"aui/a-utils/utils.css?time=20171111"
//      serviceAddr+"aui/zTree_v3/css/zTreeStyle/zTreeStyle.css",
//      serviceAddr+"aui/zTree_v3/css/demo.css"
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
	$(".zdSelect").zdSelect();
    $(".zdRecord").zdRecord();
    $(".zdSelectPage").zdSelectPage();
    $(".zdTranslate").zdTranslate();
    // 绑定图片上传事件
	if($("div.uploadFile").length > 0){
		$("div.uploadFile").uploadFile();		
	}
});
function initValidator(){
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
                   url:serviceAddr+"common/dict/zdList.do",
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
	 * 根据zdlb生成字典选择
	 */
    $.fn.zdSelect = function() {
        this.each(function(){
            var zdObj = $(this);
            var zdlb = zdObj.attr("zdlb");
            var selectedVal = zdObj.attr("selectedVal");
            var empty = zdObj.attr("empty");
            if(empty){
                var option = "<option value=''>"+empty+"</option>";
                zdObj.append(option);
            }
            $.ajax({
                   type:"POST",
                   data:{"map['zdlb']":zdlb},
                   url:serviceAddr+"common/dict/zdList.do",
                   dataType: "json",
                   success:function(data){
                       for(var i = 0;i<data.length;i++){
                           var zd = data[i];
                           var option = "<option value='"+zd.dm+"'";
                           if(zd.dm == selectedVal){
                               option += " selected='selected'";
                           }
                           option += ">"+zd.mc+"</option>";
                           zdObj.append(option);
                       }
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
    $.fn.zdSelectPage = function() {
        this.each(function(){
            var zdObj = $(this);
            var zdlb = zdObj.attr("zdlb");
            var otherParam = zdObj.attr("other-param")||'';
            var data = serviceAddr+"common/dict/zdSearch.do?autoCount=true&map['zdlb']="+zdlb+"&map['otherParam']="+otherParam;
            if(!(zdObj.attr("ajax")=="true")&&zdlb!="SYS_COMMON_ORG"){
            	data = zdList(zdlb);
            }
            zdObj.selectPage({
            	data:data,
                showField: 'mc',
                keyField: 'dm',
                searchField: "map['searchKey']",
                orderBy : ['px asc','dm asc','mc'],
                eAjaxSuccess: function(d){
                    return d;
                },
                //选中项目后的回调处理
                //入参：data：选中行的原始数据对象
                eSelect : function(data){
                    if(zdObj.attr("e-select")){
                    	eval(zdObj.attr("e-select")+'(data,zdObj)');
                        
                    }
                },
				// 点击select的那个叉的事件回调
                eClear : function(){
                    if(zdObj.attr("e-clear")){
                        eval(zdObj.attr("e-clear")+'(zdObj)');
                    }
                },
                //仅选择模式，不允许输入查询关键字
                selectOnly : zdObj.attr("select-only")=="true"?true:false,
                //关闭分页栏，数据将会一次性在列表中展示，上限200个项目
                pagination : zdObj.attr("pagination")=="false"?false:true,
                //关闭分页的状态下，列表显示的项目个数，其它的项目以滚动条滚动方式展现（默认10个）
                listSize : zdObj.attr("listSize")|10,
                multiple : zdObj.attr("multiple")=="multiple"?true:false
            });
        });

    };
    /**
     * 根据zdlb生成字典选择
     */
    $.fn.changeSelectPageData = function(zdlb,otherParam) {
		var _this = $(this);
		_this.getPlugin().option.data = serviceAddr+"common/dict/zdSearch.do?autoCount=true&map['zdlb']="+zdlb+"&map['otherParam']="+encodeURI(otherParam||"")+"&map['noCache']="+encodeURI(otherParam||"");
    };
    
    /**
     * 文件上传
     */
    $.fn.uploadFile = function() {
        this.each(function(){
            var _this = $(this);
        	var upurl = serviceAddr+"common/file/uploadFile.do";
        	var ywdm = _this.attr("ywdm");
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
    				var wjlb = $("#wjlb").val();
        			if (!(type && /^(jpg|jpeg|gif|png|bmp|doc|docx|xlsx|xls|mp4|txt)$/.test(type.toLowerCase()))) {
        				//alert("文件格式不正确，仅支持jpg,jpeg,gif,png,bmp,doc,docx,xlsx,xls,mp4,txt格式");
        				layer.alert("文件格式不正确", { 
        					time:3000,    	   		
        					icon:6
        				});
        				return false;
        			}
        			if(!wjlb){
    					layer.alert("请选择附件类型", { 
    						time:3000,    	   		
    						icon:6
    					});
    					return false;
    				}
        			if(!ywdm){
        				layer.alert("请传入业务代码", { 
        					time:3000,    	   		
        					icon:6
        				});
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
                        	layer.alert("上传成功", { 
	        					time:3000, 
	        					icon:1       	   		
        					});
                        }                        
        			}else{
        				layer.alert(data.msg||"上传失败", { 
        					time:3000, 
        					icon:5       	   		
        				});
        			}
        		}
        	});
        });
    };
})(jQuery);

//移出附件，只删除页面上的附件
function delFile(id){
	layer.alert("确定要删除吗？", {
   		icon: 3,
   		btn:["确定","取消"],
   		yes:function(index,layero){
   			layer.msg("删除成功！", { 
				shade:0.3,
				time:1500,    	   		
				icon:6
			});
   			$("#file_" + id).remove();
   		}
   	});
}

/**
 * 字典列表缓存，避免频繁向后台请求
 */
var zdListCache = {};
/**
 * 字典缓存，避免频繁向后台请求
 */
var zdCache = {};
/**
 * 获取字典列表
 * @param zdlb 字典类别
 */
function zdList(zdlb){
    if(zdListCache[zdlb]==null){
        $.ajax({
            type:"POST",
            async:false,
            data:{"map['zdlb']":zdlb},
            url:serviceAddr+"common/dict/zdList.do",
            dataType: "json",
            success:function(data){
            	zdListCache[zdlb] = data;
            },
            error:function(){
                alert("加载字典失败："+zdlb);
            }
            });
    }
    return zdListCache[zdlb];
}
/**
 * 获取字典Map
 * @param zdlb 字典类别
 */
function zdMap(zdlb){
    if(zdCache[zdlb]==null){
    	var data = zdList(zdlb);
        zdCache[zdlb] = {};
        if(data){
            for(var i=0;i<data.length;i++){
                zdCache[zdlb][data[i].dm]=data[i].mc;
            }
        }
    }
    return zdCache[zdlb];
}
/**
 * 获取字典名称
 * @param zdlb 字典类别
 * @param dm 字典代码
 */
function zdMcByDm(zdlb,dm){
	if(dm){
	    var mc = dm;
	    var zl = zdMap(zdlb);
	    if(isEmpty(zl[dm])){
	    	return mc;
	    }
	    if(!isEmpty(zl[dm])){
	        mc = zl[dm];
	    }
	    return mc;
	}
	return "";
}

/**
 * 获取字典名称多个
 * @param zdlb 字典类别
 * @param dm 字典代码
 */
function zdMcByDmMore(zdlb,dm){
	var mc = "";
	if(dm){
		var mcs = dm.split(",");
		for(var i=0;i<mcs.length;i++){
			if(mcs[i] != ""){
				var zl = zdMap(zdlb);
			    if(!isEmpty(zl[mcs[i]])){
			    	if(mc!=""){
			    		mc += "、" + zl[mcs[i]];
			    	}else{
			    		mc = zl[mcs[i]];
			    	}
			    }else{
			    	if(mc != ""){
			    		mc += "、" + mcs[i];
			    	}else{
			    		mc += mcs[i];
			    	}
			    }
			}else{
				mc += mcs[i];
			}
		}
	}
    return mc;
}

/**
 * 字典与其他选项用：组合
 * @param zdlb 字典类别
 * @param dm 字典代码
 */
function zdMcByDmMoreOther(zdlb,dm){
	if(dm){
		var mc = dm.split(":");
		dm = mc[0];
		if(dm){
			var zl = zdMap(zdlb);
		    if(isEmpty(zl[dm])){
		    	return "";
		    }
		    if(!isEmpty(zl[dm])){
		        mc = zl[dm] + ":" + mc[1];
		    }
		}
	    return mc;
	}
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
 * 弹出最大化窗口
 * @param param 包含参数的对象{"url":url,"name":name,"width":1000,"height":600}
 */
function popUpFillWin(param) {
	var name = param.name || '';
	var resizable = param.resizable || 'yes';
	var left = param.left || 0;
	var top = param.top || 0;
	var width = param.width || screen.availWidth;
	var height = param.height || screen.availHeight - 100;
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
    nd.setDate(nd.getDate() + new Number(days));
    return nd;
};

//添加指定的小时,并返回新的日期
Date.prototype.addHours = function (hours) {
    var nd = new Date(this);
    nd.setHours(nd.getHours() + parseInt(hours));
    return nd;
};
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

function time14Totime19(dateStr){
	if(dateStr==null){
		return "";
	}
	if(dateStr.length!=14){
		return dateStr;
	}
	return dateStr.time14Totime19();
}

/**
 * 将公安标准时间字符串转为10位普通显示时间格式
 * @returns 转换结果
 */
String.prototype.time14Totime10 = function () {
	var str = this;
    var result = str.substring(0, 4)+"-"
    +str.substring(4, 6)+"-"
    +str.substring(6, 8);
    return result;
};

/**
 * 将公安标准时间字符串转为12位普通显示时间格式
 * @returns 转换结果 add by nanzhou
 */
String.prototype.time12Totime14 = function () {
	var str = this;
    var result = str.substring(0, 4)+"-"
    +str.substring(4, 6)+"-"
    +str.substring(6, 8)+" "
    +str.substring(8, 10)+":"
    +str.substring(10, 12)+":00";
    return result;
};

/**
 * 将公安标准时间字符串转为10位普通显示时间格式
 * @returns 转换结果 add by nanzhou
 */
String.prototype.time8Totime10 = function () {
	var str = this;
    var result = str.substring(0, 4)+"-"
    +str.substring(4, 6)+"-"
    +str.substring(6, 8);
    return result;
};

function time8Totime10(dateStr){
	if(dateStr==null){
		return "";
	}
	if(dateStr.length!=8){
		return dateStr;
	}
	return dateStr.time8Totime10();
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

var DONT_ENUM =  "propertyIsEnumerable,isPrototypeOf,hasOwnProperty,toLocaleString,toString,valueOf,constructor".split(","),
    hasOwn = ({}).hasOwnProperty;
    for (var i in {
        toString: 1
    }){
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

//参数预处理
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

//更新用户电话
function updateUser(officePhone,userId){
	if(userId){
		$.ajax({
			url:serviceAddr+"common/user/update",
			type:"post",
			async:false,
			data:{
				officePhone:officePhone,
				userId:userId
			},
			success:function(data){
				
			}
		});
	}
}


//初始化查找用户电话
function selectUser(userId){
	var officePhone = "";
	if(userId){
		$.ajax({
			url:serviceAddr+"common/user/detail",
			type:"post",
			async:false,
			data:{
				userId:userId
			},
			success:function(data){
				if(data.flg){
					if(data.obj){
						officePhone = data.obj.officePhone;
					}
				}
			}
		});
	}
	return officePhone;
}