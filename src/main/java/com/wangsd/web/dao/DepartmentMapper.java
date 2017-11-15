package com.wangsd.web.dao;

import com.wangsd.web.model.Department;
import com.wangsd.web.model.DepartmentExample;
import com.wangsd.web.modelCustom.DepartmentCustom;
import com.wangsd.web.modelCustom.HousingCustom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepartmentMapper {
    int countByExample(DepartmentExample example);

    int deleteByExample(DepartmentExample example);

    int deleteByPrimaryKey(Integer deptId);

    int insert(Department record);

    int insertSelective(Department record);

    List<Department> selectByExample(DepartmentExample example);

    Department selectByPrimaryKey(Integer deptId);

    int updateByExampleSelective(@Param("record") Department record, @Param("example") DepartmentExample example);

    int updateByExample(@Param("record") Department record, @Param("example") DepartmentExample example);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);

    /**
     * 根据部门code查询所有公司
     * @param department
     * @return
     */
    List<DepartmentCustom> queryDepartmentListByCode(Department department);

    /**
     * 查询parent下面的最大code
     * @param parentId
     * @return
     */
    String selectMaxByParentCode(@Param("parentId") Integer parentId);

    /**
     * 根据部门id得到小区详情
     * @param deptId
     * @return
     */
    HousingCustom selectHousingCustomBydeptId(Integer deptId);
}