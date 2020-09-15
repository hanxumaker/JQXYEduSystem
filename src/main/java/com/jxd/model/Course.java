package com.jxd.model;

/**
 * @Description TODO
 * @Author Li Min
 * @Date 2020/9/10 21:30
 */
public class Course {
    private Integer courseId;//课程id
    private String courseName;//课程名称
    private String state;//课程状态

    public Course() {
    }

    public Course(String courseName, String state) {
        this.courseName = courseName;
        this.state = state;
    }

    public Course(String courseName) {
        this.courseName = courseName;
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

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
