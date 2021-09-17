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
 * 字典Map
 * @param globalData 全局变量
 * @param zdlb 字典类别
 */
function zdMap(globalData, zdlb) {
  return new Promise((resolve, reject) => {
    var zdMapCache = globalData.zdMapCache;
    if (zdMapCache[zdlb + "_cache"]) {
      //不支持获取列表
      resolve(null);
    } else if (zdMapCache[zdlb] == null) {
      zdList(globalData, zdlb).then(function (zl) {
        if(zl==null){
          zdMapCache[zdlb + "_cache"] = true;
          resolve(null);
        }else{
          var zdMap = {};
          for (var i in zl) {
            zl[i].idx = i;
            zdMap[zl[i].dm] = zl[i];
          }
          zdMapCache[zdlb] = zdMap;
          resolve(zdMap);
        }
      });
    } else {
      resolve(zdMapCache[zdlb]);
    }
  });
}
/**
 * 获取字典列表
 * @param globalData 全局变量
 * @param zdlb 字典类别
 */
function zdList(globalData, zdlb) {
  return new Promise((resolve, reject) => {
    var zdListCache = globalData.zdListCache;
    if (zdListCache[zdlb + "_cache"]) {
      //不支持获取列表
      resolve(null);
    } else if (zdListCache[zdlb] == null) {
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
    } else {
      resolve(zdListCache[zdlb]);
    }
  });
}
/**
 * 获取字典对象
 * @param globalData 全局变量
 * @param zdlb 字典类别
 * @param dm 字典代码
 */
