import util from '../../common/util';
const app = getApp()

Component({
  properties: {
    //对象代码
    dxdm: String,
    //记录主键
    id: String,
    //页面模式
    pageModel:String
  },
  data: {},
  lifetimes: {
    attached: function () {
      this.getData();
    },
  },
  methods: {
    getData: function () {
      var that = this;
      wx.request({
        url: app.globalData.serviceAddr + 'sjdx/jcxx.do?e_cllx=jcxx',
        data: {
          dxdm:that.data.dxdm,
          token: app.globalData.token,
          e_id: that.data.id
        },
        success(res) {
          if (res.data.status) {
            var data = res.data.data;
            util.zdMcByDm(app.globalData, 'SYS_COMMON_LJPD', data.obj.yxx).then(function (mc) {
              data.obj.yxx = mc;
              util.zdMcByDm(app.globalData, 'SHRMYY_JCXX_KSXX', data.obj.ks).then(function (mc) {
                data.obj.ks = mc;
                util.zdMcByDm(app.globalData, 'SHRMYY_HLB_ZLJCZBLB', data.obj.zblb).then(function (mc) {
                  data.obj.zblb = mc;
                  that.setData({
                    jcxx: data
                  });
                });
              });
            });
          } else {
            console.log('获取记录失败:' + res.msg);
            wx.showToast({
              title: "获取记录失败！",
              icon: 'error',
              duration: 3000
            });
          }
        },
        fail(res) {
          console.log('获取记录失败！' + res.errMsg);
          wx.showToast({
            title: "获取记录失败！",
            icon: 'error',
            duration: 3000
          });
        }
      });
    },
  }
})