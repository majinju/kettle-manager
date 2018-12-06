<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<gd:Layout title="this is page demo">
<jsp:body> 
<form action="common/dict/update.do" method="post"  id="dataform">
		<input type="hidden" name="id" value="${t.id }">
       <div class="wrap">
       	<div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">修改</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal" role="form">
                	<div class="row gutter-1 form-group">
                        <div class="col-xs-4 row">
                        <label class="col-xs-5 control-label">代码：</label>
                        <div class="col-xs-7">
                            <input type="text" id="dm" class="form-control" name="dm" value="${t.dm}" >
                        </div>
                        </div>
                        <div class="col-xs-4 row">
                        <label class="col-xs-5 control-label">名称：</label>
                        <div class="col-xs-7">
                            <input type="text" id="mc" class="form-control" name="mc" value="${t.mc}" >
                        </div>
                        </div>   
                    	<div class="col-xs-4 row">
						<label class="col-xs-5 control-label">排序：</label>
                        <div class="col-xs-7">
                            <input type="text" id="px" class="form-control" name="px" value="${t.px}" >
                        </div>
                        </div>          
                    </div>
                    <div class="row gutter-1 form-group">
                        <div class="col-xs-4 row">
                        <label class="col-xs-5 control-label">字典类别：</label>
                        <div class="col-xs-7">
                            <input type="text" zdlb="ZDLB" ajax="true" class="form-control zdSelectPage" name="zdlb" value="${t.zdlb}" >
                        </div>
                        </div>
                        <div class="col-xs-4 row">
                        <label class="col-xs-5 control-label required">是否删除：</label>
                        <div class="col-xs-7">
                        	<input type="text" zdlb="LJPD" pagination="false" data-rule="required" selectOnly="true" class="form-control zdSelectPage" name="isdel" value="${t.isdel}">
                        </div>
                        </div>
                    	<div class="col-xs-4 row">
                        <label class="col-xs-5 control-label">数据来源：</label>
                        <div class="col-xs-7">
                            <input type="text" id="sjly" class="form-control" name="sjly" value="${t.sjly}" >
                        </div>
                        </div>
                    </div>
                    <div class="row gutter-1 form-group">
                        <div class="col-xs-4 row">
                        <label class="col-xs-5 control-label required">是否缓存：</label>
                        <div class="col-xs-7">
                            <input type="text" zdlb="LJPD" pagination="false" data-rule="required" selectOnly="true" class="form-control zdSelectPage" name="cache" value="${t.cache }">
                        </div>
                        </div>
                    </div>                                     
                    <div class="row gutter-1 form-group">
                    	<div class="col-xs-12 row">
                        <label class="col-xs-2 control-label">描述：</label>
                        <div class="col-xs-10">
                            <input type="text" id="ms" class="form-control" name="ms" value="${t.ms }" >
                        </div>
                        </div>              
                    </div>
                    <div class="row gutter-1 form-group">
                    	<div class="col-xs-12 row">
                        <label class="col-xs-2 control-label">类别SQL：</label>
                        <div class="col-xs-10">
                            <%-- <input type="text" id="lbsql" class="form-control" name="lbsql" value="${t.lbsql}" > --%>
                            <textarea rows="3" cols="30" class="form-control" name="lbsql">${t.lbsql}</textarea>
                        </div>
                    </div>
                </div>  
            </div>
        </div>
    </div>
    <div style="text-align: center;">
    	<button type="button" class="btn btn-primary btn-sm" a-oper=submit>确定</button>
    </div>
</form>
</jsp:body>
</gd:Layout>