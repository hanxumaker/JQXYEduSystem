package com.jxd.dao;

import com.jxd.model.Manager;

public interface IManagerDao {
    /**
     * 根据已登录的经理的名字查该经理
     * @param uname 登录的经理的名字
     * @return 返回该经理
     */
    Manager getManagerByMname(String uname);
}
