package com.jxd.model;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/11 7:56
 */
public class Student {
    private Integer sid;
    private String sname;
    private String sex;
    private String nation;
    private String birthday;
    private String address;
    private String married;
    private String phone;
    private String idCard; //身份证号
    private String school;
    private String major;
    private String photo;
    private Integer cid; //班级
    private Integer deptno;
    private Integer state;

    public Student() {
    }

    public Student(Integer sid, String sname, String sex, String nation, String birthday,
                   String address, String married, String phone, String idCard, String school, String major, String photo, Integer cid, Integer deptno, Integer state) {
        this.sid = sid;
        this.sname = sname;
        this.sex = sex;
        this.nation = nation;
        this.birthday = birthday;
        this.address = address;
        this.married = married;
        this.phone = phone;
        this.idCard = idCard;
        this.school = school;
        this.major = major;
        this.photo = photo;
        this.cid = cid;
        this.deptno = deptno;
        this.state = state;
    }

    public Student(String sname, String sex, String nation, String birthday,
                   String address, String married, String phone, String idCard, String school, String major, String photo, Integer cid, Integer deptno, Integer state) {
        this.sname = sname;
        this.sex = sex;
        this.nation = nation;
        this.birthday = birthday;
        this.address = address;
        this.married = married;
        this.phone = phone;
        this.idCard = idCard;
        this.school = school;
        this.major = major;
        this.photo = photo;
        this.cid = cid;
        this.deptno = deptno;
        this.state = state;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMarried() {
        return married;
    }

    public void setMarried(String married) {
        this.married = married;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getDeptno() {
        return deptno;
    }

    public void setDeptno(Integer deptno) {
        this.deptno = deptno;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}






































