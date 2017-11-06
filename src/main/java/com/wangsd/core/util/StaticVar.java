package com.wangsd.core.util;

public class StaticVar {

	/*
	 * 公司表	
	 */
	// 后台
	public static final int COMPANY_TYPE0 = 0;
	// 客户
	public static final int COMPANY_TYPE1 = 1;
	// 服务商
	public static final int COMPANY_TYPE2 = 2;
	// 安监局
	public static final int COMPANY_TYPE3 = 3;

	// 状态是公司
	public static final int COMPANY_STATUS0 = 0;
	// 状态是部门
	public static final int COMPANY_STATUS1 = 1;
	
	/*
	 * 角色表	
	 */		
	//平台管理员
	public static final String ROLE1 = "1";
	//客户管理员
	public static final String ROLE2 = "2";
	//客户普通员工
	public static final String ROLE3 = "3";
	//服务商管理员
	public static final String ROLE4 = "4";
	//财务
	public static final String ROLE5 = "5";
	//客服人员
	public static final String ROLE6 = "6";
	
	/*
	 * 客户表	
	 */	
	//普通员工
	public static final int CUSTOMER_USERTYPE1 = 1;
	//管理员
	public static final int CUSTOMER_USERTYPE2 = 2;
	
	/*
	 * 订单表	
	 */	
	//状态
	//订单号前缀
	public static final String TORDER_IDSTR = "DD";
	public static final int TORDER_STATUS0 = 0;
	public static final int TORDER_STATUS1 = 1;
	public static final int TORDER_STATUS2 = 2;
	public static final int TORDER_STATUS3 = 3;
	public static final int TORDER_STATUS5 = 5;
	public static final int TORDER_STATUS6 = 6;
	public static final int TORDER_STATUS7 = 7;
	public static final int TORDER_STATUS99 = 99;
	
	/*
	 * 订单明细表	
	 */	
	//服务类型
	public static final int ORDERDETAIL_TYPE0 = 0;
	public static final int ORDERDETAIL_TYPE1 = 1;
	public static final int ORDERDETAIL_TYPE2 = 2;

	/*
	 * 服务单表	
	 */	
	//服务单号前缀
	public static final String MAINTAIN_IDSTR = "FW";
	//维修
	public static final int MAINTAIN_SERVICETYPE0 = 0;
	//维保
	public static final int MAINTAIN_SERVICETYPE1 = 1;
	//年检
	public static final int MAINTAIN_SERVICETYPE2 = 2;
	//新建服务单
	public static final int MAINTAIN_STATUS0 = 0;
	//已分配服务单
	public static final int MAINTAIN_STATUS1 = 1;
	//服务单已接受
	public static final int MAINTAIN_STATUS2 = 2;
	//服务单已拒绝
	public static final int MAINTAIN_STATUS3 = 3;
	//服务单已已服务
	public static final int MAINTAIN_STATUS4 = 4;
	//服务单已已评价
	public static final int MAINTAIN_STATUS5 = 5;
	//服务单已已结算（服务商佣金已付款）
	public static final int MAINTAIN_STATUS6 = 6;
		
	/*
	 * 字典表	
	 */
	// 品牌
	public static final int DICTIONARY_TYPE1 = 1;
	// 规格
	public static final int DICTIONARY_TYPE2 = 2;
	// 气体类型
	public static final int DICTIONARY_TYPE3 = 3;
	
	/*
	 * SMS表	
	 */
	// 过期时间
	public static final int SENDSMS_OUTTIME2 = 2;
	
	//验证DTU编码的远程URL
	public static final String VALIDDTUCODE_URL = "http://www.87c6.com:8080/gasinternet/dtu/validateDtuCode.do";
	//public static final String VALIDDTUCODE_URL = "http://127.0.0.1:8080/gasinternet/dtu/validateDtuCode.do";
	
	//验证探头数据是否超标URL validProbeData
	public static final String VALIDPROBEDATA_URL = "http://www.87c6.com:8080/gasinternet/dtu/dataMap.do";
	//public static final String VALIDPROBEDATA_URL = "http://127.0.0.1:8080/gasinternet/dtu/dataMap.do";
	
}
