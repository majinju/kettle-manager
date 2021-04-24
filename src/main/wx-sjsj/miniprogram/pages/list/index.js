import CustomPage from '../../common/CustomPage';
import util from '../../common/util';
//index.js
const app = getApp()

CustomPage({
  properties: {
    //对象代码
    dxdm: String,
  },
  data: {
    //数据加载中
    loading:false,
    //更多数据
    moreData:true,
    //页号
    pageIndex:1,
    //搜索条件
    searchKey:"",
    //数据列表
    pageData:[],
    slideButtons: [{
      type: 'warn',
      text: '删除',
      extClass: 'test',
      src: global.isDemo ? '/page/weui/example/cell/icon_del.svg' : '/example/cell/icon_del.svg', // icon的路径
    }]
  },
  lifetimes: {
    attached: function () {
      this.getList();
    },
  },
  methods: {
    add:function(){
      wx.navigateTo({url: '/pages/edit/index?pageModel=add&dxdm='+this.data.dxdm})
    },
    loadmore:function(){
      var that = this;
      that.setData({
        //下一页
        pageIndex:that.data.pageIndex+1
      });
      this.getList();
    },
    getList:function(event){
      var that = this;
      if(event){
        that.setData({
          //搜索重置页号
          pageIndex:1,
          moreData:true,
          //重置数据
          pageData:[],
          //获取搜索值
          searchKey:event.detail.value
        });
      }
      that.setData({
        loading:true
      });
      wx.request({
        url: app.globalData.serviceAddr+'sjdx/page.do?e_cllx=list&e_yxx=1',
        data: {
          dxdm:that.data.dxdm,
          token: app.globalData.token,
          e_searchKey:that.data.searchKey,
          autoCount:false,
          pageIndex:that.data.pageIndex
        },
        success(res){
          if(res.data.status){
            var data = res.data.data;
            if(data.list.length<10||data.list.length==0){
              that.setData({
                moreData:false
              });
            }
            that.setData({
              pageData:that.data.pageData.concat(data.list)
            });
          }else{
            console.log('查询失败:' + res.msg);
            wx.showToast({
              title: "查询失败！",
              icon: 'error',
              duration: 3000
             });
          }
          that.setData({
            loading:false
          });
        },
        fail(res){
          console.log('查询失败！' + res.errMsg);
          wx.showToast({
            title: "查询失败！",
            icon: 'error',
            duration: 3000
           });
           that.setData({
             loading:false
           });
        }
      });
    },
  },
})
