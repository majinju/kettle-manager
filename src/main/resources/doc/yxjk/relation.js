/**
 * 关系图数据格式
 * @param {string} name 图表节点名称
 * @param {string} id 图表节点唯一标识
 * @param {Array} children 图表节点关系子集
 */

// 子集数据
var mockData = {
 "name": "flare",
 "id": "flare",
 "children": [
  {
   "name": "animate",
   "id": "animate",
   "children": [
    {"name": "Easing","id": "Easing"},
    {"name": "FunctionSequence", "id": "FunctionSequence"},
    {
     "name": "interpolate",
     "id": "interpolate",
     "children": [
      {"name": "ArrayInterpolator","id": "ArrayInterpolator"},
      {"name": "ColorInterpolator","id": "ColorInterpolator",'children': [{'name': '豆腐干豆腐干','id': '豆腐干豆腐干','children': [{'name': 's手动阀手动阀','id': 's手动阀手动阀', 'children': [{'name': '啊撒旦范德萨舍得','id': '啊撒旦范德萨舍得'}]}]}]},
      {"name": "DateInterpolator","id": "DateInterpolator"}
     ]
    },
    {"name": "ISchedulable","id": "ISchedulable"},
    {"name": "Parallel","id": "Parallel"},
    {"name": "Pause", "id": "Pause"},
    {"name": "Scheduler","id": "Scheduler"},
    {"name": "Tween","id": "Tween"}
   ]
  }
 ]
}

// 父级数据
var mockData2 = {
 "name": "flare",
 "id": "flare",
 "children": [
  {
   "name": "analytics",
   "id": "analytics",
   "children": [
    {
     "name": "cluster",
     "id": "cluster",
     "children": [
      {"name": "AgglomerativeCluster","id": "AgglomerativeCluster"},
      {"name": "CommunityStructure","id": "CommunityStructure"},
      {"name": "HierarchicalCluster","id": "HierarchicalCluster"},
      {"name": "MergeEdge","id": "MergeEdge"}
     ]
    },
    {
     "name": "graph",
     "id": "graph",
     "children": [
      {"name": "BetweennessCentrality","id": "BetweennessCentrality"},
      {"name": "LinkDistance","id": "LinkDistance"},
      {"name": "MaxFlowMinCut", "id": "MaxFlowMinCut"},
      {"name": "ShortestPaths", "id": "ShortestPaths"},
      {"name": "SpanningTree", "id": "SpanningTree"}
     ]
    },
    {
     "name": "optimization",
     "id": "optimization",
     "children": [
      {"name": "AspectRatioBanker","id": "AspectRatioBanker",'children': [{"name": "tree", "id": "tree"}]}
     ]
    }
   ]
  }
 ]
}

// 第一组数据为右边树图数据，第二组数据为左边树图数据
var data = [mockData, mockData2];

/**
 * 关系图实例化
 * @param {string} selector 选择器
 * @param {Object} menuOption 右键菜单配置项，格式：[{'name': '添加','callback': callback}],方式具体看底部函数
 */
// 实例化图表，默认会有添加关系节点事件
var relationCharts = new Relation('relation');
/**
 * <id,jkrw>便于后续通过id获取任务对象
 */
var rwMap = {};
/**
 * 得到被依赖关系
 */
var ylMap = {};
window.onload=function(){
    var loadindex = layer.load(0,{
        shade: [0.3]
    });
    // 图标区块阻止浏览器默认窗口
    relationCharts.stopDefaultMenu();
    $.ajax({
        url : basicUrl+"sjdx/page.do?dxdm=SYS_YXJK_JKRW",
        type : "post",
        async :true,
        data : {
            pageSize:10000,
            pageIndex:1,
            autoCount:false
        },
        dataType : "json",
        success : function(result) {
            var list = result.data.list;
            //获取关系map
            for(var idx in list){
                //<id,jkrw>便于后续通过id获取任务对象
                rwMap[list[idx].id]=list[idx];
                if(list[idx].ylrw){
                    //得到被依赖关系
                    var ylArr = list[idx].ylrw.split(",");
                    for(var ylIdx in ylArr){
                        var ylList = ylMap[ylArr[ylIdx]];
                        if(!ylList){
                            ylList = [];
                            ylMap[ylArr[ylIdx]] = ylList;
                        }
                        ylList.push(list[idx]);
                    }
                }
            }
            //构建根节点
            var jdid = getUrlString("jdid");
            var rwdx = rwMap[jdid];
            dqjd={"name": rwdx.rwmc,
                    "id": rwdx.id,
				    "zt":rwdx.rwzt,
                    "rwdx":rwdx,
                    "children": []};
            data[0]=dqjd;
            data[1]=clone(dqjd);
            //得到关系图
            zjgx(dqjd);
            fjgx(data[1]);
            // 更新数据调用函数
            relationCharts.render(data);
            layer.close(loadindex);
        },
        error : function() {
            alert("加载页面失败");
            layer.close(loadindex);
        }
    });
}
/**
 * 已展示父节点
 */
