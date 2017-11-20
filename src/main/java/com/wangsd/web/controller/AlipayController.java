package com.wangsd.web.controller;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.wangsd.core.entity.JSONResult;
import com.wangsd.core.util.StaticVar;
import com.wangsd.web.modelCustom.HousinginfoCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.AlipayService;
import com.wangsd.web.service.HousinginfoServic;
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
    HousinginfoServic housinginfoServic;
    @Autowired
    AlipayService alipayService;

    /**
     * 同步小区到支付宝
     *
     * @param id
     * @param session
     * @return
     */
    @RequestMapping(value = "/communityCreateRequest")
    @ResponseBody
    public JSONResult communityCreateRequest(Integer id, HttpSession session) {
        JSONResult jsonResult = new JSONResult();
        //获取公钥 私钥
        UserCustom info = (UserCustom) session.getAttribute("userInfo");
        HousinginfoCustom housing = housinginfoServic.selectHousingCustomById(id);
        AlipayClient alipayClient = new DefaultAlipayClient(StaticVar.serverUrl, info.getAppId(), info.getMerchantPrivateKey(),
                StaticVar.format, StaticVar.charset, info.getAlipayPublicKey(), StaticVar.sign_type);
        housing = alipayService.communityCreateRequest(housing, housing.getToken(), alipayClient);
        boolean bl = housinginfoServic.saveOrUpdateHousing(housing);
        jsonResult.setSuccess(bl);
        return jsonResult;
    }

}
