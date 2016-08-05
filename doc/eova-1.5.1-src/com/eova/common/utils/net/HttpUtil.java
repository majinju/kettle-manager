package com.eova.common.utils.net;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.imageio.ImageIO;

public class HttpUtil {

	/**
	 * 请求URL是否连接成功
	 * @param url
	 * @return
	 */
	public static boolean isHttpOk(String url) {
		HttpURLConnection conn = null;
		try {
			URL serverUrl = new URL(url);
			conn = (HttpURLConnection) serverUrl.openConnection();
			conn.setConnectTimeout(1000 * 5);// 5s
			conn.setRequestMethod("GET");
			conn.connect();

			int state = conn.getResponseCode();
			if (state == 200) {
				return true;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally{
			conn.disconnect();
		}
		return false;
	}

	private BufferedImage image;

	public BufferedImage getImage() {
		return image;
	}

	public void setImage(BufferedImage image) {
		this.image = image;
	}

	private String cookie = "";
	public String getCookie() {
		return cookie;
	}

	public void setCookie(String cookie) {
		this.cookie = cookie;
	}

	public String getHttpConnection(String url) throws Exception {
		return HttpConnection(url, "GET", null, false);
	}

	public String getImgHttpConnection(String url) throws Exception {
		return HttpConnection(url, "GET", null, true);
	}

	public String HttpConnection(String url, String method, String contents, boolean isImg) throws Exception {
		HttpURLConnection conn = null;
		try {
			URL serverUrl = new URL(url);
			conn = (HttpURLConnection) serverUrl.openConnection();
			conn.setConnectTimeout(1000 * 20);// 1分钟自动超时
			conn.setRequestMethod(method);

			//conn.addRequestProperty("Referer", "http");
			conn.addRequestProperty("Cookie", cookie);
			conn.addRequestProperty("Connection", "Keep-Alive");
			conn.addRequestProperty("Accept-Language", "zh-cn");
			// conn.addRequestProperty("Accept-Encoding", "gzip, deflate");
			conn.addRequestProperty("Cache-Control", "no-cache");
			conn.addRequestProperty("Accept-Charset", "UTF-8;");
			// conn.addRequestProperty("User-Agent",
			// "Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.2.8) Firefox/3.6.8");
			conn.addRequestProperty(
					"User-Agent",
					"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/4.0; QQDownload 757; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET4.0C)");
			if (method.equalsIgnoreCase("get")) {
				conn.connect();
			} else if (method.equalsIgnoreCase("post")) {
				conn.setDoOutput(true);
				conn.connect();
				conn.getOutputStream().write(contents.getBytes());
			}
			if (conn.getHeaderFields().get("Set-Cookie") != null) {
				for (String s : conn.getHeaderFields().get("Set-Cookie")) {
					cookie += s;
				}
			}
			InputStream ins = conn.getInputStream();

			String charset = "UTF-8";
			InputStreamReader inr = new InputStreamReader(ins, charset);

			BufferedReader br = new BufferedReader(inr);

			if (isImg) {
				System.out.println("获取到一张图片");
				BufferedImage bi = ImageIO.read(ins);
				this.setImage(bi);
			}
			String line = "";
			StringBuffer sb = new StringBuffer();
			do {
				sb.append(line);
				line = br.readLine();
			} while (line != null);

			return sb.toString();
		} catch (Exception e) {
			throw e;
		} finally {
			conn.disconnect();
		}
	}
}
