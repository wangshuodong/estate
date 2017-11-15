package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.web.modelCustom.HousingCustom;
import com.wangsd.web.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 支付宝相关Controller
 */
@Controller
@RequestMapping("/alipay")
public class AlipayComtroller {

    @Autowired
    DepartmentService departmentService;

    /**
     * 同步小区到支付宝
     * @param deptId
     * @param request
     * @return
     */
    @RequestMapping(value = "/alipayEcoCplifeCommunityCreateRequest")
    @ResponseBody
    public JSONResult alipayEcoCplifeCommunityCreateRequest(Integer deptId, HttpServletRequest request) {
        HousingCustom housingCustom = departmentService.selectHousingCustomBydeptId(deptId);
        return null;
    }

}
