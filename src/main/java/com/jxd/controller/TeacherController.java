package com.jxd.controller;

import com.jxd.model.Grade;
import com.jxd.model.SchoolEvaluate;
import com.jxd.model.Student;
import com.jxd.service.*;
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
import java.util.Map;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/11 8:03
 */
@Controller
@SessionAttributes({"tname","cid","sid","state","deptno"})//sid:学生成绩的id
public class TeacherController {
    @Autowired
    IStudentService studentService;

    @Autowired
    ICourseService courseService;

    @Autowired
    ISchoolEvaluateService schoolEvaluateService;

    @Autowired
    IGradeService gradeService;

    @Autowired
    ITeacherService teacherService;

    //老师登录后的第一个页面
    @RequestMapping("/teacher")
    public String teacher(HttpServletRequest request, Model model) {
        String tname = "hyh";
        //String tname = "wmm";
        //String tname = request.getParameter("tname");
        model.addAttribute("tname", tname);
        return "teacher";
    }

    //学生成绩页面
    @RequestMapping("/studentScore")
    public String studentScore() {
        return "studentScore";
    }

    //得到班级下的学生
    @RequestMapping(value = "/getAllStudent", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllStudent(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        //获取班级
        String tname = (String) session.getAttribute("tname");
        int cid = studentService.getCidByTeacher(tname);
        model.addAttribute("cid", cid);
        //获取学生,过滤条件
        String sname = request.getParameter("sname");
        //获取班级内的学生
        List<Student> list = studentService.getAllStudentByCid(cid, sname);

        //获取一页显示几条数据
        int pageSize = Integer.parseInt(request.getParameter("limit"));
        //获取当前页
        int pageIndex = Integer.parseInt(request.getParameter("page"));
        int count = (pageIndex - 1) * pageSize;
        //分页查询
        List<Student> list1 = studentService.getSomeStudents(count, pageSize, sname, cid);
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

    /*//查看学生的详细信息
    public String getStudentBySid(){
       Student student = studentService.getStudentBySid(sid);
       return
    }*/
    //老师进行评分页面
    @RequestMapping("/teacherScore")
    public String teacherScore(Model model,Integer sid) {
        model.addAttribute("sid",sid);
        return "teacherScore";
    }

    //查看老师给学生的打分
    @RequestMapping(value = "/getTeacherScore", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getTeacherScore(HttpServletRequest request) {
        HttpSession session = request.getSession();
        int cid = (int) session.getAttribute("cid");
        List<Map<String, String>> list = courseService.getAllCourseByCid(cid);
        JSONArray jsonArray = JSONArray.fromObject(list);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());
        jsonObject.put("data", jsonArray);
        return jsonObject.toString();
    }

    //修改密码
    @RequestMapping("/updatePassword")
    public String updatePassword() {
        return "updatePassword";
    }

    //返回到学生成绩页面
    @RequestMapping("/selectStudentScore")
    public String selectStudentScore(Integer sid, Model model) {
        model.addAttribute("sid", sid);
        return "selectStudentScore";
    }

    //返回学生评价页面
    @RequestMapping("/studentEvaluate")
    public String studentEvaluate() {
        return "studentEvaluate";
    }

    //老师评价页面
    @RequestMapping("/teacherEvaluate")
    public String teacherEvaluate(Integer state,Model model,Integer sid,Integer deptno) {
        model.addAttribute("state",state);
        model.addAttribute("sid",sid);
        model.addAttribute("deptno",deptno);
        return "teacherEvaluate";
    }

    //查看学生的成绩
    @RequestMapping(value = "/getStudentScore", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getStudentScore(HttpServletRequest request) {
        HttpSession session = request.getSession();
        int sid = (int) session.getAttribute("sid");
        List<Map<String, String>> list = schoolEvaluateService.getStudentScoreBySid(sid);
        JSONArray jsonArray = JSONArray.fromObject(list);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());
        jsonObject.put("data", jsonArray);
        return jsonObject.toString();
    }

    //返回到学生评价页面
    @RequestMapping("/selectStudentEvaluate")
    public String selectStudentEvaluate(Integer sid1, Model model) {
        SchoolEvaluate schoolEvaluate = schoolEvaluateService.selectStuEvaBySid(sid1);
        model.addAttribute("schoolEvaluate", schoolEvaluate);
        return "selectStudentEvaluate";
    }

    //接收前台传来的已经打分的数据，将其批量插入到成绩表中
    @RequestMapping(value = "/gradeList", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String addStuScore(String stuScore,Integer sid) {
        List<Grade> list = new ArrayList<>();
        JSONArray jsonArray = JSONArray.fromObject(stuScore);
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            //获取到老师的评分
            Grade grade = new Grade(sid, Integer.parseInt(jsonObject.getString("courseid")), Double.parseDouble(jsonObject.getString("score")));
            list.add(grade);
        }
        boolean isAdd = gradeService.addStudentScore(list);
        if (isAdd) {
            return "提交成功";
        } else {
            return "提交失败";
        }
    }

    //修改老师密码
    @RequestMapping("/updatePwd")
    @ResponseBody
    public String updatePwd(HttpServletRequest request,String newPwd){
        HttpSession session = request.getSession();
        String tname = (String)session.getAttribute("tname");
        boolean isUpdate = teacherService.updatePwd(newPwd,tname);
        return "isUpdate";
    }

    //提交评价
    @RequestMapping("/addEvaluate")
    @ResponseBody
    public String addEvaluate(HttpServletRequest request,Integer finalScore,String comment,Integer sid){
        HttpSession session = request.getSession();
        String tname = (String)session.getAttribute("tname");
        int state = (int) session.getAttribute("state");
        int deptno = (int) session.getAttribute("deptno");
        SchoolEvaluate schoolEvaluate = new SchoolEvaluate(sid,tname,finalScore,comment);
        boolean isAdd = schoolEvaluateService.addSchEva(schoolEvaluate);
        if(isAdd){
            boolean isUpdate = studentService.editStuSta(sid,state+1,deptno+1);
        }
        return "isUpdate";
    }
}
