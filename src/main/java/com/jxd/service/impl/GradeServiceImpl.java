package com.jxd.service.impl;

import com.jxd.dao.IGradeDao;
import com.jxd.model.Grade;
import com.jxd.service.IGradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/12 16:42
 */
@Service
public class GradeServiceImpl implements IGradeService {
    @Autowired
    IGradeDao gradeDao;

    @Override
    public boolean addStudentScore(List<Grade> list) {
        return gradeDao.addStudentScore(list);
    }
}
