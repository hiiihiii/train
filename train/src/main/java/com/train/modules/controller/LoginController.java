package com.train.modules.controller;

import com.train.modules.entity.Department;
import com.train.modules.entity.Employee;
import com.train.modules.entity.SysUser;
import com.train.modules.entity.Teacher;
import com.train.modules.service.DeptService;
import com.train.modules.service.EmployeeService;
import com.train.modules.service.SysUserService;
import com.train.modules.service.TeacherService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Tanli on 2017/4/17 0017.
 */
@Controller
@RequestMapping(value = "userlogin")
public class LoginController {

    @Resource
    private SysUserService sysUserService;
    @Resource
    private TeacherService teacherService;
    @Resource
    private EmployeeService employeeService;
    @Resource
    private DeptService deptService;

    @RequestMapping(value = {"index", ""})
    public String index(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        return "login";
    }

    //@ResponseBody:这个注释可以将用于将Controller的方法返回的对象，
    //通过适当的HttpMessageConverter转换为指定格式后，写入到Response对象的body数据区。
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String Login(HttpServletRequest req, HttpServletResponse response , Model model)
    {
        String usertype = req.getParameter("usertype");
        String username = req.getParameter("username");
        String psw = req.getParameter("pwd");
        String message = "";
        if(usertype.equals("员工"))
        {
            Employee employee = employeeService.employeeLogin(username, psw);
            if(employee==null){
                model.addAttribute("fail","请检查用户名或密码是否正确");
                message="redirect:"+"/page/login.jsp";
            }
            else {
                Department department = deptService.getOneDept(employee.getDeptId());
                int deptid = department.getDeptId();
                String deptname = department.getDeptName();
                model.addAttribute("deptid", deptid);
                model.addAttribute("deptname",deptname);
                model.addAttribute("userId",username);
                message = "redirect:" + "../page/employee/staff_main.jsp";
            }
        }
        else if(usertype.equals("教师"))
        {
            Teacher teacher = teacherService.teacherLogin(username, psw);
            if(teacher==null){
                model.addAttribute("fail","请检查用户名或密码是否正确");
                message = "redirect:"+"../page/login.jsp";
            }
            else
            {
                model.addAttribute("teaName",teacher.getTeaName());
                model.addAttribute("teaId",teacher.getTeacherId());
                message = "redirect:"+"../page/teacher/teacher_main.jsp";
            }
        }
        else if(usertype.equals("管理员"))
        {
            SysUser sysUser = sysUserService.sysUserLogin(username, psw);
            if(sysUser==null){
                model.addAttribute("fail","请检查用户名或密码是否正确");
                message = "redirect:"+"../page/login.jsp";
            }
            else
            {
                model.addAttribute("username",username);
                message = "redirect:"+"../page/sysuser/manager_main.jsp";
            }
        }
        return message;
    }
}
