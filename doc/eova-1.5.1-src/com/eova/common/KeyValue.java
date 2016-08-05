package com.eova.common;

import java.io.Serializable;

public class KeyValue implements Serializable {
	
	private static final long serialVersionUID = -4224457388996192467L;
	
	private Object key;
	private Object value;
	private Object data;

	public KeyValue() {
	}

	public KeyValue(Object key, Object value) {
		super();
		this.key = key;
		this.value = value;
	}

	public Object getKey() {
		return key;
	}

	public void setKey(Object key) {
		this.key = key;
	}

	public Object getValue() {
		return value;
	}

	public void setValue(Object value) {
		this.value = value;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

}
