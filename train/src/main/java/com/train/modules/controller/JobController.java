package com.train.modules.controller;

import com.train.modules.entity.Department;
import com.train.modules.entity.Job;
import com.train.modules.service.DeptService;
import com.train.modules.service.JobService;
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
@RequestMapping(value = "page/job")
public class JobController {
    @Resource
    private JobService jobService;
    @Resource
    private DeptService deptService;

    @RequestMapping(value = {"index",""})
    public String index(HttpServletRequest request, HttpServletResponse response,
                      Model model)
    {
        List<Department> departmentList = deptService.getAllDepts();
        model.addAttribute("departmentList",departmentList);
        return "sysuser/manager_place";
    }

    @RequestMapping(value = "addJobIndex")
    public String addJodIndex(HttpServletRequest request, HttpServletResponse response,
                              Model model)
    {
        String deptid = request.getParameter("deptid");
        Department department = deptService.getOneDept(Integer.parseInt(deptid));
        model.addAttribute("department",department);
        return "/sysuser/manager_add_place";
    }

    @RequestMapping("addjob")
    public String addJob(HttpServletRequest request, HttpServletResponse response,
                         Model model, Job job)
    {
        String msg = "";
        String deptid = request.getParameter("deptid");
        String jobname = request.getParameter("jobname");
        String jobintro = request.getParameter("jobintro");
        try
        {
            jobname = new String(jobname.getBytes("ISO-8859-1"),"UTF-8");
            jobintro = new String(jobintro.getBytes("ISO-8859-1"),"UTF-8");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        job.setDeptId(Integer.parseInt(deptid));
        job.setJobIntro(jobintro);
        job.setJobName(jobname);
        int count = jobService.insertJob(job);
        if(count>0)
            msg = "添加成功";
        else
            msg = "ops！出错了！";
        return msg;
    }

    @RequestMapping("updateJobIndex")
    public String updateJobIndex(HttpServletRequest request, HttpServletResponse response,
                                 Model model)
    {
        String deptid = request.getParameter("deptid");
        String deptname = request.getParameter("deptname");
        List<Job> jobs = jobService.getJobByDeptId(Integer.parseInt(deptid));
        try {
            deptname= new String(deptname.getBytes("ISO-8859-1"),"UTF-8");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        model.addAttribute("jobs",jobs);
        model.addAttribute("deptname",deptname);
        model.addAttribute("deptid",deptid);
        Department department = deptService.getOneDept(Integer.parseInt(deptid));
        return "/sysuser/manager_edit_place";
    }

    @RequestMapping("updateLoad")
    public String updateLoad(HttpServletRequest request, HttpServletResponse response,
                             Model model)
    {
        String jobid = request.getParameter("jobid");
        Job job = jobService.getJobById(Integer.parseInt(jobid));
        model.addAttribute("job",job);
        return "/sysuser/manager_edit_res_place";
    }

    @RequestMapping(value = "updateJob")
    public String updateJob(HttpServletRequest request, HttpServletResponse response,
                            Model model, Job job)
    {
        String msg = "";
        String jobid = request.getParameter("jobid");
        String jobname = request.getParameter("jobname");
        String jobintro = request.getParameter("jobintro");
        //处理中文乱码
        try {
            jobname = new String(jobname.getBytes("ISO-8859-1"),"UTF-8");
            jobintro = new String(jobintro.getBytes("ISO-8859-1"),"UTF-8");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        job.setJobId(Integer.parseInt(jobid));
        job.setJobName(jobname);
        job.setJobIntro(jobintro);
        int count = jobService.updateJob(job);
        if(count>0)
            msg = "编辑成功";
        else
            msg = "ops！编辑失败了！";
        return msg;
    }

    @RequestMapping("deleteJobIndex")
    public String deleteJobIndex(HttpServletRequest request, HttpServletResponse response,
                                 Model model)
    {
        String deptid = request.getParameter("deptid");
        List<Job> jobs = jobService.getJobByDeptId(Integer.parseInt(deptid));
        model.addAttribute("jobs",jobs);
        model.addAttribute("depeid",deptid);
        Department department = deptService.getOneDept(Integer.parseInt(deptid));
        return "/sysuser/manager_del_place";
    }

    @RequestMapping("checkJobs")
    public String checkJobs(HttpServletRequest request, HttpServletResponse response,
                            Model model)
    {
        String deptid = request.getParameter("deptid");
        String deptname = request.getParameter("deptname");
        //处理中文乱码
        try {
            deptname= new String(deptname.getBytes("ISO-8859-1"),"UTF-8");
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Job> jobs = jobService.getJobByDeptId(Integer.parseInt(deptid));
        model.addAttribute("jobs",jobs);
        model.addAttribute("deptname",deptname);
        return "/sysuser/manager_check_place";
    }

    @RequestMapping("deleteJobBat")
    @ResponseBody
    public Map deleteJobs(HttpServletRequest request, HttpServletResponse response,
                          Model model)
    {
        Map mp = new HashMap();
        String[] jobids = request.getParameterValues("jobid");
        try{
            int count = jobService.deleteByIds(jobids);
            if(count>0){
                mp.put("success",true);
                mp.put("msg","删除岗位成功");
            }
            else{
                mp.put("success",false);
                mp.put("msg","OPS！删除岗位失败了！");
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
