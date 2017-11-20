package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.web.model.Housinginfo;
import com.wangsd.web.model.Roominfo;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.modelCustom.RoominfoCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.HousinginfoServic;
import com.wangsd.web.service.RoominfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 房屋信息Controller
 */
@Controller
@RequestMapping("/roominfo")
public class RoominfoController {

    @Autowired
    RoominfoService roominfoService;
    @Autowired
    HousinginfoServic housinginfoServic;


    @RequestMapping("/roominfoList")
    public String roominfoList(RoominfoCustom query, HttpServletRequest request, Model model) {
        UserCustom loginUser = (UserCustom) request.getSession().getAttribute("userInfo");
        List<ParentCustom> parentList = housinginfoServic.queryParentCustomByCode(loginUser.getParentCode());
        model.addAttribute("parentList", parentList);
        String departmentCode;
        if (query.getParentId() == null || query.getParentId() == 0) {
            departmentCode = loginUser.getParentCode();
        } else {
            Housinginfo parent = housinginfoServic.selectHousinginfoById(query.getParentId());
            departmentCode = parent.getCode();
        }
        query.setDepartmentCode(departmentCode);
        List<RoominfoCustom> list = roominfoService.queryRoominfoList(query);
        model.addAttribute("roominfoList", list);
        model.addAttribute("query", query);
        return "/roominfo/roominfo-list";
    }

    @RequestMapping("/addRoominfo")
    public String addRoominfo(HttpServletRequest request, Model model) {
        UserCustom loginUser = (UserCustom) request.getSession().getAttribute("userInfo");
        List<ParentCustom> parentList = housinginfoServic.queryParentHousingByCode(loginUser.getParentCode());
        model.addAttribute("parentList", parentList);
        return "/roominfo/roominfo-info";
    }

    @RequestMapping("/updateRoominfo")
    public String updateRoominfo(Integer id, HttpServletRequest request, Model model) {
        UserCustom loginUser = (UserCustom) request.getSession().getAttribute("userInfo");
        List<ParentCustom> parentList = housinginfoServic.queryParentCustomByCode(loginUser.getParentCode());
        model.addAttribute("parentList", parentList);
        Roominfo roominfo = roominfoService.selectRoominfoById(id);
        model.addAttribute("roominfo", roominfo);
        return "/roominfo/roominfo-info";
    }

    @RequestMapping("/deleteRoominfo")
    @ResponseBody
    public JSONResult deleteRoominfo(Integer id) {
        JSONResult obj = new JSONResult();
        int num = roominfoService.deleteRoominfo(id);
        boolean delStatus;
        if (num == 1) {
            delStatus = true;
        } else {
            delStatus = false;
        }
        obj.setSuccess(delStatus);
        return obj;
    }

    @RequestMapping(path = "/saveOrUpdateRoominfo", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult saveOrUpdateRoominfo(Roominfo roominfo) {
        boolean bl = roominfoService.saveOrUpdateUser(roominfo);
        JSONResult obj = new JSONResult();
        obj.setSuccess(bl);
        return obj;
    }

}
