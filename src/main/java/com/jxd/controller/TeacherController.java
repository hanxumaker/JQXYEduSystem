package com.jxd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/11 8:03
 */
@Controller
public class TeacherController {
    @RequestMapping("/teacher")
    public String teacher(){
        return "teacher";
    }
}
