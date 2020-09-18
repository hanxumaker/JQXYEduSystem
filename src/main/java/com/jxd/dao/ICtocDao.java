package com.jxd.dao;

import com.jxd.model.Ctoc;

import java.util.List;

public interface ICtocDao {

    /**
     * 批量插入必修课
     * @param ctocList
     * @return
     */
    boolean addCourseToClass(List<Ctoc> ctocList);
}
