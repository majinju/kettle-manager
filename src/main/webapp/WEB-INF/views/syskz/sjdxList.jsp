<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:LayoutVue title="${sjdx.dxmc }">
<jsp:body>
<!-- 数据对象列表扩展 -->
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
	<span :id="'lbplcz-'+sjdxid"></span>
</my-list>
<!--  v-if="qxByQxm('FZDX')"  v-if="qxByQxm('SCST')" -->
<!--         <button class="btn btn-primary btn-sm" @click="plcl('fzdx')"><i class="icon ion-ios-copy-outline"></i> 复制对象</button> -->
<!--         <button class="btn btn-primary btn-sm" @click="plcl('scdxst')"><i class="icon ion-log-in"></i> 生成实体</button> -->
<script type="text/x-tp" id="my-sjdx-lbplcz-tp">
<span>
{{if qxByQxm(user,sjdx,'FZDX')}}
<button class="btn btn-primary btn-sm" onclick="plcl('fzdx')"><i class="icon ion-ios-copy-outline"></i> {{= qxByQxm(user,sjdx,'FZDX').mc}}</button>
{{/if}}
{{if qxByQxm(user,sjdx,'SCDXST')}}
<button class="btn btn-primary btn-sm" onclick="plcl('scdxst')"><i class="icon ion-log-in"></i> {{= qxByQxm(user,sjdx,'SCDXST').mc}}</button>
{{/if}}
</span>
</script>
<script type="text/x-tp" id="my-sjdx-lbcz-tp">
<span>
{{if qxByQxm(user,sjdx,'CKDX')}}
<span class="divider"></span>
<a href="sjdx/list.do?dxdm={{= row.dxdm}}" target="_blank" title="查看对象，查看列表页面"><i class="icon ion-eye"></i></a>
{{/if}}
{{if qxByQxm(user,sjdx,'PZZD')}}
<span class="divider"></span>
<a href="sjdx/list.do?dxdm=SYS_SJGL_SJZD&e_sjdx={{= row.id}}" target="_blank" title="配置字段"><i class="icon ion-levels"></i></a>
{{/if}}
{{if qxByQxm(user,sjdx,'SXDX')}}
<span class="divider"></span>
<a href="sjdx/plcl.do?id={{= sjdx.id}}&e_cllx=sxdx&e_ids={{= row[sjdx.zjzd]}}" 
a-oper="dxcl" title="刷新对象,从原始表信息更新字段"><i class="icon ion-ios-refresh"></i></a>
{{/if}}
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