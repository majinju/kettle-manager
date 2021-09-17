<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:sjdxList>
<jsp:body>
<!-- 机场员工列表扩展 -->
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
    <button qxm="YGPLLZ" class="lbplcz btn btn-primary btn-sm"  @click="ygpllz()">
    	<i class="icon ion-log-out"></i> 批量离职</button>
</my-list>
<script type="text/x-tp" id="my-sjdx-lbplcz-tp">
<span>
{{if qxByQxm(user,sjdx,'YGPLSC')}}
<button class="btn btn-primary btn-sm uploadFile" ywdm="jcga" wjlb="ygsj" wjlx="xls|xlsx" callBack="clygsj"
	title="批量上传数据,请先下载模板，严格按照模板要求填充数据，数据验证要求与单个上报一致，只有全部数据验证通过才能上传成功">
	<i class="icon ion-arrow-up-a"></i> {{= qxByQxm(user,sjdx,'YGPLSC').mc}}</button>
{{/if}}
{{if qxByQxm(user,sjdx,'YGMBXZ')}}
<button class="btn btn-primary btn-sm" onclick="downloadYgscTemplate()"
	title="请严格按照模板填充数据，注意模板中的提示信息">
	<i class="icon ion-arrow-down-a"></i> {{= qxByQxm(user,sjdx,'YGMBXZ').mc}}
</button>
{{/if}}
{{if qxByQxm(user,sjdx,'LZYGSC')}}
<button class="btn btn-primary btn-sm uploadFile" ywdm="jcga" wjlb="ygsj" wjlx="xls|xlsx" callBack="lzygcl">
	<i class="icon ion-arrow-up-a"></i> {{= qxByQxm(user,sjdx,'LZYGSC').mc}}</button>
{{/if}}
{{if qxByQxm(user,sjdx,'LZMBXZ')}}
<button class="btn btn-primary btn-sm" onclick="downloadLzmbTemplate()">
	<i class="icon ion-arrow-down-a"></i> {{= qxByQxm(user,sjdx,'LZMBXZ').mc}}
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
    vp.methods.ygpllz = function(){
        var options ={
                plczqt:function(ids){
                    var url = "sjdx/edit.do?dxdm=JCGA_JCYG_JCXX_LZZY&pagemodel=add&e_ids="+ids;
                    popUpWinLayer({url:url,name:"批量离职",width:"700px",height:"350px"});
        		}
        };
        this.plcl("ygpllz", null, options);
    }
}
function downloadYgscTemplate(){
	//下载员工上传模板
	$.download("common/download.do",{id:"6897749835A04EB3AAFF4811ECC6BC08"});
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
</jsp:body>
</gd:sjdxList>