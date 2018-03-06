package com.train.modules.entity;

/**
 * Created by Tanli on 2017/4/13 0013.
 */
//对应数据库中的course表
public class Course {

    private int CourseId;

    private String CourseName;

    private int Credit;//学时

    private String CourseType;//课程类型

    private String Location;//上课地点

    private String Duration;//上课时间

    private int TeacherId;

    private int BookId;

    public int getCourseId() {
        return CourseId;
    }

    public void setCourseId(int courseId) {
        CourseId = courseId;
    }

    public String getCourseName() {
        return CourseName;
    }

    public void setCourseName(String courseName) {
        CourseName = courseName;
    }

    public int getCredit() {
        return Credit;
    }

    public void setCredit(int credit) {
        Credit = credit;
    }

    public String getCourseType() {
        return CourseType;
    }

    public void setCourseType(String type) {
        CourseType = type;
    }

    public String getLocation() {
        return Location;
    }

    public void setLocation(String location) {
        Location = location;
    }

    public String getDuration() {
        return Duration;
    }

    public void setDuration(String duration) {
        Duration = duration;
    }

    public int getTeacherId() {
        return TeacherId;
    }

    public void setTeacherId(int teacherId) {
        TeacherId = teacherId;
    }

    public int getBookId() {
        return BookId;
    }

    public void setBookId(int bookId) {
        BookId = bookId;
    }
}
