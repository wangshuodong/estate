package com.wangsd.web.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 公共视图控制器
 *
 **/
@Controller
public class CommonController {

    private static final Logger logger = LogManager.getLogger(CommonController.class.getName());

//    @Autowired
//    UsersService usersService;
//    @Autowired
//    RoleService roleService;
    
    /**
     * 进入首页
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/index")
    public String index(HttpServletRequest request, Model model) {
//        AccountCustom obj = (AccountCustom) request.getSession().getAttribute("userInfo");
//        Integer roleid = obj.getRoleid();
//        List<MenuCustom> list = roleService.queryMenuListByRoleId(obj.getRoleid());
//        model.addAttribute("menuList", list);
//        model.addAttribute("name", obj.getName());
//        model.addAttribute("loginType", 111);//系统个人信息
//        int no=usersService.getSysMessage(roleid);
//        model.addAttribute("sys_recordRoleId", roleid);
//        model.addAttribute("sys_recordNum", no);//系统消息记录数目
        return "/index";
    }

}