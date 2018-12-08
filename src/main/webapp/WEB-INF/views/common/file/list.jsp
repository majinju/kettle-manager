<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:LayoutVue title="文件管理">
	<jsp:body>
<div class="wrap">
    <div class="panel-heading">
        <h3 class="panel-title">
                                              查询条件
        </h3>
	</div>
<div id="listPage" v-cloak>
<my-from class="queryForm" :fromdata="fromData" pagemodel="search"
	:data="$data" @setval="setval" onsubmit="return false;">
  <div class="row btn-right">
      <button class="btn btn-primary btn-sm" onclick="listFrom.listPage.queryPage()">
          <i class="icon ion-ios-search-strong"></i> 查询
      </button>
  </div>
</my-from>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
                                              数据列表
        </h3>
        <div class="btn-table-left">
<!--             <button class="btn btn-primary btn-sm" href="common/file/edit.do?pageModel=edit" -->
<!-- 				a-oper="other" title="新增">新增</button> -->
            <button class="btn btn-primary btn-sm" a-oper="batch"
				href="common/file/batchDelete.do">批量删除</button>
			<!--  -->
            <button id="scwj" class="btn btn-primary btn-sm" >上传文件<i 
            	style="margin-left: 5px;" 
            	class="icon ion-ios-help-outline" 
            	id="scwjTitle"
            	@mouseover="scwjTitle(this)"></i></button>
        </div>
        <div class="btn-table-right">
        	<button class="btn btn-default btn-sm" type="button"
				onclick="ExportExcel.saveAsExcel(listFrom.listPage,'文件列表',',操作,序号');">导出当前页</button>
<!--         	<button class="btn btn-default btn-sm" type="button" -->
<!-- 				onclick="ExportExcel.exportAll(listFrom.listPage,'员工列表',',操作,序号');">导出全部</button> -->
    	</div>
	</div>
	<div class="panel-body exportDiv">
	    <table class="table table-striped table-bordered table-hover">
	        <thead>
	            <tr class="listHard">
	                <th style="width: 30px;">
	                    <span class="checkbox">
	                        <input type="checkbox" class="checkbox-input"
											name="selectAllIds">
	                        <span class="checkbox-inner"></span>
	                    </span>
	                </th>
	                <th style="width: 50px;">序号</th>
	                <th is="my-th" v-for="(field,key,index) in fields" :field="field"></th>  
                    <th style="width: 130px;">操作</th>
	            </tr>
	        </thead>
	        <tbody class="listContent">
		        <tr v-for="(row,ri) in rows">
					<th>
					    <span class="checkbox">
					        <input type="checkbox" class="checkbox-input" :value="row.id" name="chks">
					        <span class="checkbox-inner"></span>
					    </span>
					</th>
					<td>{{listPage.getHangHao(ri)}}</td>
	                <td is="my-td"  v-for="(field,key,index) in fields" :key="field.name+ri" 
	                	:field="field" :ri="ri" :index="index"
	                	:row="row" :edit="edit"
	                ></td>
					<td>
<!--                         <a :href="'common/file/edit.do?pageModel=edit&id='+row.id" a-oper="update" title="编辑">编辑</a> -->
                        <a @click="downloadFile(row.id)" title="下载">下载</a>
                        <span class="divider"></span>
						<a :href="'common/file/delete.do?isdel=1&id='+row.id" a-oper="del">删除</a>
						<span class="divider"></span>
                        <a :href="'common/file/edit.do?pageModel=details&id='+row.id" a-oper="other" title="详情">详情</a>
                    </td>
				</tr>
				<tr v-if="rows==0"><td :colspan="lbls">没有查询结果</td></tr>
	        </tbody>
	    </table>
	<!--分页渲染后放到这个元素中 -->
	<div class="row pagination width_100">
	</div>                    
	</div>
 </div>
    </div>
