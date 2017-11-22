package com.wangsd.web.model;

import java.util.Date;

public class Billaccount {
    private Integer id;

    private Integer housingId;

    private Integer roominfoId;

    private Integer costType;

    private Double billEntryAmount;

    private String acctPeriod;

    private String releaseDay;

    private String deadline;

    private String relateId;

    private Boolean status;

    private Date paydate;

    private Integer paytype;

    private Boolean paystatus;

    private Boolean deletestatus;

    private String alipayTradeNo;

    private String weixinTradeNo;

    private Byte printstatus;

    private Boolean ticketstatus;

    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getHousingId() {
        return housingId;
    }

    public void setHousingId(Integer housingId) {
        this.housingId = housingId;
    }

    public Integer getRoominfoId() {
        return roominfoId;
    }

    public void setRoominfoId(Integer roominfoId) {
        this.roominfoId = roominfoId;
    }

    public Integer getCostType() {
        return costType;
    }

    public void setCostType(Integer costType) {
        this.costType = costType;
    }

    public Double getBillEntryAmount() {
        return billEntryAmount;
    }

    public void setBillEntryAmount(Double billEntryAmount) {
        this.billEntryAmount = billEntryAmount;
    }

    public String getAcctPeriod() {
        return acctPeriod;
    }

    public void setAcctPeriod(String acctPeriod) {
        this.acctPeriod = acctPeriod == null ? null : acctPeriod.trim();
    }

    public String getReleaseDay() {
        return releaseDay;
    }

    public void setReleaseDay(String releaseDay) {
        this.releaseDay = releaseDay == null ? null : releaseDay.trim();
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline == null ? null : deadline.trim();
    }

    public String getRelateId() {
        return relateId;
    }

    public void setRelateId(String relateId) {
        this.relateId = relateId == null ? null : relateId.trim();
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Date getPaydate() {
        return paydate;
    }

    public void setPaydate(Date paydate) {
        this.paydate = paydate;
    }

    public Integer getPaytype() {
        return paytype;
    }

    public void setPaytype(Integer paytype) {
        this.paytype = paytype;
    }

    public Boolean getPaystatus() {
        return paystatus;
    }

    public void setPaystatus(Boolean paystatus) {
        this.paystatus = paystatus;
    }

    public Boolean getDeletestatus() {
        return deletestatus;
    }

    public void setDeletestatus(Boolean deletestatus) {
        this.deletestatus = deletestatus;
    }

    public String getAlipayTradeNo() {
        return alipayTradeNo;
    }

    public void setAlipayTradeNo(String alipayTradeNo) {
        this.alipayTradeNo = alipayTradeNo == null ? null : alipayTradeNo.trim();
    }

    public String getWeixinTradeNo() {
        return weixinTradeNo;
    }

    public void setWeixinTradeNo(String weixinTradeNo) {
        this.weixinTradeNo = weixinTradeNo == null ? null : weixinTradeNo.trim();
    }

    public Byte getPrintstatus() {
        return printstatus;
    }

    public void setPrintstatus(Byte printstatus) {
        this.printstatus = printstatus;
    }

    public Boolean getTicketstatus() {
        return ticketstatus;
    }

    public void setTicketstatus(Boolean ticketstatus) {
        this.ticketstatus = ticketstatus;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}