package com.wangsd.web.controller;

import com.alibaba.fastjson.JSON;
import com.wangsd.core.entity.JSONResult;
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
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
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
     * 打开页面
     * @param model
     * @return
     */
    @RequestMapping(value = "/openRole")
    public String openRole(Integer roleId, Model model) {
        if (roleId == null) { //打开新增页面
            List<MenuCustom> list = menuService.queryAllMenuTreeList();
            model.addAttribute("menuList", JSON.toJSON(list));
        }else { //打开修改页面
            List<MenuCustom> list = menuService.queryAllMenuTreeList();
            List<Integer> menuIds = roleService.queryMenuIdByRoleid(roleId);
            for (int i=0; i<list.size(); i++) {
                MenuCustom menuTree = list.get(i);
//            	if (i==0 && menuTree.getParentid() == null) {
//            		menuTree.setOpen(true);
//            	}
                if (menuIds.contains(menuTree.getId())) {
                    menuTree.setChecked(true);
                }
            }
            model.addAttribute("menuList", JSON.toJSON(list));
            Role role = roleService.selectRoleById(roleId);
            model.addAttribute("role", role);
        }
        return "/system/role-info";
    }

    /**
     * 保存权限和角色
     * @param roleCustom
     */
    @RequestMapping(path = "/saveOrUpdateRole", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult saveOrUpdateRole(RoleCustom roleCustom, Model model) {
        boolean bl;
        if (roleCustom.getId() == null) { //新增
            roleCustom.setCreateTime(new Date());
            bl = roleService.insertRole(roleCustom);
        }else { //修改
            bl = roleService.updateRole(roleCustom);
        }
        JSONResult obj = new JSONResult();
        obj.setSuccess(bl);
        return obj;
    }

    /**
     * 删除角色
     * @param roleId
     * @return
     */
    @RequestMapping("/deleteRole")
    @ResponseBody
    public JSONResult deleteRoleInfo(Integer roleId) {
        JSONResult obj = new JSONResult();
        boolean delStatus = roleService.deleteRoleInfo(roleId);
        obj.setSuccess(delStatus);
        return obj;
    }
}
