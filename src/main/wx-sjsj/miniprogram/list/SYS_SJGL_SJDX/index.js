//index.js
const app = getApp()

Page({
  data: {
  },
  onLoad: function() {
    this.setData({
      hasLogin: app.globalData.hasLogin,
      serviceAddr:app.globalData.serviceAddr
    });
  }
})
