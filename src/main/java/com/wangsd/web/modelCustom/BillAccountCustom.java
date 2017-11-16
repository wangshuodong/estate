package com.wangsd.web.modelCustom;

import com.wangsd.web.model.Billaccount;

/**
 * Created by Administrator on 2017/11/16.
 */
public class BillAccountCustom extends Billaccount {

    private String deptName;

    private String departmentCode;

    private String roominfoaddress;

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

    public String getRoominfoaddress() {
        return roominfoaddress;
    }

    public void setRoominfoaddress(String roominfoaddress) {
        this.roominfoaddress = roominfoaddress;
    }
}
