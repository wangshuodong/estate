package com.wangsd.core.util;

public class StaticVar {

	public static final String format = "json";
	public static final String charset = "utf-8";
	public static final String sign_type = "RSA";

	/**
	 * 服务商
	 */
	public static final int DEPARTMENT_TYPE1 = 1;
	/**
	 * 物业
	 */
	public static final int DEPARTMENT_TYPE2 = 2;
	/**
	 * 小区
	 */
	public static final int DEPARTMENT_TYPE3 = 3;



	/**
	 * 新建小区
	 */
	public static final String DEPARTMENT_STATUS_NEW = "NEW";
	/**
	 * 待上线
	 */
	public static final String DEPARTMENT_STATUS_PENDING_ONLINE = "PENDING_ONLINE";
	/**
	 * 上线
	 */
	public static final String DEPARTMENT_STATUS_ONLINE = "ONLINE";
	/**
	 * 维护中
	 */
	public static final String DEPARTMENT_STATUS_MAINTAIN = "MAINTAIN";
	/**
	 * 下线
	 */
	public static final String DEPARTMENT_STATUS_OFFLINE = "OFFLINE";
}
