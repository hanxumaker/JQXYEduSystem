package com.jxd.dao;

import com.jxd.model.Analytes;
import com.jxd.model.Dept;
import com.jxd.model.Manager;

import java.util.List;

public interface IManagerDao {
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

}
