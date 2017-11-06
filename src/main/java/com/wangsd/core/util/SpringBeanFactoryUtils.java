package com.wangsd.core.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * Description:普通类调用Spring注解方式的Service层bean
 * @author jxqc
 * @date 2017年9月30日
 */
public class SpringBeanFactoryUtils implements ApplicationContextAware {

	private static ApplicationContext appCtx;
	
	/*static {
		appCtx = new ClassPathXmlApplicationContext(
				new String[] {"spring/applicationContext.xml"});
		   }*/

	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		appCtx = applicationContext;
	}
	
	public static ApplicationContext getApplicationContext(){  
        return appCtx;  
    }

	public static Object getBean(String beanName) {
		return appCtx.getBean(beanName);
	}
	
	public static <T> T getBean(String name, Class<T> requiredType) {
        return appCtx.getBean(name, requiredType);
    }

}
