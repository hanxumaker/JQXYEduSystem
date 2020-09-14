package com.jxd.service;

import com.jxd.model.User;

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
}
