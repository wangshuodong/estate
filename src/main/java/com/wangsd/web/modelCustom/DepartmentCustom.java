package com.wangsd.web.modelCustom;

import com.wangsd.web.model.Department;

/**
 * Created by Administrator on 2017/11/12.
 */
public class DepartmentCustom extends Department {
    private String parentName;

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }
}
