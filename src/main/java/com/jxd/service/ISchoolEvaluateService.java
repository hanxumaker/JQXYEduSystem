package com.jxd.service;


import java.util.List;
import java.util.Map;

public interface ISchoolEvaluateService {
    /**
    * @Description 根据学生的编号查询该学生的成绩
    * @param sid
    * @Return
    * @Date 2020/9/14 14:01
    */
    List<Map<String,String>> getStudentScoreBySid(Integer sid);
}