function zdObj(globalData, zd, cache) {
  return new Promise((resolve, reject) => {
    var zdListCache = globalData.zdListCache;
    var zdlb = zd.zdlb;
    var dm = zd.dm;
    var mc = zd.mc;
    var obj = null;
    if (zdlb) {
      if (cache == undefined) {
        //默认走缓存
        cache = true;
      }
      zdList(globalData, zdlb).then(function (zl) {
        if (zl && cache) {
          //获取了字典列表
          if (dm) {
            for (var i in zl) {
              if (zl[i].dm == dm) {
                obj = zl[i];
                obj.idx = i;
                break;
              }
            }
          } else if (mc) {
            for (var i in zl) {
              if (zl[i].mc == mc) {
                obj = zl[i];
                obj.idx = i;
                break;
              }
            }
          }
          resolve(obj);
        } else if (zdListCache[zdlb][dm] && cache) {
          //该字典的具体字典项已经缓存。
          obj = zdListCache[zdlb][dm];
          resolve(obj);
        } else if (zdListCache[zdlb][mc] && cache) {
          //该字典的具体字典项已经缓存。
          obj = zdListCache[zdlb][mc];
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
                zdListCache[zdlb][data.dm] = data;
                zdListCache[zdlb][data.mc] = data;
                obj = data;
              } else if (dm) {
                obj = {
                  "dm": dm,
                  "mc": dm
                };
                zdListCache[zdlb][dm] = obj;
              } else if (mc) {
                obj = {
                  "dm": mc,
                  "mc": mc
                };
                zdListCache[zdlb][mc] = obj;
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
    } else {
      resolve(null);
    }
  });
}
/**
 * 获取字典名称
 * @param globalData 全局变量
 * @param zdlb 字典类别
 * @param dm 字典代码
 */
function zdMcByDm(globalData, zdlb, dm) {
  return new Promise((resolve, reject) => {
    zdObj(globalData, {
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
 * @param globalData 全局变量
 * @param zdlb 字典类别
 * @param dm 字典代码
 */
function zdMcByDmMore(globalData, zdlb, dm) {
  return new Promise(async (resolve, reject) => {
    if (dm) {
      var mcs = "";
      var dms = (dm + "").split(",");
      for (var i = 0; i < dms.length; i++) {
        if (isEmpty(dms[i])) {
          mcs += "、";
          continue;
        }
        await zdMcByDm(globalData, zdlb, dms[i]).then(function(mc){
          mcs += "、" + mc;
        });
      }
      resolve(mcs.substring(1));
    }else{
      resolve(dm);
    }
  });
}
/**
 * 获取字典名称
 * @param zdlb 字典类别
 * @param dm 字典代码
 */
function zdDmByMc(globalData, zdlb, mc) {
  return new Promise((resolve, reject) => {
    zdObj(globalData, {
      zdlb: zdlb,
      mc: mc
    }).then(function (obj) {
      if (obj == null) {
        resolve(mc);
      } else {
        resolve(obj.dm);
      }
    });
  });
}
/**
 * 获取字典名称
 * @param zdlb 字典类别
 * @param dm 字典代码
 */
function zdIdxByMc(globalData, zdlb, mc) {
  return new Promise((resolve, reject) => {
    zdObj(globalData, {
      zdlb: zdlb,
      mc: mc
    }).then(function (obj) {
      if (obj == null) {
        resolve(0);
      } else {
        resolve(obj.idx);
      }
    });
  });
}
////////////////////////////////字典///////////////////////////

/**
 * 我的规则验证
 * @param value 值
 * @param rules 规则
 * @returns {String} 消息内容，为空时表示验证通过
 */
function myGzyz(globalData, value, rules, field) {
  if (!rules) {
    return;
  }
  var msg = null;
  var ruleArr = rules.replace("；", ";").split(";");
  if (rules.indexOf("rgz:") > -1) {
    rules = "";
    for (var i in ruleArr) {
      var rule = ruleArr[i];
      if (!rule) {
        continue;
      }
      var rr = rule.split(":");
      //前端不进行如果则的规则校验
      if ("rgz" != rr[0]) {
        rules += ";" + rule;
      }
    }
  }
  if (!value) {
    if (rules.indexOf("notNull") > -1) {
      msg = "该值不能为空";
    }
  } else {
    ruleArr = rules.split(";");
    var zdlb = null;
    for (var i in ruleArr) {
      var rule = ruleArr[i];
      if (!rule) {
        continue;
      }
      var rr = rule.split(":");
      switch (rr[0]) {
        case "notNull":
          //前面已经处理
          break;
        case "mustBe":
          if (value != rr[1]) {
            var val = rr[1];
            if (zdlb) {
              val = zdObj(globalData, {
                zdlb: zdlb,
                dm: val
              }).mc;
            }
            msg = "该值必须为：" + val;
          }
          break;
        case "length":
          if (value.length < rr[1]) {
            msg = "该值长度不得小于：" + rr[1];
          } else if (value.length > rr[2]) {
            msg = "该值长度不得大于：" + rr[2];
          }
          break;
        case "number":
          if (!isNumber(value)) {
            msg = "该值要求是数字";
          } else if (value > rr[1]) {
            msg = "该值超出大小限制：" + rr[1];
          }
          break;
        case "null":
          if (value) {
            msg = "该值必须为空";
          }
          break;
        case "date":
          if (value.length == 8 || value.length == 10 || value.length == 14 || value.length == 19) {} else {
            msg = "该值必须是时间格式";
          }
          break;
        case "zzbds":
          //正则表达式
          eval("var bds = /" + rr[1] + "/gm");
          if (!bds.test(value)) {
            msg = rr[2];
          }
          break;
        case "sfzh":
          if (!idCardNoUtil.checkIdCardNo(value)) {
            msg = "该值不是正确的身份证号码";
          }
          break;
        case "email":
          if (value.indexOf("@") < 0) {
            msg = "该值不是正确的邮箱";
          }
          break;
        case "zdpd":
          //字典判断
          if (zdObj({
              zdlb: rr[1],
              dm: value
            }, false).mc == '0') {
            msg = "远程判断未通过:" + rr[2];
          }
          break;
        case "zd":
          //字典判断
          var kzxx = field.kzxx;
          if (typeof kzxx == "string") {
            kzxx = JSON.parse(kzxx);
          }
          if (field && kzxx["字典数据"]) {
            break;
          }
          var zdArr = value.split(",");
          for (var i in zdArr) {
            if (zdObj(globalData, {
                zdlb: rr[1],
                dm: zdArr[i]
              }) == null) {
              msg = "该字典项不存在:" + zdArr[i];
            }
          }
          zdlb = rr[1];
          break;
        default:
          msg = "规则不支持:" + rr[0];
      }
      if (msg) {
        break;
      }
    }
  }
  if (msg) {
    console.info(field.zdmc + "验证未通过：" + msg);
  }
  return msg;
}

/**
 * 判断字符串是否为空
 * @param str 要判断的字符串
 * @returns 空：true，非空：false
 */
function isEmpty(str) {
  if (str == null || str == "") {
    return true;
  } else {
    return false;
  }
}
/**
 * 是否是非负整数
 * @param str
 * @returns 非负整数：true，否则：false
 */
function isNumber(str) {
  return (/^(\+|-)?\d+$/.test(str)) && str >= 0;
}

/**
 * 判断嵌套属性存在
 * @param path 路径
 * @param object 对象 
 */
function isKeyExists(path, object) {
  //将传入的对象路径字符串拆分为数组
  var pathList = path.split('.');
  var obj = object
  if (!obj) {
    return false;
  }
  for (var i = 0; i < pathList.length; i++) {
    var key = pathList[i];
    if (!obj[key]) {
      return false;
    }
    obj = obj[key];
  }
  return true;
}

module.exports = {
  isKeyExists: isKeyExists,
  dateFormat: dateFormat,
  zdMcByDm: zdMcByDm,
  zdDmByMc: zdDmByMc,
  zdIdxByMc: zdIdxByMc,
  zdMcByDmMore: zdMcByDmMore,
  zdObj: zdObj,
  zdList: zdList,
  zdMap: zdMap,
  isEmpty: isEmpty,
  isNumber: isNumber,
  myGzyz: myGzyz,
  DATE_FORMAT_19: "yyyy-MM-dd HH:mm:ss",
  DATE_FORMAT_14: "yyyyMMddHHmmss",
  DATE_FORMAT_10: "yyyy-MM-dd",
  DATE_FORMAT_8: "yyyyMMdd",
}