package com.wangsd.web.controller;

import com.alibaba.fastjson.JSON;
import com.wangsd.web.model.Role;
import com.wangsd.web.modelCustom.MenuCustom;
import com.wangsd.web.modelCustom.RoleCustom;
import com.wangsd.web.service.MenuService;
import com.wangsd.web.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

    /**
     * 查询角色列表
     * @param model
     * @return
     */
    @RequestMapping(value = "/roleList")
    public String roleList(Model model) {
        List<Role> list = roleService.queryAllRoleList(null);
        model.addAttribute("roleList", list);
        return "/system/role-list";
    }

    /**
     * 新增角色
     * @param model
     * @return
     */
    @RequestMapping(value = "/addRole")
    public String addRole(Model model) {
        List<MenuCustom> list = menuService.queryAllMenuTreeList();
        model.addAttribute("menuList", JSON.toJSON(list));
        return "/system/role-info";
    }

    /**
     * 保存权限和角色
     * @param roleCustom
     */
    @RequestMapping(path = "/saveOrUpdateRole", method = RequestMethod.POST)
    //@ResponseBody
    public String saveOrUpdateRole(RoleCustom roleCustom, Model model) {
        boolean bl = roleService.saveOrUpdateRole(roleCustom);
        if (bl) {
            return roleList(model);
        }else {
            return "/system/role-info";
        }
    }
}
