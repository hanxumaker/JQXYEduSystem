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
     * @Description 根据班级查询这个班下的所有学生, 对本班的学生进行模糊查询
     * @Return list集合：查到的学生
     * @Date 2020/9/12 18:03
     */
    List<Student> getAllStudentByCid(@Param("cid") Integer cid, @Param("sname") String sname);

    /**
     * @param count: 跳过多少条数据;
     *               pageSize: 每页显示几条数据
     *               sname:模糊查询
     * @Description 对学生进行模糊，分页查询
     * @Return
     * @Date 2020/9/13 9:53
     */
    List<Student> getSomeStudents(@Param("count") Integer count, @Param("pageSize") Integer pageSize, @Param("sname") String sname, @Param("cid") Integer cid);

    /**
     * 根据部门号查询这个部门的所有员工,对部门下的员工进行模糊查询
     *
     * @param deptno
     * @param sname
     * @return
     */
    List<Student> getStudentsByDeptno(@Param("deptno") Integer deptno, @Param("sname") String sname);

    /**
     * 对员工进行模糊分页查询
     *
     * @param count    跳过几条数据
     * @param pageSize 显示几条数据
     * @param sname    进行模糊查询的名字
     * @param deptno   部门编号
     * @return 查到的员工
     */
    List<Student> getStudents(@Param("count") Integer count, @Param("pageSize") Integer pageSize, @Param("sname") String sname, @Param("deptno") Integer deptno);
    /**
     * 根据学生id查找学生
     * @param sid 要查找的学生id
     * @return 查找到的学生
     */
    Student getStudentBySid(Integer sid);

    /**
     * 得到全部的学生
     * @param sname
     * @param cid
     * @param page
     * @param limit
     * @return
     */
    List<Student> getAllStudents(@Param("sname") String sname, @Param("cid") Integer cid, @Param("pageIndex") Integer page, @Param("pageSize") Integer limit);

    /**
     * 得到全部的学生
     * @param sname
     * @param cid
     * @return
     */
    List<Student> getAllStudents1(@Param("sname") String sname, @Param("cid") Integer cid);

    /**
     * 增加一个学生
     * @param student
     * @return
     */
    boolean addStu(Student student);

    /**
     * 删除一个学生
     * @param sid
     * @return
     */
    boolean delStu(Integer sid);

}
