package com.train.modules.entity;

import java.util.Date;

/**
 * Created by Tanli on 2017/4/13 0013.
 */
public class Employee {

    private int EmpId;

    private String Password;

    private String EmpName;

    private String EmpSex;

    private String IdNum;//身份证号，18位

    private Date BirthDate;

    private String BirthPlace;

    private String Nation;//民族

    private String Marriage;//婚姻状况

    private Date EntryTime;//入职时间

    private String Address;

    private String Telephone;//暂时只考虑每人只有一个电话号码

    private String Email;//暂时只考虑每人只有一个邮箱地址

    private int DeptId;

    public int getDeptId() {
        return DeptId;
    }

    public void setDeptId(int deptId) {
        DeptId = deptId;
    }

    public int getEmpId() {
        return EmpId;
    }

    public void setEmpId(int empId) {
        EmpId = empId;
    }

    public String getEmpName() {
        return EmpName;
    }

    public void setEmpName(String empName) {
        EmpName = empName;
    }

    public String getEmpSex() {
        return EmpSex;
    }

    public void setEmpSex(String empSex) {
        EmpSex = empSex;
    }

    public String getIdNum() {
        return IdNum;
    }

    public void setIdNum(String idNum) {
        IdNum = idNum;
    }

    public Date getBirthDate() {
        return BirthDate;
    }

    public void setBirthDate(Date birthDate) {
        BirthDate = birthDate;
    }

    public String getBirthPlace() {
        return BirthPlace;
    }

    public void setBirthPlace(String birthPlace) {
        BirthPlace = birthPlace;
    }

    public String getNation() {
        return Nation;
    }

    public void setNation(String nation) {
        Nation = nation;
    }

    public String getMarriage() {
        return Marriage;
    }

    public void setMarriage(String marriage) {
        Marriage = marriage;
    }

    public Date getEntryTime() {
        return EntryTime;
    }

    public void setEntryTime(Date entryTime) {
        EntryTime = entryTime;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getTelephone() {
        return Telephone;
    }

    public void setTelephone(String telephone) {
        Telephone = telephone;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getPsw() {
        return Password;
    }

    public void setPsw(String psw) {
        Password = psw;
    }
}
