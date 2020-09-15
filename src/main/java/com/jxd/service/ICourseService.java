package com.jxd.service;

import com.jxd.model.Course;

import java.util.List;
import java.util.Map;

public interface ICourseService {
    /**
    * @Description 根据班级编号查询每班所上的课程
    * @Return
    * @Date 2020/9/13 13:30
    */
    List<Course> getAllCourseByCid(Integer cid);

}

