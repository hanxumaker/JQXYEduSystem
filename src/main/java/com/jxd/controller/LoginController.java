package com.jxd.controller;

import com.jxd.model.User;
import com.jxd.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @Description TODO
 * @Author Li Min
 * @Date 2020/9/13 9:27
 */
@Controller
public class LoginController {
    @Autowired
    IUserService userService;

    //返回登录页面
    @RequestMapping("/login2")
    public String login2() {
        return "login";
    }

    /**
     * 接收用户名和密码，判断该用户是否存在
     * @param user 前台传入的用户名和密码，封装成用户对象
     * @param request
     * @return 登录成功返回相对应的内容
     */
    @RequestMapping(value = "/checkUser", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String checkUser(User user, HttpServletRequest request) {
        User user1 = userService.searchUser(user);
        HttpSession session = request.getSession();//获取一个session
        if (user1 != null) {
            session.setAttribute("User", user1);//将user1存入session
            if (user1.getRole() == 1) {
                return "admin";
            } else if (user1.getRole() == 2) {
                return "teacher";
            } else if (user1.getRole() == 3) {
                return "manager";
            } else {
                return "用户名或密码错误";
            }
        } else {
            return "用户名或密码错误";
        }
    }

    /**
     * 返回管理员页面
     * @return 管理员页面
     */
    @RequestMapping("/toAdmin")
    public String toAdmin() {
        return "admin";
    }

    /**
     * 返回老师页面
     * @return 老师页面
     */
    @RequestMapping("/toTeacher")
    public String toTeacher() {
        return "teacher";
    }

    /**
     * 返回经理页面
     * @return 经理页面
     */
    @RequestMapping("/toManager")
    public String toManager() {
        return "manager";
    }
}




