package com.wangsd.web.controller;

import com.wangsd.web.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * 角色管理
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private UsersService usersService;


    @RequestMapping(value = "/roleList")
    public String logout(Model model, HttpSession session) {
        return "/system/role-list";
    }

}
