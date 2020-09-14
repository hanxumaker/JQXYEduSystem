package com.jxd.controller;

import com.jxd.dao.IDeptDao;
import com.jxd.model.Dept;
import com.jxd.model.Manager;
import com.jxd.model.Student;
import com.jxd.model.User;
import com.jxd.service.IManagerService;
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
    IDeptDao deptDao;

    @RequestMapping("/toGetStudentByDeptno")
    /*@ModelAttribute("User") User user 在控制器中获取另一个控制器存入session的值*/
    public String toGetStudentByDeptno(@ModelAttribute("User") User user, Model model) {
        Manager manager = managerService.getManagerByMname(user.getUname());
        model.addAttribute("deptno", manager.getDeptno());
        return "studentInDept";
    }

    @RequestMapping("/getDetailDeptByDeptno")
    @ResponseBody
    public JSON getDetailDeptByDeptno(Integer deptno) {
        Dept dept = deptDao.getDetailDeptByDeptno(deptno);
        List<Student> list = dept.getList();
        JSONArray jsonArray = JSONArray.fromObject(list);
        //创建json对象用于返回layui表格需要的数据
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code", 0);
        jsonObject.put("msg", "");
        jsonObject.put("count", list.size()); //一共有多少条数据
        jsonObject.put("data", jsonArray);
        return jsonObject;
    }
}
