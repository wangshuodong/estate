package com.wangsd.web.model;

public class Property {
    private Integer id;

    private Integer departmentId;

    private String alipayLoginId;

    private String appId;

    private String token;

    private String alipayDebitNum;

    private String weixinDebitNum;

    private String weixinChildrenNum;

    private String api;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public String getAlipayLoginId() {
        return alipayLoginId;
    }

    public void setAlipayLoginId(String alipayLoginId) {
        this.alipayLoginId = alipayLoginId == null ? null : alipayLoginId.trim();
    }

    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId == null ? null : appId.trim();
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token == null ? null : token.trim();
    }

    public String getAlipayDebitNum() {
        return alipayDebitNum;
    }

    public void setAlipayDebitNum(String alipayDebitNum) {
        this.alipayDebitNum = alipayDebitNum == null ? null : alipayDebitNum.trim();
    }

    public String getWeixinDebitNum() {
        return weixinDebitNum;
    }

    public void setWeixinDebitNum(String weixinDebitNum) {
        this.weixinDebitNum = weixinDebitNum == null ? null : weixinDebitNum.trim();
    }

    public String getWeixinChildrenNum() {
        return weixinChildrenNum;
    }

    public void setWeixinChildrenNum(String weixinChildrenNum) {
        this.weixinChildrenNum = weixinChildrenNum == null ? null : weixinChildrenNum.trim();
    }

    public String getApi() {
        return api;
    }

    public void setApi(String api) {
        this.api = api == null ? null : api.trim();
    }
}