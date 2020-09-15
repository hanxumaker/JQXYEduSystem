package com.jxd.service;

import com.jxd.model.Teacher;

import java.util.List;

public interface ITeacherService {
 /**
  * 获取老师列表
  * @param tname 模糊查询
  * @param page
  * @param limit
  * @return 返回一个列表
  */
 List<Teacher> getAllTeachers(String tname,Integer page,Integer limit);

 /**
  * 获取老师列表的长度
  * @param tname 模糊查询
  * @return 返回一个列表
  */
 List<Teacher> getAllTeachers1(String tname);

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
}
