<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<gd:Layout title="字典管理">
<jsp:body>
    <div class="wrap">
        <ol class="breadcrumb">
            <li>
                <i class="icon ion-home"></i>
            </li>
            <li>
                <a href="javascrip:void(0);">后台管理</a>
            </li>
            <li class="active">统一字典</li>
        </ol>
        <div id="listPage">
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-horizontal queryForm" role="form" onsubmit="return false;" action="common/dict/queryList.do">
                    <div class="row gutter-1 form-group">
                    	<div class="col-xs-4 row">
                        <label class="col-xs-5 control-label">代码：</label>
                        <div class="col-xs-7">
                        	<input type="text" id="dm" class="form-control" name="dm">
                        </div>
                        </div>
                        <div class="col-xs-4 row">
                        <label class="col-xs-5 control-label">名称：</label>
                        <div class="col-xs-7">
                            <input type="text" id="mc" class="form-control" name="mc">
                        </div>
                        </div>
                        <div class="col-xs-4 row">
                        <label class="col-xs-5 control-label">字典类别：</label>
                        <div class="col-xs-7">
                        	<input type="text" zdlb="ZDLB" ajax="true" class="form-control zdSelectPage" name="zdlb" placeholder="请选择">
                        </div>
                        </div>
                    </div>
                    <div class="row gutter-1 form-group">
                    	<div class="col-xs-4 row">
                        <label class="col-xs-5 control-label">描述：</label>
                        <div class="col-xs-7">
                            <input type="text" id="ms" class="form-control" name="ms">
                        </div>
                        </div>
                        <div class="col-xs-4 row">
                        <label class="col-xs-5 control-label">是否删除：</label>
                        <div class="col-xs-7">
                        	<input type="text" zdlb="LJPD" pagination="false" data-rule="required" selectOnly="true" class="form-control zdSelectPage" name="isdel" value="0">
                        </div>
                        </div>
