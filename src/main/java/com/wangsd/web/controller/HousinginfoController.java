package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.core.util.ApplicationUtils;
import com.wangsd.core.util.StaticVar;
import com.wangsd.web.model.Housinginfo;
import com.wangsd.web.model.Printinfo;
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
        List<ParentCustom> parentList = housinginfoServic.queryParentPropertyByCode(loginUser.getParentCode());
        model.addAttribute("parentList", parentList);
        query.setParentCode(loginUser.getParentCode());
        List<Housinginfo> list = housinginfoServic.queryAllList(query);
        model.addAttribute("housingList", list);
        model.addAttribute("query", query);
        return "/housing/housing-list";
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
        //查询上级物业
        List<ParentCustom> parentList = housinginfoServic.queryParentPropertyByCode(parentCode);
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
    /**
     *  配置打印机信息
     * @param id
     * @return
     */
    @RequestMapping(value = "updatePrintinfo")
    public String updatePrintinfo(Integer id, Model model, HttpSession session) {
        Printinfo printinfo = new Printinfo();
        List<Printinfo> list = housinginfoServic.selectPrintinfoById(id);
        if(list.size() == 1){
            printinfo = list.get(0);
            model.addAttribute("printinfo", printinfo);
        }else if(list.size() == 0){
            printinfo.setDepartmentId(id);
            model.addAttribute("printinfo", printinfo);
        }
        return "/housing/printinfo-config";
    }
    /**
     * 新增或者修改打印机
     * @param printinfo
     * @param model
     * @return
     */
    @RequestMapping(path = "/saveOrUpdatePrintinfo", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult saveOrUpdatePrintinfo(Printinfo printinfo, Model model) {
        boolean bl;
        if (printinfo.getId() == null) {  //新增
            printinfo.setCreatetime(new Date());
            bl = housinginfoServic.insertPrintinfo(printinfo);
        }else { //修改
            bl = housinginfoServic.updatePrintinfo(printinfo);
        }
        JSONResult jsonResult = new JSONResult();
        jsonResult.setSuccess(bl);
        return jsonResult;
    }
    /**
     *  跳转短信充值页面
     * @param id
     * @return
     */
    @RequestMapping(value = "smsDeposit")
    public String smsDeposit(Integer id, Model model, HttpSession session) {
        Housinginfo housinginfo = housinginfoServic.selectHousinginfoById(id);
        model.addAttribute("housinginfo", housinginfo);
        return "/housing/smsdeposit-config";
    }

    /**
     * 保存短信充值
     * @param housinginfo
     * @param model
     * @return
     */
    @RequestMapping(path = "/saveOrUpdateSmsdeposit", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult saveOrUpdateSmsdeposit(Housinginfo housinginfo, Model model) {
        boolean bl;
        HousinginfoCustom housing = housinginfoServic.selectHousingCustomById(housinginfo.getId());
        if (housing.getId() != null) {  //累加更新短信条数
            if(housing.getMessageNum() == null){
                housing.setMessageNum(housinginfo.getMessageNum());
                bl = housinginfoServic.updateHousing(housing);
            }else{
                int num  = housing.getMessageNum()+housinginfo.getMessageNum();
                housing.setMessageNum(num);
                bl = housinginfoServic.updateHousing(housing);
            }
        }else {
            bl = false;
        }
        JSONResult jsonResult = new JSONResult();
        jsonResult.setSuccess(bl);
        return jsonResult;
    }
}
