<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<gd:LayoutVue title="编辑[${sjdx.dxmc}]">
<jsp:body>
<my-edit id="dataform1" :fromdata="fromdata" :sjdxid="sjdxid" :pagemodel="pagemodel">
</my-edit>
<script>
function sjdxZdy(vp){
	vp.el="#dataform1";
    vp.methods.plcl=function(cllx){
          this.$children[0].plcl(cllx);
    }
    vp.mounted=function () {
        lxSzhd($("[name='zylx']").val(),this);
    }
}
/**
 * 类型设置回调
 */
function lxSzhd(value,_this,event){
    if(value==""){
        value="xxxx";
    }
    $(".xjsx").parents("div.my-input").css("display","none");
    $(".xjsx"+value).parents("div.my-input").css("display","block");
    var fromid = _this.fromid;
    var fromTarget = _this.$root.frommap[fromid];
    var updatedata = _this.$root.$children[0]._data.updatedata;
    for(var i in fromTarget){
        var field = fromTarget[i].field;
        if(!field.cssl){
            continue;
        }
        if(field.cssl.indexOf('xjsx'+value)>-1){
            field.hdyzgz = "notNull;"+field.hdyzgz;
        }else if(field.cssl.indexOf('xjsx')>-1){
            field.hdyzgz = field.hdyzgz.replace("notNull;", "");
        }
    }
}
function sjdxZdyjy(data,_this){
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