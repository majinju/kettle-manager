<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:LayoutVue title="${sjdx.dxmc }">
<jsp:body>
<!-- 个人笔记列表扩展 -->
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
	<span :id="'lbplcz-'+sjdxid"></span>
</my-list>
<script type="text/x-tp" id="my-sjdx-lbplcz-tp">
</script>
<script type="text/x-tp" id="my-sjdx-lbcz-tp">
<span>
<span class="divider"></span>
<a href="sjdx/getdata.do?id={{= sjdx.id}}&e_cllx=nextVal&e_bhlb={{= row['bhlb']}}" a-oper="dxcl" qrts='false' title="下一个编号"><i class="icon ion-forward"></i></a>
</span>
</script>
<script>
function sjdxZdy(vp){
    vp.el="#listPage";
    vp.methods.plcl=function(cllx){
          this.$children[0].plcl(cllx);
    }
    vp.mounted=function(){
        lbplcz(this);
    }
}
function plcl(cllx){
    listFrom.plcl(cllx);
}
function lbplcz(_this){
    var qtcz = $("#my-sjdx-lbplcz-tp").tmpl({sjdx:_this.sjdx,
        user:_this.$children[0]._data.user}).html();
    $('#lbplcz-'+_this.sjdxid).html(qtcz);
}
function sjdxlbcz(value,_this) {
    var cz = defaultLbcz(value,_this);
    if("非列表模式"==cz){
        return cz;
    }
    var qtcz = $("#my-sjdx-lbcz-tp").tmpl({sjdx:_this.$root.sjdx,
        user:_this.$parent.$parent.$parent._data.user,
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