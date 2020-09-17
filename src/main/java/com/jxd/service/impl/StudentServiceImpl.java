package com.jxd.service.impl;

import com.jxd.dao.IStudentDao;
import com.jxd.model.Student;
import com.jxd.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/12 16:45
 */
@Service
public class StudentServiceImpl implements IStudentService {
    @Autowired
    IStudentDao studentDao;
    @Override
    public int getCidByTeacher(String tname) {
        return studentDao.getCidByTeacher(tname);
    }

    @Override
    public List<Student> getAllStudentByCid(Integer cid, String sname) {
        return studentDao.getAllStudentByCid(cid,sname);
    }

    @Override
    public List<Student> getSomeStudents(Integer count, Integer pageSize, String sname,Integer cid) {
        return studentDao.getSomeStudents(count,pageSize,sname,cid);
    }

    @Override
    public List<Student> getStudentsByDeptno(Integer deptno, String sname) {
        return studentDao.getStudentsByDeptno(deptno,sname);
    }

    @Override
    public List<Student> getStudents(Integer count, Integer pageSize, String sname, Integer deptno) {
        return studentDao.getStudents(count,pageSize,sname,deptno);
    }

    @Override
    public Student getStudentBySid(Integer sid) {
        return studentDao.getStudentBySid(sid);
    }

    @Override
    public List<Student> getAllStudents(String sname, Integer cid, Integer page, Integer limit) {
        return studentDao.getAllStudents(sname, cid, page, limit);
    }

    @Override
    public List<Student> getAllStudents1(String sname, Integer cid) {
        return studentDao.getAllStudents1(sname,cid);
    }

    @Override
    public boolean addStu(Student student) {
        return studentDao.addStu(student);
    }

    @Override
    public boolean delStu(Integer sid) {
        return studentDao.delStu(sid);
    }

    @Override
    public boolean editStuSta(Integer sid, Integer state,Integer deptno) {
        return studentDao.editStuSta(sid,state,deptno);
    }

}
