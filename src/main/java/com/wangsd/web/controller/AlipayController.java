package com.wangsd.web.controller;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayEcoCplifeCommunityCreateRequest;
import com.alipay.api.response.AlipayEcoCplifeCommunityCreateResponse;
import com.wangsd.core.entity.JSONResult;
import com.wangsd.core.util.StaticVar;
import com.wangsd.web.model.ServiceinfoWithBLOBs;
import com.wangsd.web.modelCustom.HousingCustom;
import com.wangsd.web.service.DepartmentService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * 支付宝相关Controller
 */
@Controller
@RequestMapping("/alipay")
public class AlipayController {

    private static final Logger logger = LogManager.getLogger(AlipayController.class.getName());

    @Autowired
    DepartmentService departmentService;

    /**
     * 同步小区到支付宝
     *
     * @param deptId
     * @param session
     * @return
     */
    @RequestMapping(value = "/alipayEcoCplifeCommunityCreateRequest")
    @ResponseBody
    public JSONResult alipayEcoCplifeCommunityCreateRequest(Integer deptId, HttpSession session) {
        JSONResult jsonResult = new JSONResult();
        //获取公钥 私钥
        ServiceinfoWithBLOBs info = (ServiceinfoWithBLOBs) session.getAttribute("serviceInfo");
        HousingCustom housing = departmentService.selectHousingCustomBydeptId(deptId);
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, info.getAppId(), info.getMerchantPrivateKey(),
                StaticVar.format, StaticVar.charset, info.getAlipayPublicKey(), StaticVar.sign_type);
        JSONObject bizContent = new JSONObject();
        bizContent.put("community_name", housing.getName());
        bizContent.put("community_address", housing.getAddress());
        bizContent.put("district_code", housing.getDistrictCode());
        bizContent.put("city_code", housing.getCityCode());
        bizContent.put("province_code", housing.getProvinceCode());
        bizContent.put("community_locations", housing.getCommunityLocations());
        bizContent.put("hotline", housing.getHotline());
        AlipayEcoCplifeCommunityCreateRequest request = new AlipayEcoCplifeCommunityCreateRequest();
        request.setBizContent(bizContent.toString());
        //request.putOtherTextParam("app_auth_token", token);
        try {
            AlipayEcoCplifeCommunityCreateResponse response = alipayClient.execute(request);
            logger.debug(response.getBody());
            if (response.getCode().equals("10000")) {
                housing.setCommunityId(response.getCommunityId());

                jsonResult.setSuccess(true);
                jsonResult.setMessage("小区同步完成...,等待下一步基础服务初始化！");
            } else {
                jsonResult.setSuccess(false);
                jsonResult.setMessage("小区同步失败：" + response.getSubMsg());
            }
        } catch (AlipayApiException e) {
            logger.info(e.getMessage());
            e.printStackTrace();
        }
        return jsonResult;
    }

}
