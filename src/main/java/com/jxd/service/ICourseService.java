package com.jxd.service;

import java.util.List;
import java.util.Map;

public interface ICourseService {
    /**
    * @Description 根据班级编号查询每班所上的课程及其状态
    * @Return
    * @Date 2020/9/13 13:30
    */
    List<Map<String,String>> getAllCourseByCid(Integer cid);
}

