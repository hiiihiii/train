package com.train.modules.entity;

import java.util.Date;

/**
 * Created by Tanli on 2017/4/13 0013.
 */
public class CourseComm {

    private int CourseId;

    private int EmpId;

    private String CommLevel;

    private String Content;

    private Date CommTime;

    public int getCourseId() {
        return CourseId;
    }

    public void setCourseId(int courseId) {
        CourseId = courseId;
    }

    public int getEmpId() {
        return EmpId;
    }

    public void setEmpId(int empId) {
        EmpId = empId;
    }

    public String getCommLevel() {
        return CommLevel;
    }

    public void setCommLevel(String level) {
        CommLevel = level;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }

    public Date getCommTime() {
        return CommTime;
    }

    public void setCommTime(Date commTime) {
        CommTime = commTime;
    }
}
