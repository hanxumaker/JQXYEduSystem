package com.jxd.controller;

import com.jxd.model.Course;
import com.jxd.model.Student;
import com.jxd.service.ICourseService;
import com.jxd.service.IStudentService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/11 8:03
 */
@Controller
@SessionAttributes({"tname","cid"})
public class TeacherController {
    @Autowired
    IStudentService studentService;

    @Autowired
    ICourseService courseService;

    @RequestMapping("/teacher")
    public String teacher(HttpServletRequest request,Model model) {
        //String tname = request.getParameter("tname");
        //String tname = "hyh";
        String tname = "wmm";
        model.addAttribute("tname",tname);
        return "teacher";
    }

    @RequestMapping("/studentScore")
    public String studentScore() {
        return "studentScore";
    }

    @RequestMapping(value = "/getAllStudent",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllStudent(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        //获取班级
        String tname = (String)session.getAttribute("tname");
        int cid = studentService.getCidByTeacher(tname);
        model.addAttribute("cid",cid);
        //获取学生,过滤条件
        String sname = request.getParameter("sname");
        //获取班级内的学生
        List<Student> list = studentService.getAllStudentByCid(cid,sname);

        //获取一页显示几条数据
        int pageSize = Integer.parseInt(request.getParameter("limit"));
        //获取当前页
        int pageIndex = Integer.parseInt(request.getParameter("page"));
        int count = (pageIndex - 1) * pageSize;
        //分页查询
        List<Student> list1 = studentService.getSomeStudents(count, pageSize, sname,cid);
        //将list转换为数组
        JSONArray jsonArray = JSONArray.fromObject(list1);

        //创建json对象，用于返回layui表格需要的数据
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());//一个有多少条数据
        jsonObject.put("data", jsonArray);
        return jsonObject.toString();
    }
    @RequestMapping("/teacherScore")
    public String teacherScore(){
            return "teacherScore";
    }

    @RequestMapping(value = "/getTeacherScore",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getTeacherScore(HttpServletRequest request){
        HttpSession session = request.getSession();
        int cid = (int)session.getAttribute("cid");
        List<Course> list = new ArrayList<>();
        list = courseService.getAllCourseByCid(cid);
        JSONArray jsonArray = JSONArray.fromObject(list);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",0);
        jsonObject.put("msg","");
        jsonObject.put("count",list.size());
        jsonObject.put("data",jsonArray);
        return jsonObject.toString();
    }

    @RequestMapping("/updatePassword")
    public String updatePassword(){
        return "updatePassword";
    }

    //返回到学生成绩页面
    @RequestMapping("/selectStudentScore")
    public String selectStudentScore(){
        return "selectStudentScore";
    }

    //返回学生评价页面
    @RequestMapping("/studentEvaluate")
    public String studentEvaluate(){
        return "studentEvaluate";
    }

    //老师评价页面
    @RequestMapping("/teacherEvaluate")
    public String teacherEvaluate(){
        return "teacherEvaluate";
    }

    //查看学生的成绩
    @RequestMapping("/getStudentScore")
    public String getStudentScore(){
        return "getStudentScore";
    }
}
