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

    @RequestMapping("/login2")
    public String login2() {
        return "login";
    }

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

    @RequestMapping("/toAdmin")
    public String toAdmin() {
        return "admin";
    }

    @RequestMapping("/toTeacher")
    public String toTeacher() {
        return "teacher";
    }

    @RequestMapping("/toManager")
    public String toManager() {
        return "manager";
    }
}




