package com.train.modules.dao;

import com.train.modules.entity.SysUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by tanli on 2017/4/17 0017.
 */
@Repository
public interface SysUserDao {

    /**
     * 增加系统用户
     * @param sysUser
     * @return
     */
    public int insertSysUser(SysUser sysUser);

    /**
     * 根据id获取系统用户
     * @param id
     * @return
     */
    public int deleteById(int id);

    /**
     * 系统用户登录
     * @param username
     * @param psw
     * @return
     */
    public SysUser sysUserLogin(@Param("username") String username,@Param("psw") String psw);

    /**
     * 根据用户名获取系统用户
     * @param username
     * @return
     */
    public SysUser getByUserName(String username);
}
