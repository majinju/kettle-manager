package cn.benma666.common.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import cn.benma666.common.domain.BasicBean;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;


public class StringUtil extends cn.benma666.myutils.StringUtil{

    /**
     * 替换字符串
     *
     * @param line
     * @param oldString
     * @param newString
     * @return
     */
    public static final String replace(String s, String sub, String with) {
        int c = 0;
        int i = s.indexOf(sub, c);
        if (i == -1)
            return s;

        StringBuffer buf = new StringBuffer(s.length() + with.length());

        synchronized (buf) {
            do {
                buf.append(s.substring(c, i));
                buf.append(with);
                c = i + sub.length();
            } while ((i = s.indexOf(sub, c)) != -1);

            if (c < s.length())
                buf.append(s.substring(c, s.length()));
        }
        return buf.toString();
    }

    /**
     * 数字转换为定长字符串，如果长度小于指定长度，则在字符串前补0字符
     *
     * @param value 值
     * @param count 字符位数
     * @return 字符串
     */
    public static String fixNumber(long value, int count) {
        String result = String.valueOf(value);
        if (result.length() < count) {
            String zero = "";
            for (int i = result.length(); i < count; i++) {
                zero += "0";
            }
            result = zero + result;
        }
        return result;
    }

    /**
     * 判断字符串是否为null或着空串（包括空格）
     *
     * @param source
     * @return boolean
     */
    public static boolean isNullOrEmpty(String source) {
        if (source == null) {
            return true;
        }
        source = source.trim();
        if ("".equals(source)) {
            return true;
        }

        return false;
    }

    /**
     * 判断字符数组是否为null或着空串
     *
     * @param source
     * @return boolean
     */
    public static boolean isNullOrEmpty(String[] source) {
        if (source == null) {
            return true;
        }
        if (source.length == 0) {
            return true;
        }
        return false;
    }

    /**
     * 分割字符串，返回字符串数组，如果原串为<code>null</code>，则返回 <code>null</code>。
     *
     * @param source    字符
     * @param delimeter 分隔字符
     * @return String[] 字符数组
     */
    public static synchronized String[] split(String source, String delimeter) {
        if (source == null) {
            return new String[0];
        }
        StringTokenizer tokens = new StringTokenizer(source, delimeter);
        List<String> items = new ArrayList<String>();
        while (tokens.hasMoreTokens()) {
            items.add(tokens.nextToken());
        }
        String[] array = new String[items.size()];
        for (int i = 0; i < array.length; i++) {
            array[i] = items.get(i);
        }
        return array;
    }

    /**
     * oracle in 查询
     *
     * @param ids
     * @return
     * @Title: oracleIn
     */
    public static String oracleIn(String[] ids) {
        if (ids == null)
            return null;
        StringBuffer buffer = new StringBuffer("'");
        for (int i = 0; i < ids.length - 1; i++) {
            buffer.append(ids[i] + ",");
        }
        buffer.append(ids[ids.length - 1]).append("'");
        return buffer.toString();
    }

    /**
     * int转换为string
     *
     * @param value
     * @return
     * @Title: intToString
     */
    public static String intToString(int value) {
        return String.valueOf(value);
    }

    /**
     * 去掉null值
     *
     * @param str
     * @return
     * @Title: removeNull
     */
    public static String removeNull(String str) {
        if (null == str)
            return "";
        return str;
    }

    /**
     * 根据特定的字符将字符串分割，同时返回第一个值
     *
     * @param src
     * @param split
     * @return
     * @Title: getFirstBySplit
     */
    public static String getFirstBySplit(String src, String split) {
        String result = "";
        if (null != src) {
            int index = src.indexOf(split);
            if (index != -1) {
                result = src.substring(0, index);
            }
        }
        return result;
    }

    /**
     * 字符串转换为double类型
     *
     * @param str
     * @return
     * @Title: strToDouble
     */
    public static double strToDouble(String str) {
        double res = 0.0;
        if (null != str && !"".equals(str)) {
            res = Double.valueOf(str);
        }
        return res;
    }

    /**
     * 字符串转换为int类型
     *
     * @param str
     * @return
     * @Title: strToDouble
     */
    public static int strToInt(String str) {
        int res = 0;
        if (null != str && !"".equals(str)) {
            res = Integer.valueOf(str);
        }
        return res;
    }

