package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.web.model.Serviceinfo;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.modelCustom.UserCustom;
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
@RequestMapping("/service")
public class ServiceinfoController {

    @Autowired
    ServiceinfoService serviceinfoService;

    /**
     *查询所有服务商
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "serviceList")
    public String serviceList(Model model, HttpSession session) {
        UserCustom loginUser = (UserCustom) session.getAttribute("userInfo");
        String parentCode = loginUser.getParentCode();
        List<Serviceinfo> list = serviceinfoService.queryAllList(parentCode);
        model.addAttribute("serviceList", list);
        return "/service/service-list";
    }

    /**
     * 打开修改服务商页面
     * @param id
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "openService")
    public String openService(Integer id, Model model, HttpSession session) {
        UserCustom loginUser = (UserCustom) session.getAttribute("userInfo");
        String parentCode = loginUser.getParentCode();
        //查询上级服务商
        List<ParentCustom> parentList = serviceinfoService.queryParentServiceByCode(parentCode);
        model.addAttribute("parentList", parentList);
        if (id != null) {
            Serviceinfo serviceinfo = serviceinfoService.selectServiceinfoById(id);
            model.addAttribute("serviceinfo", serviceinfo);
        }
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
        boolean bl;
        if (serviceinfo.getId() == null) {  //新增
            serviceinfo.setCreateTime(new Date());
            bl = serviceinfoService.insertService(serviceinfo);
        }else { //修改
            bl = serviceinfoService.updateService(serviceinfo);
        }
        JSONResult jsonResult = new JSONResult();
        jsonResult.setSuccess(bl);
        return jsonResult;
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
        boolean delStatus = serviceinfoService.deleteServiceById(id);
        obj.setSuccess(delStatus);
        return obj;
    }

    @RequestMapping(value = "updateServicekey")
    public String updateServicekey(Integer id, Model model, HttpSession session) {
        Serviceinfo serviceinfo = serviceinfoService.selectServiceinfoById(id);
        model.addAttribute("serviceinfo", serviceinfo);
        return "/service/service-config";
    }
}
