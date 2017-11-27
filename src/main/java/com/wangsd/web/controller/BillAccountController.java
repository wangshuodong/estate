package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.core.util.ApplicationUtils;
import com.wangsd.core.util.PrintMessage;
import com.wangsd.web.model.Billaccount;
import com.wangsd.web.model.Printinfo;
import com.wangsd.web.model.Roominfo;
import com.wangsd.web.modelCustom.BillAccountCustom;
import com.wangsd.web.modelCustom.HousinginfoCustom;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
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
    @Autowired
    PrintService printService;

    /**
     * 根据部门code查询账单信息
     *
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
     *
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
     *
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
     *
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
     *
     * @param billaccount
     * @return
     */
    @RequestMapping(path = "/saveOrUpdateBillAccount", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult saveOrUpdateBillAccount(Billaccount billaccount, HttpSession session) {
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
            if (billCustom.size() == 0) {
                billaccount.setCreateTime(new Date());
                bl = billAccountService.insertBillaccount(billaccount);
            } else {
                bl = false;
                obj.setMessage("账单信息已存在！");
            }
        } else {
            Billaccount oldBill = billAccountService.selectBillAccountById(billaccount.getId());
            if (oldBill.getStatus()) {
                UserCustom loginUser = (UserCustom) session.getAttribute("userInfo");
                HousinginfoCustom housing = housinginfoServic.selectHousingCustomById(oldBill.getHousingId());
                List<BillAccountCustom> billList = new ArrayList<>();
                BillAccountCustom custom = new BillAccountCustom();
                BeanUtils.copyProperties(oldBill, custom);
                billList.add(custom);
                bl = alipayService.billModifyRequest(housing.getCommunityId(), billList, housing.getToken(), loginUser);
                if (bl) {
                    bl = billAccountService.updateBillaccount(billaccount);
                }
            }else {
                bl = billAccountService.updateBillaccount(billaccount);
            }
        }
        obj.setSuccess(bl);
        return obj;
    }

    @RequestMapping("/deleteBillaccount")
    @ResponseBody
    public JSONResult deleteBillaccount(Integer id, HttpSession session) {
        boolean bl;
        Billaccount oldBill = billAccountService.selectBillAccountById(id);
        if (oldBill.getStatus()) { //已同步
            //获取公钥 私钥
            UserCustom loginUser = (UserCustom) session.getAttribute("userInfo");
            HousinginfoCustom housing = housinginfoServic.selectHousingCustomById(oldBill.getHousingId());
            List<String> roomids = new ArrayList<>();
            roomids.add(oldBill.getId().toString());
            bl = alipayService.billDeleteRequest(housing.getCommunityId(), roomids, housing.getToken(), loginUser);
            if (bl) {
                bl = billAccountService.deleteBillaccount(id);
            }
        }else {
            bl = billAccountService.deleteBillaccount(id);
        }
        JSONResult obj = new JSONResult();
        obj.setSuccess(bl);
        return obj;
    }

    /**
     * 账单收款
     *
     * @param billaccount
     * @return
     */
    @RequestMapping(path = "/receivBillAccount", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult receivBillAccount(Billaccount billaccount, HttpSession session) {
        boolean bl = false;
        JSONResult jsonResult = new JSONResult();
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

        //打印小票
        printAccount(oldBill);
        jsonResult.setSuccess(bl);
        return jsonResult;
    }

    /**
     * 小票打印
     * @param oldBill
     * @return
     */
    @RequestMapping(path = "/printAccount")
    @ResponseBody
    public JSONResult printAccount(Billaccount oldBill) {
        boolean bl = false;
        JSONResult jsonResult = new JSONResult();
        //打印小票
        Printinfo printinfo = printService.selectPrintinfoBydeptId(oldBill.getHousingId());
        if (printinfo != null) {
            HousinginfoCustom housinginfo = housinginfoServic.selectHousingCustomById(oldBill.getHousingId());
            Roominfo roominfo = roominfoService.selectRoominfoById(oldBill.getRoominfoId());
            PrintMessage print = new PrintMessage(printinfo.getMachineCode(), printinfo.getMsign());
            String payType = ApplicationUtils.getPayType(oldBill.getPaytype());
            StringBuffer sb = new StringBuffer("");
            sb.append("<center>支付宝智慧小区</center>\r");
            sb.append("小区名称：" + housinginfo.getName() + "\r");
            sb.append(roominfo.getAddress() + "\r");
            sb.append("业主姓名：" + roominfo.getOwnerName() + "\r");
            sb.append("付款时间：" + oldBill.getPaydate() + "\r");
            sb.append("订单编号：" + oldBill.getId() + "\r");
//            if (oldBill.getAlipayTradeNo() != null) {
//                sb.append("支付宝订单号：" + oldBill.getAlipayTradeNo() + "\r");
//            }
            sb.append("支付方式：" + payType + "\r");
            sb.append("缴费金额：" + oldBill.getBillEntryAmount() + "\r");
            sb.append("缴费明细：\r");
            sb.append("<table><tr><td>类别</td><td>账期</td><td>金额</td></tr><tr><td>" + payType + "</td><td>" + oldBill.getAcctPeriod() + "</td><td>" + oldBill.getBillEntryAmount() + "</td></tr></table>\r");
            sb.append("收款单位：" + housinginfo.getPrintName() + "\r");
            sb.append("<center>技术支持：早早科技/0571-88683117/www.早早.com</center>\r");
            sb.append("----------------------\r");
            sb.append("<center>交易小票</center>\r");
            boolean printStatus = print.sendContent(sb.toString());
            if (printStatus) {
                oldBill.setPrintstatus(printStatus);
                bl = billAccountService.updateBillaccount(oldBill);
            }
        }
        jsonResult.setSuccess(bl);
        return jsonResult;
    }

}
