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
      var that = this;
      that.getData();
    },
    ready:function(){
      var that = this;
      setTimeout(function(){
        that.setData({
          jcxx: that.data.jcxx,
        });
      },2000)
    }
  },
  methods: {
    submitForm: function () {
      var that = this;
      var udaptedata = that.data.updatedata;
      var fields = that.data.jcxx.fields;
      //验证成功
      var yzcg = true;
      var msg = null;
      if (that.data.pageModel == 'edit') {
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
      } else if (that.data.pageModel == 'add') {
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
          url: app.globalData.serviceAddr + that.data.action,
          data: {
            dxdm: that.data.dxdm,
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
                url: '/pages/list/index?pageModel=list&dxdm=' + that.data.dxdm
              })
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
    quxiao: function () {
      var that = this;
      wx.navigateBack();
    },
    bindInputChange: function (e) {
      var that = this;
      var field = e.currentTarget.dataset.field;
      that.data.updatedata[field.zddm] = e.detail.value;
    },
    bindSwitchChange: function (e) {
      var that = this;
      var field = e.currentTarget.dataset.field;
      var val = e.detail.value?'1':'0';
      that.data.updatedata[field.zddm] = val;
    },
    dictSelected:function(dictObj){
      var that = this;
      var field = that.data.dictField;
      that.data.jcxx.obj[field.zddm] = dictObj.dm;
      that.data.jcxx.obj[field.zddm+'_mc'] = dictObj.mc;
      that.data.updatedata[field.zddm] = dictObj.dm;
      that.setData({
        jcxx: that.data.jcxx,
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
        dictField:ds.field
      });
      wx.navigateTo({
        url: '/pages/list/index?pageModel=list&dxdm=SYS_SJGL_TYZD_SEARCH&objStr=' 
          + JSON.stringify({cxtj:{zdlb:ds.field.zdzdlb}})
      })

    },
    bindDictChange: function (e) {
      var that = this;
      var field = e.currentTarget.dataset.field;
      var dm = that.data.zdMap[field.zdzdlb+'_list'][e.detail.value].dm;
      that.data.jcxx.obj[field.zddm] = dm;
      that.data.updatedata[field.zddm] = dm;
      that.setData({
        jcxx: that.data.jcxx,
        updatedata: that.data.updatedata
      });
    },
    getData: function () {
      var that = this;
      wx.request({
        url: app.globalData.serviceAddr + 'sjdx/jcxx.do?e_cllx=jcxx',
        data: {
          dxdm: that.data.dxdm,
          token: app.globalData.token,
          e_id: that.data.id
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
                      that.data.zdMap[zdzdlb] = zdMap;
                      await util.zdList(app.globalData, zdzdlb).then(function (zdList) {
                        that.data.zdMap[zdzdlb+'_list'] = zdList;
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
              that.data.updatedata[zjzd] = zj;
              data.action += that.data.dxdm + '&e_cllx=update';
            } else {
              data.action += that.data.dxdm + '&e_cllx=insert';
            }
            that.setData({
              zdMap: that.data.zdMap,
              updatedata: that.data.updatedata,
              action: that.data.action,
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