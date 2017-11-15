package com.wangsd.web.service;

import com.wangsd.web.model.Department;
import com.wangsd.web.model.Serviceinfo;
import com.wangsd.web.modelCustom.DepartmentCustom;
import com.wangsd.web.modelCustom.HousingCustom;

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
	 * 新增或修改小区
	 * @param housingCustom
	 * @return
	 */
	public boolean saveOrUpdateHousing(HousingCustom housingCustom);

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

	/**
	 * 根据部门id得到小区详情
	 * @param deptId
	 * @return
	 */
	public HousingCustom selectHousingCustomBydeptId(Integer deptId);

	/**
	 * 根据部门id查询公钥信息
	 * @param deptId
	 * @return
	 */
	public Serviceinfo selectServicekeyBydeptId(Integer deptId);

	/**
	 * 新增更新公钥信息
	 * @param Serviceinfo
	 * @return
	 */
	public boolean saveOrUpdateServicekey(Serviceinfo Serviceinfo);

}
