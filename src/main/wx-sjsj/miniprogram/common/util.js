////////////////////////////////时间///////////////////////////
//添加指定的天数,并返回新的日期
Date.prototype.addDays = function (days) {
  var nd = new Date(this);
  nd.setDate(nd.getDate() + parseInt(days));
  return nd;
};
//添加指定的小时,并返回新的日期
Date.prototype.addHours = function (hours) {
  var nd = new Date(this);
  nd.setHours(nd.getHours() + parseInt(hours));
  return nd;
};
/**
 * 时间字符串解析为date
 * @param dataStr
 */
Date.parseDate = function (dateStr) {
  if (!dateStr) {
    return null;
  }
  if (dateStr instanceof Date) {
    //本身就是date类型
    return dateStr;
  }
  var d = new Date();
  if (dateStr.length == 8) {
    d.setFullYear(dateStr.substring(0, 4), dateStr.substring(4, 6) - 1, dateStr.substring(6, 8));
    d.setHours(0, 0, 0);
  } else if (dateStr.length == 10) {
    d.setFullYear(dateStr.substring(0, 4), dateStr.substring(5, 7) - 1, dateStr.substring(8, 10));
    d.setHours(0, 0, 0);
  } else if (dateStr.length == 12) {
    d.setFullYear(dateStr.substring(0, 4), dateStr.substring(4, 6) - 1, dateStr.substring(6, 8));
    d.setHours(str.substring(8, 10), dateStr.substring(10, 12), 0);
  } else if (dateStr.length == 14) {
    d.setFullYear(dateStr.substring(0, 4), dateStr.substring(4, 6) - 1, dateStr.substring(6, 8));
    d.setHours(dateStr.substring(8, 10), dateStr.substring(10, 12), dateStr.substring(12, 14));
  } else if (dateStr.length == 19) {
    d.setFullYear(dateStr.substring(0, 4), dateStr.substring(5, 7) - 1, dateStr.substring(8, 10));
    d.setHours(dateStr.substring(11, 13), dateStr.substring(14, 16), dateStr.substring(17, 19));
  }
  return d;
}
/**
 * 时间对象的格式化
 */
Date.prototype.format = function (format) {
  var o = {
    "M+": this.getMonth() + 1, // month
    "d+": this.getDate(), // day
    "H+": this.getHours(), // hour
    "m+": this.getMinutes(), // minute
    "s+": this.getSeconds(), // second
    "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
    "S": this.getMilliseconds()
  };

  if (/(y+)/.test(format)) {
    format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
  }

  for (var k in o) {
    if (new RegExp("(" + k + ")").test(format)) {
      format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
    }
  }
  return format;
};
/**
 * 时间格式化
 */
function dateFormat(dateStr, fmt) {
  var d = Date.parseDate(dateStr);
  if (d) {
    if (fmt == 'date') {
      //为时间对象时，传输中转为14位时间
      fmt = 'yyyyMMddHHmmss';
    }
    return d.format(fmt);
  } else {
    return "";
  }
}
////////////////////////////////时间///////////////////////////

////////////////////////////////字典///////////////////////////
/**
 * 获取字典列表
 * @param zdlb 字典类别
 */
function zdList(zdlb, globalData) {
  return new Promise((resolve, reject) => {
    var zdListCache = globalData.zdListCache;
    if (zdListCache[zdlb + "_cache"]) {
      //不支持获取列表
      resolve(null);
    }else if (zdListCache[zdlb] == null) {
      wx.request({
        url: globalData.serviceAddr + 'common/zdList.do',
        data: {
          token: globalData.token,
          "zdlb": zdlb
        },
        success(res) {
          if (res.data.status) {
            var data = res.data.data;
            zdListCache[zdlb] = data;
            resolve(zdListCache[zdlb]);
          } else {
            //不支持获取列表
            zdListCache[zdlb + "_cache"] = true;
            zdListCache[zdlb] = {};
            resolve(null);
          }
        },
        fail(res) {
          console.log('字典加载失败！' + res.errMsg);
          wx.showToast({
            title: "字典加载失败！",
            icon: 'error',
            duration: 3000
          });
          reject(res);
        }
      });
    }else{
      resolve(zdListCache[zdlb]);
    }
  });
}
/**
 * 获取字典对象
 * @param zdlb 字典类别
 * @param dm 字典代码
 */
function zdObj(globalData, zd, cache) {
  return new Promise((resolve, reject) => {
    var zdListCache = globalData.zdListCache;
    var zdlb = zd.zdlb;
    var dm = zd.dm;
    var obj = null;
    if (zdlb) {
      if (cache == undefined) {
        //默认走缓存
        cache = true;
      }
      this.zdList(zdlb, globalData).then(function (zl) {
        if (zl && cache) {
          //获取了字典列表
          for (var i in zl) {
            if (zl[i].dm == dm) {
              obj = zl[i];
              break;
            }
          }
          resolve(obj);
        } else if (zdListCache[zdlb][dm] && cache) {
          //该字典的具体字典项已经缓存。
          obj = zdListCache[zdlb][dm];
          resolve(obj);
        } else {
          zd['e_cache'] = cache;
          //不支持获取列表
          wx.request({
            url: globalData.serviceAddr + 'common/zdObj.do',
            data: zd,
            success(res) {
              if (res.data.status) {
                var data = res.data.data;
                zdListCache[zdlb][dm] = data;
                obj = data;
              } else {
                obj = {
                  "dm": dm,
                  "mc": dm
                };
                zdListCache[zdlb][dm] = obj;
              }
              resolve(obj);
            },
            fail(res) {
              console.log('字典加载失败！' + res.errMsg);
              wx.showToast({
                title: "字典加载失败！",
                icon: 'error',
                duration: 3000
              });
              reject(res);
            }
          });
        }
      });
    }else{
      resolve(null);
    }
  });
}
/**
 * 获取字典名称
 * @param zdlb 字典类别
 * @param dm 字典代码
 */
function zdMcByDm(globalData, zdlb, dm) {
  return new Promise((resolve, reject) => {
    this.zdObj(globalData, {
      zdlb: zdlb,
      dm: dm
    }).then(function (obj) {
      if (obj == null) {
        resolve(dm);
      } else {
        resolve(obj.mc);
      }
    });
  });
}
/**
 * 获取字典名称多个
 * @param zdlb 字典类别
 * @param dm 字典代码
 */
 function zdMcByDmMore(globalData, zdlb, dm) {
  var mc = "";
  if (dm) {
    var dms = (dm + "").split(",");
    for (var i = 0; i < dms.length; i++) {
      if (isEmpty(dms[i])) {
        mc += "、";
        continue;
      }
      mc += "、" + this.zdMcByDm(globalData, zdlb, dms[i]);
    }
  }
  return mc.substring(1);
}
////////////////////////////////字典///////////////////////////

module.exports = {
  dateFormat:dateFormat,
  zdMcByDm:zdMcByDm,
  zdMcByDmMore:zdMcByDmMore,
  zdObj:zdObj,
  zdList:zdList
}