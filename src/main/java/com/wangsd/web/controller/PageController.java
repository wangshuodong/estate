package com.wangsd.web.controller;

import com.alipay.api.internal.util.AlipaySignature;
import com.wangsd.core.util.ApplicationUtils;
import com.wangsd.core.util.DateUtils;
import com.wangsd.core.util.PrintMessage;
import com.wangsd.core.util.StaticVar;
import com.wangsd.web.model.*;
import com.wangsd.web.modelCustom.HousinginfoCustom;
import com.wangsd.web.service.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * 视图控制器,返回jsp视图给前端
 **/
@Controller
@RequestMapping("/page")
public class PageController {

    private static final Logger logger = LogManager.getLogger(PageController.class.getName());

    @Autowired
    BillAccountService billAccountService;
    @Autowired
    HousinginfoService housinginfoService;
    @Autowired
    PrintService printService;
    @Autowired
    RoominfoService roominfoService;
    @Autowired
    ServiceinfoService serviceinfoService;
    @Autowired
    AlipayService alipayService;

    /**
     * 登录页
     */
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    /**
     * 404页
     */
    @RequestMapping("/404")
    public String error404() {
        return "404";
    }

    /**
     * 401页
     */
    @RequestMapping("/401")
    public String error401() {
        return "401";
    }

    /**
     * 500页
     */
    @RequestMapping("/500")
    public String error500() {
        return "500";
    }

    /**
     * welcome页面
     *
     * @return
     */
    @RequestMapping("/welcome")
    public String welcome() {
        return "welcome";
    }

    /**
     * 物业订单支付回调页面
     *
     * @return
     */
    @RequestMapping("/alipay_estate_return")
    public void alipay_estate_return(HttpServletRequest request, HttpServletResponse response) {
        logger.info("--------------wangshuodong:调用支付宝回调接口-----------------------");
        Integer id = Integer.parseInt(request.getParameter("id"));
        Serviceinfo serviceinfo = serviceinfoService.selectServiceinfoById(id);
        boolean isprint = false;
        String bizContent = "";
        //获取支付宝POST过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext(); ) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            if ("id".equals(name)) {
                continue;
            }
            //乱码解决，这段代码在出现乱码时使用
            //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        try {
            boolean checkResult = AlipaySignature.rsaCheckV2(params, serviceinfo.getAlipayPublicKey(), StaticVar.charset, StaticVar.sign_type); //调用SDK验证签名
            /* 实际验证过程建议商户务必添加以下校验：
            1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
            2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
            3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
            4、验证app_id是否为该商户本身。
            */
            if (checkResult) {//验证成功
                //商户订单号
                String out_trade_no = new String(request.getParameter("det_list").getBytes("ISO-8859-1"), "UTF-8");
                logger.info("支付宝回调订单号======" + out_trade_no);
                //本次交易支付的订单金额
                String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");
                //交易状态
                String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"), "UTF-8");

                String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");
                logger.info("trade_no======" + trade_no);
                String gmt_payment = new String(request.getParameter("gmt_payment").getBytes("ISO-8859-1"), "UTF-8");
                //买家支付宝账号对应的支付宝唯一用户号。以2088开头的纯16位数字
                String buyer_user_id = new String(request.getParameter("buyer_user_id").getBytes("ISO-8859-1"), "UTF-8");
                logger.info("buyer_user_id======" + buyer_user_id);
                if (trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")) {
                    Billaccount billaccount = billAccountService.selectBillAccountById(Integer.parseInt(out_trade_no));
                    if (billaccount != null && Double.parseDouble(total_amount) == billaccount.getBillEntryAmount()) {
                        //保存支付宝返回数据
                        billaccount.setPaydate(DateUtils.paseDatetime(gmt_payment));
                        billaccount.setAlipayTradeNo(trade_no);
                        billaccount.setPaytype(StaticVar.BILLACCOUNT_PAYSTATUS2);
                        billaccount.setPaystatus(true);
                        billaccount.setBuyerUserId(buyer_user_id);
                        billAccountService.updateBillaccount(billaccount);
                        //打印小票
                        Printinfo printinfo = printService.selectPrintinfoBydeptId(billaccount.getHousingId());
                        if (printinfo != null) {
                            HousinginfoCustom housinginfo = housinginfoService.selectHousingCustomById(billaccount.getHousingId());
                            Roominfo roominfo = roominfoService.selectRoominfoById(billaccount.getRoominfoId());
                            PrintMessage print = new PrintMessage(printinfo.getMachineCode(), printinfo.getMsign());
                            String payType = ApplicationUtils.getPayType(billaccount.getPaytype());
                            StringBuffer sb = new StringBuffer("");
                            sb.append("<center>支付宝智慧小区</center>\n");
                            sb.append("小区名称：" + housinginfo.getName() + "\n");
                            sb.append(roominfo.getAddress() + "\n");
                            sb.append("业主姓名：" + roominfo.getOwnerName() + "\n");
                            sb.append("付款时间：" + DateUtils.formatDatetime(billaccount.getPaydate()) + "\n");
                            sb.append("订单编号：" + billaccount.getId() + "\n");
                            if (billaccount.getAlipayTradeNo() != null) {
                                sb.append("支付宝订单号：" + billaccount.getAlipayTradeNo() + "\n");
                            }
                            sb.append("支付方式：" + payType + "\n");
                            sb.append("缴费金额：" + billaccount.getBillEntryAmount() + "\n");
                            sb.append("缴费明细：\n");
                            sb.append("<table><tr><td>类别</td><td>账期</td><td>金额</td></tr><tr><td>" + payType + "</td><td>" + billaccount.getAcctPeriod() + "</td><td>" + billaccount.getBillEntryAmount() + "</td></tr></table>\n");
                            sb.append("收款单位：" + housinginfo.getParentName() + "\n");
                            sb.append("<center>技术支持：早早科技/0571-88683117/www.早早.com</center>\n");
                            sb.append("----------------------\n");
                            sb.append("<center>交易小票</center>\n");
                            print.sendContent(sb.toString());
                            boolean printStatus = print.sendContent(sb.toString());
                            if (printStatus) {
                                billaccount.setPrintstatus(printStatus);
                                billAccountService.updateBillaccount(billaccount);
                                logger.info("--------------wangshuodong:物业缴费小票打印成功-----------------------");
                            }
                        }
                    }
                    bizContent = "{\"econotify\":\"success\"}";
                }
            } else {//验证失败
                logger.info("--------------wangshuodong:物业缴费异步通知验签失败-----------------------");
            }

