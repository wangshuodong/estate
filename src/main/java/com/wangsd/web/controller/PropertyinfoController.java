package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.web.model.Printinfo;
import com.wangsd.web.model.Propertyinfo;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.PrintService;
import com.wangsd.web.service.PropertyinfoService;
import com.wangsd.web.service.ServiceinfoService;
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
@RequestMapping("/property")
public class PropertyinfoController {

    @Autowired
    PropertyinfoService propertyinfoService;
    @Autowired
    ServiceinfoService serviceinfoService;
    @Autowired
    PrintService printService;

    /**
     * 查询所有物业
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "propertyList")
    public String propertyList(Model model, HttpSession session) {
        UserCustom loginUser = (UserCustom) session.getAttribute("userInfo");
        String parentCode = loginUser.getParentCode();
        List<Propertyinfo> list = propertyinfoService.queryAllList(parentCode);
        model.addAttribute("propertyList", list);
        return "/property/property-list";
    }



    /**
     * 打开服务商页面
     *
     * @param id
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "openProperty")
    public String openProperty(Integer id, Model model, HttpSession session) {
        UserCustom loginUser = (UserCustom) session.getAttribute("userInfo");
        String parentCode = loginUser.getParentCode();
        //查询上级服务商和物业
        List<ParentCustom> parentList = propertyinfoService.queryParentServiceAndPropertyByCode(parentCode);
        model.addAttribute("parentList", parentList);
        if (id != null) {
            Propertyinfo propertyinfo = propertyinfoService.selectPropertyinfoById(id);
            model.addAttribute("propertyinfo", propertyinfo);
        }
        return "/property/property-info";
    }

    /**
     * 新增或者修改服务商
     *
     * @param propertyinfo
     * @param model
     * @return
     */
    @RequestMapping(path = "/saveOrUpdateProperty", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult saveOrUpdateProperty(Propertyinfo propertyinfo, Model model) {
        boolean bl;
        if (propertyinfo.getId() == null) {  //新增
            propertyinfo.setCreateTime(new Date());
            bl = propertyinfoService.insertProperty(propertyinfo);
        } else { //修改
            bl = propertyinfoService.updateProperty(propertyinfo);
        }
        JSONResult jsonResult = new JSONResult();
        jsonResult.setSuccess(bl);
        return jsonResult;
    }

    /**
     * 删除服务商
     *
     * @param id
     * @return
     */
    @RequestMapping("/deleteProperty")
    @ResponseBody
    public JSONResult deleteProperty(Integer id) {
        JSONResult obj = new JSONResult();
        boolean delStatus = propertyinfoService.deletePropertyById(id);
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
        Printinfo printinfo = printService.selectPrintinfoBydeptId(id);
        if(printinfo == null){
            printinfo = new Printinfo();
            printinfo.setDepartmentId(id);
        }
        model.addAttribute("printinfo", printinfo);
        return "/property/property-print";
    }

}
