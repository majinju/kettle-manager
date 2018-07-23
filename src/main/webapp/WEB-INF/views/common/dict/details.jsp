<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<gd:Layout title="this is page demo">
<jsp:body> 
<form action="" method="post"  id="dataform">
       <div class="wrap">
       	<div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">详情</h3>
            </div>
            <div class="panel-body">
                <div class="form-horizontal" role="form">
                	<div class="row gutter-1 form-group">
                        <div class="col-xs-4 row">
                        <label class="col-xs-5 control-label">代码：</label>
                        <div class="col-xs-7">
                            <input type="text" id="dm" class="form-control" name="dm" value="${t.dm}" readonly="readonly">
                        </div>
                        </div>
                        <div class="col-xs-4 row">
                        <label class="col-xs-5 control-label">名称：</label>
                        <div class="col-xs-7">
                            <input type="text" id="mc" class="form-control" name="mc" value="${t.mc}" readonly="readonly">
                        </div>
                        </div> 
                        <div class="col-xs-4 row">
                        <label class="col-xs-5 control-label">排序：</label>
                        <div class="col-xs-7">
                            <input type="text" class="form-control" name="px" value="${t.px}" readonly="readonly">
                        </div>
                        </div>             
                    </div>
                    <div class="row gutter-1 form-group">
                        <div class="col-xs-4 row">
                        <label class="col-xs-5 control-label">字典类别：</label>
                        <div class="col-xs-7">
                            <input type="text" class="form-control zdTranslate" name="zdlb" zdlb="ZDLB" value="${t.zdlb}" readonly="readonly">
                        </div>
                        </div>
                        <div class="col-xs-4 row">
                        <label class="col-xs-5 control-label">是否删除：</label>
                        <div class="col-xs-7">
                        	<input type="text" id="isdel" class="form-control zdTranslate" zdlb="LJPD" name="isdel" value="${t.isdel}" readonly="readonly">
                        </div>
                        </div>
                    	<div class="col-xs-4 row">
                        <label class="col-xs-5 control-label">数据来源：</label>
                        <div class="col-xs-7">
                            <input type="text" class="form-control" name="sjly" value="${t.sjly}" readonly="readonly">
                        </div>
                        </div>  
                    </div>                   
                    <div class="row gutter-1 form-group">       
                        <div class="col-xs-4 row">
                        <label class="col-xs-5 control-label required">是否缓存：</label>
                        <div class="col-xs-7">
                            <input type="text" zdlb="LJPD" pagination="false" data-rule="required" readonly="readonly" selectOnly="true" class="form-control zdSelectPage" name="cache" value="${t.cache}">
                        </div>
                        </div>              
                    </div>
                    <div class="row gutter-1 form-group">
                    	<div class="col-xs-12 row">
                        <label class="col-xs-5 control-label">描述：</label>
                        <div class="col-xs-7">
                            <input type="text" class="form-control" name="ms" value="${t.ms }" readonly="readonly">
                        </div>
                        </div>              
                    </div>
                    <div class="row gutter-1 form-group">
                    	<div class="col-xs-12 row">
                        <label class="col-xs-5 control-label">类别SQL：</label>
                        <div class="col-xs-7">
                            <%-- <input type="text" id="lbsql" class="form-control" name="lbsql" value="${t.lbsql}" readonly="readonly"> --%>
                            <textarea rows="3" cols="30" class="form-control" disabled name="lbsql">${t.lbsql}</textarea>
                        </div>
                        </div>
                    </div>                   
                    
                </div>  
            </div>
        </div>
    </div>
</form>
</jsp:body>
</gd:Layout>