    /**
     * 返回加1后的字符串(主要用户Level处理)
     *
     * @param str
     * @return
     */
    public static String strNext(String str) {
        int res = 0;
        if (null != str && !"".equals(str)) {
            res = Integer.valueOf(str) + 1;
        }
        return String.valueOf(res);
    }

    /**
     * 将列表返回为字符串
     *
     * @param strs
     * @return
     */
    public static String[] listToStrs(List<String> strs) {
        if (strs.size() == 0 || strs.size() < 0)
            return null;
        String[] temp = new String[strs.size()];
        for (int i = 0; i < strs.size(); i++) {
            temp[i] = strs.get(i);
        }
        return temp;
    }

    /**
     * 生成Ids语句
     *
     * @param ids
     * @return
     */
    public static synchronized String buildIds(String[] ids) {
        return buildIds(ids, true);
    }

    /**
     * 生成Ids语句
     *
     * @param ids
     * @param bNeedComma
     * @return
     */
    public static String buildIds(String[] ids, boolean bNeedComma) {
        StringBuffer buffer = new StringBuffer();
        if (ids == null)
            return null;
        for (int i = 0; i < ids.length; i++) {
            if (i == 0) {
                if (bNeedComma) {
                    buffer.append("'").append(ids[i]).append("'");
                } else {
                    buffer.append(ids[i]);
                }
            } else {
                if (bNeedComma) {
                    buffer.append(",'").append(ids[i]).append("'");
                } else {
                    buffer.append(",").append(ids[i]);
                }
            }
        }
        return buffer.toString();
    }

    public static String getShortTitle(String longTitle, Integer shortLen) {
        String res = "";
        if (longTitle != null && longTitle.length() > 0) {
            if (longTitle.length() > shortLen) {
                res = "<span title=" + longTitle + ">" + longTitle.substring(0, shortLen) + "...</span>";
            } else {
                res = longTitle;
            }
        }
        return res;
    }
    
    /**
     * 截取字符串从指定下表到结尾
     */
    public static String getSubstr(String longTitle, Integer shortLen) {
        String res = "";
        if (longTitle != null && longTitle.length() > 0) {
        	if(longTitle.length() > shortLen){
        		res = longTitle.substring(shortLen,longTitle.length());        		
        	}else{
        		res = longTitle;
        	}
        }
        return res;
    }

    public static Boolean equels(String stra, String strb) {
        return stra.equals(strb);
    }

    /**
     * @param text
     * @param length
     * @return String
     * @Title: paddingString
     * @Description: 添加指定数量的字符串
     */
    public static String paddingString(String text, Integer length) {
        StringBuffer buffer = new StringBuffer();
        if (text == null) {
            return null;
        }
        for (int i = 1; i <= length; i++) {
            buffer.append(text);
        }

        return buffer.toString();
    }

   

    /**
     * @param html
     * @return String
     * @Title: findFirstImgSrcFromHtml
     * @Description: 从html中找到第一张图片的src属性值
     */
    public static String findFirstImgSrcFromHtml(String html) {
        String result = "";
        if (StringUtil.isNullOrEmpty(html)) {
            return result;
        }

        Pattern pattern = Pattern.compile("<img[^>]+src\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>");

        Matcher matcher = pattern.matcher(html);

        if (matcher.find()) {
            result = matcher.group(1);
        }

        return result;
    }


    /**
     * @param text
     * @param length
     * @return String
     * @Title: subString
     * @Description: 根据给定长度截取字符串
     */
    public static String subString(String text, Integer length) {
        if (isNullOrEmpty(text)) {
            return "";
        }
        if (length == 0) {
            length = 10;
        }
        if (text.length() > length) {
            text = text.substring(0, length);
        }

        return text;
    }

    /**
     * @param text
     * @param length
     * @return String
     * @Title: subString
     * @Description: 根据给定长度截取字符串
     */
    public static String subStringWithText(String text, Integer length) {
        if (isNullOrEmpty(text)) {
            return "";
        }
        if (length == 0) {
            length = 10;
        }
        if (text.length() > length) {
            text = text.substring(0, length) + "...";
        }

        return text;
    }

