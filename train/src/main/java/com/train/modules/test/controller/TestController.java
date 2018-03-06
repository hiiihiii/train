package com.train.modules.test.controller;

import com.train.modules.test.entity.Test;
import com.train.modules.test.service.TestService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by tanli on 2017/4/11 0011.
 */
@Controller
public class TestController {

    @Resource
    private TestService testService;

    @RequestMapping(value = "addUser")
    public void test()
    {
        Test test = new Test();
        test.setSex("女");
        test.setName("Allen");
        //user.setId(666);
        testService.addUser(test);
    }
}
