package com.jxd.service;

import com.jxd.model.Manager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

import com.jxd.model.Analytes;
import com.jxd.model.Dept;
import com.jxd.model.Manager;

import java.util.List;

public interface IManagerService {

    /**
     * 获取老师列表
     * @param tname 模糊查询
     * @param page
     * @param limit
     * @return 返回一个列表
     */
    List<Manager> getAllTeachers(@Param("tname") String tname, @Param("pageIndex") Integer page, @Param("pageSize") Integer limit);

    /**
     * 获取老师列表的长度
     * @param tname 模糊查询
     * @return 返回一个列表
     */
    List<Manager> getAllTeachers1(@Param("tname") String tname);

    /**
     * 添加一个老师
     * @param manager
     * @return 返回是否添加成功
     */
    boolean addTeacher(Manager manager);

    /**
     * 删除一个经理
     * @param manager
     * @return 返回是否添加成功
     */
    boolean delTeacher(Manager manager);

    /**
     * 编辑一个经理的信息
     * @param manager
     * @return 是否编辑成功
     */
    boolean editTea(Manager manager);
    /**
     * 根据已登录的经理的名字查该经理
     *
     * @param uname 登录的经理的名字
     * @return 返回该经理
     */
    Manager getManagerByMname(String uname);

    /**
     * 查询出所有正在使用(状态为1)的评分项
     * @return 返回查到的评分项
     */
    List<Analytes> getAnalytes(Integer state);

    /**
     * 根据部门编号查找对应的部门名称
      * @param deptno 要查找的部门编号
     * @return 查找到的部门
     */
    Dept getDnameByDeptno(Integer deptno);

}
