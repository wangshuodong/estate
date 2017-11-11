package com.wangsd.web.service;

import com.wangsd.web.model.Department;
import com.wangsd.web.modelCustom.DepartmentCustom;

import java.util.List;

public interface DepartmentService {

	/**
	 * 根据部门code查询所有公司
	 * @param department
	 * @return
	 */
	public List<DepartmentCustom> queryDepartmentListByCode(Department department);

}
