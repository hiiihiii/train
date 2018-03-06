package com.train.modules.entity;

/**
 * Created by Tanli on 2017/4/13 0013.
 */
public class SysUser {

    private int UserId; //账号

    private String Password; // 密码

    private String UserName;//用户名

    public int getUserId() {
        return UserId;
    }

    public void setUserId(int userId) {
        UserId = userId;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }
}
