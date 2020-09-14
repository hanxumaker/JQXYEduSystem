package com.jxd.service;

import com.jxd.model.Dept;

public interface IDeptService {
    /**
     * 根据部门编号获取部门详细信息
     * @param deptno 要查找的部门编号
     * @return 返回一个部门
     */
    Dept getDetailDeptByDeptno(Integer deptno);
}
