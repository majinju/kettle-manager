import CustomPage from '../../common/CustomPage';
import util from '../../common/util';
// const aTmpl = require('template_js');

const app = getApp()

CustomPage({
  properties: {
    //对象代码
    dxdm: String,
    objStr:{
      type:String,
      value:'{}'
    }
  },
  data: {
    //数据加载中
    loading: false,
    //删除提示
    scts:false,
    //更多数据
    moreData: true,
    //页号
    pageIndex: 1,
    //搜索条件
    searchKey: "",
    //数据列表
    pageData: [],
    zdMap: {},
    jcxx: null,
    user:null,
    slideButtons: [{
      type: 'warn',
      text: '删除',
      extClass: 'test',
      src: global.isDemo ? '/page/weui/example/cell/icon_del.svg' : '/example/cell/icon_del.svg', // icon的路径
    }],
    //操作列表弹窗
    showCzDialog: false,
    xxlbms:true,
    //列表可编辑
    lbkbj:false,
    updatedata:{},
    error: "",
    //查询条件
    cxtj:{},
    //保存条件
    bctj:{}
  },
  computed: {
    lbczx:function(data){
      var czList = [{ text: '刷新数据', value: 'sxsj' }
                    ];
      czList.push({ text: data.xxlbms?'简洁模式':'详细模式', value: 'qhlbms' });
      if(data.user==null){
        return czList;
      }
      if(data.user.qxMap[data.user.map[data.jcxx.sjdx.dxdm]+'_XZQX']){
        czList.push({ text: '新建记录', value: 'add' });
      }
      if(data.user.qxMap[data.user.map[data.jcxx.sjdx.dxdm]+'_BJMS']&&data.lbkbj&&data.xxlbms){
        czList.push({ text: '保存数据', value: 'bcsj' });
      }
      if(data.user.qxMap[data.user.map[data.jcxx.sjdx.dxdm]+'_BJMS']&&data.xxlbms){
        czList.push({ text: data.lbkbj?'取消编辑模式':'编辑模式', value: 'lbkbj' });
      }
      return czList;
    }
  },
  lifetimes: {
    attached:async function () {
      this.init();
      await this.getJcxx();
      this.getList();
    },
  },
  methods: {
    onPullDownRefresh() {
      var that = this;
      that.setData({
          scts: false,
          //搜索重置页号
          pageIndex: 1,
          moreData: true,
          //重置数据
          pageData: [],
      });
      that.getList();
      wx.stopPullDownRefresh();
    },
    onReachBottom: function() {
      // 页面触底时执行
      this.loadmore();
    },
    init:function(){
      var that = this;
      Object.assign(that.data,JSON.parse(that.data.objStr));
    },
    dkczlb:function(){
      this.setData({
        showCzDialog: true
      });
    },
    czClick:function(e){
      var that = this;
      var czlx = e.detail.value;
      switch(czlx){
        case 'add':
          this.add();
          break;
        case 'qhlbms':
          this.setData({
            xxlbms: (!this.data.xxlbms)
          });
          break;
        case 'lbkbj':
          this.setData({
            lbkbj: (!this.data.lbkbj)
          });
          break;
        case 'bcsj':
          this.saveListData();
          break;
        case 'sxsj':
          that.onPullDownRefresh();
          that.getList();
          break;
        case 'plsc':
        default:
          wx.showToast({
            title: '暂未实现',
            icon: 'info'
          });
      }
      this.setData({
        showCzDialog:false
      });
    },
    saveListData:function(){
      var that = this;
      var updatedata = that.data.updatedata;
      var bctjByRow = that.data.bctjByRow;
      if(Object.keys(updatedata).length==0){
        wx.showToast({
          title: '没有修改信息',
          icon: 'info'
        });
        return;
      }
      var pageData = that.data.pageData;
      var fields = that.data.jcxx.fields;
      var sjdx = that.data.jcxx.sjdx;
      //验证成功
      var yzcg = true;
      var msg = null;
      var le = [];
      for(var rownum in updatedata){
        var row = updatedata[rownum];
        for(var fd in row){
          var field = fields[fd];
          var msg = util.myGzyz(app.globalData, row[fd], field.hdyzgz, field);
          if (msg != null) {
            msg = field.zdmc + ':' + msg;
            yzcg = false;
            break;
          }
        }
        row['my-ybj']='1';
        row[sjdx.zjzd]=pageData[rownum][sjdx.zjzd];
        for(var i in bctjByRow){
          row[i] = pageData[rownum][bctjByRow[i]];
        }
        Object.assign(row,that.data.bctj);
        le.push(row);
      }
      if (yzcg) {
        wx.request({
          url: app.globalData.serviceAddr + "sjdx/saveListData.do",
          // method:'POST',
          data: {
            dxdm: that.data.dxdm,
            token: app.globalData.token,
            myparams: JSON.stringify({"listEditData":le})
          },
          success(res) {
            if (res.data.status) {
              wx.showToast({
                title: res.data.msg,
                icon: 'info'
              });
              that.setData({
                  updatedata:{}
              });
            } else {
              console.log('保存记录失败！' + res);
              that.setData({
                error: res.data.msg
              })
            }
          },
          fail(res) {
            console.log('保存记录失败！' + res);
            that.setData({
              error: res.data.msg
            })
          }
        });
      } else {
        that.setData({
          error: msg
        });
      }

    },
    bindInputChange: function (e) {
      var that = this;
      var field = e.currentTarget.dataset.field;
      var rownum = e.currentTarget.dataset.rownum;
      var ur = that.data.updatedata[rownum];
      if(!ur){
        ur = {};
        that.data.updatedata[rownum] = ur;
      }
      ur[field.zddm] = e.detail.value;
      that.data.pageData[rownum][field.zddm] = ur[field.zddm];
    },
    bindSwitchChange: function (e) {
      var that = this;
      var field = e.currentTarget.dataset.field;
      var rownum = e.currentTarget.dataset.rownum;
      var ur = that.data.updatedata[rownum];
      if(!ur){
        ur = {};
        that.data.updatedata[rownum] = ur;
      }
      ur[field.zddm] = e.detail.value?'1':'0';
      that.data.pageData[rownum][field.zddm] = ur[field.zddm];
    },
    dictSelected:function(dictObj){
      var that = this;
      var field = that.data.dictField;
      var rownum = that.data.dictRownum;
      var ur = that.data.updatedata[rownum];
      if(!ur){
        ur = {};
        that.data.updatedata[rownum] = ur;
      }
      ur[field.zddm] = dictObj.dm;
      that.data.pageData[rownum][field.zddm] = dictObj.dm;
      that.data.pageData[rownum][field.zddm+'_mc'] = dictObj.mc;
      that.setData({
        pageData: that.data.pageData,
        updatedata: that.data.updatedata
      });
    },
    dictSelect:function(e){
      var that = this;
      var ds = e.currentTarget.dataset;
      if(ds.disabled){
        //当前不可选择
        return;
      }
      that.setData({
        //当前进行字典选择的字段
        dictField:ds.field,
        dictRownum:ds.rownum
      });
      wx.navigateTo({
        url: '/pages/list/index?pageModel=list&dxdm=SYS_SJGL_TYZD_SEARCH&objStr=' 
          + JSON.stringify({cxtj:{zdlb:ds.field.zdzdlb}})
      })

    },
    bindDictChange: function (e) {
      var that = this;
      var field = e.currentTarget.dataset.field;
      var rownum = e.currentTarget.dataset.rownum;
      var ur = that.data.updatedata[rownum];
      if(!ur){
        ur = {};
        that.data.updatedata[rownum] = ur;
      }
      var dm = that.data.zdMap[field.zdzdlb+'_list'][e.detail.value].dm;
      ur[field.zddm] = dm;
      that.data.pageData[rownum][field.zddm] = dm;
      that.setData({
        pageData: that.data.pageData,
        updatedata: that.data.updatedata
      });
    },
    add: function () {
      wx.navigateTo({
        url: '/pages/edit/index?pageModel=add&dxdm=' + this.data.dxdm
      })
    },
    zxczx:function(e){
      var ds = e.currentTarget.dataset;
      var url = ds.czx.url;
      if(url=='navigateBack'){
        let tempPage = getCurrentPages(); // 当前页变量
        let prevPage = tempPage[tempPage.length - 2]; // 上一页变量
        prevPage[ds.czx.call](ds.row);
        //返回
        wx.navigateBack();
        return;
      }
      var row = ds.row;
      var obj = ds.czx.obj;
      var qqtj = ds.czx.qqtj;
      var cxtj = obj.cxtj;
      var bctj = obj.bctj;
      //查询条件
      for(var i in cxtj){
        cxtj[i]=row[cxtj[i]];
      }
      //保存条件
      for(var i in bctj){
        bctj[i]=row[bctj[i]];
      }
      //请求条件
      for(var i in qqtj){
        url+="&"+i+"="+row[qqtj[i]];
      }
      wx.navigateTo({
        url: url+"&objStr="+JSON.stringify(obj)
      })
    },
    scjlts: function (e) {
      var ds = e.currentTarget.dataset;
      this.setData({
          scts: true,
          dscjl: ds.id
      });
    },
    qxscjlts: function (e) {
      this.setData({
          scts: false
      });
    },
    scjl: function (e) {
      var that = this;
      wx.request({
        url: app.globalData.serviceAddr + 'sjdx/plcl.do?e_cllx=plsc',
        data: {
          dxdm: that.data.dxdm,
          token: app.globalData.token,
          e_ids: that.data.dscjl
        },
        success(res) {
          if (res.data.status) {
            wx.showToast({
              title: res.data.msg,
              icon: 'info'
            });
            that.setData({
                scts: false,
                //搜索重置页号
                pageIndex: 1,
                moreData: true,
                //重置数据
                pageData: [],
            });
            that.getList();
          } else {
            console.log(res.data.msg);
            wx.showToast({
              title: res.data.msg,
              icon: 'error'
            });
          }
        }
      });
    },
    loadmore: function () {
      var that = this;
      if(that.data.moreData){
        that.setData({
          //下一页
          pageIndex: that.data.pageIndex + 1
        });
        this.getList();
      }
    },
    getJcxx: function () {
      var that = this;
      return new Promise(async (resolve, reject) => {
        wx.request({
          url: app.globalData.serviceAddr + 'sjdx/jcxx.do?e_cllx=jcxx',
          data: {
            dxdm: that.data.dxdm,
            token: app.globalData.token
          },
          async success(res) {
            if (res.data.status) {
              var data = res.data.data;
              for (var f in data.fields) {
                var field = data.fields[f];
                if (field.lbzs=='1'&&(field.kjlx == 'dict' || field.kjlx == 'checkbox')) {
                  var zdzdlb = field.zdzdlb;
                  if (zdzdlb) {
                    //加载字典列表
                    await util.zdMap(app.globalData, zdzdlb).then(async function (zdMap) {
                      that.data.zdMap[zdzdlb] = zdMap;
                      await util.zdList(app.globalData, zdzdlb).then(async function (zdList) {
                        that.data.zdMap[zdzdlb+'_list'] = zdList;
                      });
                    });
                  }
                }
              }
              that.setData({
                zdMap: that.data.zdMap,
                jcxx: data,
                user:data.user
              });
              if(data.kzxx.lbymkz){
                //合并现有参数、对象中配置的参数、外部传入的参数
                Object.assign(that.data,data.kzxx.lbymkz,JSON.parse(that.data.objStr));
                that.setData(that.data);
              }
            } else {
              console.log('获取基础失败:' + res.data.msg);
              wx.showToast({
                title: res.data.msg,
                icon: 'error'
              });
            }
            resolve();
          },
          fail(res) {
            console.log('获取基础失败！' + res.errMsg);
            wx.showToast({
              title: res.errMsg,
              icon: 'error'
            });
            reject();
          }
        });
      });
    },
    getList: function (event) {
      var that = this;
      if (event) {
        that.setData({
          //搜索重置页号
          pageIndex: 1,
          moreData: true,
          //重置数据
          pageData: [],
          //获取搜索值
          searchKey: event.detail.value
        });
      }
      that.setData({
        loading: true
      });
      wx.request({
        url: app.globalData.serviceAddr + 'sjdx/page.do?e_cllx=list&e_yxx=1',
        data: {
          dxdm: that.data.dxdm,
          token: app.globalData.token,
          e_searchKey: that.data.searchKey,
          myparams:JSON.stringify(that.data.cxtj),
          autoCount: false,
          pageIndex: that.data.pageIndex
        },
        async success(res) {
          if (res.data.status) {
            var data = res.data.data;
            if (data.list.length < 10 || data.list.length == 0) {
              that.setData({
                moreData: false
              });
            }
            //字典翻译
            var fields = that.data.jcxx.fields;
            for(var row in data.list){
              for (var f in fields) {
                var field = fields[f];
                if (field.lbzs=='1'&&(field.kjlx == 'dict' || field.kjlx == 'checkbox')) {
                  var zdzdlb = field.zdzdlb;
                  if (zdzdlb) {
                    await util.zdMcByDmMore(app.globalData, zdzdlb, data.list[row][field.zddm])
                      .then(function (mc) {
                        data.list[row][field.zddm+'_mc']=mc;
                    });
                  }
                }
              }
            }
            that.setData({
              pageData: that.data.pageData.concat(data.list)
            });
          } else {
            console.log('查询失败:' + res.data.msg);
            wx.showToast({
              title: res.data.msg,
              icon: 'error'
            });
          }
          that.setData({
            loading: false
          });
        },
        fail(res) {
          console.log('查询失败！' + res.errMsg);
          wx.showToast({
            title: res.errMsg,
            icon: 'error'
          });
          that.setData({
            loading: false
          });
        }
      });
    },
  }
})