
package cn.benma666.common.iframe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

import cn.benma666.common.util.DictManager;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

public class AConfig extends PropertyPlaceholderConfigurer{
	
	public static Log log = LogFactory.getLog(AConfig.class);

	private static Map<String,String> config = new HashMap<String, String>();
	
	/**
	 * 配置代码列表
	 */
	private List<String> configCodeList;
	
	@Override
	protected void processProperties(
			ConfigurableListableBeanFactory beanFactoryToProcess,
			Properties props) throws BeansException {
		Properties initPorps = new Properties();
		initPorps.putAll(props);
		log.info("初始参数：\n"+JSON.toJSONString(initPorps,true));
		//配置了远程service服务
		String serviceAddr = props.getProperty("service.addr");
		if(serviceAddr!=null&&configCodeList!=null
				&&serviceAddr.startsWith("http://")){
			log.info("从"+serviceAddr+"加载配置信息："+configCodeList);
			config.put("serviceAddr", serviceAddr);
			for(String config:configCodeList){
				for(JSONObject obj:DictManager.zdList(config)){
					//不覆盖本地配置
					if(!initPorps.containsKey(obj.getString("dm"))){
						props.put(obj.getString("dm"), obj.getString("mc"));
					}
				}
			}
			log.info("加载远程参数后：\n"+JSON.toJSONString(props,true));
		}
		super.processProperties(beanFactoryToProcess, props);
		for(Object key:props.keySet()){
			config.put(key.toString(), props.get(key).toString());
		}
	}

	/**
	 * @param key
	 * @return
	 */
	public static String getVal(String key){
		return config.get(key);
	}

	public List<String> getConfigCodeList() {
		return configCodeList;
	}

	public void setConfigCodeList(List<String> configCodeList) {
		this.configCodeList = configCodeList;
	}
	
}
