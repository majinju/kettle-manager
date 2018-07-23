package cn.benma666.common.iframe;

import javax.servlet.ServletContext;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.web.context.ServletContextAware;

public class WebLoader implements ApplicationContextAware,ServletContextAware {
	/**
     * servletContext
     */
    static public ServletContext servletContext;
    
    public void setApplicationContext(ApplicationContext applicationContext)
    throws BeansException{
    }
    
	public void setServletContext(ServletContext arg0) {
		arg0.setAttribute("serviceAddr", AConfig.getVal("service.addr"));
	    servletContext = arg0;
	}
}
