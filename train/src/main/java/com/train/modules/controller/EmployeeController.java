package com.train.modules.controller;

import com.train.modules.entity.Course;
import com.train.modules.entity.Department;
import com.train.modules.entity.EmpNeeds;
import com.train.modules.entity.Employee;
import com.train.modules.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Tanli on 2017/4/20 0020.
 */
@Controller
@RequestMapping(value = {"page/employee"})
public class EmployeeController {

    @Resource
    private EmployeeService employeeService;
    @Resource
    private JobNeedsService jobNeedsService;
    @Resource
    private CourseService courseService;
    @Resource
    private EmpNeedsService empNeedsService;
    @Resource
    private DeptService deptService;

    @ModelAttribute
    public Employee get(@RequestParam(required = false) String userId) {
        Employee employee = null;
        if (userId != null && !(userId.equals(""))) {
            employee = employeeService.getEmpByEmpId(userId);
        } else
            employee = new Employee();
        return employee;
    }

    /**
     * 保存修改的个人信息
     *
     * @param request
     * @param response
     * @param model
     */
    @RequestMapping(value = "save")
    @ResponseBody
    public Map save(HttpServletRequest request, HttpServletResponse response,
                    Model model, Employee employee) throws ParseException {
        Map mp = new HashMap();
        String empid = request.getParameter("empid");
        employee.setEmpId(Integer.parseInt(empid));
        employee.setPsw(request.getParameter("psw"));
        employee.setEmpName(request.getParameter("empname"));
        employee.setIdNum(request.getParameter("idnum"));
        employee.setEmpSex(request.getParameter("EmpSex"));
        employee.setMarriage(request.getParameter("Marriage"));
        employee.setNation(request.getParameter("nation"));
        employee.setBirthPlace(request.getParameter("birthplace"));
        employee.setAddress(request.getParameter("address"));
        employee.setTelephone(request.getParameter("telephone"));
        employee.setEmail(request.getParameter("email"));
        //入职时间的转换
        String entrytime = request.getParameter("entrytime");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        employee.setEntryTime(sdf.parse(entrytime));
        int count = employeeService.updateEmp(employee);
        if (count != 0) {
            mp.put("success", true);
            mp.put("msg", "修改成功");
        } else {
            mp.put("success", false);
            mp.put("msg", "OPS！修改失败了！");
        }
        return mp;
    }

    /**
     * 查看个人信息
     *
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "info")
    public String info(HttpServletRequest request, HttpServletResponse response,
                       Model model, Employee employee) {
        model.addAttribute("empid", employee.getEmpId());
        model.addAttribute("psw", employee.getPsw());
        model.addAttribute("empname", employee.getEmpName());
        model.addAttribute("idnum", employee.getIdNum());
        model.addAttribute("empsex", employee.getEmpSex());
        model.addAttribute("marriage", employee.getMarriage());
        model.addAttribute("nation", employee.getNation());//民族
        model.addAttribute("birthplace", employee.getBirthPlace());
        model.addAttribute("address", employee.getAddress());
        model.addAttribute("telephone", employee.getTelephone());
        model.addAttribute("email", employee.getEmail());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        model.addAttribute("entrytime", sdf.format(employee.getEntryTime()));//入职时间
        return "employee/staff_personal_info";
    }

    /**
     * 学期选课
     *
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "selection")
    public String selection(HttpServletRequest request, HttpServletResponse response, Model model) {
        //需要获取岗位需求
        String deptid = request.getParameter("deptid");
        String empid = request.getParameter("userId");
        List<Map> jobneedsdetails = jobNeedsService.getJobNeedsDetail(Integer.parseInt(deptid), Integer.parseInt(empid));
        model.addAttribute("jobneedsdetails", jobneedsdetails);
        model.addAttribute("empid", empid);
        return "employee/staff_term_selection";
    }

    @RequestMapping("addEmpNeeds")
    @ResponseBody
    public Map addEmpNeeds(HttpServletRequest request, HttpServletResponse response,
                           Model model, EmpNeeds empNeeds) {
        Map mp = new HashMap();
        String empid = request.getParameter("empid");
        String courseid = request.getParameter("courseid");
        String jobid = request.getParameter("jobid");
        empNeeds.setEmpId(Integer.parseInt(empid));
        empNeeds.setCourseId(Integer.parseInt(courseid));
        empNeeds.setJobId(Integer.parseInt(jobid));
        Course course = courseService.getCourseById(Integer.parseInt(courseid));
        empNeeds.setTerm(course.getDuration());
        empNeeds.setScore(0);
        empNeeds.setIsScore("0");
        try {
            int count = empNeedsService.insertEmpNeeds(empNeeds);
            if (count > 0) {
                mp.put("success", true);
                mp.put("msg", "选课成功");
            } else {
                mp.put("success", false);
                mp.put("msg", "OPS！选课失败了！");
            }
        } catch (Exception e) {
            mp.put("msg", e.getMessage());
        }
        return mp;
    }

    /**
     * 查看学期选课
     *
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "checkSelection")
    public String checkSelection(HttpServletRequest request, HttpServletResponse response, Model model) {
        //获取个人培训计划
        String empid = request.getParameter("userId");
        List<Map> empNeedsdetails = empNeedsService.getEmpNeedsDetail(Integer.parseInt(empid));
        model.addAttribute("empNeedsdetails", empNeedsdetails);
        return "employee/staff_check_selection";
    }

    /**
     * 员工查询培训课程成绩
     *
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "queryScore")
    public String queryScore(HttpServletRequest request, HttpServletResponse response, Model model) {
        //获取个人培训计划，评价等信息
        //因为需要根据员工是否评价来决定是否显示成绩
        //如果没有评价，不显示成绩；评价之后才显示成绩
        String temp = request.getParameter("userId");
        int empid = Integer.parseInt(temp);
        List<Map> scores = empNeedsService.checkScore(empid);
        model.addAttribute("scores", scores);
        return "employee/staff_query_score";
    }

    /**
     * @param request
     * @param response
     * @param model
     * @param department, 这个参数必须有，否则jsp中加载不出部门信息
     * @return
     */
    @RequestMapping("addindex")
    public String addindex(HttpServletRequest request, HttpServletResponse response,
                           Model model, Department department) {
        List<Department> departments = deptService.getAllDepts();
        model.addAttribute("departments", departments);
        return "sysuser/manager_add_staff";
    }

