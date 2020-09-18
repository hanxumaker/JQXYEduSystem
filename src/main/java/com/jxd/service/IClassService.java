package com.jxd.service;

import java.util.List;
import java.util.Map;

public interface IClassService {
    /**
     * 得到全部的班级
     * @return
     */
    List<Class> getAllClass();

    /**
     * 班级表联合老师表查询
     * @return
     */
    List<Map<String,String>> getAllClasses();

    /**
     * 增加一个班级
     * @param cname
     * @return
     */
    boolean addCla(String cname);

    /**
     * 获得最大的cid
     * @return
     */
    Integer getMaxCid();
}
