<%@ include file="/WEB-INF/common/taglibs.jsp"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<gd:sjdxList>
<jsp:body>
<my-dzplhc id="listPage" :fromdata="fromdata" :sjdxid="sjdxid">
    <button class="btn btn-primary btn-sm"  @click="hqsj" title="调用批量比对模块">
    	<i class="icon ion-navigate"></i> 获取数据</button>
</my-dzplhc>
<script type="text/x-tp" id="my-sjdx-lbplcz-tp">
</script>
<script type="text/x-tp" id="my-sjdx-lbcz-tp">
<span>
<a onclick="hqsj('{{= row.zjhm}}')" title="获取数据"><i class="icon ion-navigate"></i>
</span>
</script>
<script>
/**
 * 获取单个证件号码的数据
 */
function hqsj(zjhm){
    listFrom.hqsj(zjhm);
}
function sjdxZdy(vp){
    /**
    * 获取数据，将条件传到批量比对模块
    */
    vp.methods.hqsj = function(zjhm){
        alertInfo("将条件自动传到批量比对模块，暂未实现，敬请期待。");
    }
}
function sjdxlbcz1(value,_this) {
    var cz = defaultLbcz(value,_this);
    if("非列表模式"==cz){
        return cz;
    }
    var qtcz = $("#my-sjdx-lbcz-tp").tmpl({sjdx:_this.$root.sjdx,
        user:_this.$parent.$parent.$parent._data.user,
	    row:_this.$root.listPage.rows[_this.$parent.$parent.ri]}).html();
    return qtcz;
}
</script>

<script type="text/x-tp" id="my-dzplhc-tp"> 
<div class="wrap" v-cloak @keydown="zdcx">
<ol class="breadcrumb"  :style="myFromStyle">
    <li>
        <i class="icon ion-home"></i>
    </li>
    <li class="active">{{sjdx.dxmc}}</li>
</ol>
<div>
<div v-if="lbymkz('my-istree')" style="width: 200px;float: left;height: calc(( 100vh - 38px ));background-color: honeydew;">
<div style="text-align: center;font-size: 1.5em;background-color: bisque;color: brown;">资源目录</div>
<ul :id="'leftTree-'+sjdx.id" class="ztree"></ul>
</div>
<div :style="lbymkz('my-istree')?'float: left;width:calc((100% - 200px));':''">
<my-from class="queryForm" :fromdata="fromdata" pagemodel="search" :fromid='queryFromid'
	:data="$data" @setval="setval" onsubmit="return false;" :style="myFromStyle">
  <div class="row btn-right">
      <button class="btn btn-primary btn-sm" type="button" @click="listPage.queryPage()">
          <i class="icon ion-ios-search-strong"></i> {{cxanmc||'查询'}}
      </button>
      <button class="btn btn-primary btn-sm" type="button" @click="sqzytj" v-if="xzcxx.length>0">
          <i class="icon ion-loop"></i> {{zytj?'收起':'展开'}}资源条件
      </button>
  </div>
</my-from>
<div :id="'zytj-'+queryFromid" :style="zytj?'':'display: none;'">
<div class="panel panel-default" v-for="(zy,ri) in xzcxx" :style="zy.show?'':'display: none;'">
    <div class="panel-heading">
        <h3 class="panel-title">{{zy.zymc}}</h3>
	</div>
	<div class="panel panel-info form-horizontal" role="form">
		<div class="panel-body" style="margin-right: 1%;">
			<div class="row gutter-1">
				<my-input v-for=" (field,key,index) in zy.cxx" :key="zy.zydm+'-'+field.zddm"
					:field="field" :index="index" :data="$data"
					pagemodel="search" :fromid='queryFromid'
					fieldshow="true"
					value=""
					:owner="'xzcxx-'+zy.zydm+'-'"
					@setval="setZyVal"></my-input>
			</div>
		</div>
	</div>
