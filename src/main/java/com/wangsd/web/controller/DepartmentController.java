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
     * 查询所有Department
     *
     * @param type    1查询服务商，2查询物业，3查询小区
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/departmentList")
    public String departmentList(Integer type, HttpServletRequest request, Model model) {
        UserCustom obj = (UserCustom) request.getSession().getAttribute("userInfo");
        String departmentCode = obj.getDepartmentCode();
        Department department = new Department();
        department.setCode(departmentCode);
        department.setType(type);
        List<DepartmentCustom> list = departmentService.queryDepartmentListByCode(department);
        model.addAttribute("departmentList", list);
        return "/service/service-list";
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
        UserCustom obj = (UserCustom) request.getSession().getAttribute("userInfo");
        String departmentCode = obj.getDepartmentCode();
        Department department = new Department();
        department.setCode(departmentCode);
        department.setType(type);
        List<DepartmentCustom> list = departmentService.queryDepartmentListByCode(department);
        model.addAttribute("parentDepartment", list);
        return "/service/service-info";
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
        UserCustom userInfo = (UserCustom) request.getSession().getAttribute("userInfo");
        String departmentCode = userInfo.getDepartmentCode();
        Department query = new Department();
        query.setCode(departmentCode);
        query.setType(dep.getType());
        List<DepartmentCustom> list = departmentService.queryDepartmentListByCode(query);
        model.addAttribute("parentDepartment", list);
        Department department = departmentService.findDepartmentById(dep.getId());
        model.addAttribute("department", department);
        return "/service/service-info";
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
     * @param departmentId
     * @return
     */
    @RequestMapping("/deleteDepartment")
    @ResponseBody
    public JSONResult deleteDepartment(Integer departmentId) {
        JSONResult obj = new JSONResult();
        boolean delStatus = departmentService.deleteDepartmentById(departmentId);
        obj.setSuccess(delStatus);
        return obj;
    }

}