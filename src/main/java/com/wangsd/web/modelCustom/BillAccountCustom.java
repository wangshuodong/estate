package com.wangsd.web.modelCustom;

import com.wangsd.web.model.Billaccount;

/**
 * Created by Administrator on 2017/11/16.
 */
public class BillAccountCustom extends Billaccount {

    private String housingName;

    private String housingCode;

    private String roominfoAddress;

    private String ownerName;

    private String ownerCard;

    private String ownerPhone;

    private Integer currPage;

    private Integer pageSize;

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
}
