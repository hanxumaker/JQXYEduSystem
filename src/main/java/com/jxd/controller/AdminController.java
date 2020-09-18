package com.jxd.controller;

import com.jxd.model.*;
import com.jxd.service.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.Class;
import java.util.*;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/11 7:55
 */
@Controller
@SessionAttributes({"tname", "mname", "class123", "sid"})
public class AdminController {

    @Autowired
    IStudentService studentService;

    @Autowired
    ITeacherService teacherService;

    @Autowired
    IUserService userService;

    @Autowired
    IManagerService managerService;

    @Autowired
    IAnalytesService analytesService;

    @Autowired
    ICourseService courseService;

    @Autowired
    IClassService classService;

    @Autowired
    ICtocService ctocService;

    @RequestMapping("/userList")
    public String toUserList() {
        return "userList";
    }

    @RequestMapping("/analytesList")
    public String toAnalytesList() {
        return "analytesList";
    }


    @RequestMapping("/admin")
    public String toAdmin() {
        return "admin";
    }

    @RequestMapping("/studentList")
    public String toStudentList(Model model) {
        List<Class> list = classService.getAllClass();
        model.addAttribute("class123", list);
        return "studentList";
    }

    @RequestMapping("/classList")
    public String toClassList() {
        return "classList";
    }

    @RequestMapping("/teacherList")
    public String toTeacherList() {
        return "teacherList";
    }

    @RequestMapping("/managerList")
    public String toManagerList() {
        return "managerList";
    }

    @RequestMapping("/courseList")
    public String toCourseList() {
        return "courseList";
    }

    @RequestMapping("/editTeacher1")
    public String editTeacher(Integer tid, String tname, Model model) {
        model.addAttribute("tid", tid);
        model.addAttribute("tname", tname);
        return "editTeacher";
    }

    @RequestMapping("/editManager1")
    public String editManager(Integer id, String mname, Model model) {
        model.addAttribute("id", id);
        model.addAttribute("mname", mname);
        return "editManager";
    }

    @RequestMapping("/editStudent")
    public String editStudent() {
        return "editStudent";
    }

    @RequestMapping("/addTeacher")
    public String toAddTeacher() {
        return "addTeacher";
    }

    /**
     * 根据学生信息找到学生然后去编辑
     *
     * @param sid
     * @param model
     * @return
     */
    @RequestMapping("/getStudentToEdit")
    @ResponseBody
    public Student getStudentToEdit(Integer sid, Model model) {
        model.addAttribute("sid", sid);
        Student student = studentService.getStudentBySid(sid);
        return student;
    }

    @RequestMapping("/addManager")
    public String toAddManager() {
        return "addManager";
    }

    @RequestMapping("/changeTeacher")
    public String toChangeTeacher(Model model){
        List<Teacher> list = teacherService.getFreeTeacher();
        model.addAttribute("teacher", list);
        return "changeTeacher";
    }

    @RequestMapping(value = "/ClassToCourse")
    public String ClassToCourse(){

        return "ClassToCourse";
    }

    @RequestMapping(value = "/changeTea" , produces = "text/html;charset=utf-8")
    @ResponseBody
    public String changeTea(Teacher teacher){
        //先把之前带班的老师状态置为空闲
        boolean isChange = teacherService.changeTea(teacher);
        //再把这个老师加入到班级
        boolean isAdd = teacherService.teacherToCla(teacher);
        if (isChange&&isAdd){
            return "修改成功";
        }else {
            return "修改失败";
        }
    }


    @RequestMapping("/addStudent")
    public String toAddStudent() {
        return "addStudent";
    }

    @RequestMapping("/addAnalytes")
    public String toAddAna() {
        return "addAnalytes";
    }

    @RequestMapping("/addCourse")
    public String toAddCourse() {
        return "addCourse";
    }

    /**
     * 查询出所有的空闲老师
     *
     * @return
     */
    @RequestMapping("/addClass")
    public String toAddClass(Model model) {
        List<Teacher> list = teacherService.getFreeTeacher();
        model.addAttribute("teacher", list);
        return "addClass";
    }

    /**
     * 增加班级，给老师插入班级cid
     * @param className
     * @param tid
     * @return
     */
    @RequestMapping(value = "/addCla", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String addCla(String className, Integer tid) {
        boolean addCla = classService.addCla(className);
        Integer cid = classService.getMaxCid();
        Teacher teacher = new Teacher();
        teacher.setState(0);
        teacher.setTid(tid);
        teacher.setCid(cid);
        boolean addTea = teacherService.teacherToCla(teacher);

        //新增的班级增加必修课
        List<Integer> list = courseService.getCourseId();
        List<Ctoc> ctocList = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            Ctoc ctoc = new Ctoc();
            ctoc.setCid(cid);
            ctoc.setCourseId(list.get(i));
            ctoc.setState(1);
            ctocList.add(ctoc);
        }
        boolean addCourse = ctocService.addCourseToClass(ctocList);


        if (addCla && addTea && addCourse) {
            return "新增班级成功";
        } else {
            return "新增班级失败";
        }
    }


