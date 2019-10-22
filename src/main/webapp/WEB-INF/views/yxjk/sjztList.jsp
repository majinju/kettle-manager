<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:LayoutVue title="${sjdx.dxmc }">
<jsp:body>
<!-- 监控任务列表扩展 -->
<my-list id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
    <button style="display: none;" :id="'swwx-'+sjdxid" class="btn btn-primary btn-sm"  @click="plcl('swwx')">
    	<i class="icon ion-checkmark-round"></i> 设为无效</button>
    <button style="display: none;" :id="'swyx-'+sjdxid" class="btn btn-primary btn-sm"  @click="plcl('swyx')">
    	<i class="icon ion-close-round"></i> 设为有效</button>
    <button class="btn btn-primary btn-sm"  @click="szyj()" title="暂停后所有监控将转为三级任务进行监控，恢复后则恢复为设置级别">
    	<i class="icon ion-alert-circled"></i> {{ sfyj=='1'?'暂停':'恢复' }}预警</button>
	<span :id="'lbplcz-'+sjdxid"></span>
</my-list>
<script type="text/x-tp" id="my-sjdx-lbplcz-tp">
</script>
<script type="text/x-tp" id="my-sjdx-lbcz-tp">
<span>
{{if qxByQxm(user,sjdx,'JTRW')}}
<span class="divider"></span>
<a href='{{= row.jtrwurl}}' a-oper="other" title="具体任务"><i class="icon ion-android-alert"></i></a>
{{/if}}
{{if qxByQxm(user,sjdx,'GXT')}}
<span class="divider"></span>
<a href="sjdx/list.do?dxdm=SYS_YXJK_JKRW_GXT&jdid={{= row[sjdx.zjzd]}}" title="依赖关系图" 
a-oper="newTab"><i class="icon ion-network"></i></a>
{{/if}}
{{if qxByQxm(user,sjdx,'LSXX')}}
<span class="divider"></span>
<a href='sjdx/list.do?dxdm=SYS_YXJK_XX&myparams={{= jsonEncode({"jkrw":row[sjdx.zjzd]})}}' 
title="历史消息" a-oper="other"><i class="icon ion-compass"></i></a>
{{/if}}
{{if qxByQxm(user,sjdx,'JDFK')}}
<span class="divider"></span>
<!-- <a href="sjdx/plcl.do?id={{= sjdx.id}}&map['cllx']=fk&map['clfk']=正在处理中&map['ids']={{= row[sjdx.zjzd]}}" a-oper="dxcl">反馈</a> -->
<a href="sjdx/edit.do?pagemodel=edit&id=560DB80CFE1E40E5887512A7B2711ABE&myparams={{= editUrl(sjdx,row)}}"  width="620px" height="300px"  a-oper="update" title="反馈问题解决进度"><i class="icon ion-arrow-return-left"></i></a>
</span>
{{/if}}
</script>
<script>
function sjdxZdy(vp){
    vp.methods.plcl=function(cllx){
          this.$children[0].plcl(cllx);
    }
    vp.data.sfyj = '1';
    vp.methods.szyj=function(){
        var _this = this;
        var options = {};
        options.bxlbh=false;
        if(this._data.sfyj=='1'){
            options['e_sfyj']='0';
        }else{
            options['e_sfyj']='1';
        }
        options.success = function(data,_t){
            _this._data.sfyj = options['e_sfyj'];
        };
        this.$children[0].plcl('szyj',null,options);
  	}
    vp.mounted=function(){
        lbplcz(this);
        var obj = zdObj({zdlb:'SYS_MYSERVICE_APPCONFIG',dm:'yxjk.sfyj'},false);
        this._data.sfyj = obj.mc;
    }
}
function lbplcz(_this){
    var param = {
        sjdx:_this.sjdx,
        user:_this.$children[0]._data.user
        }
    var qtcz = $("#my-sjdx-lbplcz-tp").tmpl(param).html();
    $('#lbplcz-'+_this.sjdxid).html(qtcz);
	if(qxByQxm(param.user,param.sjdx,'SWWX')){
	    $('#swwx-'+sjdxid).show();
	}
	if(qxByQxm(param.user,param.sjdx,'SWYX')){
	    $('#swyx-'+sjdxid).show();
	}
}
function sjdxlbcz(value,_this) {
    var cz = defaultLbcz(value,_this);
    if("非列表模式"==cz){
        return cz;
    }
	var sjdx = _this.$root.sjdx;
	var row = _this.$root.listPage.rows[_this.$parent.$parent.ri];
	if(row['rwlx']==1){
		row.jtrwurl='sjdx/edit.do?pagemodel=details&id=7C53F02FC43043FEAD8653541617710F';
	}else if(row['rwlx']==2){
		row.jtrwurl='sjdx/edit.do?pagemodel=details&id=5B27F00C6D854795B63F67520AF0738E';
	}else if(row['rwlx']==4){
		row.jtrwurl='sjdx/edit.do?pagemodel=details&id=2CAACF7B795F4CB9B79E26F4236EE9B3';
	}else if(row['rwlx']==5){
		row.jtrwurl='sjdx/edit.do?pagemodel=details&id=772FA408CDD743EDA4146728DBA4B24A';
	}
	if(row['rwlx']==3){
		var jtrw = row['jtrw'].split("#");
		row.jtrwurl='sjdx/edit.do?pagemodel=details&dxdm='+jtrw[0]+"&myparams=%7B'id_job':'"+jtrw[1]+"'%7D";
		row['jtrw'] = jtrw[1];
	}else{
		row.jtrwurl += "&myparams=%7B'id':'"+row['jtrw']+"'%7D";
	}
    var qtcz = $("#my-sjdx-lbcz-tp").tmpl({sjdx:sjdx,row:row,
        user:_this.$parent.$parent.$parent._data.user
        }).html();
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