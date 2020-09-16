package com.jxd.model;

/**
 * @Description TODO
 * @Author Li Min
 * @Date 2020/9/10 21:33
 */
public class Ctoc {
    private Integer cid;//班级id
    private Integer courseId;//课程id
    private Integer state;//课程状态

    public Ctoc() {
    }

    public Ctoc(Integer cid, Integer courseId, Integer state) {
        this.cid = cid;
        this.courseId = courseId;
        this.state = state;
    }

    public Ctoc(Integer courseId, Integer state) {
        this.courseId = courseId;
        this.state = state;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
