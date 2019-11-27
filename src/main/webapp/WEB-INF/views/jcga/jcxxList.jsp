<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:LayoutVue title="${sjdx.dxmc }">
<jsp:body>
<!-- 机场员工列表扩展 -->
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
	<span :id="'lbplcz-'+sjdxid"></span>
</my-list>
<script type="text/x-tp" id="my-sjdx-lbplcz-tp">
<span>
{{if qxByQxm(user,sjdx,'YGPLSC')}}
<button class="btn btn-primary btn-sm uploadFile" ywdm="jcga" wjlb="ygsj" wjlx="xls|xlsx" callBack="clygsj">
	{{= qxByQxm(user,sjdx,'YGPLSC').mc}}
	<i  style="margin-left: 5px;" 
    	class="icon ion-ios-help-outline" 
    	id="plscTitle"
    	onmouseover="plscTitle(this)"></i></button>
{{/if}}
{{if qxByQxm(user,sjdx,'YGMBXZ')}}
<button class="btn btn-primary btn-sm" onclick="downloadYgscTemplate()">{{= qxByQxm(user,sjdx,'YGMBXZ').mc}}
	<i style="margin-left: 5px;" 
    	class="icon ion-ios-help-outline" 
    	id="plscmbTitle"
    	onmouseover="plscmbTitle(this)"></i>
</button>
{{/if}}
{{if qxByQxm(user,sjdx,'LZYGSC')}}
<button class="btn btn-primary btn-sm uploadFile" ywdm="jcga" wjlb="ygsj" wjlx="xls|xlsx" callBack="lzygcl">
	{{= qxByQxm(user,sjdx,'LZYGSC').mc}}
	<i  style="margin-left: 5px;" 
    	class="icon ion-ios-help-outline" 
    	id="plscTitle"
    	onmouseover="plscTitle(this)"></i></button>
{{/if}}
{{if qxByQxm(user,sjdx,'LZMBXZ')}}
<button class="btn btn-primary btn-sm" onclick="downloadLzmbTemplate()">{{= qxByQxm(user,sjdx,'LZMBXZ').mc}}
	<i style="margin-left: 5px;" 
    	class="icon ion-ios-help-outline" 
    	id="plscmbTitle"
    	onmouseover="plscmbTitle(this)"></i>
</button>
{{/if}}
</span>
</script>
<script type="text/x-tp" id="my-sjdx-lbcz-tp">
<span>
<span class="divider"></span>
<a href="sjdx/list.do?dxdm=JCGA_JCYG_SHGX&myparams={{= jsonEncode({'ygbh':row.ygbh})}}" a-oper="other" title="社会关系"><i class="icon ion-network"></i></i></a>
</span>
</script>
<script>
function sjdxZdy(vp){
    vp.el="#listPage";
    vp.methods.plcl=function(cllx,_this,options){
         this.$children[0].plcl(cllx,_this,options);
    }
    vp.mounted=function(){
        lbplcz(this);
    }
}
function plcl(cllx,_this,options){
    listFrom.plcl(cllx,_this,options);
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
    var qtcz = $("#my-sjdx-lbcz-tp").tmpl({
        sjdx:_this.$root.sjdx,
        user:_this.$parent.$parent.$parent._data.user,
	    row:_this.$root.listPage.rows[_this.$parent.$parent.ri]}).html();
    return cz+qtcz;
}

function plscTitle(_this){
	layer.tips("批量上传需要核查的数据,请先下载模板，严格按照模板要求填充数据，数据验证要求与单个上报一致，只有全部数据验证通过才能上传成功","#plscTitle");
}
function plscmbTitle(_this){
	layer.tips("请严格按照模板填充数据，注意模板中的提示信息","#plscmbTitle");
}
function downloadYgscTemplate(){
	//下载员工上传模板
	$.download("common/download.do",{id:"D6B55EC32CBA49D0B9D7CE8767C1121A"});
}
function downloadLzmbTemplate(){
	//下载离职模板
	$.download("sjdx/getMb.do",{dxdm:"JCGA_JCYG_JCXX_LZZY"});
}
/**
 * 处理员工数据
 */
function clygsj(fileObj){
    var params = {};
    params.id=listFrom.sjdx.id;
    params['map["cllx"]']="clygsj";
    params.myparams = JSON.stringify({"fileObj":fileObj});
    ajax('sjdx/plcl.do',{
        fromdata:params,
        qrts:false,
        success:function(data){
            listFrom.$children[0].listPage.queryPage(); //执行页面刷新函数 
        },
        error:function(data){
        	if(!data.status&&data.code=='sjnrcw'){
        		popUpFullWinLayer({"url":"sjdx/list.do?dxdm=SYS_LOG_SJSCCW&e_sjwj="+fileObj.id,
        	        "name":"数据上传错误信息列表"});
        	}
        }
    });
}
/**
 * 离职员工处理
 */
function lzygcl(fileObj){
    var params = {};
    params.dxdm="JCGA_JCYG_JCXX_LZZY";
    params['map["cllx"]']="lzygcl";
    params.myparams = JSON.stringify({"fileObj":fileObj});
    ajax('sjdx/plcl.do',{
        fromdata:params,
        qrts:false,
        success:function(data){
            listFrom.$children[0].listPage.queryPage(); //执行页面刷新函数 
        },
        error:function(data){
        	if(!data.status&&data.code=='sjnrcw'){
        		popUpFullWinLayer({"url":"sjdx/list.do?dxdm=SYS_LOG_SJSCCW&e_sjwj="+fileObj.id,
        	        "name":"数据上传错误信息列表"});
        	}
        }
    });
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