<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:LayoutVue title="${sjdx.dxmc }">
<jsp:body>
<my-list id="listPage1" :fromdata="fromdata" :sjdxid="sjdxid">
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
<a href="sjdx/edit.do?pagemodel=details&dxdm=OTHER_KETTLE_ZYGL_YXRZ&e_zykdm={{= sjdx.dxdm}}&e_ids={{= row[sjdx.zjzd]}}" 
	a-oper="other" title="【{{= row.description}}】日志"><i class="icon ion-ios-paper-outline"></i></a>
<br/>
<a href="sjdx/edit.do?pagemodel=edit&dxdm=OTHER_KETTLE_ZYGL_DSSZ&e_zykdm={{= sjdx.dxdm}}&e_ids={{= row[sjdx.zjzd]}}" 
	a-oper="other" width="1000px" height="500px" title="【{{= row.description}}】定时设置"><i class="icon ion-calendar"></i></a>
<span class="divider"></span>
<a href="sjdx/list.do?dxdm=OTHER_KETTLE_CSSZ&&e_id_job={{= row.id_job}}"  a-oper="other" title="【{{= row.description}}】参数设置"><i class="icon ion-levels"></i></a>
<span class="divider"></span>
<a href="sjdx/getFile.do?id={{= sjdx.id}}&e_cllx=zyt&e_ids={{= row[sjdx.zjzd]}}" a-oper="other" title="【{{= row.description}}】作业图"><i class="icon ion-network"></i></a>
<span class="divider"></span>
<a href="sjdx/edit.do?pagemodel=add&dxdm=OTHER_KETTLE_ZYGL_FZZY&e_zykdm={{= sjdx.dxdm}}&e_ids={{= row[sjdx.zjzd]}}" 
	a-oper="other" title="【{{= row.description}}】复制"><i class="icon ion-ios-copy"></i></a>
<span class="divider"></span>
<a href="sjdx/plcl.do?id={{= sjdx.id}}&e_cllx=cz&e_ids={{= row[sjdx.zjzd]}}" a-oper="dxcl" title="重置"><i class="icon ion-android-refresh"></i></a>
</span>
</script>
<script>
function sjdxZdy(vp){
    vp.el="#listPage1";
    vp.methods.plcl=function(cllx,_this,options){
          this.$children[0].plcl(cllx,_this,options);
    }
}
function sjdxlbcz(value,_this) {
    var cz = defaultLbcz(value,_this);
    if("非列表模式"==cz){
        return cz;
    }
    var qtcz = $("#my-sjdx-lbcz-tp").tmpl({sjdx:_this.$root.sjdx,
	    row:_this.$root.listPage.rows[_this.$parent.$parent.ri]}).html();
    return cz+qtcz;
}
</script>
<script type="text/javascript">
var fromdata = ${myparams};
var sjdxid = "${sjdx.id}";
fromdata.userInfo = "${param.userInfo}";
var vueParams = {
   el : '#listPage',
   data: {
           fromdata:fromdata,
           sjdxid:sjdxid,
           frommap:{}
       },
       methods:{
       }
}
if(typeof(sjdxZdy)=='function'){
    sjdxZdy(vueParams);
}
var listFrom = new Vue(vueParams);
</script>
</jsp:body>
</gd:LayoutVue>