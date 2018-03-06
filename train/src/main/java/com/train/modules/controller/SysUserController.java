package com.train.modules.controller;

import com.train.modules.entity.SysUser;
import com.train.modules.service.SysUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by tanli on 2017/4/17 0017.
 */
@Controller
@RequestMapping(value = "sysuser")
//访问的时候是根目录+“/sysuser”
public class SysUserController {

    @Resource
    private SysUserService sysUserService;

    @RequestMapping(value = "regist")
    public void register(HttpServletRequest req, HttpServletResponse response, Model model) {
        String username = req.getParameter("username");
        String psw = req.getParameter("pwd");
        String pswAgain = req.getParameter("firm_pwd");
        SysUser sysUser = sysUserService.getByUserName(username);
        if(sysUser!=null)
        {
            String msg = "此用户名已注册，请重新填写";
            model.addAttribute("msg",msg);
        }
        else
        {
            SysUser user = new SysUser();
            user.setUserName(username);
            user.setPassword(psw);
            sysUserService.insertSysUser(user);
        }
    }
}
