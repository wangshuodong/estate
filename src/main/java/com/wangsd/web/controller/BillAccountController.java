package com.wangsd.web.controller;

import com.wangsd.web.model.Billaccount;
import com.wangsd.web.model.Department;
import com.wangsd.web.modelCustom.BillAccountCustom;
import com.wangsd.web.modelCustom.RoominfoCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.BillAccountService;
import com.wangsd.web.service.DepartmentService;
import com.wangsd.web.service.RoominfoService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 账单管理Controller
 */
@Controller
@RequestMapping("/billAccount")
public class BillAccountController {
    private static final Logger logger = LogManager.getLogger(BillAccountController.class.getName());
    @Autowired
    BillAccountService billAccountService;
    @Autowired
    DepartmentService departmentService;
    @Autowired
    RoominfoService roominfoService;

    /**
     * 根据部门code查询账单信息
     * @param billAccountCustom
     * @return
     */
    @RequestMapping("/billAccountList")
    public String billAccountList(BillAccountCustom billAccountCustom, HttpServletRequest request, Model model) {
        UserCustom obj = (UserCustom) request.getSession().getAttribute("userInfo");
        String departmentCode = obj.getDepartmentCode();
        Department department = new Department();
        department.setCode(departmentCode);
        List<BillAccountCustom> list = billAccountService.queryBillAccountListByCode(department);
        model.addAttribute("billaccountList", list);
        return "/billaccount/billaccount-list";
    }

    /**
     * 跳转新增账单页面
     * @param
     * @return
     */
    @RequestMapping("/addBillAccount")
    public String addBillAccount( HttpServletRequest request, Model model) {
        UserCustom user = (UserCustom) request.getSession().getAttribute("userInfo");
        List<Department> parentList = departmentService.queryDepartmentList(user.getDepartmentCode(), 3);
        model.addAttribute("parentList", parentList);
        RoominfoCustom query = new RoominfoCustom();
        query.setDepartmentCode(user.getDepartmentCode());
        List<RoominfoCustom> roominfoDist = roominfoService.queryRoominfoDistinct(query);
        List<RoominfoCustom> roominfoList = roominfoService.queryRoominfoList(query);
        model.addAttribute("roominfoDist", roominfoDist);
        model.addAttribute("roominfoList", roominfoList);
        return "/billaccount/billaccount-info";
    }

    /**
     * 跳转编辑账单
     * @param
     * @return
     */
    @RequestMapping("/updateBillAccount")
    public String updateBillAccount(Integer id, HttpServletRequest request, Model model) {
        UserCustom user = (UserCustom) request.getSession().getAttribute("userInfo");
        List<Department> parentList = departmentService.queryDepartmentList(user.getDepartmentCode(), 3);
        model.addAttribute("parentList", parentList);
        RoominfoCustom query = new RoominfoCustom();
        query.setDepartmentCode(user.getDepartmentCode());
    //    List<RoominfoCustom> roominfoDist = roominfoService.queryRoominfoDistinct(query);
  //      model.addAttribute("roominfoDist", roominfoDist);
        Billaccount billaccount = billAccountService.selectBillAccountById(id);
        model.addAttribute("billaccount", billaccount);
        return "/billaccount/billaccount-info";
    }


}
