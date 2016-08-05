package com.eova.common.utils.string;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class AESUtil {

	private static final String key = "yunyou17lw";

	/**
	 * 加密
	 * @param content 需要加密的内容
	 * @param password  加密密码
	 * @return
	 */
	private static byte[] encryptByte(String content, String password) {
		try {
			KeyGenerator kgen = KeyGenerator.getInstance("AES");
			kgen.init(128, new SecureRandom(password.getBytes()));
			SecretKey secretKey = kgen.generateKey();
			byte[] enCodeFormat = secretKey.getEncoded();
			SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");
			Cipher cipher = Cipher.getInstance("AES");// 创建密码器
			byte[] byteContent = content.getBytes("utf-8");
			cipher.init(Cipher.ENCRYPT_MODE, key);// 初始化
			byte[] result = cipher.doFinal(byteContent);
			return result; // 加密
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 解密
	 * @param content  待解密内容
	 * @param password 解密密钥
	 * @return
	 */
	private static byte[] decryptByte(byte[] content, String password) {
		try {
			KeyGenerator kgen = KeyGenerator.getInstance("AES");
			kgen.init(128, new SecureRandom(password.getBytes()));
			SecretKey secretKey = kgen.generateKey();
			byte[] enCodeFormat = secretKey.getEncoded();
			SecretKeySpec key = new SecretKeySpec(enCodeFormat, "AES");
			Cipher cipher = Cipher.getInstance("AES");// 创建密码器
			cipher.init(Cipher.DECRYPT_MODE, key);// 初始化
			byte[] result = cipher.doFinal(content);
			return result; // 加密
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * AES加密
	 * @param str
	 * @return
	 */
	public static String encrypt(String str) {
		return BinaryHex.binary2Hex(encryptByte(str, key));
	}

	/**
	 * AES解密
	 * @param str
	 * @return
	 */
	public static String decrypt(String str) {
		// 16进制转2进制
		byte[] decryptFrom = BinaryHex.hex2Byte(str);
		// 根据byte进行解码
		byte[] decryptResult = decryptByte(decryptFrom, key);
		return new String(decryptResult);
	}

	public static void main(String[] args) {
		String str = "发多少房间打扫看来减肥鲁大师 <br>///fdsfds房贷首付斯蒂芬是";
		// 加密
		System.out.println("加密前：" + str);
		String s = AESUtil.encrypt(str);
		System.out.println("加密后：" + s);

		System.out.println("解密后：" + AESUtil.decrypt(s));
	}
}
