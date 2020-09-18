package com.jxd.dao;

import com.jxd.model.Course;

import java.util.List;
import java.util.Map;

public interface ICourseDao {
    /**
     * @Description 根据班级编号查询每班所上的课程及其状态
     * @Return
     * @Date 2020/9/13 13:30
     */
    List<Map<String,String>> getAllCourseByCid(Integer cid);

    /**
     * 得到全部的课程
     * @return
     */
    List<Course> getAllCourse();

    /**
     * 添加一个课程
     * @param course
     * @return
     */
    boolean addCou(Course course);

    /**
     * 根据课程的id来删除
     * @param id
     * @return
     */
    boolean deleteCou(Integer id);

    /**
     * 如果状态为0，进入此方法
     * @param id
     * @return
     */
    boolean updateCou(Integer id);

    /**
     * 如果状态为1，进入此方法
     * @param id
     * @return
     */
    boolean updateCou1(Integer id);

    /**
     * 得到必选课的courseid
     * @return
     */
    List<Integer> getCourseId();


}
