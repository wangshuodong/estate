package com.wangsd.web.service.impl;


import com.wangsd.web.dao.DepartmentMapper;
import com.wangsd.web.model.Department;
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

}
