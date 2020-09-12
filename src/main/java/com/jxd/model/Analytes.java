package com.jxd.model;

/**
 * @Description TODO
 * @Author Li Min
 * @Date 2020/9/10 21:20
 */
public class Analytes {
    private Integer id;//评分项id
    private String aname;//评分项名称
    private Integer state;//评分项状态

    public Analytes() {
    }

    public Analytes(String aname, Integer state) {
        this.aname = aname;
        this.state = state;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
