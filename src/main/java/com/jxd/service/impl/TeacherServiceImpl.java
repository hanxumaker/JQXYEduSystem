package com.jxd.service.impl;

import com.jxd.dao.ITeacherDao;
import com.jxd.model.Teacher;
import com.jxd.service.ITeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/12 16:46
 */
@Service
public class TeacherServiceImpl implements ITeacherService {
    @Autowired
    ITeacherDao teacherDao;

    @Override
    public List<Teacher> getAllTeachers(String tname, Integer page, Integer limit) {
        return teacherDao.getAllTeachers(tname, page, limit);
    }

    @Override
    public List<Teacher> getAllTeachers1(String tname) {
        return teacherDao.getAllTeachers1(tname);
    }

    @Override
    public boolean addTeacher(Teacher teacher) {
        return teacherDao.addTeacher(teacher);
    }

    @Override
    public boolean delTeacher(Teacher teacher) {
        return teacherDao.delTeacher(teacher);
    }

    @Override
    public boolean editTea(Teacher teacher) {
        return teacherDao.editTea(teacher);
    }

    @Override
    public boolean updatePwd(String newPwd, String tname) {
        return teacherDao.updatePwd(newPwd,tname);
    }

    @Override
    public List<Teacher> getFreeTeacher() {
        return teacherDao.getFreeTeacher();
    }

    @Override
    public boolean teacherToCla(Teacher teacher) {
        return teacherDao.teacherToCla(teacher);
    }

    @Override
    public boolean changeTea(Teacher teacher) {
        return teacherDao.changeTea(teacher);
    }


}
