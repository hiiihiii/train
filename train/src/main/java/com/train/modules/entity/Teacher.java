package com.train.modules.entity;

import java.util.Date;

/**
 * Created by Tanli on 2017/4/13 0013.
 */
public class Teacher {

    private int TeacherId;

    private String TeaName;

    private String TeaSex;

    private Date BirthDate;

    private String Title;//职称

    private String Intro;//教师简介

    private String Password;

    private String IdNum;

    public int getTeacherId() {
        return TeacherId;
    }

    public void setTeacherId(int teacherId) {
        TeacherId = teacherId;
    }

    public String getTeaName() {
        return TeaName;
    }

    public void setTeaName(String teaName) {
        TeaName = teaName;
    }

    public String getTeaSex() {
        return TeaSex;
    }

    public void setTeaSex(String teaSex) {
        TeaSex = teaSex;
    }

    public Date getBirthDate() {
        return BirthDate;
    }

    public void setBirthDate(Date birthDate) {
        BirthDate = birthDate;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public String getIntro() {
        return Intro;
    }

    public void setIntro(String intro) {
        Intro = intro;
    }

    public String getPsw() {
        return Password;
    }

    public void setPsw(String psw) {
        Password = psw;
    }

    public String getIdNum() {
        return IdNum;
    }

    public void setIdNum(String idNum) {
        IdNum = idNum;
    }
}
