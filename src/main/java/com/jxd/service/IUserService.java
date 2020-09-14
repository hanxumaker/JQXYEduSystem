package com.jxd.service;

import com.jxd.model.User;

import java.util.List;

public interface IUserService {
    /**
     * 添加一个用户，当增加一个老师或者经理时，
     * 添加一个用户，使其能够登陆到系统
     * @param user
     * @return 返回是否添加成功
     */
    boolean addUser(User user);

    /**
     * 删除一个用户，当删除一个老师或者经理时，
     * 删除一个用户，使其不能登陆到系统
     * @param user
     * @return
     */
    boolean delUser(User user);

    /**
     * 更新user里面的老师 经理信息
     * @param oldName
     * @param newName
     * @return
     */
    boolean editUser(String oldName ,String newName);

    /**
     * 得到用户的信息展示在首页
     * @param uname
     * @param page
     * @param limit
     * @return 返回一个列表
     */
    List<User> getAllUsers(String uname,Integer page,Integer limit);

    /**
     * 得到用户的信息展示在首页
     * @param uname
     * @return 返回一个列表
     */
    List<User> getAllUsers1(String uname);
}
