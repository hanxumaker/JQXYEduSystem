package com.jxd.dao;

import com.jxd.model.SchoolEvaluate;

import java.util.List;
import java.util.Map;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/12 16:09
 */
public interface ISchoolEvaluateDao {
    /**
     * @Description 根据学生的编号查询该学生的成绩
     * @param sid
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
