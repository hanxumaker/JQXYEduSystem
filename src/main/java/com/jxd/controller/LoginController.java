package com.jxd.controller;

import com.jxd.model.User;
import com.jxd.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 * @Description TODO
 * @Author Li Min
 * @Date 2020/9/13 9:27
 */
@Controller
@SessionAttributes({"User"})
public class LoginController {
    @Autowired
    IUserService userService;
    @RequestMapping(value = "/login",produces = "text/html;charset=utf-8")
    public String login(User user, Model model) {
        User user1 = userService.searchUser(user);
        if (user1 != null) {
            model.addAttribute("User",user1);
            if (user1.getRole() == 1) {
                return "admin";
            } else if (user1.getRole() == 2) {
                return "teacher";
            } else {
                return "manager";
            }
        } else {
            model.addAttribute("msg", "用户名或密码错误，登录失败");
            return "login";
        }
    }
}



