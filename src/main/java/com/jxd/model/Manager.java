package com.jxd.model;

/**
 * @Description TODO
 * @Author wangdiandian
 * @Date 2020/9/12 11:26
 */
public class Manager {
    private Integer id;
    private String mname;
    private Integer deptno;

    public Manager() {
    }

    public Manager(Integer id, String mname, Integer deptno) {
        this.id = id;
        this.mname = mname;
        this.deptno = deptno;
    }

    public Manager(String mname, Integer deptno) {
        this.mname = mname;
        this.deptno = deptno;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public Integer getDeptno() {
        return deptno;
    }

    public void setDeptno(Integer deptno) {
        this.deptno = deptno;
    }
}

