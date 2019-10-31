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
	vp.methods.getDefaultImpSql=function(){
        var _this=this;
   	if(!$(_this.$options.el).isValid()){
    		return;
    	}else{
                var _params = {myparams:JSON.stringify(_this.$children[0]._data.updatedata)};
                _params['map["sqlType"]']="dis";
                _params['id']=_this.sjdxid;
    		$.post("sjdx/getDefaultSql.do",_params,function(data){
    			if(data.status){
    			    Vue.set(_this.fromdata,"zddrsql",data.msg);
    			}else{
    	        	layer.alert(data.msg ? data.msg : "操作失败！", { 
                           icon:2                      
                    });
                }
            });
        }
    }
}
function sjdxZdyjy(data,_this){
    if(!((_this.pagemodel=='edit'&&data.zddrsql==undefined)||!isEmpty(data.zddrsql))){
        layer.alert("字段导入SQL不能为空", { 
               icon:2                      
        });
        return false;
    }
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