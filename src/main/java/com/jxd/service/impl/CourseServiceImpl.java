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
}
