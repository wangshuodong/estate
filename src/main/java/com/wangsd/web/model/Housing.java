package com.wangsd.web.model;

public class Housing {
    private Integer id;

    private Integer departmentId;

    private String communityId;

    private String districtCode;

    private String cityCode;

    private String provinceCode;

    private String communityLocations;

    private String associatedPois;

    private String hotline;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
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
}