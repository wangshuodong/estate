package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.web.model.Housinginfo;
import com.wangsd.web.model.Propertyinfo;
import com.wangsd.web.model.Roominfo;
import com.wangsd.web.modelCustom.HousinginfoCustom;
import com.wangsd.web.modelCustom.RoominfoCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.AlipayService;
import com.wangsd.web.service.HousinginfoServic;
import com.wangsd.web.service.PropertyinfoServic;
import com.wangsd.web.service.RoominfoService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

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
    @Autowired
    RoominfoService roominfoService;
    @Autowired
    PropertyinfoServic propertyinfoServic;

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
        UserCustom loginUser = (UserCustom) session.getAttribute("userInfo");
        //调用支付宝接口
        HousinginfoCustom housing = housinginfoServic.selectHousingCustomById(id);
        boolean bl = alipayService.communityCreateRequest(housing, housing.getToken(), loginUser);
        jsonResult.setSuccess(bl);
        return jsonResult;
    }

    /**
     * 初始化小区基础服务
     *
     * @param id
     * @param session
     * @return
     */
    @RequestMapping(value = "/basicserviceInitializeRequest")
    @ResponseBody
    public JSONResult basicserviceInitializeRequest(Integer id, HttpSession session) {
        JSONResult jsonResult = new JSONResult();
        //获取公钥 私钥
        UserCustom loginUser = (UserCustom) session.getAttribute("userInfo");
        //调用支付宝接口
        HousinginfoCustom housing = housinginfoServic.selectHousingCustomById(id);
        boolean bl = alipayService.basicserviceInitializeRequest(housing.getCommunityId(), housing.getToken(), loginUser);
        jsonResult.setSuccess(bl);
        return jsonResult;
    }

    /**
     * 修改小区物业基础服务(申请服务上线)
     *
     * @param id
     * @param session
     * @return
     */
    @RequestMapping(value = "/basicserviceModifyRequest")
    @ResponseBody
    public JSONResult basicserviceModifyRequest(Integer id, HttpSession session) {
        JSONResult jsonResult = new JSONResult();
        //获取公钥 私钥
        UserCustom loginUser = (UserCustom) session.getAttribute("userInfo");
        //调用支付宝接口
        HousinginfoCustom housing = housinginfoServic.selectHousingCustomById(id);
        boolean bl = alipayService.basicserviceModifyRequest(housing.getCommunityId(), "ONLINE", housing.getToken(), loginUser);
        jsonResult.setSuccess(bl);
        return jsonResult;
    }

    /**
     * 上传物业小区内部房屋信息
     *
     * @param id
     * @param session
     * @return
     */
    @RequestMapping(value = "/roominfoUploadRequest")
    @ResponseBody
    public JSONResult roominfoUploadRequest(Integer id, HttpSession session) {
        JSONResult jsonResult = new JSONResult();
        //获取公钥 私钥
        UserCustom loginUser = (UserCustom) session.getAttribute("userInfo");
        //查询数据
        List<RoominfoCustom> roomList = new ArrayList<>();
        Roominfo roominfo = roominfoService.selectRoominfoById(id);
        RoominfoCustom roominfoCustom = new RoominfoCustom();
        BeanUtils.copyProperties(roominfo, roominfoCustom);
        roomList.add(roominfoCustom);
        HousinginfoCustom housing = housinginfoServic.selectHousingCustomById(roominfo.getParentId());
        //调用支付宝接口
        boolean bl = alipayService.roominfoUploadRequest(housing.getCommunityId(), roomList, housing.getToken(), loginUser);
        jsonResult.setSuccess(bl);
        return jsonResult;
    }

    /**
     * 批量上传房屋信息
     * @param session
     * @return
     */
    @RequestMapping(value = "/allRoominfoUploadRequest")
    @ResponseBody
    public JSONResult allRoominfoUploadRequest(HttpSession session) {
        JSONResult jsonResult = new JSONResult();
        boolean bl = false;
        //获取公钥 私钥
        UserCustom loginUser = (UserCustom) session.getAttribute("userInfo");
        //查询数据
        HousinginfoCustom housingquery = new HousinginfoCustom();
        housingquery.setParentCode(loginUser.getParentCode());
        List<Housinginfo> list = housinginfoServic.queryAllList(housingquery);
        for (Housinginfo housing : list) {
            Propertyinfo propertyinfo = propertyinfoServic.selectPropertyinfoById(housing.getParentId());
            RoominfoCustom query = new RoominfoCustom();
            query.setStatus(false);//未同步的
            query.setParentId(housing.getId());
            List<RoominfoCustom> roomList = roominfoService.queryRoominfoList(query);
            if (roomList.size() > 0) {
                //调用支付宝接口
                bl = alipayService.roominfoUploadRequest(housing.getCommunityId(), roomList, propertyinfo.getToken(), loginUser);
            }
        }
        jsonResult.setSuccess(bl);
        return jsonResult;
    }

}
