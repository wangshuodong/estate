package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.web.model.Housinginfo;
import com.wangsd.web.model.Roominfo;
import com.wangsd.web.modelCustom.HousinginfoCustom;
import com.wangsd.web.modelCustom.ParentCustom;
import com.wangsd.web.modelCustom.RoominfoCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.AlipayService;
import com.wangsd.web.service.HousinginfoServic;
import com.wangsd.web.service.RoominfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
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
    @Autowired
    AlipayService alipayService;


    /**
     * 查询房间列表
     * @param query
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/roominfoList")
    public String roominfoList(RoominfoCustom query, HttpServletRequest request, Model model) {
        UserCustom loginUser = (UserCustom) request.getSession().getAttribute("userInfo");
        List<ParentCustom> parentList = housinginfoServic.queryParentHousingByCode(loginUser.getParentCode());
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

    /**
     * 打开info页面
     * @param id
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/openRoominfo")
    public String openRoominfo(Integer id, HttpServletRequest request, Model model) {
        UserCustom loginUser = (UserCustom) request.getSession().getAttribute("userInfo");
        List<ParentCustom> parentList = housinginfoServic.queryParentHousingByCode(loginUser.getParentCode());
        model.addAttribute("parentList", parentList);
        if (id != null) {
            Roominfo roominfo = roominfoService.selectRoominfoById(id);
            model.addAttribute("roominfo", roominfo);
        }
        return "/roominfo/roominfo-info";
    }

    @RequestMapping("/deleteRoominfo")
    @ResponseBody
    public JSONResult deleteRoominfo(Integer id, HttpSession session) {
        //获取公钥 私钥
        UserCustom loginUser = (UserCustom) session.getAttribute("userInfo");
        Roominfo roominfo = roominfoService.selectRoominfoById(id);
        if (roominfo.getStatus()) { //已同步
            HousinginfoCustom housing = housinginfoServic.selectHousingCustomById(roominfo.getParentId());
            List<String> roomids = new ArrayList<>();
            roomids.add(roominfo.getId().toString());
            alipayService.roominfoDeleteRequest(housing.getCommunityId(), roomids, housing.getToken(), loginUser);
        }
        boolean bl = roominfoService.deleteRoominfo(id);
        JSONResult obj = new JSONResult();
        obj.setSuccess(bl);
        return obj;
    }

    @RequestMapping(path = "/saveOrUpdateRoominfo", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult saveOrUpdateRoominfo(Roominfo roominfo) {
        boolean bl;
        roominfo.setAddress(roominfo.getGroupName() + roominfo.getBuilding() + roominfo.getUnit() + roominfo.getRoom());
        if (roominfo.getId() == null) {
            roominfo.setCreateTime(new Date());
            bl = roominfoService.insertRoominfo(roominfo);
        }else {
            bl = roominfoService.updateRoominfo(roominfo);
        }
        JSONResult obj = new JSONResult();
        obj.setSuccess(bl);
        return obj;
    }

}
