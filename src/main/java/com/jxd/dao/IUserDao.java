package com.jxd.dao;

import com.jxd.model.User;

public interface IUserDao {
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
     * 根据输入的账号密码查找是否有该用户
     * @param user 要查找的用户
     * @return 查找到的用户
     */
    User searchUser(User user);
}
