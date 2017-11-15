package com.wangsd.web.controller;

import com.wangsd.core.entity.JSONResult;
import com.wangsd.web.dao.UsersMapper;
import com.wangsd.web.model.Department;
import com.wangsd.web.model.Users;
import com.wangsd.web.modelCustom.UserCustom;
import com.wangsd.web.service.DepartmentService;
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
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 用户管理
 */
@Controller
@RequestMapping("/user")
public class UserController {

    private static final Logger logger = LogManager.getLogger(UserController.class.getName());

    @Autowired
    private UsersService usersService;
    @Autowired
    private UsersMapper usersMapper;
    @Autowired
    DepartmentService departmentService;
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

    /**
     *
     * Description: 查询所有用户信息
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/userList")
    public String userList(Model model,HttpServletRequest request) {
        UserCustom obj = (UserCustom) request.getSession().getAttribute("userInfo");
        String departmentCode = obj.getDepartmentCode();
        Department department = new Department();
        department.setCode(departmentCode);
        List<UserCustom> list = usersService.queryUserListByCode(department);
        model.addAttribute("userList", list);
        return "/user/user-list";
    }

    /**
     *
     * Description: 跳转新增用户页面
     *
     * @param model
     * @param
     * @return
     */
    @RequestMapping(value = "addUser")
    public String addUser(Model model, HttpServletRequest request) {
        UserCustom user = (UserCustom) request.getSession().getAttribute("userInfo");
        String departmentCode = user.getDepartmentCode();
        Integer type = null;
        Department department = new Department();
        department.setCode(departmentCode);
        department.setType(type);
        List<Department> list = departmentService.queryDepartmentList(user.getDepartmentCode(),user.getDeptType());
        model.addAttribute("parentDepartment", list);
        return "/user/user-info";
    }


    /**
     * 新增或者保存User
     * @param user
     * @param
     * @return
     */
    @RequestMapping(path = "/saveOrUpdateUser", method = RequestMethod.POST)
    @ResponseBody
    public JSONResult saveOrUpdateUser(Users user) {
        boolean bl = usersService.saveOrUpdateUser(user);
        JSONResult obj = new JSONResult();
        obj.setSuccess(bl);
        return obj;
    }

    /**
     * 打开修改User页面
     * @param id
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/updateUser")
    public String updateUser(Integer id, HttpServletRequest request, Model model) {
        UserCustom user = (UserCustom) request.getSession().getAttribute("userInfo");
        String departmentCode = user.getDepartmentCode();
        Integer type = null;
        Department department = new Department();
        department.setCode(departmentCode);
        department.setType(type);
        List<Department> list = departmentService.queryDepartmentList(user.getDepartmentCode(),user.getDeptType());
        model.addAttribute("parentDepartment", list);
        Users userInfo = usersService.selectByPrimaryKey(id);
        model.addAttribute("user", userInfo);
        return "/user/user-info";
}
    /**
     *  删除User
     * @param id
     * @return
     */
    @RequestMapping(value = "/deleteUser")
    @ResponseBody
    public JSONResult deleteUser(Integer id) {
        JSONResult obj = new JSONResult();
        int num= usersService.deleteUserInfo(id);
        boolean delStatus;
        if (num == 1) {
            delStatus = true;
        } else {
            delStatus = false;
        }
        obj.setSuccess(delStatus);
        return obj;
    }
    /**
     *  检查新增登陆名是否重复
     * @param username
     * @return
     */

    @RequestMapping(value = "checkUserName")
    @ResponseBody
    public JSONResult checkUserName(String username) {
        JSONResult obj = new JSONResult();
        UserCustom user1 = usersService.selectByUsername(username);
        if(user1 != null){
            obj.setSuccess(false);
            obj.setMessage("登陆名已存在，请重新输入");
        }else{
            obj.setSuccess(true);
        }
        return obj;
    }
    /**
     *  用户启用/停用
     * @param user
     * @return
     */
    @RequestMapping(value = "activeUser")
    @ResponseBody
    public JSONResult activeUser(Users user) {
        JSONResult obj = new JSONResult();
        boolean bl = usersService.saveOrUpdateUser(user);
        obj.setSuccess(bl);
        return obj;
    }

}
