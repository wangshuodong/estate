package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.core.util.ApplicationUtils;
import com.wangsd.web.model.Serviceinfo;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.modelCustom.UserCustom;
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
@RequestMapping("/service")
public class ServiceinfoController {

    @Autowired
    ServiceinfoServic serviceinfoServic;

    /**
     *查询所有服务商
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "serviceList")
    public String serviceList(Model model, HttpSession session) {
        UserCustom obj = (UserCustom) session.getAttribute("userInfo");
        String parentCode = obj.getParentCode();
        List<Serviceinfo> list = serviceinfoServic.queryAllList(parentCode);
        model.addAttribute("serviceList", list);
        return "/service/service-list";
    }

    /**
     * 打开新增服务商页面
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "addService")
    public String addService(Model model, HttpSession session) {
        UserCustom obj = (UserCustom) session.getAttribute("userInfo");
        String parentCode = obj.getParentCode();
        List<ParentCustom> parentList = serviceinfoServic.queryParentCustomByCode(parentCode);
        model.addAttribute("parentList", parentList);
        return "/service/service-info";
    }

    /**
     * 打开修改服务商页面
     * @param id
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "updateService")
    public String updateService(Integer id, Model model, HttpSession session) {
        UserCustom obj = (UserCustom) session.getAttribute("userInfo");
        String parentCode = obj.getParentCode();
        List<ParentCustom> parentList = serviceinfoServic.queryParentCustomByCode(parentCode);
        model.addAttribute("parentList", parentList);
        Serviceinfo serviceinfo = serviceinfoServic.selectServiceinfoById(id);
        model.addAttribute("serviceinfo", serviceinfo);
        return "/service/service-info";
    }

    /**
     * 新增或者修改服务商
     * @param serviceinfo
     * @param model
     * @return
     */
    @RequestMapping(path = "/saveOrUpdateService", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult saveOrUpdateService(Serviceinfo serviceinfo, Model model) {
        JSONResult obj = new JSONResult();
        if (serviceinfo.getId() == null) {  //新增
            Serviceinfo parent = serviceinfoServic.selectServiceinfoById(serviceinfo.getParentId());
            String maxCode = serviceinfoServic.selectMaxByParentCode(serviceinfo.getParentId());
            if (maxCode == null) {
                serviceinfo.setCode(parent.getCode() + "0001");
            }else {
                serviceinfo.setCode(ApplicationUtils.getOrgCode(maxCode));
            }
            serviceinfo.setCreateTime(new Date());
        }else { //修改
            Serviceinfo oldDept = serviceinfoServic.selectServiceinfoById(serviceinfo.getId());
            if (oldDept.getParentId() != serviceinfo.getParentId()) {
                Serviceinfo parent = serviceinfoServic.selectServiceinfoById(serviceinfo.getParentId());
                String maxCode = serviceinfoServic.selectMaxByParentCode(serviceinfo.getParentId());
                if (maxCode == null) {
                    serviceinfo.setCode(parent.getCode() + "0001");
                }else {
                    serviceinfo.setCode(ApplicationUtils.getOrgCode(maxCode));
                }
            }
        }
        boolean bl = serviceinfoServic.saveOrUpdateService(serviceinfo);
        obj.setSuccess(bl);
        return obj;
    }

    /**
     *  删除服务商
     * @param id
     * @return
     */
    @RequestMapping("/deleteServicer")
    @ResponseBody
    public JSONResult deleteServicer(Integer id) {
        JSONResult obj = new JSONResult();
        boolean delStatus = serviceinfoServic.deleteServiceById(id);
        obj.setSuccess(delStatus);
        return obj;
    }

    @RequestMapping(value = "updateServicekey")
    public String updateServicekey(Integer id, Model model, HttpSession session) {
        Serviceinfo serviceinfo = serviceinfoServic.selectServiceinfoById(id);
        model.addAttribute("serviceinfo", serviceinfo);
        return "/service/service-config";
    }
}
