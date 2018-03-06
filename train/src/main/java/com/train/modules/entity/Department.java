package com.train.modules.entity;

/**
 * Created by Tanli on 2017/4/13 0013.
 */
public class Department {

    private int DeptId;

    private String DeptName;

    private String Manager;

    public int getDeptId() {
        return DeptId;
    }

    public void setDeptId(int deptId) {
        DeptId = deptId;
    }

    public String getDeptName() {
        return DeptName;
    }

    public void setDeptName(String deptName) {
        DeptName = deptName;
    }

    public String getManager() {
        return Manager;
    }

    public void setManager(String manager) {
        Manager = manager;
    }
}
