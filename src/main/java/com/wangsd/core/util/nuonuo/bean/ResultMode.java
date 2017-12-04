package com.wangsd.core.util.nuonuo.bean;
/**
 * 返回数据model
 * @author sdk.jss.com.cn
 * @version 1.0
 * @since jdk1.6
 */
public class ResultMode {

	/**
	 * 返回码
	 */
	private String code;
	
	/**
	 * 描述
	 */
	private String describe;
	
	/**
	 * 返回值
	 */
	private String result;

	public ResultMode() {
		// TODO Auto-generated constructor stub
	}
	
	public ResultMode(String code,String describe,String result) {
		this.code = code;
		this.describe = describe;
		this.result = result;
	}
	
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	
	
}
