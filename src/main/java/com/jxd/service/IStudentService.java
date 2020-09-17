package com.jxd.service;

import com.jxd.model.Student;

import java.util.List;

public interface IStudentService {

    /**
    * @Description 通过老师的登录获取到其所在的班级
    * @Return cid:班级的编号
    * @Date 2020/9/12 17:35
    */
    int getCidByTeacher(String tname);

    /**
    * @Description 根据班级查询这个班下的所有学生,对本班的学生进行模糊查询
    * @Return list集合
    * @Date 2020/9/12 18:03
    */
    List<Student> getAllStudentByCid(Integer cid,String sname);

    /**
    * @Description 对学生进行模糊，分页查询
    * @param  count: 跳过多少条数据;
     *        pageSize: 每页显示几条数据
     *        sname:模糊查询
    * @Return
    * @Date 2020/9/13 9:53
    */
    List<Student> getSomeStudents(Integer count,Integer pageSize,String sname,Integer cid);

    /**
     * 根据部门号查询这个部门的所有员工,对部门下的员工进行模糊查询
      * @param deptno 部门编号
     * @param sname 模糊查询的名字
     * @return
     */
    List<Student> getStudentsByDeptno(Integer deptno,String sname);

    /**
     * 对员工进行模糊查询
      * @param count 跳过几条数据
     * @param pageSize 显示几条数据
     * @param sname 进行模糊查询的名字
     * @param deptno 部门编号
     * @return 查到的员工
     */
    List<Student> getStudents(Integer count,Integer pageSize,String sname,Integer deptno);

    /**
     * 根据员工id查找该员工
      * @param sid 要查找的员工id
     * @return
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
    List<Student> getAllStudents(String sname,Integer cid, Integer page,Integer limit);

    /**
     * 得到全部的学生
     * @param sname
     * @param cid
     * @return
     */
    List<Student> getAllStudents1(String sname,Integer cid);

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
    /**
    * @Description 提交学校评价表后，修改学生状态
    * @param sid
    * @Return 是否修改成功
    * @Date 2020/9/16 12:02
    */
    boolean editStuSta(Integer sid,Integer state,Integer deptno);
}
