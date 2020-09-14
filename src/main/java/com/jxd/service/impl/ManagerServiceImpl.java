package com.jxd.service.impl;

import com.jxd.dao.IManagerDao;
import com.jxd.model.Manager;
import com.jxd.service.IManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/12 16:43
 */
@Service
public class ManagerServiceImpl implements IManagerService {
    @Autowired
    IManagerDao managerDao;
    @Override
    public Manager getManagerByMname(String uname) {
        return managerDao.getManagerByMname(uname);
    }
}
