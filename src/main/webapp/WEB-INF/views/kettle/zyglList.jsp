<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:sjdxList>
<jsp:body>
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
        <button class="btn btn-primary btn-sm"  @click="plcl('qd',null,{qrts:false})"><i class="icon ion-play"></i> 启动</button>
        <button class="btn btn-primary btn-sm" @click="plcl('tz')"><i class="icon ion-pause"></i> 停止</button>
        <button class="btn btn-primary btn-sm" @click="plcl('js')"><i class="icon ion-stop"></i> 结束</button>
        <button class="btn btn-primary btn-sm" @click="plcl('cxsc')" title="针对对象流转类型的作业，根据模板重新生成作业。">
        	<i class="icon ion-ios-refresh-outline"></i> 重新生成
        </button>
        <button class="btn btn-primary btn-sm" @click="plcl('drzy',null,{bxlbh:false,qrts:false})"><i class="icon ion-upload"></i> 导入作业</button>
</my-list>
<script type="text/x-tp" id="my-sjdx-lbcz-tp">
<span>
<span class="divider"></span>
<a href="sjdx/plcl.do?id={{= sjdx.id}}&e_cllx=ml&e_ids={{= row[sjdx.zjzd]}}" a-oper="dxcl" qrts='false' title="目录"><i class="icon ion-ios-folder"></i></a>
<span class="divider"></span>
<a href="sjdx/edit.do?pagemodel=details&dxdm=KETTLE_GLPT_ZYGL_YXRZ&e_zykdm={{= sjdx.dxdm}}&e_ids={{= row[sjdx.zjzd]}}" 
	a-oper="other" title="【{{= row.description||row.name}}】日志"><i class="icon ion-ios-paper-outline"></i></a>
<br/>
<a href="sjdx/edit.do?pagemodel=edit&dxdm=KETTLE_GLPT_ZYGL_DSSZ&e_zykdm={{= sjdx.dxdm}}&e_ids={{= row[sjdx.zjzd]}}" 
	a-oper="other" width="1000px" height="500px" title="【{{= row.description||row.name}}】定时设置"><i class="icon ion-calendar"></i></a>
<span class="divider"></span>
<a href="sjdx/list.do?dxdm=KETTLE_GLPT_CSSZ&&e_id_job={{= row.id_job}}"  a-oper="other" title="【{{= row.description||row.name}}】参数设置"><i class="icon ion-levels"></i></a>
<span class="divider"></span>
<a href="sjdx/getFile.do?id={{= sjdx.id}}&e_cllx=zyt&e_ids={{= row[sjdx.zjzd]}}" a-oper="other" title="【{{= row.description||row.name}}】作业图"><i class="icon ion-network"></i></a>
<span class="divider"></span>
<a href="sjdx/edit.do?pagemodel=add&dxdm=KETTLE_GLPT_ZYGL_FZZY&e_zykdm={{= sjdx.dxdm}}&e_ids={{= row[sjdx.zjzd]}}" 
	a-oper="other" title="【{{= row.description||row.name}}】复制"><i class="icon ion-ios-copy"></i></a>
<span class="divider"></span>
<a href="sjdx/plcl.do?id={{= sjdx.id}}&e_cllx=cz&e_ids={{= row[sjdx.zjzd]}}" a-oper="dxcl" title="重置"><i class="icon ion-android-refresh"></i></a>
</span>
</script>
<script>
</script>
</jsp:body>
</gd:sjdxList>