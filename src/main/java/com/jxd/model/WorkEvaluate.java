package com.jxd.model;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/12 9:41
 */
public class WorkEvaluate {
    private Integer id;//评价id
    private Integer dateId;//评价时间
    private Integer sid;//学生id
    private Integer aid;//评价分项id
    private String evaluatePerson;//评价人
    private Integer evaluateScore;//分项评价分数
    private Integer totalScore;//评价总分
    private String evaluateContent;//综合评价

    public WorkEvaluate() {
    }

    public WorkEvaluate(Integer dateId, Integer sid, Integer aid, String evaluatePerson, Integer evaluateScore, Integer totalScore, String evaluateContent) {
        this.dateId = dateId;
        this.sid = sid;
        this.aid = aid;
        this.evaluatePerson = evaluatePerson;
        this.evaluateScore = evaluateScore;
        this.totalScore = totalScore;
        this.evaluateContent = evaluateContent;
    }

    public Integer getDateId() {
        return dateId;
    }

    public void setDateId(Integer dateId) {
        this.dateId = dateId;
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

    public String getEvaluatePerson() {
        return evaluatePerson;
    }

    public void setEvaluatePerson(String evaluatePerson) {
        this.evaluatePerson = evaluatePerson;
    }

    public Integer getEvaluateScore() {
        return evaluateScore;
    }

    public void setEvaluateScore(Integer evaluateScore) {
        this.evaluateScore = evaluateScore;
    }

    public Integer getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(Integer totalScore) {
        this.totalScore = totalScore;
    }

    public String getEvaluateContent() {
        return evaluateContent;
    }

    public void setEvaluateContent(String evaluateContent) {
        this.evaluateContent = evaluateContent;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}

