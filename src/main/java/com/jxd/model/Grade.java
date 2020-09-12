package com.jxd.model;

/**
 * @Description TODO
 * @Author wangdiandian
 * @Date 2020/9/12 11:24
 */
public class Grade {
    private Integer id;
    private Integer sid;
    private Integer courseId;
    private double score;

    public Grade() {
    }

    public Grade(Integer id, Integer sid, Integer courseId, double score) {
        this.id = id;
        this.sid = sid;
        this.courseId = courseId;
        this.score = score;
    }

    public Grade(Integer sid, Integer courseId, double score) {
        this.sid = sid;
        this.courseId = courseId;
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

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }
}

