package com.jxd.service;

import com.jxd.model.Ctoc;

import java.util.List;

public interface ICtocService {

    /**
     * 批量插入必修课
     * @param ctocList
     * @return
     */
    boolean addCourseToClass(List<Ctoc> ctocList);
}
