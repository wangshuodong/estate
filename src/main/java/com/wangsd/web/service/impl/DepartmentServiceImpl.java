package com.wangsd.web.service.impl;


import com.wangsd.core.util.ApplicationUtils;
import com.wangsd.core.util.StaticVar;
import com.wangsd.web.dao.DepartmentMapper;
import com.wangsd.web.dao.HousingMapper;
import com.wangsd.web.dao.PropertyMapper;
import com.wangsd.web.dao.ServiceinfoMapper;
import com.wangsd.web.model.*;
import com.wangsd.web.modelCustom.DepartmentCustom;
import com.wangsd.web.modelCustom.HousingCustom;
import com.wangsd.web.service.DepartmentService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    HousingMapper housingMapper;
    @Autowired
    ServiceinfoMapper serviceinfoMapper;
    @Autowired
    PropertyMapper propertyMapper;

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
        criteria.andDeletestatusEqualTo(false);
        if (type != null) {
            criteria.andTypeEqualTo(type);
        }
        List<Department> list = departmentMapper.selectByExample(example);
        return list;
    }

    @Override
    public Department selectDepartmentById(int id) {
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
    public boolean saveOrUpdateHousing(HousingCustom housingCustom) {
        int ret;
        if (housingCustom.getDepartmentId() == null) { // 新增
            Department department = new Department();
            BeanUtils.copyProperties(housingCustom, department);
            department.setType(StaticVar.DEPARTMENT_TYPE3);
            department.setCreateTime(new Date());
            department.setStatus(StaticVar.DEPARTMENT_STATUS_NEW);
            Department parent = selectDepartmentById(housingCustom.getParentId());
            String maxCode = selectMaxByParentCode(housingCustom.getParentId());
            if (maxCode == null) {
                department.setCode(parent.getCode() + "0001");
            }else {
                department.setCode(ApplicationUtils.getOrgCode(maxCode));
            }
            departmentMapper.insertSelective(department);
            housingCustom.setDepartmentId(department.getId());
            ret = housingMapper.insert(housingCustom);
        }else {
            Department department = departmentMapper.selectByPrimaryKey(housingCustom.getDepartmentId());
            if (department.getParentId() != housingCustom.getParentId()) {
                Department parent = selectDepartmentById(housingCustom.getParentId());
                String maxCode = selectMaxByParentCode(housingCustom.getParentId());
                if (maxCode == null) {
                    department.setCode(parent.getCode() + "0001");
                }else {
                    department.setCode(ApplicationUtils.getOrgCode(maxCode));
                }
                department.setParentId(housingCustom.getParentId());
            }
            department.setContactPeople(housingCustom.getContactPeople());
            department.setAddress(housingCustom.getAddress());
            department.setRegion(housingCustom.getRegion());
            department.setName(housingCustom.getName());
            department.setPhone(housingCustom.getPhone());
            departmentMapper.updateByPrimaryKeySelective(department);
            ret = housingMapper.updateByPrimaryKeySelective(housingCustom);
        }
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    public HousingCustom selectHousingCustomBydeptId(Integer deptId) {
        return departmentMapper.selectHousingCustomBydeptId(deptId);
    }

    public ServiceinfoWithBLOBs selectServicekeyBydeptId(Integer deptId){
        ServiceinfoWithBLOBs serviceinfo = null;
        ServiceinfoExample example = new ServiceinfoExample();
        example.createCriteria().andDepartmentIdEqualTo(deptId);
        List<ServiceinfoWithBLOBs> list = serviceinfoMapper.selectByExampleWithBLOBs(example);
        if(list != null && list.size() >0 ){
            serviceinfo = list.get(0);
        }
        return serviceinfo;
    }

    @Override
    public String selectMaxByParentCode(Integer parentId) {
        return departmentMapper.selectMaxByParentCode(parentId);
    }

    @Override
    public boolean saveOrUpdateServicekey(ServiceinfoWithBLOBs serviceinfo){
        int ret;
        if(serviceinfo.getId() == null){//新增
            ret = serviceinfoMapper.insert(serviceinfo);
        }else{
            ret = serviceinfoMapper.updateByPrimaryKeySelective(serviceinfo);
        }
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }
    @Override
    public Property selectPropertyBydeptId(Integer deptId){
        Property property = null;
        PropertyExample example = new PropertyExample();
        example.createCriteria().andDepartmentIdEqualTo(deptId);
        List<Property> list = propertyMapper.selectByExample(example);
        if(list != null && list.size() >0 ){
            property = list.get(0);
        }
        return property;
    }
    @Override
    public boolean saveOrUpdateProperty(Property poperty){
        int ret;
        if(poperty.getId() == null){//新增
            ret = propertyMapper.insert(poperty);
        }else{
            ret = propertyMapper.updateByPrimaryKeySelective(poperty);
        }
        if (ret > 0) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Department selectDepartmentByCode(String code) {
        Department department = null;
        DepartmentExample example = new DepartmentExample();
        example.createCriteria().andCodeEqualTo(code);
        List<Department> list = departmentMapper.selectByExample(example);
        if (list != null && list.size() > 0) {
            department = list.get(0);
        }
        return department;
    }
}
