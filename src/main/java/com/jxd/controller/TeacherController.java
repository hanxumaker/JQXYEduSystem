package com.jxd.controller;

import com.jxd.model.Grade;
import com.jxd.model.SchoolEvaluate;
import com.jxd.model.Student;
import com.jxd.model.User;
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
@SessionAttributes({"tname","cid","sid","state","deptno","state1"})//state1:学生成绩的状态
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

    /**
    * @Description 学生成绩页面
    * @Return
    * @Date 2020/9/23 14:48
    */
    @RequestMapping("/studentScore")
    public String studentScore(HttpServletRequest request,Model model) {
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("User");
        String tname = user.getUname();
        model.addAttribute("tname", tname);
        return "studentScore";
    }

    /**
    * @Description 得到班级下的学生
    * @Return String
    * @Date 2020/9/23 14:50
    */
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
        List<Student> studentList = studentService.getSomeStudents(count, pageSize, sname, cid);
        //将list转换为数组
        JSONArray jsonArray = JSONArray.fromObject(studentList);

        //创建json对象，用于返回layui表格需要的数据
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());//一个有多少条数据
        jsonObject.put("data", jsonArray);
        return jsonObject.toString();
    }

    /**
    * @Description 查看学生的详细信息
    * @Return
    * @Date 2020/9/23 14:52
    */
    @RequestMapping("/studentInByCid")
    public String getStudentBySid(Model model,Integer sids){
       Student student = studentService.getStudentBySid(sids);
       model.addAttribute("student",student);
       return "studentInByCid";
    }

    /**
    * @Description 老师进行评分页面
    * @param state:学生的状态
     * @param sid：学号
     * @param deptno：部门编号
    * @Return teacherScore：页面
    * @Date 2020/9/23 14:52
    */
    @RequestMapping("/teacherScore")
    public String teacherScore(Integer state,Model model,Integer sid,Integer deptno) {
        model.addAttribute("state1",state);
        model.addAttribute("deptno",deptno);
        model.addAttribute("sid",sid);
        return "teacherScore";
    }

    /**
    * @Description 查看老师给学生的打分
    * @Date 2020/9/23 14:56
    */
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

    /**
    * @Description 修改密码
    * @Date 2020/9/23 14:57
    */
    @RequestMapping("/updatePassword")
    public String updatePassword() {
        return "updatePassword";
    }

    /**
    * @Description 返回到学生成绩页面
    * @param sid:学号
    * @Date 2020/9/23 14:57
    */
    @RequestMapping("/selectStudentScore")
    public String selectStudentScore(Integer sid, Model model) {
        model.addAttribute("sid", sid);
        return "selectStudentScore";
    }

    /**
    * @Description 返回学生评价页面
    * @Date 2020/9/23 14:58
    */
    @RequestMapping("/studentEvaluate")
    public String studentEvaluate() {
        return "studentEvaluate";
    }

    /**
    * @Description 老师评价页面
    * @param state:学生的状态
     *@param  sid：学号
     *@param deptno：部门编号
    * @Date 2020/9/23 14:58
    */
    @RequestMapping("/teacherEvaluate")
    public String teacherEvaluate(Integer state,Model model,Integer sid,Integer deptno) {
        model.addAttribute("state",state);
        model.addAttribute("sid",sid);
        model.addAttribute("deptno",deptno);
        return "teacherEvaluate";
    }

    /**
    * @Description 查看学生的成绩
    * @Date 2020/9/23 15:00
    */
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

    /**
    * @Description 返回到学生评价页面
    * @param sid1:学号
    * @Date 2020/9/23 15:00
    */
    @RequestMapping("/selectStudentEvaluate")
    public String selectStudentEvaluate(Integer sid1, Model model) {
        SchoolEvaluate schoolEvaluate = schoolEvaluateService.selectStuEvaBySid(sid1);
        model.addAttribute("schoolEvaluate", schoolEvaluate);
        return "selectStudentEvaluate";
    }

    /**
    * @Description 接收前台传来的已经打分的数据，将其批量插入到成绩表中
    * @param stuScore:评分
     *@param sid：学号
    * @Return isAdd：是否插入成功
    * @Date 2020/9/23 15:01
    */
    @RequestMapping("/gradeList")
    @ResponseBody
    public String addStuScore(HttpServletRequest request,String stuScore,Integer sid) {
        List<Grade> list = new ArrayList<>();
        HttpSession session = request.getSession();
        int state = (int) session.getAttribute("state1");
        int deptno = (int) session.getAttribute("deptno");
        JSONArray jsonArray = JSONArray.fromObject(stuScore);
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            //获取到老师的评分
            Grade grade = new Grade(sid, Integer.parseInt(jsonObject.getString("courseid")), Double.parseDouble(jsonObject.getString("score")));
            list.add(grade);
        }
        boolean isAdd = gradeService.addStudentScore(list);
        if(isAdd){
            boolean isUpdate = studentService.editStuSta(sid,state-1,deptno);
        }
        return "isUpdate";
    }

    /**
    * @Description 修改老师密码
    * @param newPwd:修改后的密码
    * @Date 2020/9/23 15:03
    */
    @RequestMapping("/updatePwd")
    @ResponseBody
    public String updatePwd(HttpServletRequest request,String newPwd){
        HttpSession session = request.getSession();
        String tname = (String)session.getAttribute("tname");
        boolean isUpdate = teacherService.updatePwd(newPwd,tname);
        return String.valueOf(isUpdate);
    }

    /**
    * @Description 提交评价
    * @param finalScore:整体分数
      @param comment：评语
      @param sid：学号
    * @Return isUpdate：是否提交成功
    * @Date 2020/9/23 15:05
    */
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
            boolean isUpdate = studentService.editStuSta(sid,state+2,deptno+1);
        }
        return "isUpdate";
    }

    /**
    * @Description 当全班都毕业时修改老师的状态
    * @Date 2020/9/23 15:08
    */
    @RequestMapping("/updateTeaStateByStu")
    @ResponseBody
    public String updateTeaStateByStu(HttpServletRequest request){
        HttpSession session = request.getSession();
        String tname = (String)session.getAttribute("tname");
        boolean isUpdate = teacherService.updateTeaStateByStu(tname,1);
        return "isUpdate";
    }
}
