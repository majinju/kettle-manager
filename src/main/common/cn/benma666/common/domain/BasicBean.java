package cn.benma666.common.domain;

import java.util.Map;

import org.beetl.sql.core.TailBean;


public class BasicBean extends TailBean{

	/**
    * 
    */
    private static final long serialVersionUID = 1710639538662210517L;

    public Map<String, Object> getMap() {
		return extMap;
	}
	public void setMap(Map<String, Object> map) {
		this.extMap = map;
	}
	
	public BasicBean(){
		
	}
}
