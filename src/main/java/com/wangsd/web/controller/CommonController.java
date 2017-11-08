package com.wangsd.web.controller;

import com.wangsd.web.modelCustom.MenuCustom;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 公共视图控制器
 *
 **/
@Controller
public class CommonController {

    @Autowired
    MenuService menuService;
    
    /**
     * 进入首页
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/index")
    public String index(HttpServletRequest request, Model model) {
        UserCustom obj = (UserCustom) request.getSession().getAttribute("userInfo");
        Integer roleId = obj.getRoleId();
        List<MenuCustom> list = menuService.queryMenuByRoleId(roleId);
        model.addAttribute("menuList", list);
        return "/index";
    }

}