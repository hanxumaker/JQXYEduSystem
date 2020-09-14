package com.jxd.dao;

import com.jxd.model.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IStudentDao {
    /**
     * @Description 通过老师的登录获取到其所在的班级
     * @Return cid:班级的编号
     * @Date 2020/9/12 17:35
     */
    int getCidByTeacher(String tname);
    /**
     * @Description 根据班级查询这个班下的所有学生,对本班的学生进行模糊查询
     * @Return list集合：查到的学生
     * @Date 2020/9/12 18:03
     */
    List<Student> getAllStudentByCid(@Param("cid") Integer cid,@Param("sname") String sname);
    /**
     * @Description 对学生进行模糊，分页查询
     * @param  count: 跳过多少条数据;
     *        pageSize: 每页显示几条数据
     *        sname:模糊查询
     * @Return
     * @Date 2020/9/13 9:53
     */
    List<Student> getSomeStudents(@Param("count") Integer count, @Param("pageSize") Integer pageSize, @Param("sname") String sname,@Param("cid") Integer cid);
}
