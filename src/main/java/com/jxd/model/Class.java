package com.jxd.model;

/**
 * @Description TODO
 * @Author Li Min
 * @Date 2020/9/10 21:27
 */
public class Class {
    private Integer cid;//班级id
    private String cname;//班级名称

    public Class() {
    }

    public Class(Integer cid, String cname) {
        this.cid = cid;
        this.cname = cname;
    }

    public Class(String cname) {
        this.cname = cname;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }
}
