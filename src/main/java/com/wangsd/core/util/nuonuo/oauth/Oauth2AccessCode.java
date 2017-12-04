package com.wangsd.core.util.nuonuo.oauth;

/**
 *第一步：获取授权码时请求的参数定义
 * @author sdk.jss.com.cn
 * @version 1.0
 * @since jdk1.6
 */
public class Oauth2AccessCode {
	
	private String client_id;//加入诺诺开放平台登录成功后，分配给应用的appSecret。
	
	private String response_type;//授权类型，此值固定为“code”
   
	private String redirect_uri;//成功授权后的回调地址，必须是创建应用时填写的主域名下的地址
	
	private String appKey;//加入诺诺开放平台登录成功后，分配给应用的appKey。

	public String getClient_id() {
		return client_id;
	}

	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}

	public String getResponse_type() {
		return response_type;
	}

	public void setResponse_type(String response_type) {
		this.response_type = response_type;
	}

	public String getRedirect_uri() {
		return redirect_uri;
	}

	public void setRedirect_uri(String redirect_uri) {
		this.redirect_uri = redirect_uri;
	}

	public String getAppKey() {
		return appKey;
	}

	public void setAppKey(String appKey) {
		this.appKey = appKey;
	}
	
	
}
