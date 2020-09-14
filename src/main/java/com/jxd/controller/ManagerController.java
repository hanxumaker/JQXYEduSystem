package com.jxd.controller;

import com.jxd.dao.IDeptDao;
import com.jxd.dao.IStudentDao;
import com.jxd.model.*;
import com.jxd.service.IManagerService;
import com.jxd.service.IStudentService;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;
import java.util.Map;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/11 8:04
 */
@Controller
@SessionAttributes({"User"})
public class ManagerController {
    @Autowired
    IManagerService managerService;
    @Autowired
    IStudentService studentService;

    @RequestMapping("/toGetStudentByDeptno")
    /*@ModelAttribute("User") User user 在控制器中获取另一个控制器存入session的值*/
    public String toGetStudentByDeptno(@ModelAttribute("User") User user, Model model) {
        Manager manager = managerService.getManagerByMname(user.getUname());
        model.addAttribute("deptno", manager.getDeptno());//将部门id存入model中
        return "studentInDept";
    }

    @RequestMapping("/getStudentsByDeptno")
    @ResponseBody
    public JSON getStudentsByDeptno(Integer limit, Integer page, String sname, Integer deptno) {
        Integer pageSize = limit; //获取一页显示几条数据
        Integer count = page * (page - 1);//跳过几条数据
        List<Student> list = studentService.getStudentsByDeptno(deptno, sname);
        List<Student> list1 = studentService.getStudents(count, pageSize, sname, deptno);
        JSONArray jsonArray = JSONArray.fromObject(list1);
        //创建json对象用于返回layui表格需要的数据
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size()); //一共有多少条数据
        jsonObject.put("data", jsonArray);
        return jsonObject;
    }

    @RequestMapping("/toEvaluationPage")
    public String toEvaluationPage(@ModelAttribute("User") User user, Integer sid, Model model) {
        //将查找到的学生存入model
        Student student = studentService.getStudentBySid(sid);
        model.addAttribute("student", student);
        //将查找到的正在使用的评分项存入model
        List<Analytes> list = managerService.getAnalytes(1);
        model.addAttribute("aList", list);
        //将查到的部门名称存入model
        Manager manager = managerService.getManagerByMname(user.getUname());
        Dept dept = managerService.getDnameByDeptno(manager.getDeptno());
        model.addAttribute("dname",dept.getDname());
        return "evaluationPage";
    }
}
