package com.wangsd.web.service;

import com.wangsd.web.model.Department;
import com.wangsd.web.modelCustom.DepartmentCustom;

import java.util.List;

public interface DepartmentService {

	/**
	 * 根据部门code查询所有Department
	 * @param department
	 * @return
	 */
	public List<DepartmentCustom> queryDepartmentListByCode(Department department);

	/**
	 * 查询下拉列表所需要的Department
	 * @param code
	 * @return
	 */
	public List<Department> queryDepartmentList(String code, Integer type);

	/**
	 * 根据id查询Department
	 * @param id
	 * @return
	 */
	public Department findDepartmentById(int id);

	/**
	 * 新增或修改Department
	 * @param department
	 * @return
	 */
	public boolean saveOrUpdateDepartment(Department department);

	/**
	 * 根据id删除Department
	 * @param id
	 * @return
	 */
	public boolean deleteDepartmentById(Integer id);

	/**
	 * 查询parent下面的最大code
	 * @param parentId
	 * @return
	 */
	public String selectMaxByParentCode(Integer parentId);
}
