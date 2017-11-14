package com.wangsd.web.service.impl;


import com.wangsd.web.dao.DepartmentMapper;
import com.wangsd.web.model.Department;
import com.wangsd.web.model.DepartmentExample;
import com.wangsd.web.modelCustom.DepartmentCustom;
import com.wangsd.web.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;

    @Override
    public List<DepartmentCustom> queryDepartmentListByCode(Department department) {
        List<DepartmentCustom> list = departmentMapper.queryDepartmentListByCode(department);
        return list;
    }

    @Override
    public List<Department> queryDepartmentList(String code, Integer type) {
        DepartmentExample example = new DepartmentExample();
        DepartmentExample.Criteria criteria = example.createCriteria();
        criteria.andCodeLike(code+"%");
        if (type != null) {
            criteria.andTypeEqualTo(type);
        }
        List<Department> list = departmentMapper.selectByExample(example);
        return list;
    }

    @Override
    public Department findDepartmentById(int id) {
        Department dep = departmentMapper.selectByPrimaryKey(id);
        return dep;
    }

    @Override
    public boolean deleteDepartmentById(Integer id) {
        Department department = new Department();
        department.setId(id);
        department.setDeletestatus(true);
        int ret = departmentMapper.updateByPrimaryKeySelective(department);
        if (ret > 0) {
            return true;
        } else {
            return false;
    }
    }

    @Override
    public boolean saveOrUpdateDepartment(Department department) {
        int ret = 0;
        if (department.getId() != null) {
            ret = departmentMapper.updateByPrimaryKeySelective(department);
        } else {
            ret = departmentMapper.insertSelective(department);
        }
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public String selectMaxByParentCode(Integer parentId) {
        return departmentMapper.selectMaxByParentCode(parentId);
    }
}
