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

    /**
     * 编辑一个老师的信息
     * @param teacher
     * @return 是否编辑成功
     */
    boolean editTea(Teacher teacher);

    /**
     * @Description 修改老师密码
     * @param tname
     * @Return 是否修改成功
     * @Date 2020/9/16 9:03
     */
    boolean updatePwd(@Param("newPwd") String newPwd,@Param("tname")String tname);

    /**
     * 找到空闲老师
     * @return
     */
    List<Teacher> getFreeTeacher();

    /**
     * 修改老师的状态，所带班级
     * @param teacher
     * @return
     */
    boolean teacherToCla(Teacher teacher);

    /**
     * 把正在带班的老师空闲下来
     * @param teacher
     * @return
     */
    boolean changeTea(Teacher teacher);

    /**
     * @Description 当老师班内学生都已毕业时，改变老师的状态
     * @param tname
     * @Return 是否修改成功
     * @Date 2020/9/17 20:00
     */
    boolean updateTeaStateByStu(@Param("tname") String tname,@Param("state") Integer state);
}
