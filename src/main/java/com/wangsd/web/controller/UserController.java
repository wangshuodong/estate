package com.wangsd.web.controller;

import com.wangsd.web.model.Users;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.UsersService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 用户管理
 */
@Controller
@RequestMapping("/user")
public class UserController {

    private static final Logger logger = LogManager.getLogger(UserController.class.getName());

    @Autowired
    private UsersService usersService;
    /**
     * 用户登录
     * @param user
     * @param result
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(path = "/login", method = RequestMethod.POST)
    public String login(Users user, BindingResult result, HttpServletRequest request, Model model) {
        logger.debug("login");
        try {
            Subject subject = SecurityUtils.getSubject();
            // 已登陆则 跳到首页
            if (subject.isAuthenticated()) {
                return "redirect:/";
            }
            if (result.hasErrors()) {
                model.addAttribute("usernameError", "参数错误！");
                return "login";
            }
            // 身份验证
            subject.login(new UsernamePasswordToken(user.getUsername(), user.getPassword()));
            // 验证成功在Session中保存用户信息
            final UserCustom userCustom = usersService.selectByUsername(user.getUsername());
            request.getSession().setAttribute("userInfo", userCustom);
        } catch (AuthenticationException e) {
            // 身份验证失败
            model.addAttribute("usernameError", "用户名或密码错误 ！");
            return "login";
        }
        return "redirect:/";
    }

    /**
     * 用户登出
     * @param session
     * @return
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("userInfo");
        // 登出操作
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "login";
    }

}
