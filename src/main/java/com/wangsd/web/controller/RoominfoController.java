package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.web.model.Department;
import com.wangsd.web.model.Roominfo;
import com.wangsd.web.modelCustom.RoominfoCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.DepartmentService;
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
    DepartmentService departmentService;

    @RequestMapping("/roominfoList")
    public String roominfoList(RoominfoCustom room, HttpServletRequest request, Model model) {
        UserCustom user = (UserCustom) request.getSession().getAttribute("userInfo");
        List<Department> parentList = departmentService.queryDepartmentList(user.getDepartmentCode(), 3);
        model.addAttribute("parentList", parentList);
        String departmentCode;
        if (room.getDepartmentId() != null) {
            Department parent = departmentService.findDepartmentById(room.getDepartmentId());
            departmentCode = parent.getCode();
        } else {
            departmentCode = user.getDepartmentCode();
        }
        RoominfoCustom query = new RoominfoCustom();
        query.setDepartmentCode(departmentCode);
        List<RoominfoCustom> list = roominfoService.queryRoominfoList(query);
        model.addAttribute("roominfoList", list);
        model.addAttribute("query", room);
        return "/roominfo/roominfo-list";
    }

    @RequestMapping("/addRoominfo")
    public String addRoominfo(HttpServletRequest request, Model model) {
        UserCustom user = (UserCustom) request.getSession().getAttribute("userInfo");
        List<Department> parentList = departmentService.queryDepartmentList(user.getDepartmentCode(), 3);
        model.addAttribute("parentList", parentList);
        return "/roominfo/roominfo-info";
    }

    @RequestMapping("/updateRoominfo")
    public String updateRoominfo(Integer id, HttpServletRequest request, Model model) {
        UserCustom user = (UserCustom) request.getSession().getAttribute("userInfo");
        List<Department> parentList = departmentService.queryDepartmentList(user.getDepartmentCode(), 3);
        model.addAttribute("parentList", parentList);
        Roominfo roominfo = roominfoService.findRoominfoById(id);
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