    /**
     * @param text
     * @param value
     * @return Boolean
     * @Title: hasValue
     * @Description: 以逗号链接的字符串是否包含给定字符串
     */
    public static Boolean hasValue(String text, String value) {
        Boolean result = false;
        if (isNullOrEmpty(text)) {
            return result;
        }
        String[] array = text.split(",");
        if (array.length == 0) {
            return result;
        }

        for (String item : array) {
            if (item.equals(value)) {
                result = true;
                break;
            }
        }
        return result;
    }

    /**
     * @param src
     * @param domain
     * @return String
     * @Title: setImageSrc
     * @Description: 设置图片路径
     */
    public static String setImageSrc(String src, String domain) {
        String result = "";
        if (src.startsWith("http://")) {
            result = src;
        } else {
            result = domain + src;
        }
        return result;
    }

    /**
     * @param tag
     * @return String[]
     * @Title: splitTag
     * @Description: 分割各种符号链接的字符串
     */
    public static String[] splitTag(String tag) {
        if (isNullOrEmpty(tag)) {
            return null;
        } else {
            return tag.split("[,，;；、\\s+|]");
        }
    }

    /**
     * @param text
     * @param splitText
     * @param index
     * @return String
     * @Title: getSplitItem
     * @Description: 根据指定的分隔符分割字符串，并获取指定位置的子字符串
     */
    public static String getSplitItem(String text, String splitText, Integer index) {
        String result = null;
        if (isNullOrEmpty(text) || isNullOrEmpty(splitText)) {
            return result;
        }

        String[] tempArray = text.split(splitText);
        if (tempArray.length >= index) {
            result = tempArray[index - 1];
        }
        return result;
    }

    /**
     * @param text
     * @return
     * @Title: removeQ
     * @Description: 移除除汉字、数字、大小写字母以及中英文连接符【-—】以外的所有字符
     */
    public static String removeQ(String text) {
        if (isNullOrEmpty(text)) {
            return "";
        }
        return text.replaceAll("[^\u4e00-\u9fa5\\-\\—\\da-zA-Z]", "");
    }

    /**
     * @return String
     * @Title: handleQuotes
     */
    public static String handleQuotes(String text) {
        if (text == null) {
            return null;
        }
        if (text.trim().length() == 0) {
            return "";
        }
        String result = text.replaceAll("\"", "&quot;");

        return result;
    }

    /**
     * @param text
     * @param count
     * @return String
     * @Title: paddingZero
     * @Description: 在指定字符串前面添加指定数目的0
     */
    public static String paddingZero(String text, Integer count) {
        if (count == null) {
            return text;
        }

        int length = count - text.length();
        StringBuffer buffer = new StringBuffer();
        if (length > 0) {
            for (int i = 0; i < length; i++) {
                buffer.append("0");
            }
        }

        return buffer.toString() + text;
    }


