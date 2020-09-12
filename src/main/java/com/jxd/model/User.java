package com.jxd.model;

/**
 * @Description TODO
 * @Author hanxu
 * @Date 2020/9/12 9:38
 */
public class User {
    private Integer id;
    private String uname;
    private String password;
    private Integer phoneNum;
    private Integer role;

    public User() {
    }

    public User(Integer id, String uname, String password, Integer phoneNum, Integer role) {
        this.id = id;
        this.uname = uname;
        this.password = password;
        this.phoneNum = phoneNum;
        this.role = role;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(Integer phoneNum) {
        this.phoneNum = phoneNum;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }
}
