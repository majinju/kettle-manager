/**  
* @Title: JsonResult.java
* @Description: json结果
* @author WangMengzhong
* @date 2013-6-5
* @version V1.0  
*/
package cn.benma666.common.util;

import java.io.Serializable;

/**
 * @Description: json结果
 *
 */
public class JsonResult implements Serializable {
	/**
	* @Fields serialVersionUID : 
	*/
	private static final long serialVersionUID = 1L;

	// 是否成功
	private boolean flg;
	
	// 信息
	private String msg;
	
	// 附加信息对象
	private Object obj;
	
	public JsonResult(boolean flg) {
		this.flg = flg;
		this.msg = "";
	}

	public JsonResult(boolean flg, String msg) {
		this.flg = flg;
		this.msg = msg;
	}

	public JsonResult(boolean flg, String msg, Object obj) {
		this.flg = flg;
		this.msg = msg;
		this.obj = obj;
	}
	
	public boolean isFlg() {
		return flg;
	}

	public void setFlg(boolean flg) {
		this.flg = flg;
	}

	/**
	 * @return the msg
	 */
	public String getMsg() {
		return msg;
	}

	/**
	 * @param msg the msg to set
	 */
	public void setMsg(String msg) {
		this.msg = msg;
	}

	/**
	 * @return the obj
	 */
	public Object getObj() {
		return obj;
	}

	/**
	 * @param obj the obj to set
	 */
	public void setObj(Object obj) {
		this.obj = obj;
	}
	
}
