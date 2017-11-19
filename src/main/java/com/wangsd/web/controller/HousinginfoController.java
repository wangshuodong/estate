package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.core.util.ApplicationUtils;
import com.wangsd.core.util.StaticVar;
import com.wangsd.web.model.Housinginfo;
import com.wangsd.web.model.Propertyinfo;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.modelCustom.UserCustom;
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

    /**
     *查询所有物业
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "housingList")
    public String housingList(Model model, HttpSession session) {
        UserCustom obj = (UserCustom) session.getAttribute("userInfo");
        String parentCode = obj.getParentCode();
        List<Housinginfo> list = housinginfoServic.queryAllList(parentCode);
        model.addAttribute("housingList", list);
        return "/housing/housing-list";
    }

    /**
     * 打开新增服务商页面
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "addHousing")
    public String addHousing(Model model, HttpSession session) {
        UserCustom obj = (UserCustom) session.getAttribute("userInfo");
        String parentCode = obj.getParentCode();
        List<ParentCustom> parentList = housinginfoServic.queryParentCustomByCode(parentCode);
        model.addAttribute("parentList", parentList);
        return "/housing/housing-info";
    }

    /**
     * 打开修改服务商页面
     * @param id
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "updateHousing")
    public String updateHousing(Integer id, Model model, HttpSession session) {
        UserCustom obj = (UserCustom) session.getAttribute("userInfo");
        String parentCode = obj.getParentCode();
        List<ParentCustom> parentList = housinginfoServic.queryParentCustomByCode(parentCode);
        model.addAttribute("parentList", parentList);
        Housinginfo housinginfo = housinginfoServic.selectHousinginfoById(id);
        model.addAttribute("housinginfo", housinginfo);
        return "/housing/housing-info";
    }

    /**
     * 新增或者修改服务商
     * @param housinginfo
     * @param model
     * @return
     */
    @RequestMapping(path = "/saveOrUpdateHousing", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult saveOrUpdateHousing(Housinginfo housinginfo, Model model) {
        JSONResult obj = new JSONResult();
        if (housinginfo.getId() == null) {  //新增
            Propertyinfo parent = propertyinfoServic.selectPropertyinfoById(housinginfo.getParentId());
            String maxCode = housinginfoServic.selectMaxByParentCode(housinginfo.getParentId());
            if (maxCode == null) {
                housinginfo.setCode(parent.getCode() + "0001");
            }else {
                housinginfo.setCode(ApplicationUtils.getOrgCode(maxCode));
            }
            housinginfo.setStatus(StaticVar.HOUSING_STATUS_NEW);
            housinginfo.setCreateTime(new Date());
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
        }
        boolean bl = housinginfoServic.saveOrUpdateHousing(housinginfo);
        obj.setSuccess(bl);
        return obj;
    }

    /**
     *  删除服务商
     * @param id
     * @return
     */
    @RequestMapping("/deleteHousing")
    @ResponseBody
    public JSONResult deleteHousing(Integer id) {
        JSONResult obj = new JSONResult();
        boolean delStatus = housinginfoServic.deleteHousingById(id);
        obj.setSuccess(delStatus);
        return obj;
    }
}
