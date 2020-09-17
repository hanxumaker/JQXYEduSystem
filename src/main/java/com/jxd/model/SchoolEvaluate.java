package com.jxd.model;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/11 8:09
 */
public class SchoolEvaluate {
    private Integer id;
    private Integer sid;
    private String tname;
    private  Integer finalScore;
    private String comment;

    public SchoolEvaluate() {
    }

    public SchoolEvaluate(Integer id, Integer sid, String tname, Integer finalScore, String comment) {
        this.id = id;
        this.sid = sid;
        this.tname = tname;
        this.finalScore = finalScore;
        this.comment = comment;
    }

    public SchoolEvaluate(Integer sid, String tname, Integer finalScore, String comment) {
        this.sid = sid;
        this.tname = tname;
        this.finalScore = finalScore;
        this.comment = comment;
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

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public Integer getFinalScore() {
        return finalScore;
    }

    public void setFinalScore(Integer finalScore) {
        this.finalScore = finalScore;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
