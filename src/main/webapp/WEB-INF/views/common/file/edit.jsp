<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java"  pageEncoding="UTF-8"%>
<gd:LayoutVue title="编辑">
<jsp:body> 
<my-from id="dataform" :data="$data" :fromdata="fromData" :pagemodel="pageModel"
	class="wrap" @setval="setval" v-cloak>
<div class="row btn-center">
    <button v-if="pageModel=='edit'" class="btn btn-primary btn-sm" a-oper=submit>确定</button>
    <button class="btn btn-default btn-sm" :a-oper="pageModel=='edit'?'colse':'allColse'">关闭</button>
</div>
</my-from>
<script>
eval('var fromData=${obj}');
if(!fromData){
    fromData={};
}
var dataform = new Vue({
    el : '#dataform',
    data : {
        action : 'common/save.do',
        method : 'post',
        index:true,
        pageModel:"${param.pageModel}",
        fromData:fromData,
        fields :{
            sclb : {
                name : 'sclb',
                label : '上传类别',
                zdlb : 'SYS_FILE_SCLB',
                zdSelectPage : true,
                width : 80
            },
            wjlx : {
                name : 'wjlx',
                label : '文件类型',
                dataRule : "length(~20)",
                width : 80
            },
            wjlb : {
                name : 'wjlb',
                label : '文件类别',
                dataRule : "length(~20)",
                width : 80
            },
            ywdm : {
                name : 'ywdm',
                label : '业务代码',
                dataRule : "length(~20)",
                width : 80
            },
            createdate : {
                name : 'createdate',
                label : '创建时间',
                inputType:"timearea",
                order : true,
                width : 130,
                value:['goDay:-30'],
                  enCodeing:function(value){
                      return value.replace(/-/g,'');
                  },
                  deCodeing:function(value,_this){
                      var val = time14Totime19(value);
                      if(_this.$root.edit){
	                      return "<span style='color:red;'>"+val+"<span>";
                      }else{
	                      return val;
                      }
                  },
                listShow:true,
                searchShow:true
            },
            createdate : {
                  name : 'createdate',
                  label : '创建时间',
                  editShow : false,
                  detailsShow : true,
                  enCodeing:function(value){
                      return value.replace(/-/g,'');
                  },
                  deCodeing:function(value,_this){
                      var val = time14Totime19(value);
                      if(_this.$root.pageModel!='edit'){
	                      return "<span style='color:red;'>"+val+"<span>";
                      }else{
	                      return val;
                      }
                  }
              },
              etldate : {
                  name : 'etldate',
                  label : '更新时间',
                  editShow : false,
                  detailsShow : true,
                  enCodeing:function(value){
                      return value.replace(/-/g,'');
                  },
                  deCodeing:function(value,_this){
                      var val = time14Totime19(value);
                      if(_this.$root.pageModel!='edit'){
	                      return "<span style='color:red;'>"+val+"<span>";
                      }else{
	                      return val;
                      }
                  }
              },
              wjm : {
                  name : 'wjm',
                  label : '文件名',
                  dataRule : "length(~200)",
                  width : 200,
                  col : '12',
                  labelCol:'2',
                  inputCol:'10'
              },
              sclj : {
                  name : 'sclj',
                  label : '上传路径',
                  dataRule : "length(~500)",
                  searchShow:false,
                  col : '12',
                  labelCol:'2',
                  inputCol:'10'
              },
              qcm : {
                  name : 'qcm',
                  label : '去重码',
                  listShow:false,
                  searchShow:false,
                  col : '12',
                  labelCol:'2',
                  inputCol:'10'
              },
              id : {
                  name : 'id',
                  label : '主键',
                  editShow : false,
                  detailsShow : true,
                  col : '12',
                  labelCol:'2',
                  inputCol:'10'
              }
        	}
	      },
	      computed : {
	          shgxls:function (){
                  var num=0;
	              var sfs = this.shgxFields;
	              Object.keys(sfs).forEach(function(key){
	                  if(!(sfs[key].listShow==false)){
	                      num++;
	                  }
	             });
                 return num+(this.pageModel=='edit'?2:1);
	          }
	      },
	      methods : {
	            setval:function(field,event){
	                this.fromData[field.name] = event.val;
	                if(event.target.mc){
	                    this.fromData['map.'+field.name]=event.mc;
	                }
	                console.log(field.label + "=" + this.fromData[field.name]); 
	             }
			},
			mounted: function () {
			}
	  });
</script>
</jsp:body>
</gd:LayoutVue>