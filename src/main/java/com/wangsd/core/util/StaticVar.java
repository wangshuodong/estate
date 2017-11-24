package com.wangsd.core.util;

public class StaticVar {

	public static final String format = "json";
	public static final String charset = "utf-8";
	public static final String sign_type = "RSA";
	public static final String serverUrl = "https://openapi.alipay.com/gateway.do";

	/**
	 * 服务商
	 */
	public static final int USERS_TYPE1 = 1;
	/**
	 * 物业
	 */
	public static final int USERS_TYPE2 = 2;
	/**
	 * 小区
	 */
	public static final int USERS_TYPE3 = 3;
	/**
	 * 超级管理员
	 */
	public static final int USERS_TYPE99 = 99;



	/**
	 * 新建小区
	 */
	public static final String HOUSING_STATUS_NEW = "NEW";
	/**
	 * 待上线
	 */
	public static final String HOUSING_STATUS_PENDING_ONLINE = "PENDING_ONLINE";
	/**
	 * 上线
	 */
	public static final String HOUSING_STATUS_ONLINE = "ONLINE";
	/**
	 * 维护中
	 */
	public static final String HOUSING_STATUS_MAINTAIN = "MAINTAIN";
	/**
	 * 下线
	 */
	public static final String HOUSING_STATUS_OFFLINE = "OFFLINE";


	/**
	 * 支付方式 现金
	 */
	public static final int billaccount_paystatus1 = 1;
	/**
	 * 支付方式 支付宝
	 */
	public static final int billaccount_paystatus2 = 2;
	/**
	 * 支付方式 微信
	 */
	public static final int billaccount_paystatus3 = 3;
	/**
	 * 支付方式 POS机
	 */
	public static final int billaccount_paystatus4 = 4;
	/**
	 * 支付方式 其他
	 */
	public static final int billaccount_paystatus99 = 99;
}
