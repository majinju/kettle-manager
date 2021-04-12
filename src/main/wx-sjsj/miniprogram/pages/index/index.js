//index.js
const app = getApp()

Page({
  data: {
    userInfo: {},
    gnlb:[],
    hasUserInfo: false,
    canIUseGetUserProfile: false
  },

  onLoad: function() {
    this.setData({
      hasLogin: app.globalData.hasLogin,
      serviceAddr:app.globalData.serviceAddr
    });
    if (wx.getUserProfile) {
      this.setData({
        canIUseGetUserProfile: true
      })
    }
    this.login();

  },
  login() {
    const that = this;
    if(that.hasLogin){
      console.log("之前已登陆");
      that.getUserInfo(app.globalData.token);
    }else{
      wx.login({
        success(res) {
          if (res.code) {
            app.globalData.hasLogin = true
            app.globalData.token = res.code;
            that.setData({
              hasLogin: true
            });
            that.getUserInfo(res.code);
          } else {
            console.log('登录失败！' + res.errMsg);
            wx.showToast({
              title: "登录失败！",
              icon: 'error',
              duration: 3000
             });
          }
        }
      });
    }
  },
  /**
   * 从服务器获取用户信息
   * @param {*} token 登陆凭证
   */
  getUserInfo(token){
    const that = this;
    wx.request({
      url: app.globalData.serviceAddr+'sjdx/plcl.do?dxdm=SYS_QX_YHXX_MRDL&e_cllx=wxdl',
      data: {
        token: token
      },
      success(res){
        var u = res.data.data;
        that.setData({
          userInfo: u,
          hasUserInfo: true
        });
        that.getGnlb();
      }
    });
  },
  /**
   * 获取功能列表
   */
  getGnlb(e){
    const that = this;
    var gnlb = that.data.gnlb;
    var fqx="";
    var datas = {};
    if(e){
      datas = e.currentTarget.dataset;
      fqx=datas.qxdm;
      if(gnlb[datas.index].open){
        gnlb[datas.index].open = false;
      }else{
        gnlb[datas.index].open = true;
      }
    }
    if(!e||!gnlb[datas.index].zqxlb){
      wx.request({
        url: app.globalData.serviceAddr+'sjdx/getdata.do?dxdm=SYS_QX_QTQX',
        data: {
          "e_cllx": "getTreeCN",
          "e_treeModel": "cds",
          "e_treeRoot": "KFZFW",
          "e_fqx":fqx,
          "token":app.globalData.token
        },
        success(res){
          if(gnlb.length==0){
              gnlb=res.data.data.list;
          }else{
              gnlb[datas.index].zqxlb=res.data.data.list;
          }
          that.setData({
            gnlb: gnlb
          });
        }
      });
    }else{
      that.setData({
        gnlb: gnlb
      });
    }
  },
  getUserProfile(e) {
    const that = this
    // 推荐使用wx.getUserProfile获取用户信息，开发者每次通过该接口获取用户个人信息均需用户确认
    // 开发者妥善保管用户快速填写的头像昵称，避免重复弹窗
    wx.getUserProfile({
      desc: '用于完善会员资料', // 声明获取用户个人信息后的用途，后续会展示在弹窗中，请谨慎填写
      success: (res) => {
        this.setData({
          userInfo: res.userInfo,
          hasUserInfo: true
        });
        //保存用户信息，下次直接使用本系统用户信息，因为每次请求用户信息都会要求用户同意。
        wx.request({
          url: app.globalData.serviceAddr+'sjdx/plcl.do?dxdm=SYS_QX_YHXX_YHZC_WX&e_cllx=wx-save-user-info',
          data: {
            token: app.globalData.token,
            e_wxyhxx: res.userInfo
          },
          header: {
            "Accept": "application/json;charset=utf-8",
            'content-type':'application/json;charset=utf-8' // 默认值
          },
          success(res){
            console.info(res.data.msg);
            if(res.data.status){
              var u = res.data.data;
              that.setData({
                userInfo: u,
                hasUserInfo: true
              });
            }else{
              wx.showToast({
                title: res.data.msg,
                icon: 'error',
                duration: 3000
               })
            }
          }
        })
      }
    })
  }
})