</div>
</div>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">数据展示</h3>
		<div class="btn-group btn-table-left" role="group" aria-label="列表操作">
			<button v-if="lbkbj=='1'" class="btn btn-primary btn-sm" @click="saveListData"><i class="glyphicon glyphicon-floppy-disk"></i> 保存数据</button>
	        <button v-if="qxByQxm('XZQX')" class="btn btn-primary btn-sm" :href="'sjdx/edit.do?dxdm='+sjdx.dxdm+'&pagemodel=add'"
				a-oper="other" :title='"新建【"+sjdx.dxmc+"】"'><i class="icon ion-ios-plus-outline"></i> {{xjanmc||'新建'}}</button>
	        <button v-if="qxByQxm('PLSC')" class="btn btn-primary btn-sm" @click="plcl('plsc')"><i class="icon ion-ios-trash-outline"></i> {{plscanmc||'批量删除'}}</button>
	        <button v-if="!(lbkbj=='1')&&qxByQxm('BJMS')" class="btn btn-primary btn-sm" 
				:href="'sjdx/list.do?dxdm='+sjdx.dxdm+'&myparams='+bjmsUrl"
	            a-oper="newTab"><i class="icon ion-edit"></i> 编辑模式</button>
			<my-file v-if="qxByQxm('SJPLSC')" edit="true" :field="sjplscfield" @setval="sjplsc"
 				title="请先下载模板，不要修改模板格式，按照模板要求进行数据填充">
				批量上传<!--<i style="margin-left: 5px;"
			    	class="icon ion-ios-help-outline plscTitle" 
			    	@mouseover="plscTitle(this)"></i>-->
			</my-file>
			<button v-if="qxByQxm('MBXZ')" class="btn btn-primary btn-sm" @click="downloadTemplate()"
				title="模板中包含了字段相关校验规则，请按规则填写，部分字典数据及详细校验规则请参考单个新增功能">
				<i class="icon ion-arrow-down-a"></i> 
				模板下载<!--<i style="margin-left: 5px;" 
			    	class="icon ion-ios-help-outline plscmbTitle" 
			    	mouseover="plscmbTitle()"></i>-->
			</button>
	        <button v-if="qxByQxm('FZJL')" class="btn btn-primary btn-sm" @click="plcl('fzjl')">
				<i class="icon ion-ios-copy-outline"></i> 复制</button>
			<button v-if="qxByQxm('PZDX')" class="btn btn-primary btn-sm" :href="'sjdx/edit.do?pagemodel=edit&dxdm=SYS_SJGL_SJDX&myparams='+pzdxUrl"
	            a-oper="other"><i class="icon ion-gear-b"></i> 配置对象</button>
	        <button v-if="qxByQxm('PZZD')" class="btn btn-primary btn-sm" :href="'sjdx/list.do?dxdm=SYS_SJGL_SJZD&myparams='+pzzdUrl"
	            a-oper="newTab"><i class="icon ion-levels"></i> 配置字段</button>
			<slot></slot>
			<span :id="'lbplcz-'+sjdx.id"></span>
		
		  <div class="btn-group" role="group" style="display:none;">
		    <button type="button" class="btn btn-primary btn-sm dropdown-toggle" 
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		      	更多操作<span class="caret"></span>
		    </button>
		    <ul class="dropdown-menu">
		      <li><a href="#">Dropdown link</a></li>
		      <li><a href="#">Dropdown link</a></li>
		    </ul>
		  </div>
		</div>
        <div class="btn-group btn-table-right" role="group" aria-label="列表右侧操作">
			<button v-if="" class="btn btn-default btn-sm" type="button"
				@click="expe"><i class="icon ion-ios-redo-outline"></i> 导出当前页</button>
			<button v-if="" class="btn btn-default btn-sm" type="button"
				@click="expeAll"><i class="icon ion-ios-redo"></i> 导出全部</button>
    	</div>
	</div>
	<div class="panel-body exportDiv" style="overflow: auto;">
	    <table class="table table-striped table-bordered table-hover">
	        <thead>
	            <tr class="listHard">
	                <th is="my-th" v-for="(field,key,index) in lbfields" 
						:field="fieldBt(field)" @setvalTh="setvalTh"></th>
	            </tr>
	        </thead>
	        <tbody class="listContent">
		        <tr v-for="(row,ri) in rows" :class="'listrow '">
	                <td is="my-td"  v-for="(field,key,index) in lbfields"
	                	:key="'led'+ri+field.zddm" 
	                	:id="'led'+ri+field.zddm" 
						:fromid="listFromid"
	                	:field="field" :ri="ri" :index="index"
	                	:row="row" :pagemodel="lbkbj=='1'?'bjlist':'cklist'"
	                	:owner="'led.'+ri+'.'" 
						:value="fval(row,field)"
	                	:class="((lbkbj=='1'&&listEditData[ri][field.zddm]!=null)?'edited':'')"
		                @setval="setvalList"
	                ></td>
				</tr>
				<tr v-if="rows==0"><td :colspan="lbls">没有查询结果</td></tr>
	        </tbody>
	    </table>
	</div>
	<!--分页渲染后放到这个元素中 -->
	<div class="row pagination width_100">
	</div> 
 </div>
