package com.jxd.service;


import com.jxd.model.SchoolEvaluate;

import java.util.List;
import java.util.Map;

public interface ISchoolEvaluateService {
    /**
    * @Description 根据学生的编号查询该学生的成绩
    * @param sid:学生的编号
    * @Return
    * @Date 2020/9/14 14:01
    */
    List<Map<String,String>> getStudentScoreBySid(Integer sid);

    /**
    * @Description 根据学生的编号查询该学生的评价
    * @param sid:学生的编号
    * @Return
    * @Date 2020/9/15 16:41
    */
    SchoolEvaluate selectStuEvaBySid(Integer sid);
}
