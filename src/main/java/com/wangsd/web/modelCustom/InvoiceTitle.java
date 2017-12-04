package com.wangsd.web.modelCustom;

import java.util.List;

/**
 * 发票抬头信息
 */
public class InvoiceTitle {
    private String buyerPhone;//购方手机（开票成功会短信提醒购方，不受推送方式影响）
    private String pushMode;
    private String invoiceDate;
    private String invoiceType;
    private String buyerName;
    private String orderNo;//订单号（每个企业唯一）
    private String clerk;//开票员
    private String salerTel;//销方电话
    private String salerAddress;//销方地址
    private String salerTaxNum;//销方税号
    private List<InvoiceTitleDetail> invoiceDetail;

    public String getBuyerPhone() {
        return buyerPhone;
    }

    public void setBuyerPhone(String buyerPhone) {
        this.buyerPhone = buyerPhone;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getClerk() {
        return clerk;
    }

    public void setClerk(String clerk) {
        this.clerk = clerk;
    }

    public String getSalerTel() {
        return salerTel;
    }

    public void setSalerTel(String salerTel) {
        this.salerTel = salerTel;
    }

    public String getSalerAddress() {
        return salerAddress;
    }

    public void setSalerAddress(String salerAddress) {
        this.salerAddress = salerAddress;
    }

    public String getSalerTaxNum() {
        return salerTaxNum;
    }

    public void setSalerTaxNum(String salerTaxNum) {
        this.salerTaxNum = salerTaxNum;
    }

    public List<InvoiceTitleDetail> getInvoiceDetail() {
        return invoiceDetail;
    }

    public void setInvoiceDetail(List<InvoiceTitleDetail> invoiceDetail) {
        this.invoiceDetail = invoiceDetail;
    }

    public String getPushMode() {
        return pushMode;
    }

    public void setPushMode(String pushMode) {
        this.pushMode = pushMode;
    }

    public String getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(String invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public String getInvoiceType() {
        return invoiceType;
    }

    public void setInvoiceType(String invoiceType) {
        this.invoiceType = invoiceType;
    }

    public String getBuyerName() {
        return buyerName;
    }

    public void setBuyerName(String buyerName) {
        this.buyerName = buyerName;
    }
}
