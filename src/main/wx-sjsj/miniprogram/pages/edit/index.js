import util from '../../common/util';
const app = getApp()

Component({
  properties: {
    //对象代码
    dxdm: String,
    //记录主键
    id: String,
    //页面模式
    pageModel: String
  },
  data: {
    action: 'sjdx/save.do?dxdm=',
    zdMap: {},
    jcxx: {},
    updatedata: {},
    error: ""
  },
  lifetimes: {
    attached: function () {
      var _this = this;
      _this.getData();
    },
    ready:function(){
      var _this = this;
      setTimeout(function(){
        _this.setData({
          jcxx: _this.data.jcxx,
        });
      },2000)
    }
  },
  methods: {
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
      var dm = _this.data.zdMap[field.zdzdlb+'_list'][e.detail.value].dm;
      _this.data.jcxx.obj[field.zddm] = dm;
      _this.data.updatedata[field.zddm] = dm;
      _this.setData({
        jcxx: _this.data.jcxx,
        updatedata: _this.data.updatedata
      });
    },
    getData: function () {
      var _this = this;
      wx.request({
        url: app.globalData.serviceAddr + 'sjdx/jcxx.do?e_cllx=jcxx',
        data: {
          dxdm: _this.data.dxdm,
          token: app.globalData.token,
          e_id: _this.data.id
        },
        async success(res) {
          if (res.data.status) {
            var data = res.data.data;
            for (var f in data.fields) {
              var field = data.fields[f];
              if (field.kjlx == 'dict' || field.kjlx == 'checkbox') {
                var zdzdlb = field.zdzdlb;
                if (zdzdlb) {
                  //加载字典列表
                  if(field.zdfy=='0'){
                    await util.zdMap(app.globalData, zdzdlb).then(async function (zdMap) {
                      _this.data.zdMap[zdzdlb] = zdMap;
                      await util.zdList(app.globalData, zdzdlb).then(function (zdList) {
                        _this.data.zdMap[zdzdlb+'_list'] = zdList;
                      });
                    });
                  }else{
                    await util.zdMcByDmMore(app.globalData, zdzdlb, data.obj[field.zddm])
                      .then(function (mc) {
                        data.obj[field.zddm+'_mc']=mc;
                    });
                  }
                }
              }
            }
            var zjzd = data.sjdx.zjzd;
            var zj = data.obj[zjzd];
            if (zj) {
              _this.data.updatedata[zjzd] = zj;
              data.action += _this.data.dxdm + '&e_cllx=update';
            } else {
              data.action += _this.data.dxdm + '&e_cllx=insert';
            }
            _this.setData({
              zdMap: _this.data.zdMap,
              updatedata: _this.data.updatedata,
              action: _this.data.action,
              jcxx: data
            });
          } else {
            console.log('获取记录失败:' + res.data.msg);
            wx.showToast({
              title: "获取记录失败！",
              icon: 'error'
            });
          }
        },
        fail(res) {
          console.log('获取记录失败！' + res.errMsg);
          wx.showToast({
            title: "获取记录失败！",
            icon: 'error'
          });
        }
      });
    },
  }
})