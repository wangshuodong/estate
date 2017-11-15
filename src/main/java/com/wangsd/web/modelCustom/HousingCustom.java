package com.wangsd.web.modelCustom;

import com.wangsd.web.model.Department;
import com.wangsd.web.model.Housing;

/**
 * Created by Administrator on 2017/11/15.
 */
public class HousingCustom extends Housing {
    private Department department;

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
}
