package com.wangsd.web.modelCustom;

import com.wangsd.web.model.Billaccount;

/**
 * Created by Administrator on 2017/11/16.
 */
public class BillAccountCustom extends Billaccount {

    private String costTypeName; //费用类型

    private String housingName; //小区名称

    private String housingCode; //小区code

    private String roominfoAddress; //房间详细名称

    private String ownerName; //业主姓名

    private String ownerCard; //业主身份证

    private String ownerPhone; //业主电话

    private Integer currPage;

    private Integer pageSize;

    /* 统计信息 */
    private Double sumAmount;
    private Integer countNum;
    private Integer userNum;
    private Integer propertyId;

    private Double fkAmount;
    private Double unfkAmount;
    private Integer fkCount;
    private Integer unfkCount;
    private Integer tbCount;
    private Integer untbCount;
    /* 统计信息 */




    public String getHousingName() {
        return housingName;
    }

    public void setHousingName(String housingName) {
        this.housingName = housingName;
    }

    public String getHousingCode() {
        return housingCode;
    }

    public void setHousingCode(String housingCode) {
        this.housingCode = housingCode;
    }

    public String getRoominfoAddress() {
        return roominfoAddress;
    }

    public void setRoominfoAddress(String roominfoAddress) {
        this.roominfoAddress = roominfoAddress;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public String getOwnerCard() {
        return ownerCard;
    }

    public void setOwnerCard(String ownerCard) {
        this.ownerCard = ownerCard;
    }

    public String getOwnerPhone() {
        return ownerPhone;
    }

    public void setOwnerPhone(String ownerPhone) {
        this.ownerPhone = ownerPhone;
    }

    public Integer getCurrPage() {
        return currPage;
    }

    public void setCurrPage(Integer currPage) {
        this.currPage = currPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Double getSumAmount() {
        return sumAmount;
    }

    public void setSumAmount(Double sumAmount) {
        this.sumAmount = sumAmount;
    }

    public Integer getCountNum() {
        return countNum;
    }

    public void setCountNum(Integer countNum) {
        this.countNum = countNum;
    }

    public Integer getUserNum() {
        return userNum;
    }

    public void setUserNum(Integer userNum) {
        this.userNum = userNum;
    }

    public Integer getPropertyId() {
        return propertyId;
    }

    public void setPropertyId(Integer propertyId) {
        this.propertyId = propertyId;
    }

    public Double getUnfkAmount() {
        return unfkAmount;
    }

    public void setUnfkAmount(Double unfkAmount) {
        this.unfkAmount = unfkAmount;
    }

    public Double getFkAmount() {
        return fkAmount;
    }

    public void setFkAmount(Double fkAmount) {
        this.fkAmount = fkAmount;
    }

    public Integer getFkCount() {
        return fkCount;
    }

    public void setFkCount(Integer fkCount) {
        this.fkCount = fkCount;
    }

    public Integer getUnfkCount() {
        return unfkCount;
    }

    public void setUnfkCount(Integer unfkCount) {
        this.unfkCount = unfkCount;
    }

    public Integer getTbCount() {
        return tbCount;
    }

    public void setTbCount(Integer tbCount) {
        this.tbCount = tbCount;
    }

    public Integer getUntbCount() {
        return untbCount;
    }

    public void setUntbCount(Integer untbCount) {
        this.untbCount = untbCount;
    }

    public String getCostTypeName() {
        return costTypeName;
    }

    public void setCostTypeName(String costTypeName) {
        this.costTypeName = costTypeName;
    }
}
