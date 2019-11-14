<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<gd:LayoutVue title="编辑[${sjdx.dxmc}]">
<jsp:body>
<my-edit id="dataform1" :fromdata="fromdata" :sjdxid="sjdxid" :pagemodel="pagemodel">
      <button type="button" v-if="pagemodel=='add'" class="btn btn-primary btn-sm" 
    	     title="获取默认字段导入SQL" @click="plcl('dis')">默认SQL</button>
</my-edit>
<script>
function sjdxZdy(vp){
	vp.el="#dataform1";
    vp.methods.plcl=function(cllx){
          this.$children[0].plcl(cllx);
    }
}
function sjdxZdyjy(data,_this){
//     if(!((_this.pagemodel=='edit'&&data.zddrsql==undefined)||!isEmpty(data.zddrsql))){
//         layer.alert("字段导入SQL不能为空", { 
//                icon:2                      
//         });
//         return false;
//     }
    return true;
}
</script>
<script>
var fromdata = ${myparams};
var sjdxid = "${sjdx.id}";
var pagemodel = "${param.pagemodel}";
var vueParams = {
        el : '#dataform',
        data: {
                fromdata:fromdata,
                sjdxid:sjdxid,
                pagemodel:pagemodel,
                frommap:{}
        },
        methods:{
        }
}
if(typeof(sjdxZdy)=='function'){
    sjdxZdy(vueParams);
}
var dataform = new Vue(vueParams);
</script>
</jsp:body>
</gd:LayoutVue>