    /**
     * @param text ：原字符串
     * @param flg  ：以特殊符合分割的字符串（狗|猪，**）
     * @return
     * @Title: flgCont$
     * @Description: 判断字符串是否包含指定的子串
     */
    public static boolean flgCont$(String text, String flg) {
        String[] str = splitTag(flg);
        if (str != null) {
            String rt = text.replaceAll("[^\u4e00-\u9fa5]", "");
            for (int n = 0, m = str.length; n < m; n++) {
                if (rt.indexOf(str[n]) != -1) {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * @param text
     * @return String
     * @Title: findFirstImgSrcFromHtml
     * @Description: 从html中找到第一张图片的src属性值
     */
    public static String escapeText(String text) {
        if (StringUtil.isNullOrEmpty(text)) {
            return text;
        }

        text = text.replaceAll("\\r", "\\\\u000D");
        text = text.replaceAll("\\n", "\\\\u000A");
        return text;
    }

    /**
     * 获取当前时间作为文件名称
     *
     * @return
     */
    public static String getTimeFileName() {
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSSS");
        Date date = new Date();
        String fileName = format.format(date);
        return fileName;

    }

    /**
     * 格式化当前时间
     *
     * @return
     */
    public static Date getTimeBy() {
        Date date = null;
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date d = new Date();
            date = format.parse(format.format(d));
        } catch (Exception e) {
            e.getStackTrace();
        }
        return date;

    }

    public static String getYearByAge(String age) {
        if (age != null && !age.equals("")) {
            Calendar mycalendar = Calendar.getInstance(); //获取现在时间
            String year = String.valueOf(mycalendar.get(Calendar.YEAR));//获取年份
            int birth = Integer.valueOf(year) - Integer.valueOf(age);

            return String.valueOf(birth);
        }
        return null;
    }

    public static String getStringByArr(String[] str) {
        if (str != null && str.length > 0) {
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < str.length; i++) {
                sb.append("'");
                sb.append(str[i]);
                sb.append("'");
                sb.append(",");
            }
            String string = sb.toString();
            string = string.substring(0, string.length() - 1);
            return string;
        }
        return null;
    }


    /**
     * 电话号码的正则表达式
     *
     * @param mobileNum 号码
     * @return boolean
     */
    public static boolean isMobileNO(String mobileNum) {

        if (mobileNum==null||mobileNum.length() != 11) {
            return false;
        }
        /**
         * 手机号码:
         * 13[0-9], 14[5,7], 15[0, 1, 2, 3, 5, 6, 7, 8, 9], 17[6, 7, 8], 18[0-9], 170[0-9]
         * 移动号段: 134,135,136,137,138,139,150,151,152,157,158,159,182,183,184,187,188,147,178,1705
         * 联通号段: 130,131,132,155,156,185,186,145,176,1709
         * 电信号段: 133,153,180,181,189,177,1700
         */
        String mobile = "^1(3[0-9]|4[57]|5[0-35-9]|8[0-9]|70)\\d{8}$";


        Pattern p = Pattern.compile(mobile);

        Matcher m = p.matcher(mobileNum);

        return m.matches();
    }


    /**
     * list转换String
     *
     * @param list list
     * @return String
     */
    public static String listToString(List<?> list, String separator) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < list.size(); i++) {
            sb.append(list.get(i)).append(separator);
        }
        return sb.toString().substring(0, sb.toString().length() - 1);
    }

