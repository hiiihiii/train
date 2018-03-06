package com.train.modules.test.service;

import com.train.modules.test.dao.TestDao;
import com.train.modules.test.entity.Test;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/4/11 0011.
 */
@Service
public class TestService {

    @Resource
    private TestDao testDao;
    public void addUser(Test user)
    {
        testDao.addUser(user);
    }
}
