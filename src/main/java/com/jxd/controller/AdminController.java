package com.jxd.controller;

import com.jxd.model.Manager;
import com.jxd.model.User;
import com.jxd.service.IManagerService;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/11 7:55
 */
@Controller
@SessionAttributes({"tname","mname"})
public class AdminController {
    @Autowired
    ITeacherService teacherService;

    @Autowired
    IUserService userService;

    @Autowired
    IManagerService managerService;

    @RequestMapping("/userList")
    public String toUserList() {
        return "userList";
    }



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

    @RequestMapping("/managerList")
    public String toManagerList() {
        return "managerList";
    }

    @RequestMapping("/editTeacher1")
    public String editTeacher(Integer tid , String tname , Model model) {
        model.addAttribute("tid",tid);
        model.addAttribute("tname",tname);
        return "editTeacher";
    }
    @RequestMapping("/editManager1")
    public String editManager(Integer id , String mname , Model model) {
        model.addAttribute("id",id);
        model.addAttribute("mname",mname);
        return "editManager";
    }
    @RequestMapping("/addTeacher")
    public String toaddTeacher() {
        return "addTeacher";
    }

    @RequestMapping("/addManager")
    public String toaddManager() {
        return "addManager";
    }

    /**
     * 输出到用户列表
     * @param uname
     * @param page
     * @param limit
     * @return 返回一个json数组
     */
    @RequestMapping(value = "/getAllUsers", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllUsers(String uname, Integer page, Integer limit){
        List<User> list = null;
        int count = 0;
        list = userService.getAllUsers(uname, page, limit);
        //count代表json的长度
        count = userService.getAllUsers1(uname).size();


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
     * 输出到老师列表
     * @param name
     * @param page
     * @param limit
     * @return 返回一个json数组
     */
    @RequestMapping(value = "/getAllTeachers", produces = "text/html;charset=utf-8")
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
     * 同理得到经理表
     * @param name
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value = "/getAllManagers", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllManagers(String name, Integer page, Integer limit) {
        List<Manager> list = null;
        int count = 0;
        list = managerService.getAllTeachers(name, page, limit);
        //count代表json的长度
        count = managerService.getAllTeachers1(name).size();


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

    /**
     * 增加一个经理，将其在用户表添加
     * @param name
     * @param password
     * @return 返回是否添加成功
     */
    @RequestMapping(value = "/addMan", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String addMan(String name, String password) {
        User user = new User();
        user.setPassword(password);
        user.setUname(name);
        user.setRole(2);
        boolean addUser = userService.addUser(user);
        Manager manager =new Manager();
        manager.setMname(name);
        boolean addMan = managerService.addTeacher(manager);
        //只有两个表同时添加上才能添加成功
        if (addUser && addMan){
            return "添加成功";
        }else {
            return "添加失败";
        }
    }
    /**
     * 删除一个老师
     * @param teacher
     * @return
     */
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

    /**
     * 删除一个经理
     * @param manager
     * @return
     */
    @RequestMapping(value = "/deleteManager", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String deleteManager(Manager manager){
        User user = new User();
        user.setUname(manager.getMname());
        boolean delUser = userService.delUser(user);
        boolean delManager = managerService.delTeacher(manager);
        if (delUser && delManager){
            return "删除成功";
        }else{
            return "删除失败";
        }
    }

    /**
     * 更新老师
     * @param teacher
     * @param request
     * @return
     */
    @RequestMapping(value = "/editTea", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String editTea(Teacher teacher, HttpServletRequest request){
        boolean isEdit = teacherService.editTea(teacher);
        HttpSession session = request.getSession();
        String oldName = (String)session.getAttribute("tname");
        String newName = teacher.getTname();
        boolean isUser = userService.editUser(oldName,newName);
        if (isEdit && isUser){
            return "修改成功";
        }else{
            return "修改失败";
        }
    }

    /**
     * 更新经理
     * @param manager
     * @param request
     * @return
     */
    @RequestMapping(value = "/editMan", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String editMan(Manager manager, HttpServletRequest request){
        String name = manager.getMname();
        Integer id = manager.getId();
        boolean isEdit = managerService.editTea(manager);
        HttpSession session = request.getSession();
        String oldName = (String)session.getAttribute("mname");
        String newName = manager.getMname();
        boolean isUser = userService.editUser(oldName,newName);
        if (isEdit && isUser){
            return "修改成功";
        }else{
            return "修改失败";
        }
    }
}