    /**
     * Arrary转换String
     *
     * @param array array
     * @return String
     */
    public static String arrayToString(String[] array, String separator) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < array.length; i++) {
            sb.append(array[i]).append(separator);
        }
        return sb.toString().substring(0, sb.toString().length() - 1);
    }


    /**
     * Arrary转换List
     *
     * @param array array
     * @return String
     */
    public static List<String> arrayToList(String[] array) {
        if (array != null && array.length > 0) {
            List<String> list = new ArrayList<String>();
            for (int i = 0; i < array.length; i++) {
                list.add(array[i]);
            }
            return list;
        }
        return null;
    }

    public static String[] listToArray( List<String> list) {
        if (list != null && list.size() > 0) {
            int number=list.size();
            String[] array =new String[number];
            for (int i = 0; i < number; i++) {
                array[i]=list.get(i);
            }
            return array;
        }
        return null;
    }

    /**
     * 获得性别
     *
     * @param gender
     * @return
     */
    public static String getGender(Integer  gender) {
        String str="";
        if(gender==1){
            str="男";
        }
        if(gender==0){
            str="女";
        }
        return  str;
    }

    public static String getGender(String  gender) {
        String str="";
        if(gender.equals("1")){
            str="男";
        }
        if(gender.equals("0")){
            str="女";
        }
        return  str;
    }

    /**
    * 组建数据库模糊匹配字段<br/>
    * @author jingma
    * @param field
    * @return
    */
    public static String buildDBLike(String field) {
        if(StringUtil.isBlank(field)){
            return UtilConst.BFH;
        }
        return UtilConst.BFH+field+UtilConst.BFH;
    }

	/**
	 * 将对象转成字符串
	 */
	/**
	 *  便捷方法，快速返回成功信息
	 *  @param data
	 *  @return
	 *  @author zhuxianming
	 *  @created 2015年11月18日 上午9:56:30
	 *  @lastModified       
	 *  @history
	 */
	public static String success(Object data) {
		return result(true, data, "");
	}
	/**
	 * 错误信息
	 * @param msg
	 * @return
	 */
	public static String error(String msg) {
		return result(false, null, msg);
	}
	
	/**
	 *  处理返回值
	 *  @param b  操作是否成功
	 *  @param data 操作返回的 主体数据 data
	 *  @param msg 操作返回的信息描述
	 *  @return JSON
	 	{
	 		"status":true,  //状态 true成功，false 失败
	 		"data":OBJECT //主体数据, 如果没有返回Null
	 		"msg":"操作成功" // 返回操作描述，可以是前后台标准接口编码
	 	}
	 *  @author zhuxianming
	 *  @created 2015年11月18日 上午9:17:46
	 *  @lastModified       
	 *  @history
	 */
	public static String result(boolean b , Object data , String msg ){
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("status", b);
		map.put("data", data);
		map.put("msg", msg);
		return JSONObject.toJSONString(map,SerializerFeature.DisableCircularReferenceDetect);
	}

	public static String toUtf8(String s){
	 	StringBuffer sb = new StringBuffer();
       	for (int i=0;i<s.length();i++){
          char c = s.charAt(i);
          if (c >= 0 && c <= 255){sb.append(c);}
          else{
              byte[] b;
              try { b = Character.toString(c).getBytes("UTF-8");}
              catch (Exception ex) {
                  System.out.println(ex);
                  b = new byte[0];
              }
              for (int j = 0; j < b.length; j++) {
                  int k = b[j];
                  if (k < 0) k += 256;
                  sb.append("%" + Integer.toHexString(k).toUpperCase());
              }
          }
      	}
       	return sb.toString();
	}
	
	/**
	 *  json数据格式化页面展示
	 *  @param data
	 *  @return string
	 */
	public static String stringParseJson(String json){
		if (null != json && !"".equals(json)) {
			try {
				JSONObject jsonobj =  JSON.parseObject(json);
				return "<pre>"+JSON.toJSONString(jsonobj,true)+"</pre>";
			} catch (Exception e) {
				return json;
			}
        }
		return json ;
	}

    /**
    * 添加sql相等的条件 <br/>
    * @author jingma
    * @param sql
    * @param values
    * @param and
    * @param value
    */
    public static void addEq(StringBuffer sql, List<Object> values, String and, Object value) {
        if(value!=null&&isNotBlank(value.toString())){
            sql.append(" "+and+" ");
            values.add(value);
        }
    }
    /**
    * 添加sql匹配的条件 <br/>
    * @author jingma
    * @param sql
    * @param values
    * @param and
    * @param value
    */
    public static void addLike(StringBuffer sql, List<Object> values, String and, Object value) {
        if(value!=null&&isNotBlank(value.toString())){
            sql.append(" "+and+" ");
            values.add(buildDBLike(value.toString()));
        }
    }

    /**
    *  <br/>
    * @author jingma
    * @param sql
    * @param values
    * @param string
    * @param t
    * @param string2
    */
    public static void addEqDate(StringBuffer sql, List<Object> values,
            BasicBean t, String zd) {
        Object value = t.get(zd+"_start");
        if(value!=null&&isNotBlank(value.toString())){
            sql.append(" and "+zd+">=? ");
            values.add(value.toString().replace("-", ""));
        }
        value = t.get(zd+"_end");
        if(value!=null&&isNotBlank(value.toString())){
            sql.append(" and "+zd+"<=? ");
            values.add(value.toString().replace("-", ""));
        }
    }

    /**
    *  <br/>
    * @author jingma
    * @param sql
    * @param defaultPx
    * @param paramJsons 
    */
    public static void addPxField(StringBuffer sql, String defaultPx, JSONObject paramJsons) {
        sql.append("order by ");
        if(isNotBlank(paramJsons.getString("orderField"))){
            sql.append(paramJsons.getString("orderField")+" "+paramJsons.getString("orderWay"));
        }else{
            sql.append(defaultPx);
        }
    }
    /**
    *  <br/>
    * @author jingma
    * @param sql
    * @param defaultPx
    * @param paramJsons 
    */
    public static void addPxField(StringBuffer sql, String defaultPx, BasicBean b) {
        sql.append("order by ");
        if(b.getMap().get("orderField")!=null&&isNotBlank(b.getMap().get("orderField").toString())){
            sql.append(b.getMap().get("orderField")+" "+b.getMap().get("orderWay"));
        }else{
            sql.append(defaultPx);
        }
    }
}
