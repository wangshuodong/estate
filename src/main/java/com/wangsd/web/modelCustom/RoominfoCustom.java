package com.wangsd.web.modelCustom;

import com.wangsd.web.model.Roominfo;

/**
 * Created by Administrator on 2017/11/13.
 */
public class RoominfoCustom extends Roominfo {
    private String deptName;

    private String departmentCode;

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getDepartmentCode() {
        return departmentCode;
    }

    public void setDepartmentCode(String departmentCode) {
        this.departmentCode = departmentCode;
    }
}
