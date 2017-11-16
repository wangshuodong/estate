package com.wangsd.web.controller;

import com.wangsd.web.modelCustom.BillAccountCustom;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 账单管理Controller
 */
@Controller
@RequestMapping("/billAccount")
public class BillAccountController {

    @RequestMapping("/billAccountList")
    public String billAccountList(BillAccountCustom billAccountCustom, HttpServletRequest request, Model model) {
        return null;
    }
}
