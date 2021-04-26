import CustomPage from '../../common/CustomPage';
import util from '../../common/util';
//index.js
const app = getApp()

CustomPage({
  data: {
    //数据加载中
    loading: false,
    //数据列表
    xtlb: [],
  },
  lifetimes: {
    attached: function () {
      this.getXtlb();
    },
  },
  methods: {
    /**
     * 获取功能列表
     */
    getXtlb() {
      const that = this;
      that.setData({
        loading:true
      });
      wx.request({
        url: app.globalData.serviceAddr + 'sjdx/getdata.do?dxdm=SYS_QX_QTQX',
        data: {
          "e_cllx": "getQtxt",
          "token": app.globalData.token
        },
        success(res) {
          if(res.data.status){
            that.setData({
              xtlb: res.data.data.list
            });
          }else{
            console.log('查询失败！' + res.errMsg);
            wx.showToast({
              title: "查询失败！",
              icon: 'error'
            });
          }
          that.setData({
            loading:false
          });
        }
      });
    }
  }
})