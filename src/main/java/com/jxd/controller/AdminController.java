package com.jxd.controller;

import com.jxd.dao.IUserDao;
import com.jxd.model.User;
import com.jxd.service.ITeacherService;
import com.jxd.service.IUserService;
import net.sf.json.JSONArray;
import com.jxd.model.Teacher;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/11 7:55
 */
@Controller
@SessionAttributes("")
public class AdminController {
    @Autowired
    ITeacherService teacherService;

    @Autowired
    IUserService userService;

    @RequestMapping("/admin")
    public String toAdmin() {
        return "admin";
    }

    @RequestMapping("/login")
    public String toLogin() {
        return "login";
    }

    @RequestMapping("/teacherList")
    public String toTeacherList() {
        return "teacherList";
    }

    @RequestMapping("/editTeacher")
    public String editTeacher() {
        return "editTeacher";
    }
    @RequestMapping("/addTeacher")
    public String toaddTeacher() {
        return "addTeacher";
    }

    /**
     * 输出到老师列表
     * @param name
     * @param page
     * @param limit
     * @return 返回一个json数组
     */
    @RequestMapping("/getAllTeachers")
    @ResponseBody
    public String getAllTeachers(String name, Integer page, Integer limit) {
        List<Teacher> list = null;
        int count = 0;
        list = teacherService.getAllTeachers(name, page, limit);
        //count代表json的长度
        count = teacherService.getAllTeachers1(name).size();


        //将list转换为json数组
        net.sf.json.JSONArray jsonArray = JSONArray.fromObject(list);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", count);
        jsonObject.put("data", jsonArray);
        return jsonObject.toString();
    }

    /**
     * 增加一个老师，将其在用户表添加
     * @param name
     * @param password
     * @return 返回是否添加成功
     */
    @RequestMapping(value = "/addTea", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String addTea(String name, String password) {
        User user = new User();
        user.setPassword(password);
        user.setUname(name);
        user.setRole(2);
        boolean addUser = userService.addUser(user);
        Teacher teacher = new Teacher();
        teacher.setTname(name);
        teacher.setState(1);
        boolean addTeacher = teacherService.addTeacher(teacher);
        //只有两个表同时添加上才能添加成功
        if (addUser && addTeacher){
            return "添加成功";
        }else {
            return "添加失败";
        }
    }

    @RequestMapping(value = "/deleteTeacher", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String deleteTeacher(Teacher teacher){
        User user = new User();
        user.setUname(teacher.getTname());
        boolean delUser = userService.delUser(user);
        boolean delTeacher = teacherService.delTeacher(teacher);
        if (delUser && delTeacher){
            return "删除成功";
        }else{
            return "删除失败";
        }

    }

}
