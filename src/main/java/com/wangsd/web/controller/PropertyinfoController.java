package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.core.util.ApplicationUtils;
import com.wangsd.web.model.Propertyinfo;
import com.wangsd.web.model.Serviceinfo;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.PropertyinfoServic;
import com.wangsd.web.service.ServiceinfoServic;
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
    PropertyinfoServic propertyinfoServic;
    @Autowired
    ServiceinfoServic serviceinfoServic;

    /**
     * 查询所有物业
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "propertyList")
    public String propertyList(Model model, HttpSession session) {
        UserCustom obj = (UserCustom) session.getAttribute("userInfo");
        String parentCode = obj.getParentCode();
        List<Propertyinfo> list = propertyinfoServic.queryAllList(parentCode);
        model.addAttribute("propertyList", list);
        return "/property/property-list";
    }

    /**
     * 打开新增服务商页面
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "addProperty")
    public String addProperty(Model model, HttpSession session) {
        UserCustom obj = (UserCustom) session.getAttribute("userInfo");
        String parentCode = obj.getParentCode();
        List<ParentCustom> parentList = propertyinfoServic.queryParentCustomByCode(parentCode);
        model.addAttribute("parentList", parentList);
        return "/property/property-info";
    }

    /**
     * 打开修改服务商页面
     *
     * @param id
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "updateProperty")
    public String updateProperty(Integer id, Model model, HttpSession session) {
        UserCustom obj = (UserCustom) session.getAttribute("userInfo");
        String parentCode = obj.getParentCode();
        List<ParentCustom> parentList = propertyinfoServic.queryParentCustomByCode(parentCode);
        model.addAttribute("parentList", parentList);
        Propertyinfo propertyinfo = propertyinfoServic.selectPropertyinfoById(id);
        model.addAttribute("propertyinfo", propertyinfo);
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
        JSONResult obj = new JSONResult();
        if (propertyinfo.getId() == null) {  //新增
            String code;
            //查询上级物业
            Propertyinfo propertyParent = propertyinfoServic.selectPropertyinfoById(propertyinfo.getParentId());
            //propertyParent==null,说明选的上级是服务商
            if (propertyParent == null) {
                Serviceinfo serviceParent = serviceinfoServic.selectServiceinfoById(propertyinfo.getParentId());
                code = serviceParent.getCode();
            } else {
                code = propertyParent.getCode();
            }
            String maxCode = propertyinfoServic.selectMaxByParentCode(propertyinfo.getParentId());
            if (maxCode == null) {
                propertyinfo.setCode(code + "0001");
            } else {
                propertyinfo.setCode(ApplicationUtils.getOrgCode(maxCode));
            }
            propertyinfo.setCreateTime(new Date());
        } else { //修改
            Propertyinfo oldDept = propertyinfoServic.selectPropertyinfoById(propertyinfo.getId());
            if (oldDept.getParentId() != propertyinfo.getParentId()) {
                Propertyinfo parent = propertyinfoServic.selectPropertyinfoById(propertyinfo.getParentId());
                String maxCode = propertyinfoServic.selectMaxByParentCode(propertyinfo.getParentId());
                if (maxCode == null) {
                    propertyinfo.setCode(parent.getCode() + "0001");
                } else {
                    propertyinfo.setCode(ApplicationUtils.getOrgCode(maxCode));
                }
            }
        }
        boolean bl = propertyinfoServic.saveOrUpdateProperty(propertyinfo);
        obj.setSuccess(bl);
        return obj;
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
        boolean delStatus = propertyinfoServic.deletePropertyById(id);
        obj.setSuccess(delStatus);
        return obj;
    }
}