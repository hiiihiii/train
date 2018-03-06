package com.train.modules.service;

import com.train.modules.dao.SysUserDao;
import com.train.modules.entity.SysUser;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by tanli on 2017/4/17 0017.
 */
@Service
public class SysUserService {

    @Resource
    private SysUserDao sysUserDao;

    public int insertSysUser(SysUser sysUser)
    {
        return sysUserDao.insertSysUser(sysUser);
    }

    public int deleteById(int id)
    {
        return sysUserDao.deleteById(id);
    }

    public SysUser sysUserLogin(String username, String psw)
    {
        return sysUserDao.sysUserLogin(username, psw);
    }

    /**
     * 根据用户名获取系统用户
     * @param username
     * @return
     */
    public SysUser getByUserName(String username)
    {
        return sysUserDao.getByUserName(username);
    }
}
