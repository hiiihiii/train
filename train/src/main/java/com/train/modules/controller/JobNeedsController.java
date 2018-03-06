package com.train.modules.controller;

import com.train.modules.entity.Course;
import com.train.modules.entity.Job;
import com.train.modules.entity.JobNeeds;
import com.train.modules.service.CourseService;
import com.train.modules.service.JobNeedsService;
import com.train.modules.service.JobService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * Created by Tanli on 2017/5/7 0007.
 */
@Controller
@RequestMapping("page/jobneeds")
public class JobNeedsController {
    @Resource
    private JobNeedsService jobNeedsService;
    @Resource
    private JobService jobService;
    @Resource
    private CourseService courseService;

    @RequestMapping(value = {"index", ""})
    public String index(HttpServletRequest request, HttpServletResponse response,
                        Model model)
    {
        //List<Job> jobs = jobService.getJobDetail();
        //model.addAttribute("jobs",jobs);
        List<Map> jobs = jobService.getJobDetail();
        model.addAttribute("jobs",jobs);
        return "/sysuser/manager_place_needs";
    }

    @RequestMapping("addIndex")
    public String addIndex(HttpServletRequest request, HttpServletResponse response,
                           Model model)
    {
        String jobid = request.getParameter("jobid");
        Job job = jobService.getJobById(Integer.parseInt(jobid));
        List<Course> courses = courseService.forJobNeed(Integer.parseInt(jobid));
        model.addAttribute("courses",courses);
        model.addAttribute("job",job);
        return "/sysuser/manager_add_place_needs";
    }

    /**
     * 实现真正的添加
     * @param request
     * @param response
     * @param model
     * @param jobNeeds
     * @return
     */
    @RequestMapping("addJobNeeds")
    public String addJobNeeds(HttpServletRequest request, HttpServletResponse response,
                              Model model, JobNeeds jobNeeds)
    {
        String msg = "";
        String jobid = request.getParameter("jobid");
        String courseid = request.getParameter("courseid");
        jobNeeds.setJobId(Integer.parseInt(jobid));
        jobNeeds.setCourseId(Integer.parseInt(courseid));
        int count = jobNeedsService.insertJobNeed(jobNeeds);
        if(count>0)
            msg="添加成功";
        else
            msg="ops！添加岗位需求失败！";
        return msg;
    }

    /**
     * 实现真正的删除
     * @param request
     * @param response
     * @param model
     * @param jobNeeds
     * @return
     */
    @RequestMapping("deleteJobNeeds")
    public String deleteJobNeeds(HttpServletRequest request, HttpServletResponse response,
                                 Model model, JobNeeds jobNeeds)
    {
        String msg = "";
        String temp = "";
        temp = request.getParameter("jobid");
        int jobid = Integer.parseInt(temp);
        temp = request.getParameter("courseid");
        int courseid = Integer.parseInt(temp);
        int count = jobNeedsService.deleteByIds(jobid,courseid);
        if(count>0)
            msg = "删除成功";
        else
            msg = "ops！删除岗位需求失败！";
        return msg;
    }

    @RequestMapping("editIndex")
    public String editIndex(HttpServletRequest request,HttpServletResponse response,
                            Model model)
    {
        String jobid = request.getParameter("jobid");
        List<Map> job_course = jobNeedsService.getByJobId(Integer.parseInt(jobid));
        model.addAttribute("jobcourses",job_course);
        model.addAttribute("jobid",jobid);
        return "/sysuser/manager_edit_place_needs";
    }

    @RequestMapping("checkJobNeeds")
    public String chechJobNeeds(HttpServletRequest request, HttpServletResponse response,
                                Model model)
    {
        String jobid = request.getParameter("jobid");
        List<Map> job_courses = jobNeedsService.getByJobId(Integer.parseInt(jobid));
        model.addAttribute("jobcourses",job_courses);
        return "/sysuser/manager_check_place_needs";
    }
}
