package com.wangsd.web.service;

import com.alibaba.fastjson.JSON;
import com.wangsd.core.feature.test.TestSupport;
import com.wangsd.web.model.Department;
import com.wangsd.web.modelCustom.HousingCustom;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Administrator on 2017/11/13.
 */
public class DepartmentServiceTest extends TestSupport {

    @Autowired
    DepartmentService departmentService;

    @Test
    public void queryDepartmentListByCode() throws Exception {

    }

    @Test
    public void queryDepartmentList() throws Exception {

    }

    @Test
    public void findDepartmentById() throws Exception {

    }

    @Test
    public void saveOrUpdateDepartment() throws Exception {

    }

    @Test
    public void deleteDepartmentById() throws Exception {

    }

    @Test
    public void selectMaxByParentCode() throws Exception {
        List<Department> list = departmentService.queryDepartmentList("001", null);
        System.out.println(JSON.toJSONStringWithDateFormat(list, "yyyy-MM-dd HH:mm:ss"));
    }

    @Test
    public void selectHousingCustomBydeptId() {
        HousingCustom obj = departmentService.selectHousingCustomBydeptId(22);
        System.out.println(JSON.toJSONStringWithDateFormat(obj, "yyyy-MM-dd HH:mm:ss"));
    }

}