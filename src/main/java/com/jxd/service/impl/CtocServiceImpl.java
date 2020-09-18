package com.jxd.service.impl;

import com.jxd.dao.ICtocDao;
import com.jxd.model.Ctoc;
import com.jxd.service.ICtocService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/12 16:40
 */
@Service
public class CtocServiceImpl implements ICtocService {

    @Autowired
    ICtocDao ctocDao;

    @Override
    public boolean addCourseToClass(List<Ctoc> ctocList) {
        return ctocDao.addCourseToClass(ctocList);
    }
}