<!--                         <div class="col-xs-4 row"> -->
<!--                         <label class="col-xs-5 control-label">字典类别树：</label> -->
<!--                         <div class="col-xs-7"> -->
<!--                         	<input type="text" zdlb="ZDLB" ajax="true" class="form-control" id="upnode" name="upnode"  onclick="showMenu();"> -->
<!--                         </div> -->
<!--                         </div> -->
                    </div>
                   
                    <div class="row btn-right">
                        <button class="btn btn-primary btn-sm" onclick="listPage.queryPage()">
                            <i class="icon ion-ios-search-strong"></i> 查询
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">
                                                      系统字典表
                </h3>
           
                <div class="btn-table-left">
                    <button class="btn btn-primary btn-sm" href="common/dict/add.do" a-oper="other" title="新增统一字典详情">新增</button>
                    <button class="btn btn-primary btn-sm" a-oper="batch" href="common/dict/batchDelete.do">批量删除</button>
                    <button class="btn btn-primary btn-sm" onclick="clearDict('common/dict/clearDict.do');" >清除缓存</button>
                    <button class="btn btn-primary btn-sm" onclick="getZdx();" >获取字典项</button>
                </div>
                <div class="btn-table-right">
                	<button class="btn btn-default btn-sm" type="button" 
                    	onclick="ExportExcel.saveAsExcel(listPage,'字典列表',',操作,序号');">导出当前页</button>
					<button class="btn btn-default btn-sm" type="button" 
						onclick="ExportExcel.exportAll(listPage,'字典列表',',操作,序号');">导出全部</button>
                </div>
            </div>
            <div class="panel-body exportDiv">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr class="listHard">
                            <th style="width: 30px;">
                                <span class="checkbox">
                                    <input type="checkbox" class="checkbox-input" name="selectAllIds">
                                    <span class="checkbox-inner"></span>
                                </span>
                            </th>
                            <th style="width: 50px;">序号</th>
                            <th style="width: 150px;">代码</th>
                            <th class="filed-order" data-filed="mc">名称</th>
                            <th style="width: 50px;">排序</th>
                            <th>字典类别</th>                 
                            <th style="width: 80px;">描述</th>               
                            <th style="width: 80px;">上级节点</th>
                            <th class="filed-order" data-filed="createdate" style="width: 130px;">创建时间</th>   
                            <th style="width: 130px;">操作</th>
                        </tr>
                    </thead>
                    <tbody class="listContent">
                    </tbody>
                </table>
				<!--分页渲染后放到这个元素中 -->
				<div class="row pagination width_100">
				</div>                    
            </div>
        </div>
        <script type="text/html" id="listPageTemplate">
    					<tr>
                            <th>
                                <span class="checkbox">
                                    <input type="checkbox" class="checkbox-input" zdlb="{{= zdlb}}" dm="{{= dm}}" value="{{= id}}" name="chks">
                                    <span class="checkbox-inner"></span>
                                </span>
                            </th>
                            <td>{{= listPage.getHangHao(\$index)}}</td>
                            <td style="text-align: left;">{{= dm}}</td>
                            <td style="text-align: left;">{{= mc}}</td>
                            <td>{{= px}}</td>
                            <td>{{= zdMcByDm("ZDLB",zdlb)}}</td>
                            <td>{{= ms}}</td>
                            <td>{{= zdMcByDm(zdlb,upnode)}}</td>
                            <td>{{= time14Totime19(createdate)}}</td>
                            <td>
                                <a href="common/dict/update.do?id={{= id}}" a-oper="update" title="编辑">编辑</a>
                                <span class="divider"></span>
								<a href="common/dict/delete.do?isdel=1&id={{= id}}" a-oper="del">删除</a>
								<span class="divider"></span>
                                <a href="common/dict/details.do?id={{= id}}" a-oper="other" title="详情">详情</a>
                            </td>
                        </tr>
		</script>
        </div>
    </div>
    <div id="menuContent" class="menuContent" style="display:none; position: absolute;">
		<ul id="upnodeContent" class="ztree" style="margin-top:0; width:180px; height: 300px;"></ul>
	</div>
    <script type="text/javascript">
    
		//获取字典项
		function getZdx() {
			if($("input:checkbox[name='chks']:checked").size() == 0){
				layer.alert("请选择字典类别", { 
					time:3000,    	   		
					icon:6
				});
				return false;
			}
			if($("input:checkbox[name='chks']:checked").size() > 1){
				layer.alert("只能选择一个字典类别", { 
					time:3000,    	   		
					icon:6
				});
				return false;
			}
			var _this= $("input:checkbox[name='chks']:checked");
			var zdlb = _this.attr("zdlb");
			
			if(zdlb == "ZDLB"){
				var dm = _this.attr("dm");
				var url = "common/dict/zdList.do?map[%27zdlb%27]="+dm;
				var width = _this.attr("width");
		        var height = _this.attr("height");

		        var perContent = layer.open({
				      type: 2,
				      title: "字典项",
				      shadeClose: true,
				      shade: false,
				      maxmin: true, //开启最大化最小化按钮
				      area: [width?width:'800px', height?height:'500px'],
				      content: url
				});
		        layer.full(perContent);
		        return false;
			}else{
				layer.alert("请选择字典类别为字典类别的字典项", { 
					time:3000,    	   		
					icon:6
				});
				return false;
			}		
			
		}
		 
    	//清除字典缓存
		function clearDict(url) {
			layer.alert("亲，您确定要清除缓存么!", {
		   		icon: 3,
		   		btn:["确定","取消"],
		   		yes:function(index,layero){
		   			ajaxClear(url);	   			
		   		}
			});
		   	return false;
		}
		
		function ajaxClear(_url){	
		    $.ajax({
		        type: "POST",
		        url: _url,
		        dataType: "json",
		        success: function (data) {
		            if (data.flg) {
		            	listPage.requestList(); //执行页面刷新函数
		        	   	layer.msg(data.msg ? data.msg : "恭喜您，清除缓存成功！", { 
		        	   		shade:0.3,
		        	   		time: 1500,    	   		
		        	   		icon:6,		        	   				        	   		    	   				
		        		});
		            }else {
		            	layer.msg(data.msg ? data.msg : "对不起，清除缓存失败！", { 
		        	   		time: 1500, 
		        	   		icon:5       	   		
		        		});
		            }
		        },
		        error: function (XMLHttpRequest, textStatus, errorThrown) {
		        	layer.msg("出现未知错误！", { 
		    	   		time: 1500, 
		    	   		icon:5,
		    		});
		        }
		    });
			
		}
	</script>
</jsp:body>
</gd:Layout>