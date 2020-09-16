package com.jxd.service.impl;

import com.jxd.dao.IAnalytesDao;
import com.jxd.model.Analytes;
import com.jxd.service.IAnalytesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/12 16:39
 */
@Service
public class AnalytesServiceImpl implements IAnalytesService {
    @Autowired
    IAnalytesDao analytesDao;
    @Override
    public List<Analytes> getAllAnalytes() {
        return analytesDao.getAllAnalytes();
    }

    @Override
    public boolean deleteAna(Integer id) {
        return analytesDao.deleteAna(id);
    }

    @Override
    public boolean updateAna(Integer id) {
        return analytesDao.updateAna(id);
    }

    @Override
    public boolean updateAna1(Integer id) {
        return analytesDao.updateAna1(id);
    }

    @Override
    public boolean addAna(Analytes analytes) {
        return analytesDao.addAna(analytes);
    }
}
