package com.jxd.model;

/**
 * @Description TODO
 * @Author Li Min
 * @Date 2020/9/14 16:08
 */
public class EvaluateDate {
    private Integer dateId;//评价时间id
    private String dateName;//评价的时间段的名称

    public EvaluateDate() {
    }

    public EvaluateDate(Integer dateId, String dateName) {
        this.dateId = dateId;
        this.dateName = dateName;
    }

    public Integer getDateId() {
        return dateId;
    }

    public void setDateId(Integer dateId) {
        this.dateId = dateId;
    }

    public String getDateName() {
        return dateName;
    }

    public void setDateName(String dateName) {
        this.dateName = dateName;
    }
}
