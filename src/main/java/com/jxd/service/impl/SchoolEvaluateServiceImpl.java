package com.jxd.service.impl;

import com.jxd.dao.ISchoolEvaluateDao;
import com.jxd.model.SchoolEvaluate;
import com.jxd.service.ISchoolEvaluateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/12 16:45
 */
@Service
public class SchoolEvaluateServiceImpl implements ISchoolEvaluateService {
    @Autowired
    ISchoolEvaluateDao schoolEvaluateDao;
    @Override
    public List<Map<String, String>> getStudentScoreBySid(Integer sid) {
        return schoolEvaluateDao.getStudentScoreBySid(sid);
    }

    @Override
    public SchoolEvaluate selectStuEvaBySid(Integer sid) {
        return schoolEvaluateDao.selectStuEvaBySid(sid);
    }
}
