package com.jxd.service;

import com.jxd.model.Analytes;
import com.jxd.model.Dept;
import com.jxd.model.Manager;
import com.jxd.model.WorkEvaluate;

import java.util.List;
import java.util.Map;

public interface IManagerService {
    /**
     * 根据已登录的经理的名字查该经理
     *
     * @param uname 登录的经理的名字
     * @return 返回该经理
     */
    Manager getManagerByMname(String uname);

    /**
     * 查询出所有正在使用(状态为1)的评分项
     *
     * @return 返回查到的评分项
     */
    List<Analytes> getAnalytes(Integer state);

    /**
     * 根据部门编号查找对应的部门名称
     *
     * @param deptno 要查找的部门编号
     * @return 查找到的部门
     */
    Dept getDnameByDeptno(Integer deptno);

    /**
     * 根据学生id查找学生的工作评价信息
     *
     * @param sid 要查找的学生id
     * @return 查找到的工作评价信息
     */
    List<WorkEvaluate> getWorkEvaluateBySid(Integer sid);

    /**
     * 根据职工id查出该职工的学校评价信息
     * @param sid 要查找的职工id
     * @return 该职工的学校评价信息
     */
    List<Map<String,Object>> getStudentSchoolEvaluate(Integer sid);

    /**
     * 添加一个职工的工作评价信息
      * @param list 几条评价信息
     * @return 是否添加成功
     */
    boolean addWorkEvaluate(List<WorkEvaluate> list);
}