            String result = AlipaySignature.encryptAndSign(bizContent, serviceinfo.getAlipayPublicKey(), serviceinfo.getMerchantPrivateKey(), StaticVar.charset, false, true, StaticVar.sign_type);
            response.getOutputStream().print(result);
        } catch (Exception e) {
            logger.info(e);
            e.printStackTrace();
        }
    }

    /**
     * 电子发票回调页面
     *
     * @return
     */
    @RequestMapping("/alipay_invoice_return")
    public String alipay_invoice_return() {
        return "welcome";
    }

    /**
     * 开票地址
     *
     * @return
     */
    @RequestMapping("/alipay_openticket")
    public String alipay_openticket(HttpServletRequest request, HttpServletResponse response, Model model) {
        logger.info("--------------wangshuodong:诺诺回调接口-----------------------");
        String retUrl = "";
        String tradeNo = request.getParameter("code");
        logger.info(tradeNo);
        tradeNo = "2017120121001004150200389768";
        Billaccount billaccount = billAccountService.selectBillAccountByTradeNo(tradeNo);
//        HousinginfoCustom housing = housinginfoService.selectHousingCustomById(billaccount.getHousingId());
//        String deptCode = housing.getCode().substring(0, 7);
//        Serviceinfo serviceinfo = serviceinfoService.selectServiceinfoByCode(deptCode);
        //alipayService.invoiceTitleListGetRequest("2088102172245446", serviceinfo.getAppId(), serviceinfo.getMerchantPrivateKey(), serviceinfo.getAlipayPublicKey(), null);
//        alipayService.invoiceTitleListGetRequest("2088102172245446", StaticVar.appid, StaticVar.privateKey, StaticVar.publicKey, null);
        if (billaccount.getTicketstatus() == StaticVar.BILLACCOUNT_TICKETSTATUS0) {
            model.addAttribute("bill", billaccount);
            retUrl ="invoice";
        }else if (billaccount.getTicketstatus() == StaticVar.BILLACCOUNT_TICKETSTATUS1) {
            retUrl ="invoice_load";
        }else if (billaccount.getTicketstatus() == StaticVar.BILLACCOUNT_TICKETSTATUS2) {
            retUrl ="invoice_success";
        }
        return retUrl;
    }

    @RequestMapping("/invoiceAdd")
    public String invoiceAdd(Ticket ticket) {
        billAccountService.insertTicket(ticket);
        return "invoice_load";
    }
}