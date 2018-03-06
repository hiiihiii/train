package com.train.modules.controller;

import com.train.modules.entity.Employee;
import com.train.modules.service.EmpNeedsService;
import com.train.modules.service.EmployeeService;
import com.train.modules.service.TeacherService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/5/18 0018.
 */
@Controller
@RequestMapping("page/teacher/empneeds")
public class EmpNeedsController {

    @Resource
    private EmpNeedsService empNeedsService;
    @Resource
    private TeacherService teacherService;
    @Resource
    private EmployeeService employeeService;

    @RequestMapping(value = "addscores")
    @ResponseBody
    public Map addScores(HttpServletRequest request, HttpServletResponse response,
                         Model model) {
        Map mp = new HashMap();
        String courseid = request.getParameter("courseid");
        String teacherid = request.getParameter("teacherid");
        ArrayList<Map> scores = new ArrayList<Map>();
        List<Employee> employees = employeeService.getEmpByCourseId(Integer.parseInt(courseid),Integer.parseInt(teacherid));
        for(int i=0;i<employees.size();i++)
        {
            String temp = request.getParameter(""+employees.get(i).getEmpId());
            if(temp!=null&&!(temp.equals(""))){
                Map tem = new HashMap();
                tem.put("empid",employees.get(i).getEmpId());
                tem.put("courseid",Integer.parseInt(courseid));
                tem.put("score",Double.parseDouble(temp));
                tem.put("isscore","1");
                scores.add(tem);
            }
        }
        try{
            int count = empNeedsService.setScoresBat(scores);
            if(count>0)
            {
                mp.put("success",true);
                mp.put("msg","提交成绩成功");
            }
            else
            {
                mp.put("success",false);
                mp.put("msg","OPS！提交成绩失败了！");
            }
        }catch (Exception e)
        {
            mp.put("success",false);
            mp.put("msg",e.getMessage());
        }
        return mp;
    }

    @RequestMapping("teacheckscore")
    public String teacheckscore(HttpServletRequest request, HttpServletResponse response,
                                Model model)
    {
        String teaid = request.getParameter("teaid");
        String courseid = request.getParameter("courseid");
//        List<Map> scores = empNeedsService.checkScores(Integer.parseInt(courseid));
        List<Map> chooseList = teacherService.chooseList(Integer.parseInt(teaid),Integer.parseInt(courseid));
        model.addAttribute("chooseList", chooseList);
        return "teacher/teacher_check_score";
    }
}
