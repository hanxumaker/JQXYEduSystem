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
}
