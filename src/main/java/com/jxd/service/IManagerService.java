package com.jxd.service;

import com.jxd.model.Manager;
import org.apache.ibatis.annotations.Param;

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
}
