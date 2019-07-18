package com.dongli.entity;

public class Student extends User{
    private String name;
    private String IDNum;
    private String sex;
    private Integer age;
    private String tel;
    private String birthday;
    private String major;
    private String rno;
    private String registration;



    public Student(String IDNum, String name, String sex, Integer age, String tel, String birthday,
                   String major, String rno, String registration) {
        this.name = name;
        this.IDNum = IDNum;
        this.sex = sex;
        this.age = age;
        this.tel = tel;
        this.birthday = birthday;
        this.major = major;
        this.rno = rno;
        this.registration = registration;
    }

    public Student() {

    }

    public String getRno() {
        return rno;
    }

    public void setRno(String rno) {
        this.rno = rno;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIDNum() {
        return IDNum;
    }

    public void setIDNum(String IDNum) {
        this.IDNum = IDNum;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getRegistration() {
        return registration;
    }

    public void setRegistration(String registration) {
        this.registration = registration;
    }
}
