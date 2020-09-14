package com.jxd.service;

import com.jxd.model.Manager;

public interface IManagerService {
    /**
     * 根据已登录的经理的名字查该经理
      * @param uname 登录的经理的名字
     * @return 返回该经理
     */
    Manager getManagerByMname(String uname);


}