</div>
<script type="text/javascript">
var listFrom = new Vue({
    el : '#listPage',
    data : {
        action:"common/file/queryList.do",
        upurl:serviceAddr+"common/file/uploadFile.do",
        downurl:serviceAddr+"common/file/downloadFile.do",
        rows:[],
        listPage:new PageAjax(),
        updateRows:false,
        fromData:{},
        edit:false,
        fields : {
	            wjm : {
	                name : 'wjm',
	                label : '文件名',
                    dataRule : "length(~200)",
                    width : 200
	            },
	            sclb : {
	                name : 'sclb',
	                label : '上传类别',
                    zdlb : 'SYS_FILE_SCLB',
                    zdSelectPage : true,
                    width : 80
	            },
	            wjlx : {
	                name : 'wjlx',
	                label : '文件类型',
                    dataRule : "length(~20)",
                    width : 80
	            },
	            wjlb : {
	                name : 'wjlb',
	                label : '文件类别',
                    dataRule : "length(~20)",
                    width : 80
	            },
	            ywdm : {
	                name : 'ywdm',
	                label : '业务代码',
                    dataRule : "length(~20)",
                    width : 80
	            },
	            createdate : {
                    name : 'createdate',
                    label : '创建时间',
                    inputType:"timearea",
                    order : true,
                    width : 130,
                    value:['goDay:-30'],
	                  enCodeing:function(value){
	                      return value.replace(/-/g,'');
	                  },
	                  deCodeing:function(value,_this){
	                      var val = time14Totime19(value);
	                      if(_this.$root.edit){
		                      return "<span style='color:red;'>"+val+"<span>";
	                      }else{
		                      return val;
	                      }
	                  },
                    listShow:true,
                    searchShow:true
	            },
	            sclj : {
	                name : 'sclj',
	                label : '上传路径',
                    dataRule : "length(~500)",
                    searchShow:false
	            },
	            qcm : {
	                name : 'qcm',
	                label : '去重码',
                    listShow:false,
                    searchShow:false
	            },
                isdel : {
                    name : 'isdel',
                    label : '是否删除',
                    zdlb : 'SYS_COMMON_LJPD',
                    zdSelectPage : true,
                    width : 60,
                    value : '0',
                    listShow:false
                }
            }
        },
	      computed : {
	          lbls:function (){
	                 var num=0;
	              var sfs = this.fields;
	              Object.keys(sfs).forEach(function(key){
	                  if(!(sfs[key].listShow==false)){
	                      num++;
	                  }
	             });
	             return num+(this.edit?2:3);
	          }
	      },
        methods : {
            zdMcByDm : zdMcByDm,
            setval:function(field,event){
                this.fromData[field.name] = event.val;
                if(event.target.mc){
                    this.fromData['map.'+field.name]=event.mc;
                }
                console.log(field.label + "=" + this.fromData[field.name]); 
             },
             scwjTitle:function(_this){
                 layer.tips("只是上传","#scwjTitle");
             },
             downloadFile:function(id){
                 //下载人员核查模板
            	 $.download(this.downurl,{id:id});
             }
        },
        mounted: function () {
            this.listPage.setPageId(this.listPage.pageId);
            this.listPage.queryPage();
			//文件上传
            this.ajaxUpload = new Ajax_upload("#scwj", {
        			action : this.upurl,
        			data: {"ywdm":"common","wjlb":"wjmb"}, 
        			name : 'file',
        			autoSubmit : true,
        			responseType:'json',
        			onSubmit : function(file, ext) {
        				var type = ext[0];
        				if($(this._input).prop("files")[0].size>30*1024*1024){
        					layer.msg("文件大小超过30M", { 
        						time: 1500,    	   		
        						icon:6
        					});
        					return false;
        				}
        				if (!(type && /^(xlsx|xls|txt)$/.test(type.toLowerCase()))) {
        					layer.msg("文件格式不正确，仅支持xlsx,xls,txt格式", { 
        						time: 1500,    	   		
        						icon:6
        					});
        					return false;
        				}
        				this.disable();
        				listFrom.loadindex = layer.load(0,{
        		    		shade: [0.3]
        		    	});
        			},
        			onComplete : function(file, resp) {
        				this.enable();
        				if (!resp.status) {
        					layer.msg(resp.msg, { 
        						time: 1500,    	   		
        						icon:6
        					});
        					return false;
        				}else{
							layer.alert("上传成功", {
								time: 3000,
								icon:1
							});
    				        listFrom.listPage.queryPage();
			                layer.close(listFrom.loadindex);
        				}
        			}					
        		});
        }
    });
</script>
</jsp:body>
</gd:LayoutVue>