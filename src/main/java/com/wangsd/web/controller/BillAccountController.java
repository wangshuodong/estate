package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
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
     * 跳转新增账单
     * @param
     * @return
     */
    @RequestMapping("/addBillAccount")
    public String addBillAccount(HttpServletRequest request, Model model) {
        UserCustom loginUser = (UserCustom) request.getSession().getAttribute("userInfo");
        List<ParentCustom> parentList = housinginfoServic.queryParentHousingByCode(loginUser.getParentCode());
        model.addAttribute("parentList", parentList);
        return "/billaccount/billaccount-info";
    }

    /**
     * 跳转编辑账单
     * @param
     * @return
     */
    @RequestMapping("/updateBillAccount")
    public String updateBillAccount(Integer id, HttpServletRequest request, Model model) {
        BillAccountCustom query = new BillAccountCustom();
        query.setId(id);
        List<BillAccountCustom> list = billAccountService.queryBillAccountList(query);
        if (list.size() == 1) {
            BillAccountCustom billaccount = list.get(0);
            model.addAttribute("billaccount", billaccount);
        }
        return "/billaccount/billaccount-update";
    }

    @RequestMapping(path = "/saveOrUpdateBillAccount", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult saveOrUpdateBillAccount(Billaccount billaccount) {
        boolean bl;
        if (billaccount.getId() == null) {
            billaccount.setCreateTime(new Date());
            bl = billAccountService.insertBillaccount(billaccount);
        }else {
            bl = billAccountService.updateBillaccount(billaccount);
        }
        JSONResult obj = new JSONResult();
        obj.setSuccess(bl);
        return obj;
    }

}
