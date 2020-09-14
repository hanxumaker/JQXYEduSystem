package com.jxd.dao;

import com.jxd.model.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ITeacherDao {

    /**
     * 获取老师列表
     * @param tname 模糊查询
     * @param page
     * @param limit
     * @return 返回一个列表
     */
    List<Teacher> getAllTeachers(@Param("tname") String tname, @Param("pageIndex") Integer page, @Param("pageSize") Integer limit);

    /**
     * 获取老师列表的长度
     * @param tname 模糊查询
     * @return 返回一个列表
     */
    List<Teacher> getAllTeachers1(@Param("tname") String tname);

    /**
     * 添加一个老师
     * @param teacher
     * @return 返回是否添加成功
     */
    boolean addTeacher(Teacher teacher);

    /**
     * 删除一个老师
     * @param teacher
     * @return 返回是否添加成功
     */
    boolean delTeacher(Teacher teacher);
}
