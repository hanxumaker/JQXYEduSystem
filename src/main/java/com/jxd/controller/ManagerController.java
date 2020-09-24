package com.jxd.controller;

import com.jxd.model.*;
import com.jxd.service.IManagerService;
import com.jxd.service.IStudentService;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
 * @Date 2020/9/11 8:04
 */
@Controller
public class ManagerController {
    @Autowired
    IManagerService managerService;
    @Autowired
    IStudentService studentService;

    /**
     * 根据部门编号查找员工,把查找到的员工返回前台
     *
     * @param request 声明一个request,用于存数据
     * @param model
     * @return 员工列表页面
     */
    @RequestMapping("/toGetStudentByDeptno")
    public String toGetStudentByDeptno(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("User");//从session中获取user1
        Manager manager = managerService.getManagerByMname(user.getUname());
        model.addAttribute("deptno", manager.getDeptno());//将部门id存入model中
        return "studentInDept";
    }

    /**
     * 对员工列表进行模糊分页查询
     *
     * @param limit  一页显示几条数据
     * @param page   页数
     * @param sname  员工姓名
     * @param deptno 部门编号
     * @return 将查到的列表转成json数组，返回到前台
     */
    @RequestMapping("/getStudentsByDeptno")
    @ResponseBody
    public JSON getStudentsByDeptno(Integer limit, Integer page, String sname, Integer deptno) {
        Integer pageSize = limit; //获取一页显示几条数据
        Integer count = page * (page - 1);//跳过几条数据
        List<Student> list = studentService.getStudentsByDeptno(deptno, sname);
        List<Student> StudentList = studentService.getStudents(count, pageSize, sname, deptno);
        JSONArray jsonArray = JSONArray.fromObject(StudentList);
        //创建json对象用于返回layui表格需要的数据
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size()); //一共有多少条数据
        jsonObject.put("data", jsonArray);
        return jsonObject;
    }

    /**
     * 查看员工的工作评价
     *
     * @param request 声明一个request,用于存数据
     * @param sid     要查找的员工编号
     * @param model
     * @return 返回查看评价页面
     */
    @RequestMapping("/toCheckEvaluation")
    public String toEvaluationPage(HttpServletRequest request, Integer sid, Model model) {
        //取出session中的User
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("User");
        //将查找到的员工存入model
        Student student = studentService.getStudentBySid(sid);
        model.addAttribute("student", student);
        //将查到的部门名称存入model
        Manager manager = managerService.getManagerByMname(user.getUname());
        Dept dept = managerService.getDnameByDeptno(manager.getDeptno());
        model.addAttribute("dname", dept.getDname());
        //将查到的该员工的工作评价信息存入model
        List<WorkEvaluate> WorkEvaluateList = managerService.getWorkEvaluateBySid(sid);
        model.addAttribute("wList", WorkEvaluateList);
        //将查到的该员工的学校评价信息存入model
        List<Map<String, Object>> list = managerService.getStudentSchoolEvaluate(sid);
        model.addAttribute("sList", list);
        return "checkEvaluationPage";
    }

    /**
     * 返回到修改密码页面
     *
     * @return 修改密码页面
     */
    @RequestMapping("/toUpdateManagerPwd")
    public String toUpdatePwd() {
        return "updateManagerPwd";
    }

    /**
     * 修改密码
     *
     * @param uname    当前用户的用户名
     * @param password 新密码
     * @return 是否修改成功
     */
    @RequestMapping("/updateManagerPwd")
    @ResponseBody
    public String updateManagerPwd(String uname, String password) {
        boolean isUpdate = managerService.updateManagerPwd(uname, password);
        return "isUpdate";
    }

    /**
     * 点击退出,返回登录页面
     *
     * @param session 声明一个session,用于取数据
     * @return 返回到登录页面
     */
    @RequestMapping("/quit")
    public String quit(HttpSession session) {
        session.removeAttribute("User");//把存入session的User清除
        session.invalidate();//session中的内容较多时，采用此方法，将session设置为失效
        return "login";
    }

    /**
     * 返回进行评价的页面
     * @param request 声明一个request用于取出数据
     * @param model 声明一个session用于存数据
     * @param sid 员工编号
     * @return 返回工作评价页面
     */
    @RequestMapping("toDoWorkEvaluation")
    public String toDoWorkEvaluation(HttpServletRequest request, Model model, Integer sid) {
        //取出session中的User
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("User");
        //将查找到的员工存入model
        Student student = studentService.getStudentBySid(sid);
        model.addAttribute("student", student);
        //将查到的部门名称存入model
        Manager manager = managerService.getManagerByMname(user.getUname());
        Dept dept = managerService.getDnameByDeptno(manager.getDeptno());
        model.addAttribute("dname", dept.getDname());
        //将查到的正在使用的评价项存入model
        List<Analytes> AnalytesList = managerService.getAnalytesByState(1);
        model.addAttribute("aList", AnalytesList);
        return "doWorkEvaluation";
    }

    /**
     * 添加工作评价
     * @param state 员工当前状态
     * @param sid 员工编号
     * @param dateId 评价时间id
     * @param totalScore 整体评价分数
     * @param evaluatePerson 评价人
     * @param evaluateContent 综合评价
     * @param evaluateScores 存放评价项id和评价分数的数组
     * @return 是否评价成功
     */
    @RequestMapping(value = "/addWorkEvaluate", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String addWorkEvaluate(Integer state, Integer sid, Integer dateId, Integer totalScore,
                                  String evaluatePerson, String evaluateContent, String evaluateScores) {
        JSONArray jsonArray = JSONArray.fromObject(evaluateScores);
        List<WorkEvaluate> list = new ArrayList<>();
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            Integer aid = jsonObject.getInt("aid");
            Integer evaluateScore = jsonObject.getInt("evaluateScore");
            WorkEvaluate workEvaluate = new WorkEvaluate(dateId, sid, aid, evaluatePerson, evaluateScore, totalScore, evaluateContent);
            list.add(workEvaluate);
        }
        boolean isAdd = managerService.addWorkEvaluate(list);
        boolean isUpdate;
        if (isAdd) {
            /*判断员工的状态并修改*/
            if (state == 9) {
                isUpdate = managerService.editStudentState(sid, state);
            } else {
                isUpdate = managerService.editStudentState(sid, (state + 1));
            }
            if (isUpdate) {
                return "评价成功";
            } else {
                return "评价失败";
            }
        } else {
            return "评价失败";
        }

    }
}