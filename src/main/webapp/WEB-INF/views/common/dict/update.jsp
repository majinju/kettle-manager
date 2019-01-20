<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<gd:Layout title="this is page demo">
<jsp:body> 
<form action="common/dict/update.do" method="post"  id="dataform">
		<input type="hidden" name="id" value="${t.id }">
       <div class="wrap">
       	<div class="panel panel-info">
            <div class="panel-body">
                <div class="form-horizontal" role="form">
                	<div class="row gutter-1">
                        <div class="row form-group col-xs-4">
	                        <label class="col-xs-6 control-label required">代码：</label>
	                        <div class="col-xs-6">
	                            <input type="text" id="dm" class="form-control" data-rule="required" name="dm" value="${t.dm}" >
	                        </div>
                        </div>
                        <div class="row form-group col-xs-4">
	                        <label class="col-xs-6 control-label required">字典类别：</label>
	                        <div class="col-xs-6">
	                            <input type="text" zdlb="SYS_COMMON_ZDLB" ajax="true" data-rule="required" class="form-control zdSelectPage" name="zdlb" value="${t.zdlb}" >
	                        </div>
                        </div>
                        <div class="row form-group col-xs-4">
	                        <label class="col-xs-6 control-label required">是否缓存：</label>
	                        <div class="col-xs-6">
	                            <input type="text" zdlb="SYS_COMMON_LJPD" pagination="false" data-rule="required" select-only="true" class="form-control zdSelectPage" name="cache" value="${t.cache}">
	                        </div>	
                        </div>
                        <div class="row form-group col-xs-12">
	                        <label class="col-xs-2 control-label required">名称：</label>
	                        <div class="col-xs-10">
	                           <textarea class="form-control" data-rule="required" name="mc">${t.mc}</textarea>
	                        </div>
                        </div>
                    	<div class="row form-group col-xs-4">
							<label class="col-xs-6 control-label required">排序：</label>
	                        <div class="col-xs-6">
	                            <input type="text" id="px" class="form-control" data-rule="required" name="px" value="${t.px}" >
	                        </div>
                        </div>
                        <div class="row form-group col-xs-4">
	                        <label class="col-xs-6 control-label required">是否删除：</label>
	                        <div class="col-xs-6">
	                        	<input type="text" zdlb="SYS_COMMON_LJPD" pagination="false" data-rule="required" select-only="true" class="form-control zdSelectPage" name="isdel" value="${t.isdel}">
	                        </div>	
                        </div>
                    	<div class="row form-group col-xs-4">
	                        <label class="col-xs-6 control-label">数据来源：</label>
	                        <div class="col-xs-6">
	                            <input type="text" id="sjly" class="form-control" name="sjly" value="${t.sjly}" >
	                        </div>
                        </div>
                   		<div class="row form-group col-xs-12">
	                        <label class="col-xs-2 control-label">描述：</label>
	                        <div class="col-xs-10">
	                            <input type="text" id="ms" class="form-control" name="ms" value="${t.ms }" >
	                        </div>
                        </div> 
                   		<div class="row form-group col-xs-12">
	                        <label class="col-xs-2 control-label">类别SQL：</label>
	                        <div class="col-xs-10">
	                           <textarea class="form-control" name="lbsql">${t.lbsql}</textarea>
	                        </div>
                		</div>
                	</div>
            </div>
        </div>
    </div>
    <div class="row btn-center">
    	<button class="btn btn-primary btn-sm" a-oper=submit>确定</button>
    	<button class="btn btn-default btn-sm" a-oper="colse">关闭</button>
    </div>
</form>
</jsp:body>
</gd:Layout>