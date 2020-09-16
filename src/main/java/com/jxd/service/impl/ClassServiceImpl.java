package com.jxd.service.impl;

import com.jxd.dao.IClassDao;
import com.jxd.service.IClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/12 16:39
 */
@Service
public class ClassServiceImpl implements IClassService {
    @Autowired
    IClassDao classDao;
    @Override
    public List<Class> getAllClass() {
        return classDao.getAllClass();
    }
}
