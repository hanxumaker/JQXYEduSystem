package com.jxd.service.impl;

import com.jxd.dao.IDeptDao;
import com.jxd.model.Dept;
import com.jxd.service.IDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/12 15:59
 */
@Service
public class DeptServiceImpl implements IDeptService {
    @Autowired
    IDeptDao deptDao;
    @Override
    public Dept getDetailDeptByDeptno(Integer deptno) {
        return deptDao.getDetailDeptByDeptno(deptno);
    }
}
