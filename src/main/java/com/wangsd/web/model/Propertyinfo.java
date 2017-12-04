package com.wangsd.web.model;

import java.util.Date;

public class Propertyinfo {
    private Integer id;

    private String code;

    private String name;

    private String contactPeople;

    private String contactPhone;

    private String contactAddress;

    private String salertaxnum;

    private Integer parentId;

    private String alipayLoginId;

    private String appId;

    private String token;

    private String alipayDebitNum;

    private String weixinDebitNum;

    private String weixinChildrenNum;

    private String api;

    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getContactPeople() {
        return contactPeople;
    }

    public void setContactPeople(String contactPeople) {
        this.contactPeople = contactPeople == null ? null : contactPeople.trim();
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone == null ? null : contactPhone.trim();
    }

    public String getContactAddress() {
        return contactAddress;
    }

    public void setContactAddress(String contactAddress) {
        this.contactAddress = contactAddress == null ? null : contactAddress.trim();
    }

    public String getSalertaxnum() {
        return salertaxnum;
    }

    public void setSalertaxnum(String salertaxnum) {
        this.salertaxnum = salertaxnum == null ? null : salertaxnum.trim();
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
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

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}