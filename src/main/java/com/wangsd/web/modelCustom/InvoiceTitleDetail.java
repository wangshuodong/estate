package com.wangsd.web.modelCustom;

/**
 * 发票抬头信息
 */
public class InvoiceTitleDetail {
    private String goodsName;//商品名称（如invoiceLineProperty =1，则此商品行为折扣行，折扣行不允许多行折扣，折扣行必须紧邻被折扣行，商品名称必须与被折扣行一致）
    private String num;//数量（冲红时项目数量为负数）
    private String withTaxFlag;//单价含税标志，0:不含税,1:含税
    private String price;//单价金额
    private String taxRate;//税率

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getWithTaxFlag() {
        return withTaxFlag;
    }

    public void setWithTaxFlag(String withTaxFlag) {
        this.withTaxFlag = withTaxFlag;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getTaxRate() {
        return taxRate;
    }

    public void setTaxRate(String taxRate) {
        this.taxRate = taxRate;
    }
}
