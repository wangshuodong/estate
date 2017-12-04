package com.wangsd.core.util.nuonuo.bean;

/**
 * 请求体中业务参数model
 * @author sdk.jss.com.cn
 * @version 1.0
 * @since jdk1.6
 * @param <T>
 */
public class PrivateData<T> {
	
	/**
	 * 请求数据
	 */
	private Object servicedata ;
	

	public void setServicedata(Object servicedata) {
		this.servicedata = servicedata;
	}
	public Object getServicedata() {
		return servicedata;
	}
	
}
