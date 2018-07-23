 ////////////////////////////////////////////////\\
//             常用操作基于layer开源控件的封装                                     \\
//             Autother:Wangmengzhong             \\
 //            QQ:821501431                      \\
  ////////////////////////////////////////////////
  
/*****************************************************\
                       函数目录
          1.function:ListTable     --列表相关操作
          2.function:OtherClick    --其它点击事件弹窗
          3.function:FormFrame     --弹出层表单相关操作

\*****************************************************/


///////////////////////删除执行函数////////////////////
function ajaxDel(_url){	
    $.ajax({
        type: "POST",
        url: _url,
        dataType: "json",
        success: function (data) {
            if (data.flg) {              
        	   	layer.alert(data.msg ? data.msg : "删除成功！", { 
        	   		shade:0.3,
        	   		time: 1500,    	   		
        	   		icon:1,
        	   		end:function(){
        	   			listPage.requestList(); //执行页面刷新函数    	   			
					}
        		});
            }else {
            	layer.alert(data.msg ? data.msg : "删除失败！", { 
        	   		time: 1500, 
        	   		icon:2      	   		
        		});
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
        	layer.alert("出现未知错误！", { 
    	   		time: 1500, 
    	   		icon:2
    		});
        }
    });
	
}

///////////////////////////////自动提交表单函数////////////////
///////////////////////适用场景：自动定时暂存表单调用该函数///////////
function autoSubmit(formId,opened,_url){
			
	//表示是否指定表单。如果没有指定则默认指定表单
	if(formId==""||formId==undefined){
		formId = "dataform";
	}
	var url = $("#"+formId).attr("action");
	var param = $("#"+formId).serialize();
	$.post(url,param,function(data){
		
		//表示暂存成功后，需要跳转。例如点击打印暂存后跳转。
		if(opened!=""&&opened!=undefined){
			
			if(data.flg){
				if(opened=="newpage"){
					window.open(_url);//跳转页面
				}else if(opened=="zancun"){
					layer.alert("暂存成功！",{					
						shade:0.3,
		    	   		time: 1500,    	   		
		    	   		icon:1
					});
				}
			}else{
				
				//给出失败提示
				layer.alert(data.msg ? data.msg : "操作失败！",{					
					shade:0.3,
	    	   		time: 1500,    	   		
	    	   		icon:1
				});
			}
		}
		
	});
	
}


 //////////////////////表单提交操作相关////////////////////////
function formSubmit(formId,opened,_url){
	
	var url = $("#"+formId).attr("action");
	var _params = $("#"+formId).serialize();
    //var _params = $("#"+formId).formToJson();
    //_params = preParam(_params);
		 
	$.post(url,_params,function(data){
		if(data.flg){
			layer.alert(data.msg ? data.msg : "操作成功！", { 
    	   		shade:0.3,
    	   		time: 1500,    	   		
    	   		icon:1,
    	   		end:function(){
    	   			
    	   			//判断是否设置打开弹层
    	   			if(opened==""||opened==undefined){
    	   				
    	   			    //关闭弹层
        	   			var index = parent.layer.getFrameIndex(window.name);
        	   			parent.layer.close(index);
    	   				
    	   				//判断是否跳转到其它页面
    	   				if(_url==""||_url==undefined){    	   					 	   				    
            	   			parent.listPage.queryPage(); //执行页面刷新函数    	          	   			
    	   				}else if(_url=="zglist"){
    	   					parent.zglist();//局部刷新父页面
    	   				}else{   	   					
    	   					//跳转到其它页面
    	   					window.parent.location.href = _url;  	   					
    	   				}
    	   			         	   			
    	   			}else{
    	   				if(opened=="redirect"){
    	   					//跳转到其它页面
    	   					window.location.href = _url;
    	   				}else if(opened=="reload"){
    	   					location.reload();
    	   				}else if(opened=="newpage"){
    	   					window.open(_url);
    	   				}else{
    	   					listPage.queryPage();
    	   				}
    	   			   	   				
    	   			}
    	   			  			
				}
    		});
		}else{
        	layer.alert(data.msg ? data.msg : "操作失败！", { 
    	   		time: 1500, 
    	   		icon:2       	   		
    		});
        	subnum=subnum-1;
		}
		
	});
}


/////////////////////////////////////////////
// @param selectedIds 以逗号','连接的id字符串
// @param linkClicked 触发单击事件的目标对象
 ///////////////////////////////////////////////
function ajaxBatchUpdate(selectedIds, linkClicked) {    
	//1 批量更新
    $.ajax({
        type: "POST",
        url: linkClicked.attr("href"),
        data: { ids: selectedIds,'map["ids"]': selectedIds},
        dataType: "json",
        success: function (data) {
            if (data.flg) {
            	
        	   	layer.alert(data.msg ? data.msg : "操作成功！", { 
        	   		shade:0.3,
        	   		time: 1500,    	   		
        	   		icon:1,
        	   		end:function(){
        	   			listPage.queryPage(); //执行页面刷新函数 
        	   			linkClicked.attr("style","");
					}
        		});
            } else {
            	linkClicked.attr("style","");
               	layer.alert(data.msg ? data.msg : "操作失败！", { 
        	   		time: 1500, 
        	   		icon:2       	   		
        		});
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
        	linkClicked.attr("style","");
           	layer.alert("网络异常！", { 
    	   		time: 1500, 
    	   		icon:2       	   		
    		});
        }
    });
}

//提交次数
var subnum = 0;

$(document).ready(function(){
	
	    /***********************ListTable*******************
	    *                         列表相关操作                   *
	   *               1.表格删除相关类事件：a-oper="del"            *
	  *                2.表格修改相关类事件：a-oper="update"
	 *                 3.表格其他事件:    a-oper="other"
	 *                 4.按钮批量操作事件： a-oper="batch"
	 *                
	 * 注：使用时在列表页面模板渲染的表格操作行上添加对应标签。
	 *    全局标签统一命名a-oper。对应事件
	 *    删除:del
	 *    更新：update
	 *    其它：other
	 ************************************************************/	
	
	//1.删除事件：a-oper="del"
	$(".listContent").on("click","[a-oper=del]",function(){		
		var url = $(this).attr("href");
	   	layer.alert("确定删除？", {
	   		icon: 3,
	   		btn:["确定","取消"],
	   		yes:function(index,layero){
	   			ajaxDel(url);	   			
	   		}
		});
	   	return false;
	});
	
	//2.修改事件：a-oper="update"
	$(".listContent").on("click","[a-oper=update]",function(){		
		var url = $(this).attr("href");
		var width = $(this).attr("width");
        var height = $(this).attr("height");
        var title = $(this).attr("title");

        var perContent  = layer.open({
				      type: 2,
				      title: title ? title : "修改",
				      shadeClose: true,
				      shade: false,
				      maxmin: true, //开启最大化最小化按钮
				      area: [width?width:'800px', height?height:'500px'],
				      content: url
			    });
        if(!(height||width)){
            layer.full(perContent);
        }
	   	return false;
	});
	
	//3.其他事件:a-oper="other"
	$(".listContent").on("click","[a-oper=other]",function(){		
		var url = $(this).attr("href");
		var width = $(this).attr("width");
        var height = $(this).attr("height");
        var title = $(this).attr("title");

		var perContent = layer.open({
				      type: 2,
				      title: title ? title : "  ",
				      shadeClose: true,
				      shade: false,
				      maxmin: true, //开启最大化最小化按钮
				      area: [width?width:'800px', height?height:'500px'],
				      content: url
			    });
        if(!(height||width)){
            layer.full(perContent);
        }
	   	return false;
	});
	
	//4.批量操作：a-oper="batch"
	 $("[a-oper=batch]").click(function(){
	        var idArray = [], $this = $(this);
	        $("[name='chks']:checked").each(function () {
	            idArray.push($(this).val());
	        });

	        if (idArray.length === 0) {
				layer.alert("请选择相关信息！", { 
	    	   		shade:0.3,
	    	   		time: 1500,    	   		
	    	   		icon:0
	    		});
	        }else {
	    	   	layer.alert("你确定要提交吗？", {
	    	   		icon: 3,
	    	   		btn:["确定","取消"],
	    	   		yes:function(index,layero){
	    	   		    //使URL不能再次提交
		            	$this.attr("style","display: none");
		            	ajaxBatchUpdate(idArray.join(','), $this);
	    	   		}
	    		});	            
	        }
	        return false;		 
	 });
	 
	
	
	
	 /******************************OtherClick********************
	 *                页面其它相关弹层
	 *       
	 *       注：在指定的表单元素上面添加标签 a-oper="other"
	 *******************************************************************/
	
	$("[a-oper=other]").click(function(){		
		var url = $(this).attr("href");
		var width = $(this).attr("width");
        var height = $(this).attr("height");
        var title = $(this).attr("title");

		var perContent = layer.open({
				      type: 2,
				      title: title ? title : "  ",
				      shadeClose: true,
				      shade: false,
				      maxmin: true, //开启最大化最小化按钮
				      area: [width?width:'800px', height?height:'500px'],				      
				      content: url
			    });
        if(!(height||width)){
            layer.full(perContent);
        }
	   	return false;
	});
	
	
	/********************************FormFrame**************
	 *                              弹出层相关表单操作
	 *                      1.表单提交:a-oper=submit
	 *                      2.表单关闭:a-oper=colse
	 *                      
	 *         注：对应的表单要定义id="dataform"
	 * *********************************************************/
	//为所有表单加上验证
	$("form").validator({
    	//实时验证关闭，只在提交表单的时候执行验证
    	timely:0,
    	//在第一次错误时停止验证，即一个一个验证
    	stopOnError:true,
    	msgClass: 'displayNone',
    	//生成验证提示
    	msgMaker: function(opt){
    		layer.tips(opt.msg, opt.element, {tips:[2, '#c00'],shift:6});
    		return "";
        },
        rules: {
            isDisplay: function() {
            	if($('div.showOrHidden').css('display')=='block'){
            		return true;
            	}else{
            		return false;
            	}
            },
            isZancun: function(){
            	if($("input[name='btn']").val()=='zancun'){
            		return false;
            	}else{
            		return true;
            	}
            }
        },
    });
	 
	//手动保存
	 $("[a-oper=submit]").click(function(){
		 
			var formId = $(this).attr("formId");
			var opened = $(this).attr("opened");
			var url = $(this).attr("url");
			
			if(typeof formDef==="function"){
				var flg = formDef();
				if(!flg){
					return false;
				}
			}

			//验证是否有多个表单
			if(formId==""||formId==undefined){
				formId = "dataform";
			}
			
	        //常规验证
	    	if(!$("#"+formId).isValid()){
	    		return;
	    	}else{
	   		 
	    		layer.confirm("确定提交？",{
				 icon:3,
				 btn:['确定','取消'], 
				 yes:function(index,layero){
					 if(subnum==0){
						 formSubmit(formId,opened,url); 
					 }
					 subnum=subnum + 1;
				 },btn2:function(){//取消按钮事件
					 if(typeof qxbtn ==="function"){
						 qxbtn();
						}
				 }
			   });
	    		
	    	}
		 
		 return false;		 
	 });
	 
	 /////////自动保存表单
	 $("[a-oper=autosubmit]").click(function(){		 
			var formId = $(this).attr("formId");
			var opened = $(this).attr("opened");
			var url = $(this).attr("url");
		 
			if(typeof formDef==="function"){
				var flg = formDef();
				if(!flg){
					return false;
				}
			}

			//表示是否指定表单。如果没有指定则默认指定表单
			if(formId==""||formId==undefined){
				formId = "dataform";
			}
			
			 //常规验证
	    	if(!$("#"+formId).isValid()){
	    		return;
	    	}else{	   	
				autoSubmit(formId,opened,url);		
	    	}
		 
	 });
	 
	 //关闭弹层或返回
	 $("[a-oper=colse]").click(function(){
		 
		 layer.confirm("你确定要关闭吗？",{
			 icon:3,
			 btn:['确定','取消'],
			 yes:function(){
				 var index = parent.layer.getFrameIndex(window.name);
				 parent.layer.close(index);
			 }
		 });
		 
		 return false;
	 });
	 
	//关闭弹层后刷新父页面
	 $("[a-oper=parref]").click(function(){
		 
		 layer.confirm("你确定要关闭吗？",{
			 icon:3,
			 btn:['确定','取消'],
			 yes:function(){
				 var index = parent.layer.getFrameIndex(window.name);
				 parent.layer.close(index);
				 parent.listPage.queryPage(); //执行页面刷新函数 
			 }
		 });
		 
		 return false;
	 });
	
	//关闭弹层  不询问
	 $("[a-oper=allColse]").click(function(){
		 var index = parent.layer.getFrameIndex(window.name);
		 parent.layer.close(index);
	 });
});