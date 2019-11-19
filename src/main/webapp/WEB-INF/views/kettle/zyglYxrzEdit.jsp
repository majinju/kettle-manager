<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<gd:LayoutVue title="编辑[${sjdx.dxmc}]">
<jsp:body>
<my-edit id="dataform" :fromdata="fromdata" :sjdxid="sjdxid" :pagemodel="pagemodel">
<button type="button" class="btn btn-primary btn-sm" 
    @click="jzxrz">加载新日志</button>
</my-edit>
<script>
function sjdxZdy(vp){
	vp.methods.plcl=function(cllx){
		this.$children[0].plcl(cllx);
	}
	vp.mounted=function () {
		this.jzxrz();
	}
	vp.methods.jzxrz=function(){
		var _this=this;
		var _params = {myparams:JSON.stringify({})};
		_params['id']=_this.sjdxid;
		_params['e_zykdm']=_this.fromdata.zykdm;
		_params['e_id_job']=_this.fromdata.ids;
		_params['e_startLineNr']=_this.fromdata.startLineNr||0;
		_params['e_cllx']="rz";
		myAjax("sjdx/plcl.do",_params,function(result){
		   var _t = $("[name='yxrz']");
		   var xrz = result.data.data;
		   if(xrz==""){
		       xrz = (new Date())+"暂无新日志\n"
		   }
		   _t.val(_t.val()+xrz);
		   _this.fromdata.startLineNr = result.data.lastLineNr;
		});
	}
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