</div>
</div>
</div>
</script>
<script type="text/javascript">
//导出excel按钮控件
Vue.component('my-dzplhc', {
    props: ['fromdata','sjdxid'],
    template:"#my-dzplhc-tp",
    data: function () {
        return {
            rows:[],
            listPage:new PageAjax(),
            listEditData:[],
            sjplscfield:{
                    kzxx:{
                        file:{
                            ywdm:"other",
                            wjlb:"other",
                            wjlx:"xls|xlsx"
                        }
                    }
                },
            //选中查询项
            xzcxx:[],
            zytj:true
        }
      },
      created : function(){
          var _this = this;
          this.$root.listPage = this.listPage;
          var data = this.$data;
   		  $.ajax({url : "sjdx/jcxx.do",
	        type : "post",
            async : false,
            data : {id:this.sjdxid,userInfo:_this.fromdata.userInfo},
            success:function(result){
    			if(result.status){
    			    var rd = result.data;
    			    _this.$root.sjdx = data.sjdx = rd.sjdx;
    			     _this.sjplscfield.kzxx.file={
                             ywdm:"dxsjsc",
                             wjlb:rd.sjdx.dxdm,
                             wjlx:"xls|xlsx"
                         };
    			    _this.$root.fields = data.fields = rd.fields;
    			    _this.$root.user = data.user = rd.user;
    			    _this.$root.kzxx = data.kzxx = rd.kzxx;
      			    _this.$root.frommap[_this.queryFromid]={};
      			    _this.$root.frommap[_this.listFromid]={};
    			}else{
    	        	redict(result);
    			}
   			}});
          data.action=this.action;
          _this.fromdata.xzcxx = [];
      	},
	      computed : {
	          dcpcl:function (){
	              var dcpcl = fromdata['my-dcpcl'];
	              if(!dcpcl&&this._data.kzxx.lbymkz){
	                  dcpcl = this._data.kzxx.lbymkz['my-dcpcl'];
	              }
	              return dcpcl||",操作,序号";
	          },
	          cxanmc:function (){
	              var anmc = fromdata['my-cxanmc'];
	              if(!anmc&&this._data.kzxx.lbymkz){
	                  anmc = this._data.kzxx.lbymkz['my-cxanmc'];
	              }
	              return anmc;
	          },
	          xjanmc:function (){
	              var anmc = fromdata['my-xjanmc'];
	              if(!anmc&&this._data.kzxx.lbymkz){
	                  anmc = this._data.kzxx.lbymkz['my-xjanmc'];
	              }
	              return anmc;
	          },
	          plscanmc:function (){
	              var anmc = fromdata['my-plscanmc'];
	              if(!anmc&&this._data.kzxx.lbymkz){
	                  anmc = this._data.kzxx.lbymkz['my-plscanmc'];
	              }
	              return anmc;
	          },
	          lbkbj:function (){
	              var lbkbj = fromdata['my-lbkbj'];
	              if(!lbkbj&&this._data.kzxx.lbymkz){
	                  lbkbj = this._data.kzxx.lbymkz['my-lbkbj'];
	              }
	              return lbkbj;
	          },
	          fields : function (){ return this._data.fields;},
	          sjdx : function (){
					return this._data.sjdx;
				},
	          queryFromid : function (){ return "queryFromid-"+this.sjdx.id;},
	          listFromid : function (){ return "listFromid-"+this.sjdx.id;},
			  myFromStyle : function (){
			      var style = "";
			      var isCxtj = true;
	              if(fromdata['my-cxtj']!=undefined){
	                  isCxtj = fromdata['my-cxtj']!='0';
	              }else{
	                  isCxtj = this._data.sjdx.cxtj!='0';
	              }
	              //||!this.qxByQxm("CXQX")
	              if(!isCxtj){
	                  style+="display: none;";
	              }
	              return style;
				},
		      lbfields : function (){ return clone(this._data.fields);},
	          action:function (){ return "sjdx/page.do?dxdm="+this._data.sjdx.dxdm;},
	          lbls:function (){
	              var num=0;
	              var sfs = this.fields;
	              Object.keys(sfs).forEach(function(key){
	                  if(!(sfs[key].lbzs==false)){
	                      num++;
	                  }
	             });
	             return num;
	          },
		      bjmsUrl:function(){
		          var data = clone(fromdata);
		          data["my-lbkbj"] = "1";
	              return encodeURI(JSON.stringify(data));
		      },
		      pzzdUrl:function(){
	              return encodeURI(JSON.stringify({sjdx:this.sjdx.id,'my-lbkbj':'1'}));
		      },
	          addUrl:function(){
	              return encodeURI(JSON.stringify({"sjdx":this.sjdx.id}));
	          },
	          pzdxUrl:function(){
	              return encodeURI(JSON.stringify({"id":this.sjdx.id}));
	          }
	      },
        methods : {
            sqzytj:function(){
                this.zytj=this.zytj?false:true;
            },
            zdcx:function(){
                var e = event || window.event || arguments.callee.caller.arguments[0];
                if(e && e.keyCode==13){ // enter 键
                    this.listPage.queryPage();
                }
            },
            plscTitle:function(){
            	layer.tips("请先下载模板，严格按照模板要求填充数据，数据验证要求与单个上报一致，只有全部数据验证通过才能上传成功",
            	        $(this.$el).find(".plscTitle"));
            },
	        plscmbTitle:function(){
            	layer.tips("请严格按照模板填充数据，注意模板中的提示信息",$(this.$el).find(".plscmbTitle"));
            },
            downloadTemplate:function(){
            	//下载模板
            	$.download("sjdx/getMb.do?dxdm="+this._data.sjdx.dxdm,{});
            },
	        expe:function(){
	            ExportExcel.saveAsExcel(this.$root.listPage,this.sjdx.dxmc+"-当前页",this.dcpcl);
	        },
	        expeAll:function(){
	            ExportExcel.exportAll(this.$root.listPage,this.sjdx.dxmc+"-全部",this.dcpcl);
	        },
	          qxByQxm : function (qxm){
					var user = this._data.user;
					return user.qxMap[user.map[this.sjdx.dxdm]+"_"+qxm];
				},
	          lbymkz:function (kznr){
	              var k = fromdata[kznr];
	              if(!k&&this._data.kzxx.lbymkz){
	                  k = this._data.kzxx.lbymkz[kznr];
	              }
	              return k;
	          },
	        fieldBt:function(field){
	            //判断是否必填
	            field.btzt = (this.lbkbj=='1'&&field.bjbt=='1');
	            field.lbkbj=(this.lbkbj=='1');
	            return field;
	        },
		    fval:function(row,field){
		        if(row[field.zddm]){
		            return row[field.zddm];
		        }else{
		            return field.xzmrz;
		        }
		    },
            setval:function(field,event){
                this.fromdata[field.zddm] = event.val;
                if(event.target.mc){
                    this.fromdata['map.'+field.zddm]=event.mc;
                }
                console.log(field.zdmc + "=" + this.fromdata[field.zddm]); 
             },
             setZyVal:function(field,event){
	              this.fromdata[event.owner+field.zddm] = event.val;
	              if(event.target.mc){
	                  this.fromdata['map.'+event.owner+field.zddm]=event.mc;
	              }
              	console.log(event.owner+field.zdmc + "=" + this.fromdata[event.owner+field.zddm]); 
           	},
             lbmssetval:function(field,event){
                this.fromdata[field.zddm] = event.val;
                if(event.target.mc){
                    this.fromdata['map.'+field.zddm]=event.mc;
                }
                console.log(field.zdmc + "=" + this.fromdata[field.zddm]); 
             },
             setvalTh:function(field,event){
                 var _this = this;
                 var ed = _this.listEditData;
                 for(var i=0;i<ed.length;i++){
                     event.ri=i;
                     _this.setvalList(field, event,_this);
                     _this.rows[i][field.zddm]=event.val;
                 }
             },
             setvalList:function(field,event,_this){
                 if(!_this){
                     _this = this;
                 }
                var r = event.ri;
                if(_this.listEditData[r][field.zddm]||_this.listPage.rows[r][field.zddm]!=event.val){
                    if(field.zdywlb!='99'&&!_this.listEditData[r][field.zddm]){
                        //非虚拟字段
                        Vue.set(_this.listEditData[r],'my-ybj',"1");
                    }
                    Vue.set(_this.listEditData[r],field.zddm,event.val);
                    if(event.mc){
                        _this.listEditData[r]['map.'+field.zddm]=event.mc;
                    }
                    console.log(r+"-"+field.zdmc+ "=" + _this.listEditData[r][field.zddm]);
                }
              },
	        plcl:function(cllx,_this,options){
	            if(!_this){
		            _this = this;
	            }
	            if(!options){
	                options={};
	            }
                var ed = _this.listEditData;
                var ids = "";
                for(var i=0;i<ed.length;i++){
					if(ed[i]['my-lbxz']=='1'){
					    ids=ids+","+ed[i][_this.sjdx.zjzd];
					}
                }
                //选择的id为空且需列表行
                if(ids==""&&!(options.bxlbh==false)){
                    alertError("请选择要操作行");
                    return;
                }
                options['e_ids']=ids.substring(1);
                if(options.plczqt){
                    return options.plczqt(options['e_ids']);
                }
                options.id=_this.sjdx.id;
                options['e_cllx']=cllx;
            	var loadindex = layer.load(0,{
            		shade: [0.3]
            	});
            	var end = options.end;
            	options.end = null;
	            ajax('sjdx/plcl.do',{
	                fromdata:options,
	                qrts:options.qrts,
	                success:function(data){
	                    if(end){
	                        end(data,_this);
	                    }else{
	        	   		 	_this.listPage.queryPage(); //执行页面刷新函数 
	                    }
		                layer.close(loadindex);
	                },
	                error:function(data){
	                    if(end){
	                        end(data,_this);
	                    }
		                layer.close(loadindex);
	                },
	                qxbtn:function(){
		                layer.close(loadindex);
	                }
	            });
	        },
            sjplsc:function(field,e){
                this.plcl("sjplsc",null,{"e_file":JSON.stringify(e.rep),"bxlbh":false,"qrts":false,
                    end:function(data,_this){
                    	if(!data.status&&data.code=='sjnrcw'){
                    		popUpFullWinLayer({"url":"sjdx/list.do?dxdm=SYS_LOG_SJSCCW&e_sjwj="+e.val,
                    	        "name":"数据上传错误信息列表"});
                    	}else{
	        	   		 	_this.listPage.queryPage(); //执行页面刷新函数 
                    	}
                    }});
            },
              saveListData:function(){
                  var _this = this;
                  var _params = $.extend({},fromdata, {id:_this._data.sjdx.id});
                  if(!myValidFrom(_this,'saveList')){
                      return;
                  }
                  _params.myparams = JSON.stringify({"listEditData":_this.listEditData});
	              ajax("sjdx/saveListData.do",{fromdata:_params,
	                  success:function(data){
		    			  _this.listPage.refreshPage();
		              }
	              });
              },
              reloadTree:function(){
                  var _this = this;
                  var zTree = $.fn.zTree.getZTreeObj('leftTree-'+_this.sjdx.id),
					type = "refresh",
					silent = false,
					nodes = zTree.getSelectedNodes();
					if (nodes.length == 0) {
						alertInfo("请先选择一个父节点");
					}
					for (var i=0, l=nodes.length; i<l; i++) {
						zTree.reAsyncChildNodes(nodes[i], type, silent);
						if (!silent) zTree.selectNode(nodes[i]);
					}
              },
              initTree:function(){
                    var _this = this;
		            if(!_this.lbymkz("my-istree")){
		                return;
		            }
		            var fjd = "fjd";
		            if(_this.lbymkz("fjdzddm")){
		                fjd = _this.lbymkz("fjdzddm");
		            }
                  	var setting = {
              			data: {
              				simpleData: {
              					enable: true
              				}
              			},
              			view:{
          				    fontCss: setNode,
              			    showLine:true,
              			    showIcon:true,
              			    nameIsHTML:true
              			},
              			async: {
              				enable: true,
              				url:"sjdx/getdata.do?dxdm="+_this.sjdx.dxdm,
              				autoParam:["dm=e_"+fjd],
              				otherParam:{"e_cllx":"getTreeCN"},
              				dataFilter: treefilter
              			},
              			callback: {
            				beforeAsync: beforeAsync,
            				onAsyncSuccess: onAsyncSuccess,
              				onClick: treeClick,
              				onCheck: zTreeOnCheck
              			}
              		};
                  	var treeSetting = this.lbymkz("treeSetting");
                  	if(treeSetting){
                  		setting = $.extend({},setting, treeSetting);
                  	}
					//树节点的单击事件
	          		function treeClick(event, treeId, treeNode, clickFlag) {
	          		    if(!treeNode.sjdx){
	          		        //没有配置数据对象的节点
	          		    }else{
		          		    //请求节点对应的数据对象的查询条件，进行展示。
		          		    if(!treeNode.isCxx){
				            	var loadindex = layer.load(0,{
				            		shade: [0.3]
				            	});
				            	//获取查询项
		        	            ajax('sjdx/getdata.do',{
		        	                fromdata:{"dxdm":_this.sjdx.dxdm,"e_cllx":"hqcxx","e_sjdx":treeNode.sjdx},
		        	                qrts:false,
		        	                jgts:false,
		        	                success:function(data){
		        	                    //生成查询项
		        	                    if(data.status){
		        						    _this.xzcxx.push({
		        	                            "zydm":treeNode.dm,
		        	                            "sjdx":treeNode.sjdx,
		        	                            "zymc":treeNode.name,
		        	                            "show":true,
		        	                            "cxx":data.data.list
		        	                    	});
		        						    treeNode.isCxx = 1;
		        	                    }else{
			        						alertError("获取查询项失败:"+data.msg);
		        	                    }
		        		                layer.close(loadindex);
		        	                },
		        	                error:function(data){
		        						alertError("获取查询项失败:"+data);
		        		                layer.close(loadindex);
		        	                }
		        	            });
		          		    }else if(treeNode.isCxx == 1){
    						    treeNode.isCxx = 2;
		          		        //移除对应的查询项
		          		        for(var idx in _this.xzcxx){
		          		            var zy = _this.xzcxx[idx];
		          		            if(zy.zydm==treeNode.dm){
		          		              	//delete _this.xzcxx.splice(idx, 1);
		          		              	zy.show=false;
		          		            }
		          		        }
		          		    }else if(treeNode.isCxx == 2){
    						    treeNode.isCxx = 1;
		          		        //移除对应的查询项
		          		        for(var idx in _this.xzcxx){
		          		            var zy = _this.xzcxx[idx];
		          		            if(zy.zydm==treeNode.dm){
		          		              	zy.show=true;
		          		            }
		          		        }
		          		    }
		          		    
	          		    }
					    
	          		}
	          		function zTreeOnCheck(event, treeId, treeNode) {
	          			var zys = _this.zys;
	          			var cns = zys.getChangeCheckedNodes();
	          			var changeNodes = [];
	          			for(var idx in cns){
	          			    var cn = cns[idx];
	          			    changeNodes.push({zAsync:cn.zAsync,sjdx:cn.sjdx,dm:cn.dm,mc:cn.name});
	          			}
	          			_this.fromdata.xzcxx = changeNodes;
	          			
	          		};
	          		//处理后台返回的数据
	          		function treefilter(treeId, parentNode, rep) {
	          			if (!rep.status) return null;
	          			var list = rep.data.list;
	          			for (var i=0, l=list.length; i<l; i++) {
	          				list[i].isParent=(list[i].parent>0)
	          			}
	          			return list;
	          		}
	          		//节点展示前的处理
	                function setNode(treeId, node) {
	                    if(node.myIcon){
	                        node.name='<i class="icon '+node.myIcon+'" style="color:red;"></i> '+node.name;
	                    }
	                    if(node.icon){
	                        node.icon=getDownloadUrl()+"?id="+node.icon;
	                    }
	          			return {};
	          		}
	                this.zys = $.fn.zTree.init($('#leftTree-'+_this.sjdx.id), setting);
					//全部展开
	    			var zTree = this.zys;
					function asyncNodes(nodes) {
						if (!nodes) return;
						for (var i=0, l=nodes.length; i<l; i++) {
							if (nodes[i].isParent && nodes[i].zAsync) {
								asyncNodes(nodes[i].children);
							} else {
								zTree.reAsyncChildNodes(nodes[i], "refresh", true);
							}
						}
					}
					var curAsyncCount = 0, asyncForAll = false;
					function beforeAsync() {
						curAsyncCount++;
					}
					
					function onAsyncSuccess(event, treeId, treeNode, msg) {
						curAsyncCount--;
						if(!treeNode){
						    asyncNodes(zTree.getNodes());
						}else{
							asyncNodes(treeNode.children);
						}
					}
              }
        },
        mounted: function () {
            var _this = this;
            this.listPage.setPageId("#"+this.$el.id);
            this.listPage.paramType = "jsonStr";
            this.listPage.listFrom = _this;
            //不需要分页
            this.listPage.pageSize = 5000;
            this.listPage.exportUrl = "sjdx/export.do?dxdm="+_this.sjdx.dxdm;
            this.listPage.fytjxs = _this.sjdx.fytjxs;
            if(typeof(initPage)=='function'){
                initPage(this.listPage);
            }
            this.listPage.callback = function(data){
                var rows = data.list;
                _this.listEditData = [];
                if(rows){
                    for(var i=0;i<rows.length;i++){
         	              var p = {};
       	              p[_this.sjdx.zjzd]=rows[i][_this.sjdx.zjzd];
                        _this.listEditData.push(p);
                        rows[i]['my-lbxz']='0';
                      }
                }
            }
            if(!(_this.sjdx.cscx=='0')){
                this.listPage.queryPage();
            }
            //初始化左侧树
            _this.initTree();
       		//水印
           	watermark({"watermark_txt":_this._data.user.yhxm+","+_this._data.user.sfzh});
       		if(this.lbymkz("my-tzgg")){
       		    var url = serviceAddr+"sjdx/edit.do?pagemodel=details&dxdm=SYS_SJGL_GRBJ_ZS&e_id="+this.lbymkz("my-tzgg");
       			popUpWinLayer({url:url,name:"通知公告"});
       		}
        }
  });
</script>

</jsp:body>
</gd:sjdxList>