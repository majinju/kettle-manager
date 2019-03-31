/**
 * 本平台ajax分页对象的封装，按套路来就不需要参数配置。
 * 使用参考频繁进出车辆分析
 */
function PageAjax(){
	//参数传到后台的方式：object/jsonStr
    this.paramType="object";
	//分页对象的id
    this.pageId = "#listPage";
	//参数
    this.params={};
	//页大小
    this.pageSize = 10;
	//最大页大小，用于现在导出全部
    this.maxPageSize = 50000;
	//页大小列表
    this.pageSizeList=[5,10,20,50,100,200,500,1000,2000,5000];
	//当前页
    this.pageIndex = 1;
	//是否自动统计总数，只有查询按钮才会统计总量，分页跳转条件不变，数据量不会变
    this.autoCount = true;
	//总量
    this.total = 0;
	//总页数
    this.pageCount = 0;
	//数据列表
    this.rows = null;
	//列表页数据模板id，默认：listPageTemplate
    this.listPageTemplate = null;
    this.listHead = null;
    //显示页大小
    this.showPageSize = true;
    //是否初始查询
    this.initQuery=true;
    //统计数据量延迟加载。
    this.totalDelay = '1';
    //执行默认分页模板处理方式
    this.defaultPageTmpl = true;
    
    //自定义参数校验
    this.checkParam=function(_params){
        return true;
    };
    
    //定义表单查询回调函数
    this.callback=function(data){
    };
    this.queryPage=function(){
        var self = this;
        //常规验证
    	if(!self.getQueryForm().isValid()){
    		return;
    	}
        var _params = self.getQueryForm().formToJson();
        _params = preParam(_params);
        //特殊验证
        if(!_params||!self.checkParam(_params)){
            return false;
        }
        self.params = _params;
        self.pageIndex = 1;
        self.autoCount = true;
        self.requestList();
    };
    /**
     * 刷新页面数据
     */
    this.refreshPage=function(){
        var self = this;
        self.requestList();
    };
    this.pagination=function(){
        var self = this;
        if(self.total==0){
            var col = self.getListHead().find("th").size();
            //移除分页信息
            $(self.pageId +" .pagination").html("");
        }else if(self.total<=self.pageSize){
            //移除分页信息
            $(self.pageId +" .pagination").html("");
        }else{
            //分页渲染后放到这个元素中
            var listPage = $(self.pageId +" .pagination");
            //分页元素渲染
            listPage.html($("#page-tp").tmpl(self));
            //页大小变化
            $(self.pageId+" .pageSizeLi").on("click",function(){
            	//获取选择的页大小
                var pageSize = $(this).attr("data-size");
                self.pageSize = pageSize;
                //重新计算页数
                self.setTotal(self.total);
                //如果当前页大于页数则设置当前页为最大页
                if(self.pageIndex>self.pageCount){
                    self.pageIndex=self.pageCount;
                }
                //没有修改查询条件，不需要统计数据总量
                self.autoCount = false;
                self.requestList();
            });
            //转到指定页
            $(self.pageId+" .paging-sure").on("click",function(){
                var zhuanPage = $(self.pageId+" .zhuanPage").val();
                if(!isNumber(zhuanPage)||zhuanPage>self.pageCount||zhuanPage<1){
                    alertInfo("请输入正确的页码");
                    return;
                }
                self.pageIndex = new Number(zhuanPage);
                //没有修改查询条件，不需要统计数据总量
                self.autoCount = false;
                self.requestList();
            });
            //第一页
            $(self.pageId+" a.paging-prev").on("click",function(){
                if(self.pageIndex==1){
                    alertInfo("已经是第一页了");
                }else{
                    self.pageIndex = 1;
                    self.autoCount = false;
                    self.requestList();
                }
            });
            //上一页
            $(self.pageId+" a.paging-before").on("click",function(){
                if(self.pageIndex==1){
                    alertInfo("已经是第一页了");
                }else{
                    self.pageIndex = self.pageIndex - 1;
                    self.autoCount = false;
                    self.requestList();
                }
            });
            //下一页
            $(self.pageId+" a.paging-after").on("click",function(){
                if(self.pageIndex==self.pageCount){
                    alertInfo("已经是最后一页了");
                }else{
                    self.pageIndex = self.pageIndex + 1;
                    self.autoCount = false;
                    self.requestList();
                }
            });
            //最后一页
            $(self.pageId+" a.paging-next").on("click",function(){
                if(self.pageIndex==self.pageCount){
                    alertInfo("已经是最后一页了");
                }else{
                    self.pageIndex = self.pageCount;
                    self.autoCount = false;
                    self.requestList();
                }
            });
        }
    };
    /**
     * 请求列表
     * @param params 查询参数
     * @param callback 数据处理回调函数
     */
    this.requestList=function(){      
    	var loadindex = layer.load(0,{
    		shade: [0.3]
    	});
        var self = this;
        var url = self.getUrl();
        //当只有一个参数，且参数名称是params时，不进行二次json包装
        if(Object.keys(self.params).length==1&&self.params.params){
            self.paramType="object";
        }
        
        //处理排序字段
        if(self.getListHead().find(".order-current").size()==1){
        	var filedTh = self.getListHead().find(".order-current");
        	//map传参
            self.params["map['orderField']"] = filedTh.attr("data-filed");
            self.params["map['orderWay']"] = filedTh.attr("data-order");

            self.params["orderField"] = filedTh.attr("data-filed");
            self.params["orderWay"] = filedTh.attr("data-order");
        }

        self.params.queryList = true;
        var params = clone(self.params);
        params.autoCount = self.autoCount;
        //如果需要统计总量且要求延迟统计
        if(self.autoCount&&(self.totalDelay!='1')){
            params.autoCount = false;
        }
        if(self.paramType=="jsonStr"){
            params = {"myparams":JSON.stringify(params),"pageIndex":self.pageIndex,
                    "pageSize":self.pageSize,"autoCount":params.autoCount,"queryList":params.queryList};
        }else{
            //设置传到后台的参数
            params.pageIndex = self.pageIndex;
            params.pageSize = self.pageSize;
        }
        self.listFrom.rows=[];
    	$.ajax({
    		url:url,
    		type:"post",
    		data:params,
            dataType: "json",
    		success:function(result){
                if(self.defaultPageTmpl){
                    if(!result.status){
                        alertInfo(result.msg);
                        layer.close(loadindex);
                        return;
                    }
                    result = result.data;
                    eval("result.list = "+JSON.stringify(result.list).replace(/ /g,"")+"");
                    self.callback(result);
                    if(!result.list){
                        result.list = [];
                    }
                    self.rows = result.list;
                    self.listFrom.rows=self.rows;

                    //如果需要统计总量且要求延迟统计
                    if(self.autoCount&&(self.totalDelay!='1')){
                    }else{
                        self.setTotal(result.recordCount);
                        self.pagination();
                        $(self.pageId+" .pageSize").val(self.pageSize);
                    }
                }else{
                    self.callback(result);
                }
                layer.close(loadindex);
    		},
    		error:function(errInfo){
    		    alertError("分页查询失败");        
                layer.close(loadindex);
    		}
    	});

        //如果需要统计总量且要求延迟统计
        if(self.autoCount&&(self.totalDelay=='2')){
            $(self.pageId +" .pagination").html('<div class="col-xs-12"><div class="pagination-group">数据量正在统计中...</div></div>');
            var params = self.params;
            params.autoCount = true;
            params.queryList = false;
            if(self.paramType=="jsonStr"){
                params = {"myparams":JSON.stringify(params),"pageIndex":self.pageIndex,
                        "pageSize":self.pageSize,"autoCount":true,"queryList":false};
            }else{
                //设置传到后台的参数
                params.pageIndex = self.pageIndex;
                params.pageSize = self.pageSize;
                params.autoCount = self.autoCount;
            }
            $.ajax({
                url:url,
                type:"post",
                data:params,
                dataType: "json",
                success:function(result){
                    if(!result.status){
                        alertInfo(result.msg);
                        return;
                    }
                    result = result.data;
                    self.setTotal(result.recordCount);
                    self.pagination();
                    $(self.pageId+" .pageSize").val(self.pageSize);
                },
                error:function(errInfo){
                    alertError("统计总量失败");        
                }
            });
        }else if(self.autoCount&&(self.totalDelay=='3')){
            $(self.pageId +" div.row.pagination").html('<div class="col-xs-12"><div class="pagination-group">点击统计</div></div>');
        }
    };
    
    /**
     * 导出全部
     * @param title 文件名
     * @param callback 隐藏列
     */
    this.exportAll=function(title,hiddenCol){
    	var loadindex = layer.load(0,{
    		shade: [0.3]
    	});
        var self = this;
        var params = self.params;
        if(self.paramType=="jsonStr"){
            params = {"myparams":JSON.stringify(params),"pageIndex":self.pageIndex,
                    "pageSize":self.maxPageSize,"autoCount":false};
        }else{
            //就按当前页号导出
            params.pageIndex = self.pageIndex;
            //设置页大小
            params.pageSize = self.maxPageSize;
            //不统计总量
            params.autoCount = false;
        }
        params["map['title']"]=title;
        params["map['hiddenCol']"]=hiddenCol;
        var inputs = '';
        jQuery.each(Object.keys(params), function() {
            var val = params[this];
            if((typeof val == 'string')&&val.indexOf("\"")>-1){
                val = val.replace(/"/g,"%34");
            }
            inputs += '<input type="hidden" name="'+ this + '" value="' + val + '" />';
            
        });
        jQuery('<form action="' + self.exportUrl + '" method="post">' + inputs + '</form>')
        .appendTo('body').submit().remove();
        layer.close(loadindex);
    };
    /**
     * 字段排序
     */
    this.fieldOrder = function(_this) {
        var self = this;
        var fi = $(_this).find("i");
        var ficlass = fi.attr("class");
        $("th i.desc").removeClass("desc");
        $("th i.asc").removeClass("asc");
        $(".order-current").removeClass("order-current");
        $(_this).addClass("order-current");
        if (!ficlass) {
            fi.addClass("desc");
            fi.attr("title", "当前是降序");
            $(_this).attr("data-order", "desc");
        } else if (ficlass == 'desc') {
            fi.removeClass("desc");
            fi.addClass("asc");
            fi.attr("title", "当前是升序");
            $(_this).attr("data-order", "asc");
        } else if (ficlass == 'asc') {
            fi.removeClass("asc");
            fi.attr("title", "点击可以设置排序方式");
            $(_this).attr("data-order", "");
            $(".order-current").removeClass("order-current");
        }
        self.queryPage();
    };
    this.setTotal=function(t){
        if(t>=0){
            var self = this;
            self.total = t;
            self.pageCount = parseInt(self.total/self.pageSize)+(self.total%self.pageSize>0?1:0);
        }
    };
    /**
     * 设置当前分页的id
     */
    this.setPageId=function(pageid){
        var self = this;
        self.pageId = pageid;
        //设置值改变校验
        self.getQueryForm().validator({
        	//实时验证关闭，只在提交表单的时候执行验证
        	timely:0,
        	//在第一次错误时停止验证，即一个一个验证
        	stopOnError:true,
        	msgClass: 'displayNone',
        	//生成验证提示
        	msgMaker: function(opt){
        		layer.tips(opt.msg, opt.element, {tips:[2, '#c00'],shift:6});
        		return "";
            }
        });
    };
    this.getUrl=function(){
        var self = this;
        var url = self.getQueryForm().attr("action");
        return url;
    };
    this.getListTemplate=function(){
        var self = this;
        //页id加Template后缀作为默认数据模板id
        var lt = $(self.pageId+"Template");
        if(self.listPageTemplate){
        	lt = $("#"+self.listPageTemplate);
        }
        return lt;
    };
    this.getListHead=function(){
        var self = this;
        //用页id限定范围
        var lh = $(self.pageId+" .listHard");
        return lh;
    };
    this.getQueryForm=function(){
        var self = this;
        var queryForm = $(self.pageId+" .queryForm");
        return queryForm;
    };
    /**
     * 结合页数和序号得到数据的行号
     * @param index 显示数据的序号
     * @returns 数据的行号
     */
    this.getHangHao=function(index){
        var self = this;
        return (self.pageIndex-1)*self.pageSize+index+1;
    };
}
/**
 * 导出封装
 */
var ExportExcel = {
//导出本页
saveAsExcel:function(page, title, hiddenCol)
{
	var action = $("#form1_1").attr("action");
	if(!(action.indexOf("http://")>-1||action.indexOf("/")==0)){
		$("#form1_1").attr("action",serviceAddr+action);
	}
	var tableContent = $(page.pageId+" .exportDiv").html();
	if(tableContent.indexOf("</td>",tableContent.indexOf("</td>")+1)==-1){
	    alertError("没有数据可以导出！");
		return;
	}
	document.getElementById('filename_1').value = title;
	document.getElementById('content_1').value = tableContent;
	if(hiddenCol == null || hiddenCol == undefined || hiddenCol == "undefined") {
		document.getElementById('hiddenCol_1').value = "";
	} else {
		document.getElementById('hiddenCol_1').value = hiddenCol;
	}
	document.getElementById('form1_1').submit();
},

//导出全部
exportAll:function(page, title, hiddenCol)
{
	if(page.total == 0){
		alertError("没有数据可以导出！");
		return;
	}
	if(page.total >page.maxPageSize){
		alertInfo("系统只能导出前"+page.maxPageSize+"条信息！");
	}
	page.exportAll(title,hiddenCol);
}
};