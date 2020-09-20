package com.jxd.service;

import com.jxd.model.User;

import java.util.List;

public interface IUserService {
    /**
     * 添加一个用户，当增加一个老师或者经理时，
     * 添加一个用户，使其能够登陆到系统
     *
     * @param user
     * @return 返回是否添加成功
     */
    boolean addUser(User user);

    /**
     * 删除一个用户，当删除一个老师或者经理时，
     * 删除一个用户，使其不能登陆到系统
     *
     * @param user
     * @return
     */
    boolean delUser(User user);

    /**
     * 根据输入的账号密码查找是否有该用户
     *
     * @param user 要查找的用户
     * @return 查找到的用户
     */
    User searchUser(User user);

    /**
     * 更新user里面的老师 经理信息
     *
     * @param oldName
     * @param newName
     * @return
     */
    boolean editUser(String oldName, String newName);

    /**
     * 得到用户的信息展示在首页
     *
     * @param uname
     * @param page
     * @param limit
     * @return 返回一个列表
     */
    List<User> getAllUsers(String uname, Integer page, Integer limit);

    /**
     * 得到用户的信息展示在首页
     *
     * @param uname
     * @return 返回一个列表
     */
    List<User> getAllUsers1(String uname);

    /**
     * 根据用户的id，重置密码
     *
     * @param id
     * @return
     */
    boolean resetPwd(Integer id);
}
