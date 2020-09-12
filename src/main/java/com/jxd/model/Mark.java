package com.jxd.model;

/**
 * @Description TODO
 * @Author wangdiandian
 * @Date 2020/9/12 11:27
 */
public class Mark {
    private Integer id;
    private Integer sid;
    private Integer aid;
    private Integer score;

    public Mark() {

    }

    public Mark(Integer id, Integer sid, Integer aid, Integer score) {
        this.id = id;
        this.sid = sid;
        this.aid = aid;
        this.score = score;
    }

    public Mark(Integer sid, Integer aid, Integer score) {
        this.sid = sid;
        this.aid = aid;
        this.score = score;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }
}

