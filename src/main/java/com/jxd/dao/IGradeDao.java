package com.jxd.dao;

import com.jxd.model.Grade;

import java.util.List;

public interface IGradeDao {
    /**
     * @Description 将老师给学生打的分数提交到成绩表中
     * @param list:学生成绩对象
     * @Return 是否提交成功
     * @Date 2020/9/15 15:28
     */
    boolean addStudentScore(List<Grade> list);
}
