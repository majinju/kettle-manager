<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<gd:LayoutVue title="编辑[${sjdx.dxmc}]">
<jsp:body>
<!-- 数据对象编辑扩展 -->
<my-edit id="dataform1" :fromdata="fromdata" :sjdxid="sjdxid" :pagemodel="pagemodel">
      <button type="button" class="btn btn-primary btn-sm" 
    	     title="测试载体配置可用性" @click="cszt()">测试载体</button>
</my-edit>
<script>
function sjdxZdy(vp){
	vp.el="#dataform1";
    vp.methods.plcl=function(cllx){
          this.$children[0].plcl(cllx);
    }
    /**
     * 测试数据载体
     */
    vp.methods.cszt=function(){
        var _this = this;
        var df = {};
        df.id=sjdxid;
        df['e_cllx']='cszt';
        df['e_id']=fromdata.id;
        if(pagemodel == 'details'){
            ajax("sjdx/plcl.do",{
                fromdata:df,
                success:function(data){
	            }
           	}
            );
        }else{
            df.myparams=JSON.stringify(_this.$children[0].updatedata);
            ajax("sjdx/plcl.do",{fromdata:df,
                success:function(data){
	            }
            });
        }
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