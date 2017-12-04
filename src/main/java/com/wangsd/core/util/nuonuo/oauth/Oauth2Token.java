package com.wangsd.core.util.nuonuo.oauth;

/**
 *第二步：获取token和用户信息时请求的参数定义
 * @author sdk.jss.com.cn
 * @version 1.0
 * @since jdk1.6
 */
public class Oauth2Token {
  
	private String client_id;//加入诺诺开放平台登录成功后，分配给应用的appSecret
	
	private String code;//授权码，请求/authorize时返回的Authorization Code
	
	private String redirect_uri;//成功授权后的回调地址，必须是创建应用时填写的主域名下的地址
	
	private String appKey;//加入诺诺开放平台登录成功后，分配给应用的appKey
	
	private String client_secret;//加入诺诺开放平台登录成功后，分配给应用的appSecret
	
	private String grant_type;//授权类型，在本步骤中，此值为“authorization_code”

	public String getClient_id() {
		return client_id;
	}

	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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

	public String getClient_secret() {
		return client_secret;
	}

	public void setClient_secret(String client_secret) {
		this.client_secret = client_secret;
	}

	public String getGrant_type() {
		return grant_type;
	}

	public void setGrant_type(String grant_type) {
		this.grant_type = grant_type;
	}
	
}
