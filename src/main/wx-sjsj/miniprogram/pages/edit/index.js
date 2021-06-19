/**工具集 */
import util from '../../common/util';
/**
 * 应用
 */
const app = getApp();

Component({
  properties: {
    //对象代码
    dxdm: String,
    //记录主键
    id: String,
    //页面模式
    pageModel: String,
    /**配置对象字符串 */
    objStr:{
      type:String,
      value:'{}'
    },
  },
  data: {
    action: 'sjdx/save.do',
    updatedata: {},
    error: "",
    appgd:{},
    /**基础信息 */
    jcxx: null,
    user:null,
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
        if(data.kzxx.bjymkz){
          //合并现有参数、对象中配置的参数、外部传入的参数
          Object.assign(_this.data,data.kzxx.bjymkz,JSON.parse(_this.data.objStr));
          _this.setData(_this.data);
        }
      });
      _this.getList();
    },
    ready:function(){
      var _this = this;
      //解决部分安卓机的大文本框高度计算异常问题
      setTimeout(function(){
        _this.setData({
          jcxx: _this.data.jcxx,
        });
      },2000)
    }
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
    getList: function () {
      var _this = this;
      if(!_this.data.id){
        //没有id不查询
        _this.data.jcxx.obj={};
        _this.setData({
          jcxx: _this.data.jcxx
        });
        return;
      }
      var myparams = {};
      var zjzd = _this.data.jcxx.sjdx.zjzd;
      myparams[zjzd]=_this.data.id;
      wx.request({
        url: app.globalData.serviceAddr + 'sjdx/page.do?e_cllx=list',
        data: {
          dxdm: _this.data.dxdm,
          token: app.globalData.token,
          myparams:JSON.stringify(myparams),
          autoCount:false,
          pageIndex:1
        },
        async success(res) {
          if (res.data.status) {
            var data = res.data.data;
            //字典翻译
            var fields = _this.data.jcxx.fields;
            var row = data.list[0];
            for (var f in fields) {
              var field = fields[f];
              if ((field.kjlx == 'dict' || field.kjlx == 'checkbox')) {
                var zdzdlb = field.zdzdlb;
                if (zdzdlb) {
                  await util.zdMcByDmMore(app.globalData, zdzdlb, row[field.zddm])
                    .then(function (mc) {
                      row[field.zddm+'_mc']=mc;
                  });
                }
              }
            }
            var zj = row[zjzd];
            if (zj) {
              _this.data.updatedata[zjzd] = zj;
            }
            _this.data.jcxx.obj=row;
            _this.setData({
              updatedata: _this.data.updatedata,
              jcxx: _this.data.jcxx
            });
          } else {
            console.log('查询失败:' + res.data.msg);
            wx.showToast({
              title: res.data.msg,
              icon: 'error'
            });
          }
        },
        fail(res) {
          console.log('查询失败！' + res.errMsg);
          wx.showToast({
            title: res.errMsg,
            icon: 'error'
          });
        }
      });
    },
    submitForm: function () {
      var _this = this;
      var udaptedata = _this.data.updatedata;
      var fields = _this.data.jcxx.fields;
      //验证成功
      var yzcg = true;
      var msg = null;
      if (_this.data.pageModel == 'edit') {
        //编辑
        for (var fd in udaptedata) {
          var field = fields[fd];
          var msg = util.myGzyz(app.globalData, udaptedata[fd], field.hdyzgz, field);
          if (msg != null) {
            msg = field.zdmc + ':' + msg;
            yzcg = false;
            break;
          }
        }
      } else if (_this.data.pageModel == 'add') {
        //新增
        for (var fd in fields) {
          var field = fields[fd];
          if (field.xzzs == '1') {
            var msg = util.myGzyz(app.globalData, udaptedata[fd], field.hdyzgz, field);
            if (msg != null) {
              msg = field.zdmc + ':' + msg;
              yzcg = false;
              break;
            }
          }
        }
      }
      if (yzcg) {
        wx.request({
          url: app.globalData.serviceAddr + _this.data.action,
          data: {
            dxdm: _this.data.dxdm,
            token: app.globalData.token,
            myparams: udaptedata
          },
          success(res) {
            if (res.data.status) {
              wx.showToast({
                title: res.data.msg,
                icon: 'info'
              });
              wx.navigateTo({
                url: '/pages/list/index?pageModel=list&dxdm=' + _this.data.dxdm
              })
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
    quxiao: function () {
      var _this = this;
      wx.navigateBack();
    },
    bindInputChange: function (e) {
      var _this = this;
      var field = e.currentTarget.dataset.field;
      _this.data.updatedata[field.zddm] = e.detail.value;
    },
    bindSwitchChange: function (e) {
      var _this = this;
      var field = e.currentTarget.dataset.field;
      var val = e.detail.value?'1':'0';
      _this.data.updatedata[field.zddm] = val;
    },
    dictSelected:function(dictObj){
      var _this = this;
      var field = _this.data.dictField;
      _this.data.jcxx.obj[field.zddm] = dictObj.dm;
      _this.data.jcxx.obj[field.zddm+'_mc'] = dictObj.mc;
      _this.data.updatedata[field.zddm] = dictObj.dm;
      _this.setData({
        jcxx: _this.data.jcxx,
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
        dictField:ds.field
      });
      wx.navigateTo({
        url: '/pages/list/index?pageModel=list&dxdm=SYS_SJGL_TYZD_SEARCH&objStr=' 
          + JSON.stringify({cxtj:{zdlb:ds.field.zdzdlb}})
      })

    },
    bindDictChange: function (e) {
      var _this = this;
      var field = e.currentTarget.dataset.field;
      var dm = app.globalData.zdListCache[field.zdzdlb][e.detail.value].dm;
      _this.data.jcxx.obj[field.zddm] = dm;
      _this.data.updatedata[field.zddm] = dm;
      _this.setData({
        jcxx: _this.data.jcxx,
        updatedata: _this.data.updatedata
      });
    },
  },
})