    /**
     * 输出到用户列表
     *
     * @param uname
     * @param page
     * @param limit
     * @return 返回一个json数组
     */
    @RequestMapping(value = "/getAllUsers", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllUsers(String uname, Integer page, Integer limit) {
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
     * 忘记密码时，管理员进行密码重置
     *
     * @param id
     * @return 是否重置成功
     */
    @RequestMapping(value = "/resetUser", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String resetUser(Integer id) {
        boolean ret = userService.resetPwd(id);
        if (ret) {
            return "重置成功";
        } else {
            return "重置失败";
        }
    }

    /**
     * @Description 查询出所有的评分项
     * @Return
     * @Author hanxu
     * @Date 2020/9/14 19:50
     */
    @RequestMapping(value = "/getAllAnalytesList", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllAnalytesList() {
        List<Analytes> list = analytesService.getAllAnalytes();

        //将list转换为json数组
        net.sf.json.JSONArray jsonArray = JSONArray.fromObject(list);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());
        jsonObject.put("data", jsonArray);
        return jsonObject.toString();
    }

    /**
     * @Description 查询出所有的课程
     * @Return
     * @Author hanxu
     * @Date 2020/9/14 19:50
     */
    @RequestMapping(value = "/getAllCourse", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllCourse() {
        List<Course> list = courseService.getAllCourse();
        //将list转换为json数组
        net.sf.json.JSONArray jsonArray = JSONArray.fromObject(list);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());
        jsonObject.put("data", jsonArray);
        return jsonObject.toString();
    }

    /**
     * 输出到老师列表
     *
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


        //将list转换为 json数组
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
     *
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
     * 得到全部的学生
     *
     * @param sname
     * @param cid
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value = "/getAllStudents", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllStudents(String sname, Integer cid, Integer page, Integer limit) {
        List<Student> list = null;
        int count = 0;
        list = studentService.getAllStudents(sname, cid, page, limit);
        //count代表json的长度
        count = studentService.getAllStudents1(sname, cid).size();

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
     * 上传图片
     *
     * @param file
     * @param request
     * @return
     */
    @RequestMapping("/uploadImg")
    @ResponseBody
    public Object uploadImg(MultipartFile file, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        String uuid = UUID.randomUUID() + "";
        //图片上传
        OutputStream out = null;
        InputStream fileInput = null;
        try {
            if (!StringUtils.isEmpty(String.valueOf(file))) {
                String originalName = file.getOriginalFilename();
                //文件类型后缀：jpg、png..
                String suffix = originalName.substring(originalName.lastIndexOf(".") + 1);
                //上传位置
                String filepath = "E:\\idea\\workspace\\框架\\JQXYEduSystem\\src\\main\\webapp\\static\\imgs\\" + uuid + "." + suffix;
                String src = "../../static/imgs/" + uuid + "." + suffix;
                File files = new File(filepath);

                file.transferTo(files);
                //返回值是json类型，其中data是照片存储路径
                result.put("src", src);
                return result;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (fileInput != null) {
                    fileInput.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        result.put("code", 0);
        result.put("msg", "");
        return result;

    }

    /**
     * 增加学生的信息
     *
     * @param student
     * @return
     */
    @RequestMapping(value = "/addStu", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String addStu(Student student) {
        boolean isAdd = studentService.addStu(student);
        if (isAdd) {
            return "新增学员成功";
        } else {
            return "新增学员失败";
        }
    }

    /**
     * 更改学生的信息
     *
     * @param student
     * @return
     */
    @RequestMapping(value = "/updateStu", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String update(Student student) {
        boolean isUpdate = studentService.updateStu(student);
        if (isUpdate) {
            return "学员信息编辑成功";
        } else {
            return "学员信息编辑失败";
        }
    }

    /**
     * 删除一个学生，如果工作则不能删除
     *
     * @param sid
     * @return
     */
    @RequestMapping(value = "/deleteStudent", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String deleteStudent(Integer sid) {
        boolean isDel = studentService.delStu(sid);
        if (isDel) {
            return "删除成功";
        } else {
            return "删除失败";
        }
    }


    /**
     * 增加一个老师，将其在用户表添加
     *
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
        if (addUser && addTeacher) {
            return "添加成功";
        } else {
            return "添加失败";
        }
    }

    /**
     * 增加一个经理，将其在用户表添加
     *
     * @param name
     * @param password
     * @return 返回是否添加成功
     */
    @RequestMapping(value = "/addMan", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String addMan(String name, String password, Integer deptno) {
        User user = new User();
        user.setPassword(password);
        user.setUname(name);
        user.setRole(3);
        boolean addUser = userService.addUser(user);
        Manager manager = new Manager();
        manager.setMname(name);
        manager.setDeptno(deptno);
        boolean addMan = managerService.addTeacher(manager);
        //只有两个表同时添加上才能添加成功
        if (addUser && addMan) {
            return "添加成功";
        } else {
            return "添加失败";
        }
    }

    /**
     * 增加一个评分项，将其状态定义为可用
     *
     * @param aname
     * @return
     */
    @RequestMapping(value = "/addAna", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String addAna(String aname) {
        Analytes analytes = new Analytes();
        analytes.setAname(aname);
        analytes.setState(1);
        boolean isAdd = analytesService.addAna(analytes);
        if (isAdd) {
            return "增加成功";
        } else {
            return "增加失败";
        }
    }

    /**
     * 增加一个课程
     *
     * @param
     * @return
     */
    @RequestMapping(value = "/addCou", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String addCou(Course course) {
        boolean isAdd = courseService.addCou(course);
        if (isAdd) {
            return "增加成功";
        } else {
            return "增加失败";
        }
    }


    /**
     * 删除一个老师
     *
     * @param teacher
     * @return
     */
    @RequestMapping(value = "/deleteTeacher", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String deleteTeacher(Teacher teacher) {
        User user = new User();
        user.setUname(teacher.getTname());
        boolean delUser = userService.delUser(user);
        boolean delTeacher = teacherService.delTeacher(teacher);
        if (delUser && delTeacher) {
            return "删除成功";
        } else {
            return "删除失败";
        }
    }

    /**
     * 删除一个经理
     *
     * @param manager
     * @return
     */
    @RequestMapping(value = "/deleteManager", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String deleteManager(Manager manager) {
        User user = new User();
        user.setUname(manager.getMname());
        boolean delUser = userService.delUser(user);
        boolean delManager = managerService.delTeacher(manager);
        if (delUser && delManager) {
            return "删除成功";
        } else {
            return "删除失败";
        }
    }

    /**
     * 更新老师
     *
     * @param teacher
     * @param request
     * @return
     */
    @RequestMapping(value = "/editTea", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String editTea(Teacher teacher, HttpServletRequest request) {
        boolean isEdit = teacherService.editTea(teacher);
        HttpSession session = request.getSession();
        String oldName = (String) session.getAttribute("tname");
        String newName = teacher.getTname();
        boolean isUser = userService.editUser(oldName, newName);
        if (isEdit && isUser) {
            return "修改成功";
        } else {
            return "修改失败";
        }
    }

    /**
     * 更新经理
     *
     * @param manager
     * @param request
     * @return
     */
    @RequestMapping(value = "/editMan", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String editMan(Manager manager, HttpServletRequest request) {
        String name = manager.getMname();
        Integer id = manager.getId();
        boolean isEdit = managerService.editTea(manager);
        HttpSession session = request.getSession();
        String oldName = (String) session.getAttribute("mname");
        String newName = manager.getMname();
        boolean isUser = userService.editUser(oldName, newName);
        if (isEdit && isUser) {
            return "修改成功";
        } else {
            return "修改失败";
        }
    }

    /**
     * 删除一个评分项
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/deleteAna", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String deleteAna(Integer id) {
        boolean isDel = analytesService.deleteAna(id);
        if (isDel) {
            return "删除成功";
        } else {
            return "删除失败";
        }
    }

    /**
     * 删除一门课程
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/deleteCou", produces = "text/html;charset=utf-8")
    @ResponseBody
    private String deleteCou(Integer id) {
        boolean isDel = courseService.deleteCou(id);
        if (isDel) {
            return "删除成功";
        } else {
            return "该课程已经上过，无法删除";
        }
    }

    /**
     * 更改评分项的状态
     *
     * @param id
     * @param state
     * @return
     */
    @RequestMapping(value = "/updateAna", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String updateAna(Integer id, Integer state) {
        boolean isUpdate = false;
        if (state == 0) {
            isUpdate = analytesService.updateAna(id);
        } else {
            isUpdate = analytesService.updateAna1(id);
        }
        if (isUpdate) {
            return "状态修改成功";
        } else {
            return "状态修改失败";
        }
    }

    /**
     * 更改课程的状态
     *
     * @param id
     * @param state
     * @return
     */
    @RequestMapping(value = "/updateCou", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String updateCou(Integer id, Integer state) {
        boolean isUpdate = false;
        if (state == 0) {
            isUpdate = courseService.updateCou(id);
        } else {
            isUpdate = courseService.updateCou1(id);
        }
        if (isUpdate) {
            return "状态修改成功";
        } else {
            return "状态修改失败";
        }
    }

    /**
     * 联合查询 班级老师
     *
     * @return
     */
    @RequestMapping(value = "/getAllClasses", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getAllClasses() {
        List<Map<String, String>> list = classService.getAllClasses();
        //将list转换为json数组
        net.sf.json.JSONArray jsonArray = JSONArray.fromObject(list);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size());
        jsonObject.put("data", jsonArray);
        return jsonObject.toString();
    }

}
