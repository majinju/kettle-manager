//app.js
App({
  onLaunch: function () {
    if (!wx.cloud) {
      console.error('请使用 2.2.3 或以上的基础库以使用云能力')
    } else {
      wx.cloud.init({
        // env 参数说明：
        //   env 参数决定接下来小程序发起的云开发调用（wx.cloud.xxx）会默认请求到哪个云环境的资源
        //   此处请填入环境 ID, 环境 ID 可打开云控制台查看
        //   如不填则使用默认环境（第一个创建的环境）
        // env: 'my-env-id',
        traceUser: true,
      })
    }

    //serviceAddr:"http://127.0.0.1:88/myservice/"
    this.globalData = {
      //服务端地址
      serviceAddr:"https://my.benma666.cn:85/myservice/",
      //菜单根节点
      cdRoot:"SHRMYY",
      //这个值整个导航栏的高度
      navigationBarHeight:0,
      //状态栏的高度
      statusBarHeight:wx.getSystemInfoSync()['statusBarHeight'],
      hasLogin:false,
      token:"",
      //字典列表缓存
      zdListCache:{},
      //字典名称列表缓存
      zdmcListCache:{}
    }
    this.topBarHeight();
  },
	topBarHeight(){
	    var {top,height} = wx.getMenuButtonBoundingClientRect(); //胶囊按钮的位置
    	var statusH = wx.getSystemInfoSync()['statusBarHeight']; //状态栏的位置
    	var meneStatusHeight = top - statusH; //状态栏到胶囊按钮的距离
    	var navigationBarHeight = statusH + height + meneStatusHeight * 2; //整个头部导航栏：状态栏+状态栏距离胶囊按钮的距离*2+胶囊按钮的高度
    	this.globalData.navigationBarHeight = navigationBarHeight;
	}
})
