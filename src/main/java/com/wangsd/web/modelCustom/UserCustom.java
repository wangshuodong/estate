package com.wangsd.web.modelCustom;

import com.wangsd.web.model.Users;

/**
 * Created by Administrator on 2017/11/7.
 */
public class UserCustom extends Users {

    private String deptName;

    private String departmentCode;

    private Integer deptType;

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public Integer getDeptType() {
        return deptType;
    }

    public void setDeptType(Integer deptType) {
        this.deptType = deptType;
    }

    public String getDepartmentCode() {
        return departmentCode;
    }

    public void setDepartmentCode(String departmentCode) {
        this.departmentCode = departmentCode;
    }
}