var yzsfjd = {};
/**
 * 得到父集关系
 */
function fjgx(dqjd){
    if(!dqjd.rwdx.ylrw){
        return;
    }
    var ylArr = dqjd.rwdx.ylrw.split(",");
    for(var ylIdx in ylArr){
        var rwdx = rwMap[ylArr[ylIdx]];
        if(!yzsfjd[rwdx.id]){
            yzsfjd[rwdx.id]=1;
        }else{
            yzsfjd[rwdx.id]++;
        }
        var jd={"name": yzsfjd[rwdx.id]+"_"+rwdx.rwmc,
                "id": yzsfjd[rwdx.id]+"_"+rwdx.id,
				"zt":rwdx.rwzt,
                "rwdx":rwdx,
                "children": []};
        dqjd.children.push(jd);
        fjgx(jd);
    }
}
/**
 * 已展示子节点 
 */
var yzszjd = {};
/**
 * 得到子级关系
 */
function zjgx(dqjd){
    var ylArr = ylMap[dqjd.rwdx.id];
    for(var ylIdx in ylArr){
        var rwdx = ylArr[ylIdx];
        if(!yzsfjd[rwdx.id]){
            yzsfjd[rwdx.id]=1;
        }else{
            yzsfjd[rwdx.id]++;
        }
        var jd={"name": yzsfjd[rwdx.id]+"_"+rwdx.rwmc,
                "id": yzsfjd[rwdx.id]+"_"+rwdx.id,
				"zt":rwdx.rwzt,
                "rwdx":rwdx,
                "children": []};
        dqjd.children.push(jd);
        yzszjd[rwdx.id]++;
        zjgx(jd);
    }
}
function Relation(dom, menuOption) {
  /* 初始化图表默认配置项 */
  var defaultOption = {
      tooltip: {
          trigger: 'item',
          triggerOn: 'mousemove',
          formatter: function(value) {
            value = value.name
            return value
          }
      },
      series: [
          {
            type: 'tree',
            name: 'tree1',
            data: [],
            top: '0%',
            left: '15%',
            bottom: '0%',
            right: '50%',
            orient: 'RL',
            symbol: 'arrow',
            symbolRotate: 270,
            symbolSize: 7,
            lineStyle: {
              color: '#ddc6aa'
            },
			grid: {
				containerLabel: true
			},
			// roam: true,
			itemStyle: {
				// 根据isNormal字段判断是否正常 正常为绿色 不正常为红色
				color: function (params) {
					//debugger
					return params.data.zt=='1' ? 'green' : 'red';
				},
				borderWidth: 0
			},
            label: {
                normal: {
                    position: 'left',
                    verticalAlign: 'middle',
                    align: 'right',
                    formatter: function (value) {
                      value = value.name
                      return (value.length > 14 ? (value.slice(0,12)+"...") : value )
                    }
                }
            },

            leaves: {
                label: {
                    normal: {
                        position: 'left',
                        verticalAlign: 'middle',
                        align: 'right'
                    }
                }
            },

            expandAndCollapse: true,
            initialTreeDepth: -1,

            animationDuration: 550,
            animationDurationUpdate: 750

        },
        {
            type: 'tree',
            name: 'tree2',
            data: [],
            top: '0%',
            left: '50%',
            bottom: '0%',
            right: '15%',
            orient: 'LR',
            symbol: 'arrow',
            symbolRotate: 270,
            symbolSize: 7,
            lineStyle: {
              color: '#ddc6aa'
            },
			itemStyle: {
				// 根据isNormal字段判断是否正常 正常为绿色 不正常为红色
				color: function (params) {
					return params.data.zt=='1' ? 'green' : 'red';
				},
				borderWidth: 0
			},
            label: {
                normal: {
                    position: 'left',
                    verticalAlign: 'middle',
                    align: 'right',
                    formatter: function (value) {
                      value = value.name
                      return (value.length > 14 ? (value.slice(0,12)+"...") : value )
                    },
                    triggerEvent: true
                }
            },

            leaves: {
                label: {
                    normal: {
                        position: 'right',
                        verticalAlign: 'middle',
                        align: 'left'
                    }
                }
            },

            expandAndCollapse: true,
            initialTreeDepth: -1,

            animationDuration: 550,
            animationDurationUpdate: 750
        }
      ]
  }
  /* 默认右键菜单 */
  var defaultMenuOption = [
    {
      'name': '添加',  // 菜单名
      'callback': callback // 菜单事件
    }
  ]

  this.dom = document.getElementById(dom)
  this.option = defaultOption
  this.menuOption = menuOption ? menuOption : defaultMenuOption

  /* 处理数据，基数行隐藏，偶数行展示 */
  this.dealData = function(data) {
    echarts.util.each(data.children, function (datum, index) {
      index % 2 === 0 && (datum.collapsed = true);
    });
  }

  /* 数据更新 */
  this.render = function(data) {
    // 绑定数据
    this.data = data
    this.option.series[0].data = [ data[1] ]
    this.option.series[1].data = [ data[0] ]

    this.myCharts = echarts.init(this.dom)
    this.myCharts.showLoading()

    this.myCharts.setOption(this.option)

    // 计算最适合宽度及高度，避免层级重叠显示
    var arr = this.myCharts._chartsViews
    var totalDepth = 0
    var allNode = 0
    arr.map(function(n,i){
      var nodesArr = n._data.tree._nodes
      var graphicEls = n._data._graphicEls;
      var depth,treeNode = 0
      nodesArr.map(function(d,j) {
        !j && (depth = d.depth)
        d.depth > depth && (depth = d.depth)
      })
      totalDepth += depth

      for(var m = 0; m < graphicEls.length; m ++){
         var node = graphicEls[m];
         if (node === undefined) {
            continue;
         }
         treeNode ++ 
      }
      treeNode > allNode && (allNode = treeNode)
    })

    var container = this.dom
    var containerWidth = this.dom.offsetWidth
    var containerHeight = this.dom.offsetHeight
    var currentHeight = 20 * allNode
    var newHeight = Math.max(currentHeight, containerHeight)
    container.style.height = newHeight + 'px'
    container.style.width = totalDepth * 250 + 'px'
    this.myCharts.resize()
    this.myCharts.hideLoading()

    document.querySelector('.relation-title').style.width = totalDepth * 250 + 'px'

    // 绑定菜单事件
    // 初始化右键菜单
    if (!this.menuOption.length) {
      return
    }
    this.initContentMenu(data);
    this.bindEvent();
  }

  /* 事件绑定 */
  this.bindEvent = function() {
    var self = this;
    // 鼠标右键事件
    this.myCharts.on('contextmenu', function(params) {
      event.preventDefault();
      self.setTiplocation(params.event.offsetX + 40, params.event.offsetY + 20, params);
    });

    // 鼠标左键点击画布关闭右键弹窗事件
    this.dom.onclick = function() {
      var tooltip = document.getElementById('relationTooltip');
      tooltip.setAttribute('style', 'display:none;');
    }
  }

  /* 获取鼠标当前位置，设置右键菜单位置 */
  this.setTiplocation = function(x, y, params) {
    var dom = document.getElementById('relationTooltip')
    dom.setAttribute('style', "top:"+y+"px;left:"+x+"px;display:block;");
    dom.childNodes.forEach(function(d) {
      d.setAttribute('data-id', params.data.id)
      d.setAttribute('data-tree', params.seriesName)
    })
  }

  /* 禁用该charts内浏览器自带的浏览器菜单事件 */
  this.stopDefaultMenu = function() {
    this.dom.oncontextmenu = function(e){
       return false;
    }
  }

  /* 初始化右键菜单 */
  this.initContentMenu = function(data) {
    var parent = document.createElement('div')
    parent.setAttribute('class', 'relation-tooltip')
    parent.setAttribute('id', 'relationTooltip')
    this.menuOption.map(function(d) {
      var span = document.createElement('span')
      span.innerHTML = d.name
      parent.appendChild(span)
      span.onclick = function() {
        d.callback()
      }
    })
    this.dom.appendChild(parent)
  }
}


var newData = [mockData2,mockData]
// 添加子集回调函数,直接获取添加节点后数据进行图表重新render
function callback() {
  console.log('xxx')
  relationCharts.render(newData)
}
