import CustomPage from '../../common/CustomPage';
/**
 * 应用
 */
const app = getApp();
/**
 * 首页组件
 */
Component({
  //外部传参
  properties: {
    /**
     * 菜单根节点
     */
    cdRoot: String,
    /**
     * 项目名称
     */
    projectName: String
  },
  data: {
    /**app公用参数 */
    appgd:{},
    /**操作列表弹窗 */
    showSzDialog: false,
    /**系统设置项列表 */
    szList: [{
        text: '切换系统',
        value: 'qhxt'
      },
      {
        text: '清空缓存',
        value: 'qkhc'
      }
    ],
    /**功能列表 */
    gnlb: [],
    /**打开的功能 */
    openGn:-1,
  },
  lifetimes: {
    attached: function () {
      const _this = this;
      //传参>存储>默认
      if (_this.data.cdRoot) {
        //传参：切换系统
        wx.setStorage('static.cdRoot', _this.data.cdRoot);
        wx.setStorage('static.projectName', _this.data.projectName);
        _this.setData({
          gnlb: [],
        });
        _this.getGnlb();
      } else{
        if (wx.getStorageSync('static.cdRoot')) {
          //之前切换过系统
          _this.setData({
            projectName: wx.getStorageSync('static.projectName'),
            cdRoot: wx.getStorageSync('static.cdRoot')
          });
        } else {
          //使用默认值系统
          _this.setData({
            projectName: app.globalData.projectName,
            cdRoot: app.globalData.cdRoot
          });
        }
        if(wx.getStorageSync('session.token')){
          app.globalData.token = wx.getStorageSync('session.token');
          _this.tokenYxx(app.globalData.token).then(function(data){
            //会话有效，从缓存加载
            app.globalData.userInfo = wx.getStorageSync('session.userInfo');
            app.globalData.sjdxJcxx = wx.getStorageSync('static.sjdxJcxx')||{};
            app.globalData.zdListCache = wx.getStorageSync('static.zdListCache')||{};
            app.globalData.zdMapCache = wx.getStorageSync('static.zdMapCache')||{};
            _this.setData({
              gnlb: wx.getStorageSync('session.gnlb'),
              openGn: wx.getStorageSync('session.openGn'),
              appgd: app.globalData,
            });
          }).catch(function(res){
            //会话失效
            _this.login();
          });
        }else{
          _this.login();
        }
      }
    },
  },
  methods: {
    /**
     * 登陆
     */
    login() {
      const _this = this;
      wx.login({
        success(res) {
          if (res.code) {
            app.globalData.token = res.code;
            wx.setStorageSync('session.token',res.code);
            _this.getUserInfo(res.code);
          } else {
            console.log('登录失败！' + res.errMsg);
            wx.showToast({
              title: res.errMsg,
              icon: 'error'
            });
          }
        }
      });
    },
    /**
     * 验证token有效性
     * @param {*} token 登陆凭证
     */
    tokenYxx(token) {
      const _this = this;
      return new Promise((resolve, reject) => {
        wx.request({
          url: app.globalData.serviceAddr + 'sjdx/page.do?dxdm=SYS_LOG_SJSCCW',
          data: {
            token: token,
            myparams: JSON.stringify({"authCode":"KFZFW_PTGL_SJSCCW","cllx":"list"}),
            autoCount: false,
            queryList: false
          },
          success(res) {
            if(res.data.status){
              resolve(res.data.data);
            }else{
              //按会话过期处理
              reject(res);
            }
          },
          fail(res) {
            console.log('验证登陆有效性失败！' + res.errMsg);
            wx.showToast({
              title: "验证登陆有效性失败！",
              icon: 'error',
              duration: 5000
            });
            reject(res);
          }
        });
      });
    },
    /**
     * 从服务器获取用户信息
     * @param {*} token 登陆凭证
     */
    getUserInfo(token) {
      const _this = this;
      wx.request({
        url: app.globalData.serviceAddr + 'sjdx/plcl.do?dxdm=SYS_QX_YHXX_MRDL&e_cllx=wxdl',
        data: {
          token: token,
          e_projectCode: app.globalData.projectCode
        },
        success(res) {
          if (res.data.status) {
            var u = res.data.data;
            if (u.wxyhxx) {
              //已注册用户
              u.wxyhxx = JSON.parse(u.wxyhxx);
            } else {
              //未注册的用户
              u.wxyhxx = {
                //默认头像
                avatarUrl: app.globalData.serviceAddr + 'common/download.do?xzms=false&id=777E25E5809D45BDBC8273DBC2D1FCB5'
              };
            }
            app.globalData.userInfo = u;
            wx.setStorageSync('session.userInfo',u);
            _this.setData({
              userInfo: u
            });
            _this.getGnlb();
          } else {
            console.log('请求失败:' + res.data.msg);
            wx.showToast({
              title: res.data.msg,
              icon: 'error'
            });
          }
        }
      });
    },
    /**
     * 获取功能列表
     */
    getGnlb(e) {
      const _this = this;
      var gnlb = _this.data.gnlb;
      var fqx = "";
      var datas = {};
      var openGn = _this.data.openGn;
      if (e) {
        datas = e.currentTarget.dataset;
        fqx = datas.qxdm;
        if(openGn==datas.index){
          openGn = -1;
        }else{
          openGn = datas.index;
        }
        wx.setStorageSync('session.openGn',openGn);
      }
      if (!e || !gnlb[datas.index].zqxlb) {
        wx.request({
          url: app.globalData.serviceAddr + 'sjdx/getdata.do?dxdm=SYS_QX_QTQX',
          data: {
            "e_cllx": "getTreeCN",
            "e_treeModel": "cds",
            "e_treeRoot": _this.data.cdRoot,
            "e_fqx": fqx,
            "token": app.globalData.token
          },
          success(res) {
            if (res.data.status) {
              if (gnlb.length == 0) {
                gnlb = res.data.data.list;
              } else {
                gnlb[datas.index].zqxlb = res.data.data.list;
              }
              _this.setData({
                gnlb: gnlb,
                appgd: app.globalData,
                openGn: openGn,
              });
              wx.setStorageSync('session.gnlb',gnlb);
            } else {
              console.log('请求失败:' + res.data.msg);
              wx.showToast({
                title: res.data.msg,
                icon: 'error'
              });
            }
          }
        });
      } else {
        _this.setData({
          openGn: openGn
        });
      }
    },
    /**
     * 点击注册：获取用户信息
     * @param {*} e 
     */
    getUserProfile(e) {
      const _this = this
      // 推荐使用wx.getUserProfile获取用户信息，开发者每次通过该接口获取用户个人信息均需用户确认
      // 开发者妥善保管用户快速填写的头像昵称，避免重复弹窗
      wx.getUserProfile({
        // 声明获取用户个人信息后的用途，后续会展示在弹窗中，请谨慎填写
        desc: '用于完善会员资料', 
        success: (res) => {
          //保存用户信息，下次直接使用本系统用户信息，因为每次请求用户信息都会要求用户同意。
          wx.request({
            url: app.globalData.serviceAddr + 'sjdx/plcl.do?dxdm=SYS_QX_YHXX_YHZC_WX&e_cllx=wx-save-user-info',
            data: {
              token: app.globalData.token,
              e_wxyhxx: res.userInfo
            },
            header: {
              "Accept": "application/json;charset=utf-8",
              'content-type': 'application/json;charset=utf-8' // 默认值
            },
            success(res) {
              console.info("保存用户信息情况："+res.data.msg);
              if (res.data.status) {
                var u = res.data.data;
                app.globalData.userInfo = u;
                wx.setStorageSync('session.userInfo',u);
                _this.setData({
                  userInfo: u,
                  //注册后重新获取功能列表
                  gnlb:[]
                });
                _this.getGnlb();
              } else {
                wx.showToast({
                  title: res.data.msg,
                  icon: 'error'
                })
              }
            }
          })
        }
      })
    },
    /**
     * 打开设置弹窗
     */
    dksz: function () {
      this.setData({
        showSzDialog: true
      });
    },
    /**
     * 设置项事件
     * @param {*} e 
     */
    szClick: function (e) {
      var szlx = e.detail.value;
      switch (szlx) {
        case 'qhxt':
          this.switchSystem();
          break;
        case 'qkhc':
          wx.clearStorageSync();
          wx.showToast({
            title: '清空缓存成功',
            icon: 'info'
          });
          break;
        default:
          wx.showToast({
            title: '暂未实现',
            icon: 'info'
          });
      }
      //关闭设置弹窗
      this.setData({
        showSzDialog: false
      });
    },
    /**
     * 切换系统
     */
    switchSystem: function () {
      wx.navigateTo({
        url: '/pages/switch-system/index'
      });
    },
  },
})