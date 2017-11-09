package com.wangsd.web.controller;

import com.wangsd.web.model.Role;
import com.wangsd.web.modelCustom.MenuCustom;
import com.wangsd.web.service.MenuService;
import com.wangsd.web.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 角色管理
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;
    @Autowired
    private MenuService menuService;


    @RequestMapping(value = "/roleList")
    public String roleList(Model model) {
        List<Role> list = roleService.queryAllRoleList(null);
        model.addAttribute("roleList", list);
        return "/system/role-list";
    }

    @RequestMapping(value = "/addRole")
    public String addRole(Model model) {
        List<MenuCustom> list = menuService.queryAllMenuTreeList();
        model.addAttribute("menuList", list);
        return "/system/role-info";
    }
}
