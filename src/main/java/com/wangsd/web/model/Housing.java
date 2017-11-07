package com.wangsd.web.model;

import java.util.Date;

public class Housing {
    private Integer housId;

    private String housName;

    private String address;

    private Integer departmentId;

    private String departmentCode;

    private String communityId;

    private String districtCode;

    private String cityCode;

    private String provinceCode;

    private String communityLocations;

    private String associatedPois;

    private String hotline;

    private Byte init;

    private String status;

    private Date createTime;

    public Integer getHousId() {
        return housId;
    }

    public void setHousId(Integer housId) {
        this.housId = housId;
    }

    public String getHousName() {
        return housName;
    }

    public void setHousName(String housName) {
        this.housName = housName == null ? null : housName.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public String getDepartmentCode() {
        return departmentCode;
    }

    public void setDepartmentCode(String departmentCode) {
        this.departmentCode = departmentCode == null ? null : departmentCode.trim();
    }

    public String getCommunityId() {
        return communityId;
    }

    public void setCommunityId(String communityId) {
        this.communityId = communityId == null ? null : communityId.trim();
    }

    public String getDistrictCode() {
        return districtCode;
    }

    public void setDistrictCode(String districtCode) {
        this.districtCode = districtCode == null ? null : districtCode.trim();
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode == null ? null : cityCode.trim();
    }

    public String getProvinceCode() {
        return provinceCode;
    }

    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode == null ? null : provinceCode.trim();
    }

    public String getCommunityLocations() {
        return communityLocations;
    }

    public void setCommunityLocations(String communityLocations) {
        this.communityLocations = communityLocations == null ? null : communityLocations.trim();
    }

    public String getAssociatedPois() {
        return associatedPois;
    }

    public void setAssociatedPois(String associatedPois) {
        this.associatedPois = associatedPois == null ? null : associatedPois.trim();
    }

    public String getHotline() {
        return hotline;
    }

    public void setHotline(String hotline) {
        this.hotline = hotline == null ? null : hotline.trim();
    }

    public Byte getInit() {
        return init;
    }

    public void setInit(Byte init) {
        this.init = init;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}