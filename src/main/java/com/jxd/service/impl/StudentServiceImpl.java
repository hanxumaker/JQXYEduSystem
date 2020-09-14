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
}
