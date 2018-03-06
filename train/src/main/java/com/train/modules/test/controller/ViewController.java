package com.train.modules.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class ViewController {

    @RequestMapping(value = "testRun")
    public String test(){
        System.out.println("你已通过springMVC进入controller方法……");
        return "/test/success";
    }
}