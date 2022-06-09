import axios from "@/axios";
import dayjs from "dayjs"
import customParseFormat from "dayjs/plugin/customParseFormat"
import { useStore } from "vuex";
import _store from "@/store"

dayjs.extend(customParseFormat)

  ////////////////////////////////时间///////////////////////////
  /**
   * 时间字符串解析为date
   * @param dateStr 时间字符串
   */
  ; (Date as any).parseDate = function (dateStr: any) {
    if (!dateStr) {
      return null;
    }
    if (dateStr instanceof Date) {
      //本身就是date类型
      return dateStr;
    }
    let d = dayjs(dateStr, ["YYYYMMDDHHmmss", "YYYYMMDD", "YYMMDD", "YYYY-MM-DD HH:mm:ss", "YYYY-MM-DD",
      "YYYY年MM月DD日HH时mm分ss秒", "YYYY年MM月DD日"])
    return d.toDate();
  }
  /**
   * 时间对象的格式化
   */
  ; (Date as any).prototype.format = function (format: any) {
    const o = {
      "M+": this.getMonth() + 1, // month
      "D+": this.getDate(), // day
      "H+": this.getHours(), // hour
      "m+": this.getMinutes(), // minute
      "s+": this.getSeconds(), // second
      "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
      "S+": this.getMilliseconds()
    };

    if (/(Y+)/.test(format)) {
      format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }

    for (const k in o) {
      if (new RegExp("(" + k + ")").test(format)) {
        format = format.replace(RegExp.$1, RegExp.$1.length === 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
      }
    }
    return format;
  };
/**
 * 时间格式化
 */
export function dateFormat(dateStr: any, fmt: any) {
  const d = (Date as any).parseDate(dateStr);
  if (d) {
    if (fmt === 'date') {
      //为时间对象时，传输中转为14位时间
      fmt = 'yyyyMMddHHmmss';
    }
    return d.format(fmt);
  } else {
    return "";
  }
}

/**
 * dayjs的加减方法调用
 * @param obj
 */
export function dayjsMethod(obj: any) {
  return dayjs()[obj.method](obj.value, obj.dw).format("YYYYMMDDHHmmss");
}
////////////////////////////////时间///////////////////////////
/**
 * json字符串格式化
 * @param text_value 待格式化字符串
 * @returns {string|boolean}
 */
export function jsonFormat(text_value: any) {
  if (isEmpty(text_value)) {
    alert("不能为空");
    return false;
  }
  if (text_value.indexOf("\n") > 0) {
    //存在换行，不进行格式化
    return text_value
  }
  //结果
  let res = "";
  let i = 0, j = 0, k = 0, ii, ele;
  for (; i < text_value.length; i++) {
    //k:缩进，j:""个数
    ele = text_value.charAt(i);
    if (j % 2 === 0 && ele === "}") {
      k--;
      for (ii = 0; ii < k; ii++) {
        ele = "  " + ele;
      }
      ele = "\n" + ele;
    } else if (j % 2 === 0 && ele === "{") {
      ele += "\n";
      k++;
      for (ii = 0; ii < k; ii++) ele += "  ";
    } else if (j % 2 === 0 && ele === ",") {
      ele += "\n";
      for (ii = 0; ii < k; ii++) {
        ele += "  ";
      }
    } else if (ele === "\"") {
      j++;
    }
    res += ele;
  }
  return res
}

/**
 * 是否有权限
 * @param auth 权限码
 * @returns {*} 权限对象，为空则没权限
 */
export const hasAuth = (auth: any) => {
  const store = useStore() || _store;
  return store.state.user.qxMap[auth];
}

////////////////////////////////字典///////////////////////////
/**
 * 字典缓存
 * @type {{}}
 */
const globalData = {
  zdListCache: {}
};

/**
 * 获取字典项
 * @param zdObj 字典类别等信息对象
 * @param cache 是否缓存，默认采用缓存
 * @returns {Promise<unknown>} 字典对象-异步
 */
export function zdObj(zdObj: any, cache?: any) {
  return zdObjG(globalData, zdObj, cache);
}

/**
 * 获取字典列表
 * @param zdlb 字典类别
 * @returns {Promise<unknown>} 字典列表-异步
 */
export function zdList(zdlb: any) {
  return zdListG(globalData, zdlb);
}
/**
 * 获取字典树
 * @param zdlb 字典类别
 * @returns {Promise<unknown>} 字典树-异步
 */
export function zdTree(zdlb: any) {
  return zdTreeG(globalData, zdlb);
}
/**
 * 获取字典树
 * @param globalData 全局变量
 * @param zdlb 字典类别
 */
function zdTreeG(globalData: any, zdlb: any) {
  return new Promise((resolve, reject) => {
    const zdListCache = globalData.zdListCache;
    if (zdListCache[zdlb + "tree"] == null) {
      axios.post({
        //数据对象
        "sys": {
          authCode: "QTQX_ZDGL",
          "cllx": "zdTree",
        },
        "yobj": {
          "zdlb": zdlb
        },
      }, false).then(function (res) {
        zdListCache[zdlb + "_tree"] = res.data;
        resolve(res.data);
      }).catch(function (rep) {
        reject(null);
      })
    } else {
      resolve(zdListCache[zdlb + "_tree"]);
    }
  });
}
/**
 * 获取字典列表
 * @param globalData 全局变量
 * @param zdlb 字典类别
 */
function zdListG(globalData: any, zdlb: any) {
  return new Promise((resolve, reject) => {
    const zdListCache = globalData.zdListCache;
    if (zdListCache[zdlb + "_nocache"]) {
      //不支持获取列表
      reject(null);
    } else if (zdListCache[zdlb] == null) {
      axios.post({
        //数据对象
        "sys": {
          authCode: "QTQX_ZDGL",
          "cllx": "zdList",
        },
        "yobj": {
          "zdlb": zdlb
        }
      }, false).then(function (res) {
        if (res.status && res.data) {
          let list = []
          for (const i in res.data) {
            list.push(res.data[i])
          }
          zdListCache[zdlb] = list;
          resolve(list);
        } else {
          //不支持获取列表
          zdListCache[zdlb + "_nocache"] = true;
          zdListCache[zdlb] = [];
          reject(null);
        }
      }).catch(function (rep) {
        reject(null);
      })
    } else {
      resolve(zdListCache[zdlb]);
    }
  });
}
/**
 * 获取字典对象
 * @param globalData 全局变量
 * @param zdObj 字典对象
 * @param cache 是否缓存
 */
function zdObjG(globalData: any, zdObj: any, cache: any) {
  return new Promise((resolve, reject) => {
    const zdListCache = globalData.zdListCache;
    const zdlb = zdObj.zdlb;
    const dm = zdObj.dm;
    const mc = zdObj.mc;
    let obj: any = null;
    if (zdlb) {
      if (cache === undefined) {
        //默认走缓存
        cache = true;
      }
      if (cache) {
        zdListG(globalData, zdlb).then(function (zl: any) {
          let i;
          //获取了字典列表
          if (dm) {
            for (i in zl as any) {
              if (zl[i].dm === dm) {
                obj = zl[i];
                obj.idx = i;
                break;
              }
            }
            if (!obj) {
              obj = {
                dm: dm,
                mc: dm
              }
            }
          } else if (mc) {
            for (i in zl) {
              if (zl[i].mc === mc) {
                obj = zl[i];
                obj.idx = i;
                break;
              }
            }
            if (!obj) {
              obj = {
                dm: mc,
                mc: mc
              }
            }
          }
          resolve(obj);
        }).catch(function () {
          if (zdListCache[zdlb][dm]) {
            //该字典的具体字典项已经缓存。
            obj = zdListCache[zdlb][dm];
            resolve(obj);
          } else if (zdListCache[zdlb][mc]) {
            //该字典的具体字典项已经缓存。
            obj = zdListCache[zdlb][mc];
            resolve(obj);
          } else {
            postZdObj(globalData, {
              sys: {
              },
              yobj: zdObj
            }).then((data) => {
              resolve(data);
            }).catch(() => {
              reject(null);
            })
          }
        });
      } else {
        postZdObj(globalData, {
          sys: {
            //不走缓存
            dataCache: false
          },
          yobj: zdObj
        }).then((data) => {
          resolve(data);
        }).catch(() => {
          reject(null);
        })
      }
    } else {
      resolve(null);
    }
  });
}
function postZdObj(globalData: any, data: any) {
  const zdListCache = globalData.zdListCache;
  return new Promise(function (resolve, reject) {
    data.sys.authCode = "QTQX_ZDGL";
    data.sys.cllx = "zdObj";
    axios.post(data, false).then(function (res) {
      let obj
      let dm
      let mc
      if (res.status) {
        const zd = res.data;
        dm = zd.dm
        mc = zd.mc
        zdListCache[data.yobj.zdlb][zd.dm] = zd;
        zdListCache[data.yobj.zdlb][zd.mc] = zd;
        obj = zd;
      } else if (dm) {
        obj = {
          "dm": dm,
          "mc": dm
        };
        zdListCache[data.yobj.zdlb][dm] = obj;
      } else if (mc) {
        obj = {
          "dm": mc,
          "mc": mc
        };
        zdListCache[data.yobj.zdlb][mc] = obj;
      }
      resolve(obj);
    }).catch(function () {
      reject(null)
    })
  })
}

/**
 * 获取字典名称
 * @param globalData 全局变量
 * @param zdlb 字典类别
 * @param dm 字典代码
 */
function zdMcByDm(globalData: any, zdlb: any, dm: any) {
  return new Promise((resolve) => {
    zdObj(globalData, {
      zdlb: zdlb,
      dm: dm
    }).then(function (obj: any) {
      resolve(obj.mc);
    }).catch(() => {
      resolve(dm);
    });
  });
}
/**
 * 获取字典名称多个
 * @param globalData 全局变量
 * @param zdlb 字典类别
 * @param dm 字典代码
 */
function zdMcByDmMore(globalData: any, zdlb: any, dm: any) {
  return new Promise(async (resolve) => {
    if (dm) {
      let mcs = "";
      const dms = (dm + "").split(",");
      for (let i = 0; i < dms.length; i++) {
        if (isEmpty(dms[i])) {
          mcs += "、";
          continue;
        }
        await zdMcByDm(globalData, zdlb, dms[i]).then(function (mc) {
          mcs += "、" + mc;
        }).catch(() => {
          mcs += "、" + dms[i];
        });
      }
      resolve(mcs.substring(1));
    } else {
      resolve(dm);
    }
  });
}
/**
 * 获取字典名称
 * @param globalData 公共变量
 * @param zdlb 字典类别
 * @param mc 字典名称
 */
function zdDmByMc(globalData: any, zdlb: any, mc: any) {
  return new Promise((resolve, reject) => {
    zdObj(globalData, {
      zdlb: zdlb,
      mc: mc
    }).then(function (obj: any) {
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
 * @param globalData 公共变量
 * @param zdlb 字典类别
 * @param mc 字典名称
 */
function zdIdxByMc(globalData: any, zdlb: any, mc: any) {
  return new Promise((resolve, reject) => {
    zdObj(globalData, {
      zdlb: zdlb,
      mc: mc
    }).then(function (obj: any) {
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
 * 判断字符串是否为空
 * @param str 要判断的字符串
 * @returns 空：true，非空：false
 */
export function isEmpty(str: any) {
  return str === null || str === undefined || str === "";
}
/**
 * 是否是非负整数
 * @param str
 * @returns 非负整数：true，否则：false
 */
export function isNumber(str: any) {
  return (/^(\+|-)?\d+$/.test(str)) && str >= 0;
}

/**
 * 基于jsonpath给对象设置值
 * @param obj 对象
 * @param path 路径
 * @param value 值
 * @returns {boolean}
 */
export function setByPath(obj: any, path: any, value: any) {
  //将传入的对象路径字符串拆分为数组
  const pathList = path.split('.');
  if (!obj) {
    obj = {}
  }
  for (let i = 0; i < pathList.length; i++) {
    const key = pathList[i];
    if (i === pathList.length - 1) {
      obj[key] = value;
      return true;
    }
    if (!obj[key]) {
      obj[key] = {}
    }
    obj = obj[key];
  }
}
/**
 * 基于jsonpath给对象设置值
 * @param obj 对象
 * @param path 路径
 */
export function getByPath(obj: any, path: any) {
  //将传入的对象路径字符串拆分为数组
  const pathList = path.split('.');
  if (!obj) {
    return null;
  }
  for (let i = 0; i < pathList.length; i++) {
    const key = pathList[i];
    if (i === pathList.length - 1) {
      return obj[key];
    }
    if (!obj[key]) {
      return null
    }
    obj = obj[key];
  }
}

/**
 * 基于jsonpath进行属性拷贝
 * @param target 目标对象
 * @param source 来源对象
 * @param path 路径
 */
export function copyByPath(target: any, source: any, path: any) {
  setByPath(target, path, getByPath(source, path))
}

/**
 * 基于jsonpath进行属性拷贝
 * @param target 目标对象
 * @param source 来源对象
 * @param map 路径映射集合
 */
export function copyByPathMap(target: any, source: any, map: any) {
  if (map) {
    for (const key in map) {
      setByPath(target, key, getByPath(source, map[key]))
    }
  }
}

/**
 * 对象深拷贝合并
 * @param target
 * @param sources
 * @returns {any}
 */
export function assignDeep(target: any, ...sources: any) {
  // 1. 参数校验
  if (target == null) {
    throw new TypeError('Cannot convert undefined or null to object');
  }

  // 2. 如果是基本类型数据转为包装对象
  let result = Object(target);

  // 3. 缓存已拷贝过的对象，解决引用关系丢失问题
  if (!result['__hash__']) {
    result['__hash__'] = new WeakMap();
  }
  let hash = result['__hash__'];

  sources.forEach((v: any) => {
    // 4. 如果是基本类型数据转为对象类型
    let source = Object(v);
    // 5. 遍历原对象属性，基本类型则值拷贝，对象类型则递归遍历
    Reflect.ownKeys(source).forEach(key => {
      // 6. 跳过自有的不可枚举的属性
      if (!Object.getOwnPropertyDescriptor(source, key)!.enumerable) {
        return;
      }
      if (typeof source[key] === 'object' && source[key] !== null) {
        // 7. 属性的冲突处理和拷贝处理
        let isPropertyDone = false;
        if (!result[key] || !(typeof result[key] === 'object')
          || Array.isArray(result[key]) !== Array.isArray(source[key])) {
          // 当 target 没有该属性，或者属性类型和 source 不一致时，直接整个覆盖
          if (hash.get(source[key])) {
            result[key] = hash.get(source[key]);
            isPropertyDone = true;
          } else {
            result[key] = Array.isArray(source[key]) ? [] : {};
            hash.set(source[key], result[key]);
          }
        }
        if (!isPropertyDone) {
          result[key]['__hash__'] = hash;
          assignDeep(result[key], source[key]);
        }
      } else {
        Object.assign(result, { [key]: source[key] });
      }
    });
  });

  delete result['__hash__'];
  return result;
}

export default {
  dateFormat,
  isEmpty,
  isNumber,
  DATE_FORMAT_19: "yyyy-MM-dd HH:mm:ss",
  DATE_FORMAT_14: "yyyyMMddHHmmss",
  DATE_FORMAT_10: "yyyy-MM-dd",
  DATE_FORMAT_8: "yyyyMMdd",
}
