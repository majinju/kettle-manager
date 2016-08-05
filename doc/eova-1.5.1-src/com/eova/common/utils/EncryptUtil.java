package com.eova.common.utils;

import java.security.Key;
import java.security.MessageDigest;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

import com.alibaba.druid.util.Base64;


/**
 * 字符串加密与解密
 *
 * @author Jieven
 * @date 2014-5-12
 */
public class EncryptUtil {

	public static final String MD5 = "MD5";
	public static final String SHA1 = "SHA-1";

	/**
	 * 字符单向加密算法
	 * @param str 加密
	 * @return
	 */
	private static String encrypt(String type, String str) {
		try {
			String result = "";
			MessageDigest md = MessageDigest.getInstance(type);
			byte[] bytes = md.digest(str.getBytes("UTF-8"));
			for (byte b : bytes) {
				String hex = Integer.toHexString(b & 0xFF).toUpperCase();
				result += ((hex.length() == 1) ? "0" : "") + hex;
			}
			return result;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * MD5加密
	 * @param str
	 * @return
	 */
	public static String getMd5(String str) {
		return encrypt(MD5, str);
	}

	/**
	 * SHA1加密
	 * @param str
	 * @return
	 */
	public static String getSha1(String str) {
		return encrypt(SHA1, str);
	}

	/**
	 * 获取双重伪装加密
	 * @return
	 */
	public static String getSM32(String str) {
		return getSha1(getMd5(str)).substring(0, 32);
	}

	private static final String MK = "11111111111111111111111111111111111111111111111111111111";
	// 指定DES加密解密所用的密钥
	private static Key key;

	/**
	 * 设置加密的校验码
	 * @Date:2012-10-16 下午04:25:13
	 * @ClassDescription:
	 */
	private static void setkey(String keyStr) {
		try {
			DESKeySpec objDesKeySpec = new DESKeySpec(keyStr.getBytes("UTF-8"));
			SecretKeyFactory objKeyFactory = SecretKeyFactory.getInstance("DES");
			key = objKeyFactory.generateSecret(objDesKeySpec);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	// 对字符串进行DES加密，返回BASE64编码的加密字符串
	public static String encryptString(String str) {
		setkey(MK);
		byte[] bytes = str.getBytes();
		try {
			Cipher cipher = Cipher.getInstance("DES");
			cipher.init(Cipher.ENCRYPT_MODE, key);
			byte[] encryptStrBytes = cipher.doFinal(bytes);
			return Base64.byteArrayToAltBase64(encryptStrBytes);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	// 对BASE64编码的加密字符串进行解密，返回解密后的字符串
	public static String decryptString(String str) {
		setkey(MK);
		try {
			byte[] bytes = Base64.base64ToByteArray(str);
			Cipher cipher = Cipher.getInstance("DES");
			cipher.init(Cipher.DECRYPT_MODE, key);
			bytes = cipher.doFinal(bytes);
			return new String(bytes);
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}

	public static void main(String[] args) {
		// 测试
//		System.out.println(EncryptUtil.getMd5("admin"));
//		System.out.println(EncryptUtil.getSha1("admin"));
		System.out.println(EncryptUtil.getSM32("D033E22AE348AEB5660FC2140AEC35850C4DA997"));
		System.out.println(EncryptUtil.encryptString("注册成功"));
		System.out.println(EncryptUtil.decryptString(EncryptUtil.encryptString("注册成功")));
		// 21232F297A57A5A743894A0E4A801FC3
		// D033E22AE348AEB5660FC2140AEC35850C4DA997
		// DE5CAC556F600BEC8E4425383CA7D8E8
	}
}
