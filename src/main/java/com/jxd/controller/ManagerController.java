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

import java.util.ArrayList;
import java.util.HashMap;
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
        //将查到的部门名称存入model
        Manager manager = managerService.getManagerByMname(user.getUname());
        Dept dept = managerService.getDnameByDeptno(manager.getDeptno());
        model.addAttribute("dname", dept.getDname());
        //将查到的该学生的工作评价信息存入model
        List<WorkEvaluate> list1 = managerService.getWorkEvaluateBySid(sid);
        model.addAttribute("wList", list1);
        //将查到的该学生的学校评价信息存入model
        List<Map<String, Object>> list = managerService.getStudentSchoolEvaluate(sid);
        model.addAttribute("sList", list);
        return "evaluationPage";
    }

    @RequestMapping(value = "/addWorkEvaluate", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String addWorkEvaluate(Integer sid, Integer dateId, Integer score0, Integer score1, Integer score2,
                                  Integer score3, Integer score4, Integer totalScore, String evaluatePerson, String evaluateContent) {
        WorkEvaluate workEvaluate = new WorkEvaluate(dateId, sid, 1, evaluatePerson, score0, totalScore, evaluateContent);
        WorkEvaluate workEvaluate1 = new WorkEvaluate(dateId, sid, 2, evaluatePerson, score1, totalScore, evaluateContent);
        WorkEvaluate workEvaluate2 = new WorkEvaluate(dateId, sid, 3, evaluatePerson, score2, totalScore, evaluateContent);
        WorkEvaluate workEvaluate3 = new WorkEvaluate(dateId, sid, 4, evaluatePerson, score3, totalScore, evaluateContent);
        WorkEvaluate workEvaluate4 = new WorkEvaluate(dateId, sid, 5, evaluatePerson, score4, totalScore, evaluateContent);
        List<WorkEvaluate> list = new ArrayList();
        list.add(workEvaluate);
        list.add(workEvaluate1);
        list.add(workEvaluate2);
        list.add(workEvaluate3);
        list.add(workEvaluate4);
        boolean isAdd = managerService.addWorkEvaluate(list);
        if (isAdd) {
            return "评价成功";
        } else {
            return "评价失败";
        }
    }

}
