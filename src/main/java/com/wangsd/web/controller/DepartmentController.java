package com.wangsd.web.controller;

import com.wangsd.web.model.Department;
import com.wangsd.web.modelCustom.DepartmentCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 服务商控制器
 *
 **/
@Controller
@RequestMapping("/department")
public class DepartmentController {

    @Autowired
    DepartmentService departmentService;
    
    /**
     * 进入首页
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

}