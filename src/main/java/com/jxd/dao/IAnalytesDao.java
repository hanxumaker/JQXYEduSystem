package com.jxd.dao;

import com.jxd.model.Analytes;

import java.util.List;

public interface IAnalytesDao {

    /**
     * 得到全部的评分项
     * @return 返回一个list
     */
    List<Analytes> getAllAnalytes();

    /**
     * 根据评分项的id来删除
     * @param id
     * @return
     */
    boolean deleteAna(Integer id);

    /**
     * 如果状态为0，进入此方法
     * @param id
     * @return
     */
    boolean updateAna(Integer id);

    /**
     * 如果状态为1，进入此方法
     * @param id
     * @return
     */
    boolean updateAna1(Integer id);

    /**
     * 增肌一个评分项
     * @param analytes
     * @return
     */
    boolean addAna(Analytes analytes);
}
