package com.jxd.dao;

import com.jxd.model.Manager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

import com.jxd.model.Analytes;
import com.jxd.model.Dept;
import com.jxd.model.Manager;
import com.jxd.model.WorkEvaluate;

import java.util.List;
import java.util.Map;

public interface IManagerDao {
    /**
     * 获取老师列表
     *
     * @param tname 模糊查询
     * @param page
     * @param limit
     * @return 返回一个列表
     */
    List<Manager> getAllTeachers(@Param("tname") String tname, @Param("pageIndex") Integer page, @Param("pageSize") Integer limit);

    /**
     * 获取老师列表的长度
     *
     * @param tname 模糊查询
     * @return 返回一个列表
     */
    List<Manager> getAllTeachers1(@Param("tname") String tname);

    /**
     * 添加一个老师
     *
     * @param manager
     * @return 返回是否添加成功
     */
    boolean addTeacher(Manager manager);

    /**
     * 删除一个老师
     *
     * @param manager
     * @return 返回是否添加成功
     */
    boolean delTeacher(Manager manager);

    /**
     * 编辑一个老师的信息
     *
     * @param manager
     * @return 是否编辑成功
     */
    boolean editTea(Manager manager);

    /**
     * 根据已登录的经理的名字查该经理
     * 根据已登录的经理的名字查该经理,为了获取经理所在的部门
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
     * 根据员工id查找该员工的工作评价信息
     *
     * @param sid 要查找的员工id
     * @return 查找到的工作评价信息
     */
    List<WorkEvaluate> getWorkEvaluateBySid(Integer sid);

    /**
     * 根据员工id查出该员工的学校评价信息
     *
     * @param sid 要查找的员工id
     * @return 该员工的学校评价信息
     */
    List<Map<String, Object>> getStudentSchoolEvaluate(Integer sid);

    /**
     * 添加一个员工的工作评价信息
     *
     * @param list 要添加的员工评价信息
     * @return 是否添加成功
     */
    boolean addWorkEvaluate(List<WorkEvaluate> list);

    /**
     * 根据员工id修改员工的状态
     *
     * @param sid   员工id
     * @param state 要修改成的状态
     * @return 是否修改成功
     */
    boolean editStudentState(@Param("sid") Integer sid, @Param("state") Integer state);

    /**
     * 根据经理名字修改经理密码
      * @param uname 经理的登录的用户名
     * @param password 新密码
     * @return 是否修改成功
     */
    boolean updateManagerPwd(@Param("uname") String uname,@Param("password") String password);
}
