package com.wangsd.web.model;

public class ServiceinfoWithBLOBs extends Serviceinfo {
    private String merchantPrivateKey;

    private String alipayPublicKey;

    public String getMerchantPrivateKey() {
        return merchantPrivateKey;
    }

    public void setMerchantPrivateKey(String merchantPrivateKey) {
        this.merchantPrivateKey = merchantPrivateKey == null ? null : merchantPrivateKey.trim();
    }

    public String getAlipayPublicKey() {
        return alipayPublicKey;
    }

    public void setAlipayPublicKey(String alipayPublicKey) {
        this.alipayPublicKey = alipayPublicKey == null ? null : alipayPublicKey.trim();
    }
}