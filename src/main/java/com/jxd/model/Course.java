package com.jxd.model;

/**
 * @Description TODO
 * @Author Li Min
 * @Date 2020/9/10 21:30
 */
public class Course {
    private Integer courseId;//课程id
    private String courseName;//课程名称
    private Integer state;//课程状态

    public Course() {
    }

    public Course(String courseName, Integer state) {
        this.courseName = courseName;
        this.state = state;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
