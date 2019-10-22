<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<gd:LayoutVue title="编辑[${sjdx.dxmc}]">
<jsp:body>
<my-edit id="dataform1" :fromdata="fromdata" :sjdxid="sjdxid" :pagemodel="pagemodel">
</my-edit>
<script type="text/x-tp" id="my-sjdx-czan-tp">
<span style="float: right;">
<button class="btn btn-primary btn-sm" type="button" onclick="{{= onpzdx}}">配置对象</button>
<button class="btn btn-primary btn-sm" type="button" onclick="{{= onpzzd}}">配置字段</button>
</span>
</script>
<script>
function sjdxZdy(vp){
	vp.el="#dataform1";
    vp.methods.plcl=function(cllx){
          this.$children[0].plcl(cllx);
    }
    vp.mounted=function () {
        var zylx = this.$children[0].editdata.zylx;
        if(!zylx){
            zylx = $("[name='zylx']").val();
        }
        //添加获取km配置信息按钮
        $("[name='kmlm']").after('<button class="btn btn-primary btn-sm" style="float: right;" type="button" onclick="getKmmrpz()">获取默认配置</button>');
		//修改来源对象样式
        var lydxEl = $("[name='lydx_text']").parent();
		lydxEl.attr("style",$("[name='lydx_text']").attr("style"));
		lydxEl.after($("#my-sjdx-czan-tp").tmpl({onpzdx:"pzlydx()",onpzzd:"pzlyzd()"}).html());
		//修改来源对象样式
        var mbdxEl = $("[name='mbdx_text']").parent();
        mbdxEl.attr("style",$("[name='mbdx_text']").attr("style"));
        mbdxEl.after($("#my-sjdx-czan-tp").tmpl({onpzdx:"pzmbdx()",onpzzd:"pzmbzd()"}).html());
        //添加获取流转配置信息按钮
        var lzmbEl = $("[name='lzmb_text']").parent();
        lzmbEl.attr("style",$("[name='lzmb_text']").attr("style"));
        lzmbEl.after('<button class="btn btn-primary btn-sm" style="float: right;" type="button" onclick="getDxlzMrpz()">获取默认配置</button>');
        
        lxSzhd(zylx,this);
    }
}
function pzlydx(){
    var lydx = $("[name='lydx']").val();
    if(lydx){
        popUpFillWin({url:'sjdx/edit.do?pagemodel=edit&dxdm=SYS_SJGL_SJDX&myparams=%7B"id":"'+lydx+'"%7D'});
    }else{
        popUpFillWin({url:'sjdx/edit.do?pagemodel=add&dxdm=SYS_SJGL_SJDX'});
    }
}
function pzmbdx(){
    var lydx = $("[name='mbdx']").val();
    if(lydx){
        popUpFillWin({url:'sjdx/edit.do?pagemodel=edit&dxdm=SYS_SJGL_SJDX&myparams=%7B"id":"'+lydx+'"%7D'});
    }else{
        popUpFillWin({url:'sjdx/edit.do?pagemodel=add&dxdm=SYS_SJGL_SJDX'});
    }
}
function pzlyzd(){
    var lydx = $("[name='lydx']").val();
    if(lydx){
        popUpFillWin({url:'sjdx/list.do?dxdm=SYS_SJGL_SJZD&myparams=%7B%22sjdx%22:%22'+lydx+'%22%7D'});
    }else{
        alertError("请先选择数据对象");
    }
}
function pzmbzd(){
    var lydx = $("[name='mbdx']").val();
    if(lydx){
        popUpFillWin({url:'sjdx/list.do?dxdm=SYS_SJGL_SJZD&myparams=%7B%22sjdx%22:%22'+lydx+'%22%7D'});
    }else{
        alertError("请先选择数据对象");
    }
}
/**
 * 获取km默认配置信息
 */
function getKmmrpz(){
    var kmlm = $("[name='kmlm']").val();
    if(!kmlm){
        alertError("km类名不能为空");
        return;
    }
    dataform.$children[0].plcl("getKmmrpz");
}
/**
 * 获取对象流转默认配置信息
 */
function getDxlzMrpz(){
    var lydx = $("[name='lydx']").val();
    var mbdx = $("[name='mbdx']").val();
    if(!lydx||!mbdx){
        alertError("请先选择来源对象和目标对象");
        return;
    }
    dataform.$children[0].plcl("getDxlzMrpz");
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
    var fromTarget = _this.$root.frommap["#dataform1"];
    var updatedata = _this.$root.$children[0]._data.updatedata;
    for(var i in fromTarget){
        var field = fromTarget[i].field;
        if(!field.cssl){
            continue;
        }
        if(field.cssl.indexOf('xjsx'+value)>-1&&field.hdyzgzOld){
            field.hdyzgz = field.hdyzgzOld;
        }else if(field.cssl.indexOf('xjsx')>-1){
            if(!field.hdyzgzOld){
                field.hdyzgzOld = field.hdyzgz;
            }
            //非当前作业类型的属性移除必填校验
            field.hdyzgz = field.hdyzgz.replace(/notNull;/g, "");
        }
    }
    if(value=='cgzy'&&pagemodel=="add"){
        alertError("常规作业请直接在spoon中新建!");
    }
}
function sjdxZdyjy(data,_this){
    if(data.zylx=='cgzy'&&pagemodel=="add"){
        alertError("常规作业请直接在spoon中新建!");
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