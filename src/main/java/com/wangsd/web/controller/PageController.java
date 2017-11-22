package com.wangsd.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 视图控制器,返回jsp视图给前端
 *
 **/
@Controller
@RequestMapping("/page")
public class PageController {

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
     * @return
     */
    @RequestMapping("/welcome")
    public String welcome() {
        return "welcome";
    }

    /**
     * 物业订单支付回调页面
     * @return
     */
    @RequestMapping("/alipay_estate_return")
    public String alipay_estate_return() {
        return "welcome";
    }

    /**
     * 电子发票回调页面
     * @return
     */
    @RequestMapping("/alipay_invoice_return")
    public String alipay_invoice_return() {
        return "welcome";
    }

}