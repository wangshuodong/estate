package com.wangsd.core.util;

public class StaticVar {

	public static final String format = "json";
	public static final String charset = "utf-8";
	public static final String sign_type = "RSA";
	public static final String serverUrl = "https://openapi.alipay.com/gateway.do";

	public static final String invoice_appid = "2016082000296074";
	public static final String invoice_privateKey = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAJh7pRQLGNPmSRwho2R7YDlF3odXEYwWUv6riOu/8u/TLesG3xn7H/1fpHxWUzSsfLD427zT798fXhD7U9a26BzSmNMw3aR0NjWfkXqsK4xgfj6eWd6nQ2uk/k6tGZpHSXhnqxGzwMgsc6hV+gUEVGkc/OQZBLp8ICDCb+SFsNm5AgMBAAECgYA5ks30sG/yakwGhCj2YqMlXN01yslEVJWHtOrg4Lvwk5MN361TWP9uIrOvgsSt6ca252/Ib1ltrKFO1iaEttESo7ioTIhJjRnwQD3CHb+H6swFmb4EbXelS752I5A+4XvDxNV6gagyESNWi1eAh7R4JifGpqJs7HzOzb8SBoskhQJBAMeNQGAdoHOtnaU/2BWfmbM8qW2juq9GO5SFG+x2buNHtXCPVDoNw6LXvtbysJa4tZmN0JG5hhyiZ+6n0IsqxNsCQQDDndvnk5n3fzI/l6kHMUCQmYalnAl4A51hqELhgvBHdPd7uZ6iTFdcQAQeWWb0cQG6velDRWpomRKRp33zqbX7AkEAgt2UYTQsvJAYOX30FMI1BwF6T0e3ryiM/CqLFHja4bxuNeIZJ3VNXmbEZayEuGNr3MbPCDI1zGOJa06sigfDTwJAFhKi9K+ICRBWOCzByuj40xgvxFImE1+9C370BQREXpvJLTHVv5SDqwoiLNaDsoNp4Yt6XbfgeOsE2GCg6rS0rwJAYJOscOrgHbMHJooCdR+c3RMWh4RswzEVnTucEpo8ra2DIDFR+1e/jnSgqqvYZOFF/+tIRI4TOomYUkbjsycfNQ==";
	public static final String invoice_publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIgHnOn7LLILlKETd6BFRJ0GqgS2Y3mn1wMQmyh9zEyWlz5p1zrahRahbXAfCfSqshSNfqOmAQzSHRVjCqjsAw1jyqrXaPdKBmr90DIpIxmIyKXv4GGAkPyJ/6FTFY99uhpiq0qadD/uSzQsefWo0aTvP/65zi3eof7TcZ32oWpwIDAQAB";


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
	public static final int BILLACCOUNT_PAYSTATUS1 = 1;
	/**
	 * 支付方式 支付宝
	 */
	public static final int BILLACCOUNT_PAYSTATUS2 = 2;
	/**
	 * 支付方式 微信
	 */
	public static final int BILLACCOUNT_PAYSTATUS3 = 3;
	/**
	 * 支付方式 POS机
	 */
	public static final int BILLACCOUNT_PAYSTATUS4 = 4;
	/**
	 * 支付方式 其他
	 */
	public static final int BILLACCOUNT_PAYSTATUS99 = 99;


	/**
	 * 开票状态 未开票
	 */
	public static final int BILLACCOUNT_TICKETSTATUS0 = 0;
	/**
	 * 开票状态 申请中
	 */
	public static final int BILLACCOUNT_TICKETSTATUS1 = 1;
	/**
	 * 开票状态 同意
	 */
	public static final int BILLACCOUNT_TICKETSTATUS2 = 2;
	/**
	 * 开票状态 拒绝
	 */
	public static final int BILLACCOUNT_TICKETSTATUS3 = 3;
	/**
	 * 开票状态 开票成功
	 */
	public static final int BILLACCOUNT_TICKETSTATUS4 = 4;
	/**
	 * 开票状态 开票失败
	 */
	public static final int BILLACCOUNT_TICKETSTATUS5 = 5;
}
