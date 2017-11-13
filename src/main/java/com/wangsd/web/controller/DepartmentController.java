package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.core.util.ApplicationUtils;
import com.wangsd.web.model.Department;
import com.wangsd.web.modelCustom.DepartmentCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 服务商控制器
 **/
@Controller
@RequestMapping("/department")
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;

    /**
     * 物业查询
     * @param dep
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/serviceList")
    public String serviceList(Department dep, HttpServletRequest request, Model model) {
        UserCustom user = (UserCustom) request.getSession().getAttribute("userInfo");
        String departmentCode;
        if (dep.getParentId() != null) {
            Department parent = departmentService.findDepartmentById(dep.getParentId());
            departmentCode = parent.getCode();
        }else {
            departmentCode = user.getDepartmentCode();
        }
        Department query = new Department();
        query.setCode(departmentCode);
        query.setType(1);
        List<DepartmentCustom> list = departmentService.queryDepartmentListByCode(query);
        model.addAttribute("departmentList", list);
        return "/service/service-list";
    }

    /**
     * 服务商查询
     * @param dep
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/propertyList")
    public String propertyList(Department dep, HttpServletRequest request, Model model) {
        UserCustom user = (UserCustom) request.getSession().getAttribute("userInfo");
        String departmentCode;
        if (dep.getParentId() != null) {
            Department parent = departmentService.findDepartmentById(dep.getParentId());
            departmentCode = parent.getCode();
        }else {
            departmentCode = user.getDepartmentCode();
        }
        Department query = new Department();
        query.setCode(departmentCode);
        query.setType(2);
        List<DepartmentCustom> list = departmentService.queryDepartmentListByCode(query);
        model.addAttribute("departmentList", list);
        return "/property/property-list";
    }

    /**
     * 小区查询
     * @param dep
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/housingList")
    public String housingList(Department dep, HttpServletRequest request, Model model) {
        UserCustom user = (UserCustom) request.getSession().getAttribute("userInfo");
        List<Department> parentList = departmentService.queryDepartmentList(user.getDepartmentCode(), 2);
        model.addAttribute("parentList", parentList);
        String departmentCode;
        if (dep.getParentId() != null && dep.getParentId() != 0) {
            Department parent = departmentService.findDepartmentById(dep.getParentId());
            departmentCode = parent.getCode();
        }else {
            departmentCode = user.getDepartmentCode();
        }
        Department query = new Department();
        query.setCode(departmentCode);
        query.setType(3);
        List<DepartmentCustom> list = departmentService.queryDepartmentListByCode(query);
        model.addAttribute("departmentList", list);
        model.addAttribute("query", dep);
        return "/housing/housing-list";
    }

    /**
     * 打开新增Department页面
     *
     * @param type    1查询服务商，2查询物业，3查询小区
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "addDepartment")
    public String addDepartment(Integer type, HttpServletRequest request, Model model) {
        UserCustom user = (UserCustom) request.getSession().getAttribute("userInfo");
        String returnUrl = null;
        if (type == 1) {
            List<Department> list = departmentService.queryDepartmentList(user.getDepartmentCode(), 1);
            model.addAttribute("parentDepartment", list);
            returnUrl = "/service/service-info";
        } else if (type == 2) {
            //新增物业的时候需要查询上级服务商
            List<Department> list = departmentService.queryDepartmentList(user.getDepartmentCode(), 1);
            model.addAttribute("parentDepartment", list);
            returnUrl = "/property/property-info";
        } else if (type == 3) {
            //新增小区的时候需要查询上级物业
            List<Department> list = departmentService.queryDepartmentList(user.getDepartmentCode(), 2);
            model.addAttribute("parentDepartment", list);
            returnUrl = "/housing/housing-info";
        }
        return returnUrl;
    }

    /**
     * 打开修改Department页面
     * @param dep
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/updateDepartment")
    public String updateDepartment(Department dep, HttpServletRequest request, Model model) {
        UserCustom user = (UserCustom) request.getSession().getAttribute("userInfo");
        String returnUrl = null;
        int type = 1;
        if (dep.getType() == 1) {
            List<Department> list = departmentService.queryDepartmentList(user.getDepartmentCode(), 1);
            model.addAttribute("parentDepartment", list);
            returnUrl = "/service/service-info";
        } else if (dep.getType() == 2) {
            //新增物业的时候需要查询上级服务商
            List<Department> list = departmentService.queryDepartmentList(user.getDepartmentCode(), 1);
            model.addAttribute("parentDepartment", list);
            returnUrl = "/property/property-info";
        } else if (dep.getType() == 3) {
            //新增小区的时候需要查询上级物业
            List<Department> list = departmentService.queryDepartmentList(user.getDepartmentCode(), 2);
            model.addAttribute("parentDepartment", list);
            returnUrl = "/housing/housing-info";
        }
        Department department = departmentService.findDepartmentById(dep.getId());
        model.addAttribute("department", department);
        return returnUrl;
    }

    /**
     * 新增或者保存Department
     * @param department
     * @param model
     * @return
     */
    @RequestMapping(path = "/saveOrUpdateDepartment", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult saveOrUpdateDepartment(Department department, Model model) {
        JSONResult obj = new JSONResult();
        Department parent = departmentService.findDepartmentById(department.getParentId());
        String maxCode = departmentService.selectMaxByParentCode(department.getParentId());
        if (maxCode == null) {
            department.setCode(parent.getCode() + "0001");
        }else {
            department.setCode(ApplicationUtils.getOrgCode(maxCode));
        }
        department.setCreateTime(new Date());
        boolean bl = departmentService.saveOrUpdateDepartment(department);
        obj.setSuccess(bl);
        return obj;
    }

    /**
     *  删除department
     * @param id
     * @return
     */
    @RequestMapping("/deleteDepartment")
    @ResponseBody
    public JSONResult deleteDepartment(Integer id) {
        JSONResult obj = new JSONResult();
        boolean delStatus = departmentService.deleteDepartmentById(id);
        obj.setSuccess(delStatus);
        return obj;
    }

}