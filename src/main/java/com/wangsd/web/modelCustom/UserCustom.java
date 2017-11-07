package com.wangsd.web.modelCustom;

import com.wangsd.web.model.Department;
import com.wangsd.web.model.Users;

/**
 * Created by Administrator on 2017/11/7.
 */
public class UserCustom extends Users{
    private Department department;

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
}
