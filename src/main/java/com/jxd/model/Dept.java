package com.jxd.model;

/**
 * @Description TODO
 * @Author wangdiandian
 * @Date 2020/9/12 11:20
 */
public class Dept {
    private Integer deptno;
    private String dname;

    public Dept() {
    }

    public Dept(Integer deptno, String dname) {
        this.deptno = deptno;
        this.dname = dname;
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

