package com.jxd.model;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/12 9:31
 */
public class Teacher {
    private Integer tid;
    private String tname;
    private Integer cid;
    private Integer state;

    public Teacher(Integer tid, String tname, Integer cid, Integer state) {
        this.tid = tid;
        this.tname = tname;
        this.cid = cid;
        this.state = state;
    }

    public Teacher() {
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
