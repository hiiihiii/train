package com.train.modules.entity;

/**
 * Created by Tanli on 2017/4/13 0013.
 */
public class EmpNeeds {

    private int EmpId;

    private int CourseId;

    private int JobId;

    private String Term;

    private double Score;

    private String IsScore;

    public int getEmpId() {
        return EmpId;
    }

    public void setEmpId(int empId) {
        EmpId = empId;
    }

    public int getCourseId() {
        return CourseId;
    }

    public void setCourseId(int courseId) {
        CourseId = courseId;
    }

    public int getJobId() {
        return JobId;
    }

    public void setJobId(int jobId) {
        JobId = jobId;
    }

    public String getTerm() {
        return Term;
    }

    public void setTerm(String term) {
        Term = term;
    }

    public double getScore() {
        return Score;
    }

    public void setScore(double score) {
        Score = score;
    }

    public String getIsScore() {
        return IsScore;
    }

    public void setIsScore(String isScore) {
        IsScore = isScore;
    }
}
