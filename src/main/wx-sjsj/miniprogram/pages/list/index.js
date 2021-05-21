import CustomPage from '../../common/CustomPage';
/**工具集 */
import util from '../../common/util';
/**
 * 应用
 */
const app = getApp();

CustomPage({
  properties: {
    //对象代码
    dxdm: String,
    /**配置对象字符串 */
    objStr:{
      type:String,
      value:'{}'
    },
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
    /**列表编辑修改的信息 */
    updatedata:{},
    /**错误提示 */
    error: "",
    //查询条件
    cxtj:{},
    //保存条件
    bctj:{},
    /**应用公用数据 */
    appgd:{},
    /**基础信息 */
    jcxx: null,
    user:null,
    lbcz:{},
  },
  computed: {
    /**列表操作项 */
    lbczx:function(data){
      var user = data.user;
      var dxdm = data.dxdm;
      var czList = [{ text: '刷新数据', value: 'sxsj' }];
      czList.push({ text: data.xxlbms?'简洁模式':'详细模式', value: 'qhlbms' });
      if(!user){
        return czList;
      }
      var authCode = data.jcxx.sjdx.map.authCode;
      if(user.qxMap[authCode+'_XZQX']){
        czList.push({ text: '新建记录', value: 'add' });
      }
      if(user.qxMap[authCode+'_BJMS']&&data.lbkbj&&data.xxlbms){
        czList.push({ text: '保存数据', value: 'bcsj' });
      }
      if(user.qxMap[authCode+'_BJMS']&&data.xxlbms){
        czList.push({ text: data.lbkbj?'取消编辑模式':'编辑模式', value: 'lbkbj' });
      }
      return czList;
    }
  },
  lifetimes: {
    attached:async function () {
      var _this = this;
      _this.init();
      await _this.getJcxx().then(function(data){
        _this.setData({
          jcxx: data,
          user: app.globalData.userInfo,
          appgd: app.globalData,
        });
        if(data.kzxx.lbymkz){
          //合并现有参数、对象中配置的参数、外部传入的参数
          Object.assign(_this.data,data.kzxx.lbymkz,JSON.parse(_this.data.objStr));
          _this.setData(_this.data);
        }
      });
      this.getList();
    },
  },
  methods: {
    /**初始化 */
    init:function(){
      var _this = this;
      //合并传入的配置信息
      Object.assign(_this.data,JSON.parse(_this.data.objStr));
    },
    /**获取基础信息 */
    getJcxx: function () {
      var _this = this;
      return new Promise(async (resolve, reject) => {
        //优先使用缓存
        var data = app.globalData.sjdxJcxx[_this.data.dxdm];
        if(!data){
          wx.request({
            url: app.globalData.serviceAddr + 'sjdx/jcxx.do?e_cllx=jcxx',
            data: {
              dxdm: _this.data.dxdm,
              token: app.globalData.token
            },
            async success(res) {
              if (res.data.status) {
                data = res.data.data;
                delete data.user;
                for (var f in data.fields) {
                  var field = data.fields[f];
                  if ((field.kjlx == 'dict' || field.kjlx == 'checkbox')) {
                    var zdzdlb = field.zdzdlb;
                    if (zdzdlb) {
                      //加载字典列表
                      await util.zdMap(app.globalData, zdzdlb).then(function (zdMap) {});
                    }
                  }
                }
                //设置缓存
                app.globalData.sjdxJcxx[_this.data.dxdm] = data;
                wx.setStorageSync('static.sjdxJcxx', app.globalData.sjdxJcxx);
                wx.setStorageSync('static.zdListCache', app.globalData.zdListCache);
                wx.setStorageSync('static.zdMapCache', app.globalData.zdMapCache);
                //回调
                resolve(data);
              } else {
                console.log('获取基础失败:' + res.data.msg);
                wx.showToast({
                  title: res.data.msg,
                  icon: 'error'
                });
                reject(res);
              }
            },
            fail(res) {
              console.log('获取基础失败！' + res.errMsg);
              wx.showToast({
                title: res.errMsg,
                icon: 'error'
              });
              reject(res);
            }
          });
        }else{
          resolve(data);
        }
      });
    },
    saveListData:function(){
      var _this = this;
      var updatedata = _this.data.updatedata;
      if(Object.keys(updatedata).length==0){
        wx.showToast({
          title: '没有修改信息',
          icon: 'info'
        });
        return;
      }
      var bctjByRow = _this.data.bctjByRow;
      var pageData = _this.data.pageData;
      var fields = _this.data.jcxx.fields;
      var sjdx = _this.data.jcxx.sjdx;
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
        Object.assign(row,_this.data.bctj);
        le.push(row);
      }
      if (yzcg) {
        wx.request({
          url: app.globalData.serviceAddr + "sjdx/saveListData.do",
          // method:'POST',
          data: {
            dxdm: _this.data.dxdm,
            token: app.globalData.token,
            myparams: JSON.stringify({"listEditData":le})
          },
          success(res) {
            if (res.data.status) {
              wx.showToast({
                title: res.data.msg,
                icon: 'info'
              });
              _this.setData({
                  updatedata:{}
              });
            } else {
              console.log('保存记录失败！' + res);
              _this.setData({
                error: res.data.msg
              })
            }
          },
          fail(res) {
            console.log('保存记录失败！' + res);
            _this.setData({
              error: res.data.msg
            })
          }
        });
      } else {
        _this.setData({
          error: msg
        });
      }

    },
    getList: function (event) {
      var _this = this;
      if (event) {
        _this.setData({
          //搜索重置页号
          pageIndex: 1,
          moreData: true,
          //重置数据
          pageData: [],
          //获取搜索值
          searchKey: event.detail.value
        });
      }
      _this.setData({
        loading: true
      });
      wx.request({
        url: app.globalData.serviceAddr + 'sjdx/page.do?e_cllx=list&e_yxx=1',
        data: {
          dxdm: _this.data.dxdm,
          token: app.globalData.token,
          e_searchKey: _this.data.searchKey,
          myparams:JSON.stringify(_this.data.cxtj),
          autoCount: false,
          pageIndex: _this.data.pageIndex
        },
        async success(res) {
          if (res.data.status) {
            var data = res.data.data;
            if (data.list.length < 10 || data.list.length == 0) {
              _this.setData({
                moreData: false
              });
            }
            //字典翻译
            var fields = _this.data.jcxx.fields;
            for(var row in data.list){
              for (var f in fields) {
                var field = fields[f];
                if ((field.kjlx == 'dict' || field.kjlx == 'checkbox')) {
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
            _this.setData({
              pageData: _this.data.pageData.concat(data.list)
            });
          } else {
            console.log('查询失败:' + res.data.msg);
            wx.showToast({
              title: res.data.msg,
              icon: 'error'
            });
          }
          _this.setData({
            loading: false
          });
        },
        fail(res) {
          console.log('查询失败！' + res.errMsg);
          wx.showToast({
            title: res.errMsg,
            icon: 'error'
          });
          _this.setData({
            loading: false
          });
        }
      });
    },
    /**下拉刷新 */
    onPullDownRefresh() {
      var _this = this;
      _this.setData({
          scts: false,
          //搜索重置页号
          pageIndex: 1,
          moreData: true,
          //重置数据
          pageData: [],
      });
      _this.getList();
      wx.stopPullDownRefresh();
    },
    /**上拉获取数据 */
    onReachBottom: function() {
      // 页面触底时执行
      this.loadmore();
    },
    /**打开操作列表 */
    dkczlb:function(){
      this.setData({
        showCzDialog: true
      });
    },
    /**操作项处理 */
    czClick:function(e){
      var _this = this;
      var czlx = e.detail.value;
      switch(czlx){
        case 'add':
          _this.add();
          break;
        case 'qhlbms':
          _this.setData({
            xxlbms: (!_this.data.xxlbms)
          });
          break;
        case 'lbkbj':
          _this.setData({
            lbkbj: (!_this.data.lbkbj)
          });
          break;
        case 'bcsj':
          _this.saveListData();
          break;
        case 'sxsj':
          _this.onPullDownRefresh();
          _this.getList();
          break;
        case 'plsc':
        default:
          wx.showToast({
            title: '暂未实现',
            icon: 'info'
          });
      }
      //关闭操作列表
      _this.setData({
        showCzDialog:false
      });
    },
    bindInputChange: function (e) {
      var _this = this;
      var field = e.currentTarget.dataset.field;
      var rownum = e.currentTarget.dataset.rownum;
      var ur = _this.data.updatedata[rownum];
      if(!ur){
        ur = {};
        _this.data.updatedata[rownum] = ur;
      }
      ur[field.zddm] = e.detail.value;
      _this.data.pageData[rownum][field.zddm] = ur[field.zddm];
    },
    bindSwitchChange: function (e) {
      var _this = this;
      var field = e.currentTarget.dataset.field;
      var rownum = e.currentTarget.dataset.rownum;
      var ur = _this.data.updatedata[rownum];
      if(!ur){
        ur = {};
        _this.data.updatedata[rownum] = ur;
      }
      ur[field.zddm] = e.detail.value?'1':'0';
      _this.data.pageData[rownum][field.zddm] = ur[field.zddm];
    },
    dictSelected:function(dictObj){
      var _this = this;
      var field = _this.data.dictField;
      var rownum = _this.data.dictRownum;
      var ur = _this.data.updatedata[rownum];
      if(!ur){
        ur = {};
        _this.data.updatedata[rownum] = ur;
      }
      ur[field.zddm] = dictObj.dm;
      _this.data.pageData[rownum][field.zddm] = dictObj.dm;
      _this.data.pageData[rownum][field.zddm+'_mc'] = dictObj.mc;
      _this.setData({
        pageData: _this.data.pageData,
        updatedata: _this.data.updatedata
      });
    },
    dictSelect:function(e){
      var _this = this;
      var ds = e.currentTarget.dataset;
      if(ds.disabled){
        //当前不可选择
        return;
      }
      _this.setData({
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
      var _this = this;
      var field = e.currentTarget.dataset.field;
      var rownum = e.currentTarget.dataset.rownum;
      var ur = _this.data.updatedata[rownum];
      if(!ur){
        ur = {};
        _this.data.updatedata[rownum] = ur;
      }
      var dm = app.globalData.zdMapCache[field.zdzdlb][e.detail.value].dm;
      ur[field.zddm] = dm;
      _this.data.pageData[rownum][field.zddm] = dm;
      _this.setData({
        pageData: _this.data.pageData,
        updatedata: _this.data.updatedata
      });
    },
    /**新建记录 */
    add: function () {
      wx.navigateTo({
        url: '/pages/edit/index?pageModel=add&dxdm=' + this.data.dxdm
      })
    },
    /**执行列表操作项 */
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
    /**删除记录提示 */
    scjlts: function (e) {
      var ds = e.currentTarget.dataset;
      this.setData({
          scts: true,
          /**待删除记录 */
          dscjl: ds.id
      });
    },
    /**取消：删除记录提示 */
    qxscjlts: function (e) {
      this.setData({
          scts: false
      });
    },
    /**删除记录 */
    scjl: function (e) {
      var _this = this;
      wx.request({
        url: app.globalData.serviceAddr + 'sjdx/plcl.do?e_cllx=plsc',
        data: {
          dxdm: _this.data.dxdm,
          token: app.globalData.token,
          e_ids: _this.data.dscjl
        },
        success(res) {
          if (res.data.status) {
            wx.showToast({
              title: res.data.msg,
              icon: 'info'
            });
            _this.setData({
                scts: false,
                //搜索重置页号
                pageIndex: 1,
                moreData: true,
                //重置数据
                pageData: [],
            });
            _this.getList();
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
    /**加载更多数据 */
    loadmore: function () {
      var _this = this;
      if(_this.data.moreData){
        _this.setData({
          //下一页
          pageIndex: _this.data.pageIndex + 1
        });
        this.getList();
      }
    },
  }
})