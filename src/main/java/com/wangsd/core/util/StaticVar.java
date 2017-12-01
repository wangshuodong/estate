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
	 * 未同步
	 */
	public static final int HOUSING_STATUS1 = 1;
	/**
	 * 已同步
	 */
	public static final int HOUSING_STATUS2 = 2;
	/**
	 * 已初始化
	 */
	public static final int HOUSING_STATUS3 = 3;
	/**
	 * 已上线
	 */
	public static final int HOUSING_STATUS4 = 4;


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


//	/**
//	 * 物业管理费
//	 */
//	public static final int billaccount_cost_type1 = 1;
//	/**
//	 * 水电公摊费
//	 */
//	public static final int billaccount_cost_type2 = 2;
//	/**
//	 * 垃圾清运费
//	 */
//	public static final int billaccount_cost_type3 = 3;
//	/**
//	 * 公共照明费
//	 */
//	public static final int billaccount_cost_type4 = 4;
//	/**
//	 * 水费
//	 */
//	public static final int billaccount_cost_type5 = 5;
//	/**
//	 * 电费
//	 */
//	public static final int billaccount_cost_type6 = 6;
//	/**
//	 * 蒸汽费
//	 */
//	public static final int billaccount_cost_type7 = 7;
//	/**
//	 * 其他
//	 */
//	public static final int billaccount_cost_type99 = 99;
}
