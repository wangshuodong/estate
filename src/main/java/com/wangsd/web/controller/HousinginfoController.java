package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.core.util.ApplicationUtils;
import com.wangsd.core.util.StaticVar;
import com.wangsd.web.model.Housinginfo;
import com.wangsd.web.model.Propertyinfo;
import com.wangsd.web.modelCustom.HousinginfoCustom;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.AlipayService;
import com.wangsd.web.service.HousinginfoServic;
import com.wangsd.web.service.PropertyinfoServic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/11/19.
 */
@Controller
@RequestMapping("/housing")
public class HousinginfoController {

    @Autowired
    HousinginfoServic housinginfoServic;
    @Autowired
    PropertyinfoServic propertyinfoServic;
    @Autowired
    AlipayService alipayService;

    /**
     *查询所有小区
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "housingList")
    public String housingList(HousinginfoCustom query, Model model, HttpSession session) {
        UserCustom loginUser = (UserCustom) session.getAttribute("userInfo");
        List<ParentCustom> parentList = housinginfoServic.queryParentCustomByCode(loginUser.getParentCode());
        model.addAttribute("parentList", parentList);
        String parentCode;
        if (query.getParentId() == null || query.getParentId() == 0) {
            parentCode = loginUser.getParentCode();
        } else {
            Propertyinfo parent = propertyinfoServic.selectPropertyinfoById(query.getParentId());
            parentCode = parent.getCode();
        }
        List<Housinginfo> list = housinginfoServic.queryAllList(parentCode);
        model.addAttribute("housingList", list);
        model.addAttribute("query", query);
        return "/housing/housing-list";
    }

    /**
     * 打开新增小区页面
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "addHousing")
    public String addHousing(Model model, HttpSession session) {
        UserCustom loginUser = (UserCustom) session.getAttribute("userInfo");
        String parentCode = loginUser.getParentCode();
        List<ParentCustom> parentList = housinginfoServic.queryParentCustomByCode(parentCode);
        model.addAttribute("parentList", parentList);
        return "/housing/housing-info";
    }

    /**
     * 打开修改小区页面
     * @param id
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "openHousing")
    public String openHousing(Integer id, Model model, HttpSession session) {
        UserCustom obj = (UserCustom) session.getAttribute("userInfo");
        String parentCode = obj.getParentCode();
        List<ParentCustom> parentList = housinginfoServic.queryParentCustomByCode(parentCode);
        model.addAttribute("parentList", parentList);
        if (id != null) {
            Housinginfo housinginfo = housinginfoServic.selectHousinginfoById(id);
            model.addAttribute("housinginfo", housinginfo);
        }
        return "/housing/housing-info";
    }

    /**
     * 新增或者修改小区
     * @param housinginfo
     * @param model
     * @return
     */
    @RequestMapping(path = "/saveOrUpdateHousing", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult saveOrUpdateHousing(Housinginfo housinginfo, Model model) {
        boolean bl;
        if (housinginfo.getId() == null) {  //新增
            housinginfo.setDeletestatus(false);
            housinginfo.setStatus(StaticVar.HOUSING_STATUS_NEW);
            housinginfo.setCreateTime(new Date());
            bl = housinginfoServic.insertHousing(housinginfo);
        }else { //修改
            Housinginfo oldDept = housinginfoServic.selectHousinginfoById(housinginfo.getId());
            if (oldDept.getParentId() != housinginfo.getParentId()) {
                Propertyinfo parent = propertyinfoServic.selectPropertyinfoById(housinginfo.getParentId());
                String maxCode = housinginfoServic.selectMaxByParentCode(housinginfo.getParentId());
                if (maxCode == null) {
                    housinginfo.setCode(parent.getCode() + "0001");
                }else {
                    housinginfo.setCode(ApplicationUtils.getOrgCode(maxCode));
                }
            }
            bl = housinginfoServic.updateHousing(housinginfo);
        }
        JSONResult jsonResult = new JSONResult();
        jsonResult.setSuccess(bl);
        return jsonResult;
    }

    /**
     *  删除小区
     * @param id
     * @return
     */
    @RequestMapping("/deleteHousing")
    @ResponseBody
    public JSONResult deleteHousing(Integer id, HttpSession session) {
        JSONResult obj = new JSONResult();
        UserCustom loginUser = (UserCustom) session.getAttribute("userInfo");
        HousinginfoCustom housing = housinginfoServic.selectHousingCustomById(id);
        //让小区在支付宝平台下线
        if (housing.getStatus() != StaticVar.HOUSING_STATUS_NEW) {
            alipayService.basicserviceModifyRequest(housing.getCommunityId(), "OFFLINE", housing.getToken(), loginUser);
        }
        boolean delStatus = housinginfoServic.deleteHousingById(id);
        obj.setSuccess(delStatus);
        return obj;
    }
}
