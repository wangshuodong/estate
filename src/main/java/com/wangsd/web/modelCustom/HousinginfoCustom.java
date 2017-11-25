package com.wangsd.web.modelCustom;

import com.wangsd.web.model.Housinginfo;

/**
 * Created by wangsd on 2017/11/20.
 */
public class HousinginfoCustom extends Housinginfo {
    private String parentCode;
    private String token;
    private String printName;

    public String getParentCode() {
        return parentCode;
    }

    public void setParentCode(String parentCode) {
        this.parentCode = parentCode;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getPrintName() {
        return printName;
    }

    public void setPrintName(String printName) {
        this.printName = printName;
    }
}
