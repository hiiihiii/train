package com.train.modules.controller;

import com.train.modules.entity.Department;
import com.train.modules.service.DeptService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Tanli on 2017/4/18 0018.
 */
@Controller
@RequestMapping(value = "page/sysuser")
public class DeptController {

    @Resource
    private DeptService deptService;

    @RequestMapping(value = "addDept")
    @ResponseBody
    public Map addDept(HttpServletRequest request, HttpServletResponse response,
                       Model model, Department department)
    {
        Map mp = new HashMap();
        String deptname = request.getParameter("deptname");
        String deptmanager = request.getParameter("deptmanager");
        try {
            deptname= new String(deptname.getBytes("ISO-8859-1"),"UTF-8");
            deptmanager= new String(deptmanager.getBytes("ISO-8859-1"),"UTF-8");
        } catch (Exception e) {
            mp.put("success",false);
            mp.put("msg",e.getMessage());
            e.printStackTrace();
        }
        department.setDeptName(deptname);
        department.setManager(deptmanager);
        try {

            int count = deptService.insertDept(department);
            if (count > 0){
                mp.put("success",true);
                mp.put("msg","添加部门成功");
            }
            else{
                mp.put("success",false);
                mp.put("msg","OPS！添加部门失败了！");
            }
        }catch (Exception e){
            mp.put("success",false);
            mp.put("msg",e.getMessage());
        }
        return mp;
    }

    @RequestMapping(value = "deleteIndex")
    public String deleteDepts(HttpServletRequest request, HttpServletResponse response,
                              Model model, Department department)
    {
        List<Department> departmentList = deptService.getAllDepts();
        model.addAttribute("departmentList",departmentList);
        return "/sysuser/manager_del_dept";
    }

    //这个方法可能要废了
    @RequestMapping( value = "updateIndex")
    public String updateDept(HttpServletRequest request, HttpServletResponse response,
                             Model model)
    {
        List<Department> departmentList;
        departmentList = deptService.getAllDepts();
        model.addAttribute("departmentList",departmentList);
        return "/sysuser/manager_edit_dept";
    }

    @RequestMapping(value = "updateInfo")
    public String updateInfo(HttpServletRequest request,HttpServletResponse response,
                      Model model)
    {
        String deptid = request.getParameter("deptid");
        Department department = deptService.getOneDept(Integer.parseInt(deptid));
        model.addAttribute("department",department);
        return  "/sysuser/manager_edit_res_dept";
    }

    @RequestMapping(value = "updateDept")
    @ResponseBody
    public Map updateDept(HttpServletRequest request, HttpServletResponse response,
                             Model model, Department department)
    {
        Map mp = new HashMap();
        String deptid = request.getParameter("deptid");
        String deptname = request.getParameter("deptname");
        String deptmanager = request.getParameter("deptmanager");
        //处理中文乱码
        try {
            deptname= new String(deptname.getBytes("ISO-8859-1"),"UTF-8");
            deptmanager= new String(deptmanager.getBytes("ISO-8859-1"),"UTF-8");
        }
        catch (Exception e) {
            mp.put("success",false);
            mp.put("msg",e.getMessage());
            e.printStackTrace();
        }
        department.setDeptId(Integer.parseInt(deptid));
        department.setDeptName(deptname);
        department.setManager(deptmanager);
        int count = deptService.updateDept(department);
        try{
            if(count>0)
            {
                mp.put("success",true);
                mp.put("msg","修改部门成功");
            }
        else{
                mp.put("success",false);
                mp.put("msg","OPS！修改部门失败了！");
            }
        }catch (Exception e){
            mp.put("success",false);
            mp.put("msg",e.getMessage());
        }
        return mp;
    }

    @RequestMapping(value = "getAllDepts")
    public String getAllDepts(HttpServletRequest request, HttpServletResponse response,
                            Model model)
    {
        List<Department> departmentList = deptService.getAllDepts();
        model.addAttribute("departmentList",departmentList);
        return "/sysuser/manager_check_dept";
    }

    /**
     * 删除选中的部门，可以批量删除
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping("deleteDepts")
    @ResponseBody
    public Map deleteDepts(HttpServletRequest request, HttpServletResponse response,
                              Model model)
    {
        Map mp = new HashMap();
        String[] deptids = request.getParameterValues("deptid");
        try
        {
            int len = deptService.deleteByIds(deptids);
            if(len>0){
                mp.put("success",true);
                mp.put("msg","删除成功！");
            }
            else
            {
                mp.put("success",false);
                mp.put("msg","OPS！删除部门失败了！");
            }
        }
        catch (Exception e){
            mp.put("success",false);
            mp.put("msg",e.getMessage());
            e.printStackTrace();
        }
        return mp;
    }
}