    @RequestMapping("addstaff")
    @ResponseBody
    public Map addstaff(HttpServletRequest request, HttpServletResponse response,
                        Model model, Employee employee) {
        Map mp = new HashMap();
        String empname = request.getParameter("empname");
        String idnum = request.getParameter("idnum");
        String empsex = request.getParameter("sex");
        String marriage = request.getParameter("marriage");
        String nation = request.getParameter("nation");
        String birthplace = request.getParameter("birthplace");
        String address = request.getParameter("address");
        String telephone = request.getParameter("telephone");
        String email = request.getParameter("email");
        String entrytimetemp = request.getParameter("entrytime");
        Date entrytime = new Date();
        int deptid = 0;
        String deptidtemp = request.getParameter("DeptId");
        try {
            empname = new String(empname.getBytes("iso-8859-1"), "utf-8");
            idnum = new String(idnum.getBytes("iso-8859-1"), "utf-8");
            empsex = new String(empsex.getBytes("iso-8859-1"),"utf-8");
            marriage = new String(marriage.getBytes("iso-8859-1"), "utf-8");
            nation = new String(nation.getBytes("iso-8859-1"), "utf-8");
            birthplace = new String(birthplace.getBytes("iso-8859-1"), "utf-8");
            address = new String(address.getBytes("iso-8859-1"), "utf-8");
            telephone = new String(telephone.getBytes("iso-8859-1"), "utf-8");
            email = new String(email.getBytes("iso-8859-1"), "utf-8");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            entrytime = sdf.parse(entrytimetemp);
            deptid = Integer.parseInt(deptidtemp);
        } catch (Exception e) {
            mp.put("success", false);
            mp.put("msg", e.getMessage());
        }
        employee.setEmpName(empname);
        employee.setEmpSex(empsex);
        employee.setPsw("123456");
        employee.setMarriage(marriage);
        employee.setEmail(email);
        employee.setEntryTime(entrytime);
        employee.setAddress(address);
        employee.setIdNum(idnum);
        employee.setBirthPlace(birthplace);
        employee.setDeptId(deptid);
        employee.setTelephone(telephone);
        employee.setNation(nation);
        try {
            int count = employeeService.insertEmp(employee);
            if (count > 0) {
                mp.put("success", true);
                mp.put("msg", "添加员工成功");
            } else {
                mp.put("success", false);
                mp.put("msg", "OPS！添加员工失败！");
            }
        } catch (Exception e) {
            mp.put("success", false);
            mp.put("msg", e.getMessage());
        }
        return mp;
    }

    @RequestMapping("deleteindex")
    public String deleteindex(HttpServletRequest request, HttpServletResponse response,
                              Model model)
    {
        List<Employee> employees = employeeService.getAllEmp();
        model.addAttribute("employees",employees);
        return "sysuser/manager_del_staff";
    }

    @RequestMapping("deleteEmpBat")
    @ResponseBody
    public Map deleteEmpBat(HttpServletRequest request, HttpServletResponse response,
                            Model model){
        Map mp = new HashMap();
        String[] empids = request.getParameterValues("empid");
        try{
            int count = employeeService.deleteByEmpIds(empids);
            if(count>0){
                mp.put("success",true);
                mp.put("msg","删除员工成功");
            }
            else{
                mp.put("success",false);
                mp.put("msg","OPS！删除员工失败了！");
            }
        }
        catch (Exception e){
            mp.put("success",false);
            mp.put("msg",e.getMessage());
            e.printStackTrace();
        }
        return mp;
    }

    @RequestMapping("editindex")
    public String editindex(HttpServletRequest request, HttpServletResponse response,
                            Model model)
    {
        List<Employee> employees = employeeService.getAllEmp();
        model.addAttribute("employees",employees);
        return "sysuser/manager_edit_staff";
    }
    @RequestMapping("editloadinfo")
    public String editloadinfo(HttpServletRequest request, HttpServletResponse response,
                               Model model, Employee employee){
        String empid = request.getParameter("empid");
        employee = employeeService.getEmpByEmpId(empid);
        List<Department> departments = deptService.getAllDepts();
        model.addAttribute("departments",departments);
        model.addAttribute("employee",employee);
        return "sysuser/manager_edit_res_staff";
    }

    @RequestMapping("checkstaff")
    public String checkstaff(HttpServletRequest request, HttpServletResponse response,
                             Model model)
    {
        List<Employee> employees = employeeService.getAllEmp();
        model.addAttribute("employees",employees);
        return "sysuser/manager_check_staff";
    }
}