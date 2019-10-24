<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:LayoutVue title="${sjdx.dxmc }">
<jsp:body>
<!-- 转换列表扩展 -->
<my-list id="listPage1" :fromdata="fromdata" :sjdxid="sjdxid">
        <button class="btn btn-primary btn-sm" @click="plcl('drzh',null,{bxlbh:false,qrts:false})">
        	<i class="icon ion-upload"></i> 导入转换</button>
</my-list>
<script type="text/x-tp" id="my-sjdx-lbcz-tp">
<span>
<span class="divider"></span>
<a href="sjdx/plcl.do?id={{= sjdx.id}}&e_cllx=ml&e_ids={{= row[sjdx.zjzd]}}" a-oper="dxcl" qrts='false' title="目录"><i class="icon ion-ios-folder"></i></a>
<span class="divider"></span>
<a href="sjdx/getFile.do?id={{= sjdx.id}}&e_cllx=zht&e_ids={{= row[sjdx.zjzd]}}" a-oper="other" title="【{{= row.name}}】转换图"><i class="icon ion-network"></i></a>
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