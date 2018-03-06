package com.train.modules.entity;

/**
 * Created by Tanli on 2017/4/13 0013.
 */
public class Job {

    private int JobId;

    private String JobName;

    private String JobIntro;

    private int DeptId;

//    private Department department;

    public int getJobId() {
        return JobId;
    }

    public void setJobId(int jobId) {
        JobId = jobId;
    }

    public String getJobName() {
        return JobName;
    }

    public void setJobName(String jobName) {
        JobName = jobName;
    }

    public String getJobIntro() {
        return JobIntro;
    }

    public void setJobIntro(String jobIntro) {
        JobIntro = jobIntro;
    }

    public int getDeptId() {
        return DeptId;
    }

    public void setDeptId(int deptId) {
        DeptId = deptId;
    }

//    public Department getDepartment() {
//        return department;
//    }
//
//    public void setDepartment(Department department) {
//        this.department = department;
//    }
}
