package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.web.model.Billaccount;
import com.wangsd.web.modelCustom.BillAccountCustom;
import com.wangsd.web.modelCustom.HousinginfoCustom;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.AlipayService;
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
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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
    @Autowired
    AlipayService alipayService;

    /**
     * 根据部门code查询账单信息
     * @param query
     * @return
     */
    @RequestMapping("/billAccountList")
    public String billAccountList(BillAccountCustom query, HttpServletRequest request, Model model) {
        UserCustom loginUser = (UserCustom) request.getSession().getAttribute("userInfo");
        String parentCode = loginUser.getParentCode();
        List<ParentCustom> parentList = housinginfoServic.queryParentHousingByCode(loginUser.getParentCode());
        model.addAttribute("parentList", parentList);
        query.setHousingCode(parentCode);
        List<BillAccountCustom> list = billAccountService.queryBillAccountList(query);
        model.addAttribute("billaccountList", list);
        model.addAttribute("query", query);
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
        return "/billaccount/billaccount-add";
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

    /**
     * 跳转账单收款
     * @param
     * @return
     */
    @RequestMapping("/receivBillAccount")
    public String receivBillAccount(Integer id, HttpServletRequest request, Model model) {
        BillAccountCustom query = new BillAccountCustom();
        query.setId(id);
        List<BillAccountCustom> list = billAccountService.queryBillAccountList(query);
        if (list.size() == 1) {
            BillAccountCustom billaccount = list.get(0);
            model.addAttribute("billaccount", billaccount);
        }
        return "/billaccount/billaccount-receiv";
    }

    /**
     * 保存账单
     * @param billaccount
     * @return
     */
    @RequestMapping(path = "/saveOrUpdateBillAccount", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult saveOrUpdateBillAccount(Billaccount billaccount) {
        boolean bl = false;
        JSONResult obj = new JSONResult();
        BillAccountCustom bill = new BillAccountCustom();
        if (billaccount.getId() == null) {
            bill.setHousingId(billaccount.getHousingId());
            bill.setRoominfoId(billaccount.getRoominfoId());
            bill.setCostType(billaccount.getCostType());
            bill.setAcctPeriod(billaccount.getAcctPeriod());
            bill.setBillEntryAmount(billaccount.getBillEntryAmount());
            List<BillAccountCustom> billCustom = billAccountService.queryBillAccountList(bill);
            if(billCustom.size() == 0){
                billaccount.setCreateTime(new Date());
                bl = billAccountService.insertBillaccount(billaccount);
            }else{
                bl = false;
                obj.setMessage("账单信息已存在！");
            }
        }else {
            bl = billAccountService.updateBillaccount(billaccount);
        }

        obj.setSuccess(bl);
        return obj;
    }

    /**
     * 账单收款
     * @param billaccount
     * @return
     */
    @RequestMapping(path = "/receivBillAccount", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult receivBillAccount(Billaccount billaccount, HttpSession session) {
        boolean bl = false;
        JSONResult obj = new JSONResult();
        //删除支付宝账单
        Billaccount oldBill = billAccountService.selectBillAccountById(billaccount.getId());
        if (oldBill.getStatus()) {
            UserCustom loginUser = (UserCustom) session.getAttribute("userInfo");
            HousinginfoCustom housing = housinginfoServic.selectHousingCustomById(oldBill.getHousingId());
            List<String> bill_entry_id_list = new ArrayList<>();
            bill_entry_id_list.add(oldBill.getId().toString());
            alipayService.billDeleteRequest(housing.getCommunityId(), bill_entry_id_list, housing.getToken(), loginUser);
        }
        //更新收款信息
        billaccount.setPaystatus(true);
        billaccount.setPaydate(new Date());
        bl = billAccountService.updateBillaccount(billaccount);
        obj.setSuccess(bl);
        //打印小票

        return obj;
    }



}
