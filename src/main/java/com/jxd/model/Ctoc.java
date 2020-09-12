package com.jxd.model;

/**
 * @Description TODO
 * @Author Li Min
 * @Date 2020/9/10 21:33
 */
public class Ctoc {
    private Integer cid;//班级id
    private Integer courseId;//课程id

    public Ctoc(Integer cid, Integer courseId) {
        this.cid = cid;
        this.courseId = courseId;
    }

    public Ctoc() {
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
}
