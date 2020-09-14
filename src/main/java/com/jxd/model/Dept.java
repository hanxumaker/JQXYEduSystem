package com.jxd.model;

import java.util.List;

/**
 * @Description TODO
 * @Author wangdiandian
 * @Date 2020/9/12 11:20
 */
public class Dept {
    private Integer deptno;
    private String dname;
    private List<Student> list;//一个部门下的学生集合

    public Dept() {
    }

    public Dept(Integer deptno, String dname) {
        this.deptno = deptno;
        this.dname = dname;
    }

    public List<Student> getList() {
        return list;
    }

    public void setList(List<Student> list) {
        this.list = list;
    }

    public Dept(String dname) {
        this.dname = dname;
    }

    public Integer getDeptno() {
        return deptno;
    }

    public void setDeptno(Integer deptno) {
        this.deptno = deptno;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }
}

