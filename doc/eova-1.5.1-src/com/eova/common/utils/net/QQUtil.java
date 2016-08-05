package com.eova.common.utils.net;

import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;

/**
 * QQ加密算法
 *
 * @author Jieven
 * @date 2013-12-29
 */
public class QQUtil {
	/**16进制字符**/
	public static final String HEXSTRING = "0123456789ABCDEF";

	/**
	 * 获取QQ登录密码加密结果
	 * @param qq QQ号
	 * @param password QQ密码 
	 * @param verifycode 验证码
	 * @return
	 * @throws Exception
	 */
	public static String getEncryption(String qq, String password, String verifycode) throws Exception {
		// 将QQ转成16进制的字符串->传说中的UIN
		qq = uin2hex(qq);
		String P = hexchar2bin(md5(password));
		System.out.println(P);
		// 去掉UIN中的"\",进行计算
		String U = md5(P + hexchar2bin(qq.replace("\\x", "").toUpperCase()));
		System.out.println(U);
		String V = md5(U + verifycode.toUpperCase());
		System.out.println(V);

		return V;
	}

	/**
	 * 将QQ从10进制转16进制
	 * @param str qq
	 * @return
	 */
	public static String uin2hex(String str) {
		int maxLength = 16;
		// 1623736450
		int qq = Integer.parseInt(str);
		// 转16进制
		String hex = Integer.toHexString(qq);
		int len = hex.length();
		// 将少于16的用0补齐->0000000060c84082
		for (int i = len; i < maxLength; i++) {
			hex = "0" + hex;
		}
		StringBuilder sb = new StringBuilder();
		for (int j = 0; j < maxLength; j += 2) {
			sb.append("\\x" + hex.substring(j, j + 2));
		}
		// \x00\x00\x00\x00\x22\xcd\xba\xda
		return sb.toString();
	}

	/**
	 * 将MD5字符变成16进制字符
	 * @param md5str
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String hexchar2bin(String md5str) throws UnsupportedEncodingException {
		ByteArrayOutputStream baos = new ByteArrayOutputStream(md5str.length() / 2);

		for (int i = 0; i < md5str.length(); i = i + 2) {
			baos.write((HEXSTRING.indexOf(md5str.charAt(i)) << 4 | HEXSTRING.indexOf(md5str.charAt(i + 1))));
		}
		return new String(baos.toByteArray(), "ISO-8859-1");
	}

	/**
	 * MD5加密
	 * @param str
	 * @return
	 * @throws Exception
	 */
	public static String md5(String str) throws Exception {
		// 默认加密字符集
		byte buf[] = str.getBytes("ISO-8859-1");
		StringBuffer hexString = new StringBuffer();
		String result = "";
		String digit = "";

		try {
			MessageDigest algorithm = MessageDigest.getInstance("MD5");
			algorithm.reset();
			algorithm.update(buf);

			byte[] digest = algorithm.digest();

			for (int i = 0; i < digest.length; i++) {
				digit = Integer.toHexString(0xFF & digest[i]);

				if (digit.length() == 1) {
					digit = "0" + digit;
				}

				hexString.append(digit);
			}

			result = hexString.toString();
		} catch (Exception ex) {
			result = "";
		}

		return result.toUpperCase();
	}

	public static void main(String[] args) {
		String qq = "1623736450";
		String password = "123456";
		String verifycode = "mhsa";
		// 加密结果(by Qzone)
		String md5 = "206DB5EB4F8358B4984D59D8FE474047";
		try {
			String s = QQUtil.getEncryption(qq, password, verifycode);
			if (s.equals(md5)) {
				System.out.println("加密成功！");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String s = getGTK("@tK39RmBRW");
		System.out.println(s);
		
	}

	/**
	 * QQ空间G_TK算法
	 * @param str cookie中的skey
	 * @return
	 */
	public static String getGTK(String str) {
		int hash = 5381;
		for (int i = 0, len = str.length(); i < len; ++i) {
			hash += (hash << 5) + (int) (char) str.charAt(i);
		}
		return (hash & 0x7fffffff) + "";
	}
}
