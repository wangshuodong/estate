package com.wangsd.web.modelCustom;

import com.wangsd.web.model.Roominfo;

/**
 * Created by Administrator on 2017/11/13.
 */
public class RoominfoCustom extends Roominfo {
    private String housingName;

    private String housingCode;

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
