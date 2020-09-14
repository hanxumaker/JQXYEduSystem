package com.jxd.service.impl;

import com.jxd.dao.ICourseDao;
import com.jxd.model.Course;
import com.jxd.service.ICourseService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/12 16:40
 */
public class CourseServiceImpl implements ICourseService {
    @Autowired
    ICourseDao courseDao;
    @Override
    public List<Course> getAllCourseByCid(Integer cid) {
        return courseDao.getAllCourseByCid(cid);
    }
}
