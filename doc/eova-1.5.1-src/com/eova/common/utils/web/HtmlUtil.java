package com.eova.common.utils.web;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.eova.common.utils.xx;
import com.eova.common.utils.util.RegexUtil;

public class HtmlUtil {

	/**
	 * 过滤HTML及非法字符
	 * 
	 * @param str
	 * @return
	 */
	public static String XSSEncode(String str) {
		if (str != null && str.length() != 0) {
			/** XSS敏感词 **/
			// 忽略html标签中的脚本
			str = str.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"#xss\"");
			str = str.replaceAll("<script[^>]*?>[\\s\\S]*?<\\/script>", " xss ");
			// 忽略大小写,过滤 <script> 及其变种(\\u003c|\\u003e)暂时无法处理
			str = str.replaceAll("(?i)(<|%3C)script(>|%3E)", " xss ");
			// 过滤带JS事件的HTML标签正则:<[N个字母][N个空格]on[4-18个字母][可能有空格]=[任意字符]>,最小匹配
			// str = str.replaceAll("(?i)<[a-zA-Z]+\\s+on[a-zA-Z]{4,18}\\s*=.*?>", " xss ");
			// 过滤js函数
			str = str.replaceAll("(?i)(eval|alert|prompt|confirm)\\((.*)\\)", " xss ");
			// 过滤DOM调用
			str = str.replaceAll("(?i)document.cookie", " xss ");
			/** SQL敏感词 **/
			str = str.replaceAll("(?i)union select", " sql ");
			str = str.replaceAll("(?i)and exists", " sql ");
			str = str.replaceAll("(?i)or exists", " sql ");
		}
		return str;
	}

	/**
	 * HTML标签转换
	 * 
	 * @param str
	 * @return
	 */
	public static String HTMLEncode(String str) {
		if (!xx.isEmpty(str)) {
			// 替换HTML标签
			str = str.replaceAll("<", "&lt;");
			str = str.replaceAll(">", "&gt;");
			str = str.replace(String.valueOf((char) 34), "&quot;");
			str = str.replace(String.valueOf((char) 39), "&#39;");
			str = str.replace(String.valueOf((char) 13), "");
			str = str.replace(String.valueOf((char) 10), "<br/> ");
		}
		return str;
	}

	/**
	 * UBB代码解析成HTML
	 * 
	 * @param str
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public static String UBBToHTML(String str) {
		if (xx.isEmpty(str)) {
			return str;
		}

		String regex = "";
		String ment = "";

		// ------------------------------------------------------------------超链接
		// [url=http://xxx.com]xxx[/url]
		regex = "\\[url=(http:\\/\\/.[^\\[]*)\\](.[^\\[]*)\\[\\/url\\]";
		ment = "<a href=\"$1\">$2</a>";
		str = RegexUtil.replaceAll(regex, ment, str);

		// [url=xxx.com]xxx[/url]
		regex = "\\[url=([^\\[]*)\\](.[^\\[]*)\\[\\/url\\]";
		ment = "<a href=\"http://$1\">$2</a>";
		str = RegexUtil.replaceAll(regex, ment, str);

		// ------------------------------------------------------------------图片
		// [img]http://XXXXX.com/123.jpg[/img]
		regex = "\\[img\\](http:\\/\\/.[^\\[]*)\\[\\/img\\]";
		ment = "<img src=\"$1\" />";
		str = RegexUtil.replaceAll(regex, ment, str);

		// [img]xxx.com/123.jpg[/img]

		regex = "\\[img\\](.[^\\[]*)\\[\\/img\\]";
		ment = "<img src=\"http://$1\" />";
		str = RegexUtil.replaceAll(regex, ment, str);

		// ------------------------------------------------------------------表情
		for (Map<String, String> x : faceList) {
			Iterator iter = x.entrySet().iterator();
			while (iter.hasNext()) {
				Map.Entry entry = (Map.Entry) iter.next();
				Object key = entry.getKey();
				Object val = entry.getValue();
				regex = "\\[(" + val + ")\\]";
				ment = "<img src=\"/ui/imgs/face/" + key + ".gif\" alt=\"" + val + "\" />";
				str = RegexUtil.replaceAll(regex, ment, str);
			}
		}
		// ------------------------------------------------------------------文字样式
		// 颜色 [color=red]xxx[/color]
		regex = "\\[color=(.[^\\[]*)\\](.[^\\[]*)\\[\\/color\\]";
		ment = "<font color=\"$1\">$2</font>";
		str = RegexUtil.replaceAll(regex, ment, str);

		// 自定义字体 范围 1-8 [size=1-8]xxx[/size]
		regex = "\\[size=([1-8])\\](.[^\\[]*)\\[\\/size\\]";
		ment = "<font size=\"$1\">$2</font>";
		str = RegexUtil.replaceAll(regex, ment, str);

		// 斜体
		regex = "\\[i\\](.[^\\[]*)\\[\\/i\\]";
		ment = "<i>$1</i>";
		str = RegexUtil.replaceAll(regex, ment, str);

		// 加粗
		regex = "\\[b\\](.[^\\[]*)\\[\\/b\\]";
		ment = "<b>$1</b>";
		str = RegexUtil.replaceAll(regex, ment, str);

		// 下划线
		regex = "\\[u\\](.[^\\[]*)\\[\\/u\\]";
		ment = "<u>$1</u>";
		str = RegexUtil.replaceAll(regex, ment, str);

		// 删除线
		regex = "\\[s\\](.[^\\[]*)\\[\\/s\\]";
		ment = "<strike>$1</strike>";
		str = RegexUtil.replaceAll(regex, ment, str);

		// 下标文字
		regex = "\\[sub\\](.[^\\[]*)\\[\\/sub\\]";
		ment = "<sub>$1</sub>";
		str = RegexUtil.replaceAll(regex, ment, str);

		// 上标文字
		regex = "\\[sup\\](.[^\\[]*)\\[\\/sup\\]";
		ment = "<sup>$1</sup>";
		str = RegexUtil.replaceAll(regex, ment, str);

		// ------------------------------------------------------------------排版和效果
		// 换行
		regex = "\\[br\\]";
		ment = "<br />";
		str = RegexUtil.replaceAll(regex, ment, str);

		// 分割线
		regex = "\\[hr\\]";
		ment = "<hr />";
		str = RegexUtil.replaceAll(regex, ment, str);

		// 滚动
		regex = "\\[fly\\](.[^\\[]*)\\[\\/fly\\]";
		ment = "<marquee>$1</marquee>";
		str = RegexUtil.replaceAll(regex, ment, str);

		// 居中
		regex = "\\[center\\](.[^\\[]*)\\[\\/center\\]";
		ment = "<center>$1</center>";
		str = RegexUtil.replaceAll(regex, ment, str);

		// 将UBB代码换成HTML代码后返回
		return str;
	}

	/**
	 * 清除HTML标签,CSS,JS
	 * 
	 * @return 纯文本
	 */
	public static String clearHtml(String str) {
		String regex = "";

		// 去js
		regex = "<script(\\s[^>]*?)?>[\\s\\S]*?</script>";
		str = RegexUtil.replaceAll(regex, "", str);

		// 去css
		regex = "<style>[\\s\\S]*?</style>";
		str = RegexUtil.replaceAll(regex, "", str);

		// 去html
		regex = "<(.[^>]*)>";
		str = RegexUtil.replaceAll(regex, "", str);

		return str;
	}

	/**
	 * 清除HTML标签,CSS,JS
	 * 
	 * @return 纯文本
	 */
	public static String clearUBB(String str) {
		String regex = "";

		// 去html
		regex = "\\[(.[^\\]]*)\\]";
		str = RegexUtil.replaceAll(regex, "", str);

		return str;
	}

	/**
	 * 替换关键字排除标签(a|img|pre|h)
	 * 
	 * @param regex 被替换字符
	 * @param ment 替换字符
	 * @param str 原文
	 * @param tag 排除标签组
	 * @return
	 */
	public static String replaceExcludeTag(String regex, String ment, String str) {
		StringBuilder sb = new StringBuilder();
		String[] ss = str.split("<");
		for (String s : ss) {
			// System.out.println(s);
			sb.append('<');
			if (s.startsWith("a")) {
				sb.append(s);
			} else if (s.startsWith("pre")) {
				sb.append(s);
			} else if (s.startsWith("img")) {
				int temp = s.indexOf(">");
				// 获取img标签内容
				sb.append(s.substring(0, temp));
				// 替换标签后面的内容
				sb.append(RegexUtil.replaceAll(regex, ment, s.substring(temp, s.length())));
			} else {
				sb.append(RegexUtil.replaceAll(regex, ment, s));
			}
		}
		sb.delete(0, 1);
		return sb.toString();
	}

	public static void main(String[] args) {
		// 替换关键字排除标签
		String s = "<p><img src=\"http://blog.zjzsys.com/ui/kd/plugins/emoticons/images/13.gif\" border=\"0\" alt=\"\" />Java<img src=\"http://blog.zjzsys.com/ui/kd/plugins/emoticons/images/81.gif\" border=\"0\" alt=\"\" /><br />添加在贵站首页后，在本贴下留言即可，我看到后就会添加到本站(前提是符合要求)</p>";
		String s1 = replaceExcludeTag("Java", "Net", s);
		System.out.println(s1);
		{
			// 清除UBB语法
			String a = "fds[哈哈]fs[微笑]d[b]范德萨[/b]佛挡[color=red]顺东方大厦[/color]杀佛";
			System.out.println(clearUBB(a));
		}
		System.out.println();
		{
			// 清除UBB语法
			String b = "fdsfsd<b>范德萨</b>佛挡杀佛";
			System.out.println(clearHtml(b));
		}
	}

	/**
	 * 表情集合
	 */
	public static List<Map<String, String>> faceList = new ArrayList<Map<String, String>>();
	static {
		LinkedHashMap<String, String> faceMap_one = new LinkedHashMap<String, String>();
		faceMap_one.put("00", "微笑");
		faceMap_one.put("01", "撇嘴");
		faceMap_one.put("02", "色");
		faceMap_one.put("03", "发呆");
		faceMap_one.put("04", "得意");
		faceMap_one.put("05", "流泪");
		faceMap_one.put("06", "害羞");
		faceMap_one.put("07", "闭嘴");
		faceMap_one.put("08", "睡");
		faceMap_one.put("09", "大哭");
		faceMap_one.put("10", "尴尬");
		faceMap_one.put("11", "发怒");
		faceMap_one.put("12", "调皮");
		faceMap_one.put("13", "龇牙");
		faceMap_one.put("14", "惊讶");
		faceMap_one.put("15", "难过");
		faceMap_one.put("16", "酷");
		faceMap_one.put("17", "冷汗");
		faceMap_one.put("18", "抓狂");
		faceMap_one.put("19", "吐");
		faceMap_one.put("20", "偷笑");

		LinkedHashMap<String, String> faceMap_two = new LinkedHashMap<String, String>();
		faceMap_two.put("21", "可爱");
		faceMap_two.put("22", "白眼");
		faceMap_two.put("23", "傲慢");
		faceMap_two.put("24", "饥饿");
		faceMap_two.put("25", "困");
		faceMap_two.put("26", "惊恐");
		faceMap_two.put("27", "流汗");
		faceMap_two.put("28", "憨笑");
		faceMap_two.put("29", "大兵");
		faceMap_two.put("30", "奋斗");
		faceMap_two.put("31", "咒骂");
		faceMap_two.put("32", "疑问");
		faceMap_two.put("33", "嘘...");
		faceMap_two.put("34", "晕");
		faceMap_two.put("35", "折磨");
		faceMap_two.put("36", "衰");
		faceMap_two.put("37", "骷髅");
		faceMap_two.put("38", "敲打");
		faceMap_two.put("39", "再见");
		faceMap_two.put("40", "擦汗");
		faceMap_two.put("41", "抠鼻");

		LinkedHashMap<String, String> faceMap_three = new LinkedHashMap<String, String>();
		faceMap_three.put("42", "鼓掌");
		faceMap_three.put("43", "糗大了");
		faceMap_three.put("44", "坏笑");
		faceMap_three.put("45", "左哼哼");
		faceMap_three.put("46", "右哼哼");
		faceMap_three.put("47", "哈欠");
		faceMap_three.put("48", "鄙视");
		faceMap_three.put("49", "委屈");
		faceMap_three.put("50", "快哭了");
		faceMap_three.put("51", "阴险");
		faceMap_three.put("52", "亲亲");
		faceMap_three.put("53", "吓");
		faceMap_three.put("54", "可怜");
		faceMap_three.put("55", "菜刀");
		faceMap_three.put("56", "西瓜");
		faceMap_three.put("57", "啤酒");
		faceMap_three.put("58", "篮球");
		faceMap_three.put("59", "乒乓");
		faceMap_three.put("60", "咖啡");
		faceMap_three.put("61", "饭");
		faceMap_three.put("62", "猪头");

		LinkedHashMap<String, String> faceMap_four = new LinkedHashMap<String, String>();
		faceMap_four.put("63", "玫瑰");
		faceMap_four.put("64", "凋谢");
		faceMap_four.put("65", "示爱");
		faceMap_four.put("66", "爱心");
		faceMap_four.put("67", "心碎");
		faceMap_four.put("68", "蛋糕");
		faceMap_four.put("69", "闪电");
		faceMap_four.put("70", "炸弹");
		faceMap_four.put("71", "刀");
		faceMap_four.put("72", "足球");
		faceMap_four.put("73", "瓢虫");
		faceMap_four.put("74", "便便");
		faceMap_four.put("75", "月亮");
		faceMap_four.put("76", "太阳");
		faceMap_four.put("77", "礼物");
		faceMap_four.put("78", "拥抱");
		faceMap_four.put("79", "强");
		faceMap_four.put("80", "弱");
		faceMap_four.put("81", "握手");
		faceMap_four.put("82", "胜利");
		faceMap_four.put("83", "抱拳");

		LinkedHashMap<String, String> faceMap_five = new LinkedHashMap<String, String>();
		faceMap_five.put("84", "勾引");
		faceMap_five.put("85", "拳头");
		faceMap_five.put("86", "差劲");
		faceMap_five.put("87", "爱你");
		faceMap_five.put("88", "NO");
		faceMap_five.put("89", "Ok");

		faceList.add(0, faceMap_one);
		faceList.add(1, faceMap_two);
		faceList.add(2, faceMap_three);
		faceList.add(3, faceMap_four);
		faceList.add(4, faceMap_five);
	}
}
