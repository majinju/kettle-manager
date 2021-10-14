
function getType(obj) {
    let toString = Object.prototype.toString
    let map = {
        '[object Boolean]' : 'boolean',
        '[object Number]'  : 'number',
        '[object String]'  : 'string',
        '[object Function]' : 'function',
        '[object Array]'  : 'array',
        '[object Date]'   : 'date',
        '[object RegExp]'  : 'regExp',
        '[object Undefined]': 'undefined',
        '[object Null]'   : 'null',
        '[object Object]'  : 'object'
    };
    return map[toString.call(obj)]
}
function deepClone(data) {
    let t = getType(data), o, i, ni

    if(t === 'array') {
        o = [];
    }else if( t === 'object') {
        o = {};
    }else {
        return data
    }

    if(t === 'array') {
        for (i = 0, ni = data.length; i < ni; i++) {
            o.push(deepClone(data[i]))
        }
        return o;
    }else if( t === 'object') {
        for( i in data) {
            o[i] = deepClone(data[i])
        }
        return o
    }
}

function setDateAndTime(date) {
    date = date || new Date()
    let y = date.getFullYear()
    let M = date.getMonth()+1
    let d = date.getDate()
    let h = date.getHours()
    let m = date.getMinutes()
    let s = date.getSeconds()
    M = M>=10?M:'0'+M
    d = d>=10?d:'0'+d
    h = h>=10?h:'0'+h
    m = m>=10?m:'0'+m
    s = s>=10?s:'0'+s
    let num = isNaN(parseInt(""+y+M+d+h+m+s)) ? '' : parseInt(""+y+M+d+h+m+s)
    return num
}

/**
 * 字符串拼接日期格式
 * @param val
 * @returns {string}
 */
function formatDateAndDate(val) {
    if (!val) {
        return "";
    }
    let y = val.substr(0, 4);
    let M = val.substr(4, 2);
    let d = val.substr(6, 2);
    let h = val.substr(8, 2);
    let m = val.substr(10, 2);
    let s = val.substr(12, 2);
    return y + "-" + M + "-" + d + " " + h + ":" + m + ":" + s;
}

/**
 * 日期时间格式转换为字符串
 * @param date
 * @returns {string}
 */
function  setDate(date) {
    if (date) {
        let sj = [];
        date.forEach(item => {
            let time = new Date(item);
            let y = time.getFullYear();
            let m = time.getMonth()+1;
            let d = time.getDate();
            let h = time.getHours();
            let s = time.getMinutes();
            let mm = time.getSeconds();
            m = m >= 10 ? m : "0" + m;
            d = d >= 10 ? d : "0" + d;
            h = h >= 10 ? h : "0" + h;
            s = s >= 10 ? s : "0" + s;
            mm = mm >= 10 ? mm : "0" + mm;
            sj.push("" + y + m + d + h + s + mm);
        });
        return sj.join(";");
    } else {
        return "";
    }
}


/**
 * 默认时间向前,可通过参数来确定默认的时间.
 * 可以默认时间范围
 * @param num
 * @returns {string[]}
 */
function timeDefault (num,day) {
    let date = new Date()
    // 通过时间戳计算
    let defalutStartTime = date.getTime() +24 * 3600 * 1000 // 转化为时间戳
    let defalutEndTime = date.getTime()
    let startDateNs = new Date(defalutStartTime)
    let endDateNs = new Date(defalutEndTime)
    // 月，日 不够10补0
    defalutStartTime = startDateNs.getFullYear() + '-' + ((startDateNs.getMonth() + 1) > 10 ?
        (startDateNs.getMonth() -num) + '-' + (startDateNs.getDate() >10 ? startDateNs.getDate()-day+" "+endDateNs.getHours()+":"+endDateNs.getMinutes()+":"+endDateNs.getSeconds() : '0' + endDateNs.getDate()+" "+endDateNs.getHours()+":"+endDateNs.getMinutes()+":"+endDateNs.getSeconds()) :
        '0' + (startDateNs.getMonth() -num) + '-' + (startDateNs.getDate() >10 ? startDateNs.getDate()-day+" "+endDateNs.getHours()+":"+endDateNs.getMinutes()+":"+endDateNs.getSeconds() : '0' + endDateNs.getDate()+" "+endDateNs.getHours()+":"+endDateNs.getMinutes()+":"+endDateNs.getSeconds()))
    return [defalutStartTime,""]
}

export {
    deepClone,
    setDateAndTime,
    formatDateAndDate,
    setDate,
    timeDefault
}
