package com.wangsd.web.controller;

import com.wangsd.web.model.Billaccount;
import com.wangsd.web.modelCustom.BillAccountCustom;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.BillAccountService;
import com.wangsd.web.service.HousinginfoServic;
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
    RoominfoService roominfoService;
    @Autowired
    HousinginfoServic housinginfoServic;

    /**
     * 根据部门code查询账单信息
     * @param query
     * @return
     */
    @RequestMapping("/billAccountList")
    public String billAccountList(BillAccountCustom query, HttpServletRequest request, Model model) {
        UserCustom loginUser = (UserCustom) request.getSession().getAttribute("userInfo");
        String parentCode = loginUser.getParentCode();
        query.setHousingCode(parentCode);
        List<BillAccountCustom> list = billAccountService.queryBillAccountList(query);
        model.addAttribute("billaccountList", list);
        return "/billaccount/billaccount-list";
    }

    /**
     * 跳转编辑账单
     * @param
     * @return
     */
    @RequestMapping("/openBillAccount")
    public String openBillAccount(Integer id, HttpServletRequest request, Model model) {
        UserCustom loginUser = (UserCustom) request.getSession().getAttribute("userInfo");
        List<ParentCustom> parentList = housinginfoServic.queryParentHousingByCode(loginUser.getParentCode());
        model.addAttribute("parentList", parentList);
//        List<Department> parentList = departmentService.queryDepartmentList(user.getDepartmentCode(), 3);
//        model.addAttribute("parentList", parentList);
//        RoominfoCustom query = new RoominfoCustom();
//        query.setDepartmentCode(user.getDepartmentCode());
    //    List<RoominfoCustom> roominfoDist = roominfoService.queryRoominfoDistinct(query);
  //      model.addAttribute("roominfoDist", roominfoDist);
        if (id != null) {
            Billaccount billaccount = billAccountService.selectBillAccountById(id);
            model.addAttribute("billaccount", billaccount);
        }
        return "/billaccount/billaccount-info";
    }


}
