package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.core.util.StaticVar;
import com.wangsd.web.model.Housinginfo;
import com.wangsd.web.model.Propertyinfo;
import com.wangsd.web.model.Roominfo;
import com.wangsd.web.modelCustom.BillAccountCustom;
import com.wangsd.web.modelCustom.HousinginfoCustom;
import com.wangsd.web.modelCustom.RoominfoCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    @Autowired
    BillAccountService billAccountService;

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
        housingquery.setStatus(StaticVar.HOUSING_STATUS1);
        List<Housinginfo> list = housinginfoServic.queryAllList(housingquery);
        for (Housinginfo housing : list) {
            Propertyinfo propertyinfo = propertyinfoServic.selectPropertyinfoById(housing.getParentId());
            RoominfoCustom query = new RoominfoCustom();
            query.setStatus(false);//未同步的
            query.setParentId(housing.getId());
            query.setCurrPage(0);
            query.setPageSize(199);
            List<RoominfoCustom> roomList = roominfoService.queryRoominfoList(query);
            if (roomList.size() > 0) {
                //调用支付宝接口
                bl = alipayService.roominfoUploadRequest(housing.getCommunityId(), roomList, propertyinfo.getToken(), loginUser);
            }
        }
        jsonResult.setSuccess(bl);
        return jsonResult;
    }

    /**
     * 批量上传待缴物业费账单
     * @param id
     * @param session
     * @return
     */
    @RequestMapping(value = "/billBatchUploadRequest")
    @ResponseBody
    public JSONResult billBatchUploadRequest(Integer id, HttpSession session) {
        JSONResult jsonResult = new JSONResult();
        boolean bl = false;
        //获取公钥 私钥
        UserCustom loginUser = (UserCustom) session.getAttribute("userInfo");
        //查询数据
        if (id != null) {
            BillAccountCustom query = new BillAccountCustom();
            query.setId(id);
            List<BillAccountCustom> list = billAccountService.queryBillAccountList(query);
            if (list.size() == 1) {
                BillAccountCustom billaccount = list.get(0);
                HousinginfoCustom housing = housinginfoServic.selectHousingCustomById(billaccount.getHousingId());
                List<BillAccountCustom> billList = new ArrayList<>();
                billList.add(billaccount);
                bl = alipayService.billBatchUploadRequest(housing.getCommunityId(), billList, housing.getToken(), loginUser);
            }
        }else {
            HousinginfoCustom housingquery = new HousinginfoCustom();
            housingquery.setParentCode(loginUser.getParentCode());
            housingquery.setStatus(StaticVar.HOUSING_STATUS1);
            List<Housinginfo> list = housinginfoServic.queryAllList(housingquery);
            for (Housinginfo housing : list) {
                Propertyinfo propertyinfo = propertyinfoServic.selectPropertyinfoById(housing.getParentId());
                BillAccountCustom query = new BillAccountCustom();
                query.setHousingId(housing.getId());
                query.setStatus(false);
                query.setCurrPage(0);
                query.setPageSize(199);
                List<BillAccountCustom> billList = billAccountService.queryBillAccountList(query);
                if (billList.size() > 0) {
                    bl = alipayService.billBatchUploadRequest(housing.getCommunityId(), billList, propertyinfo.getToken(), loginUser);
                }
            }
        }
        jsonResult.setSuccess(bl);
        return jsonResult;
    }

    @RequestMapping(value = "qrcode")
    public String qrcode(Integer id, Model model, HttpSession session) {
        //获取公钥 私钥
        UserCustom loginUser = (UserCustom) session.getAttribute("userInfo");
        HousinginfoCustom housing = housinginfoServic.selectHousingCustomById(id);
        String codeImage = alipayService.communityDetailsQueryRequest(housing.getCommunityId(), housing.getToken(), loginUser);
        model.addAttribute("codeImage", codeImage);
        return "/housing/housing-qrcode";
    }

}
