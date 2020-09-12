package com.jxd.model;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/12 9:41
 */
public class WorkEvaluate {
    private Integer id;
    private Integer sid;
    private Integer mid;
    private Integer year;
    private Integer finalScore;
    private String comment;

    public WorkEvaluate() {
    }

    public WorkEvaluate(Integer id, Integer sid, Integer mid, Integer year, Integer finalScore, String comment) {
        this.id = id;
        this.sid = sid;
        this.mid = mid;
        this.year = year;
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

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
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
