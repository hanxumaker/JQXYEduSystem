package com.jxd.service.impl;

import com.jxd.dao.IUserDao;
import com.jxd.model.User;
import com.jxd.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/12 16:46
 */
@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    IUserDao userDao;
    @Override
    public User searchUser(User user) {
        return userDao.searchUser(user);
    }
    @Override
    public boolean addUser(User user) {
        return userDao.addUser(user);
    }

    @Override
    public boolean delUser(User user) {
        return userDao.delUser(user);
    }

    @Override
    public boolean editUser(String oldName, String newName) {
        return userDao.editUser(oldName, newName);
    }

    @Override
    public List<User> getAllUsers(String uname, Integer page, Integer limit) {
        return userDao.getAllUsers(uname, page, limit);
    }

    @Override
    public List<User> getAllUsers1(String uname) {
        return userDao.getAllUsers1(uname);
    }

    @Override
    public boolean resetPwd(Integer id) {
        return userDao.resetPwd(id);
    }
}
