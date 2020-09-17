package com.jxd.service.impl;

import com.jxd.dao.ICourseDao;
import com.jxd.model.Course;
import com.jxd.service.ICourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/12 16:40
 */
@Service
public class CourseServiceImpl implements ICourseService {
    @Autowired
    ICourseDao courseDao;

    @Override
    public List<Map<String, String>> getAllCourseByCid(Integer cid) {
        return courseDao.getAllCourseByCid(cid);
    }

    @Override
    public List<Course> getAllCourse() {
        return courseDao.getAllCourse();
    }

    @Override
    public boolean addCou(Course course) {
        return courseDao.addCou(course);
    }

    @Override
    public boolean deleteCou(Integer id) {
        return courseDao.deleteCou(id);
    }

    @Override
    public boolean updateCou(Integer id) {
        return courseDao.updateCou(id);
    }

    @Override
    public boolean updateCou1(Integer id) {
        return courseDao.updateCou1(id);
    }
}
