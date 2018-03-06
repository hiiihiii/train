package com.train.modules.controller;

import com.train.modules.entity.Course;
import com.train.modules.entity.Teacher;
import com.train.modules.service.CourseService;
import com.train.modules.service.TeacherService;
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
 * Created by Tanli on 2017/4/13 0013.
 */
@Controller
@RequestMapping("page/sysuser/course")
public class CourseController {

    @Resource
    private CourseService courseService;
    @Resource
    private TeacherService teacherService;

//    @ModelAttribute
//    public Course get(@RequestParam(required = false) String courseid){
//        Course course = new Course();
//        if(courseid!=null&&!(courseid.equals("")))
//        {
//            course = courseService.getCourseById(Integer.parseInt(courseid));
//        }
//        return course;
//    }

    @RequestMapping("addindex")
    public String getTeachers(HttpServletRequest request, HttpServletResponse response,
                              Model model, Teacher teacher)
    {
        List<Teacher> teachers = teacherService.getAllTeacher();
        model.addAttribute("teachers",teachers);
        return "sysuser/manager_add_course";
    }

    @RequestMapping("addcourse")
    @ResponseBody
    public Map addcourse(HttpServletRequest request, HttpServletResponse response,
                         Model model, Course course)
    {
        Map mp = new HashMap();
        String coursename = request.getParameter("coursename");
        String credittemp = request.getParameter("credit");
        String coursetype  = request.getParameter("coursetype");
        String location = request.getParameter("location");
        String duration = request.getParameter("duration");
        String temp = request.getParameter("TeacherId");
        int teacherid = 0, credit = 0;
        try{
            coursename = new String(coursename.getBytes("iso-8859-1"),"utf-8");
            coursetype = new String(coursetype.getBytes("iso-8859-1"),"utf-8");
            location = new String(location.getBytes("iso-8859-1"),"utf-8");
            duration = new String(duration.getBytes("iso-8859-1"),"utf-8");
            teacherid = Integer.parseInt(temp);
            credit = Integer.parseInt(credittemp);
        }
        catch (Exception convert)
        {
            mp.put("success",false);
            mp.put("msg",convert.getMessage());
        }
        course.setTeacherId(teacherid);
        course.setCourseName(coursename);
        course.setCredit(credit);
        course.setCourseType(coursetype);
        course.setLocation(location);
        course.setDuration(duration);
        try{
            int count = courseService.insertCourse(course);
            if(count>0) {
                mp.put("success", true);
                mp.put("msg", "增加课程成功");
            }
            else{
                mp.put("success", false);
                mp.put("msg", "OPS！增加课程失败了！");
            }
        }catch (Exception e){
            mp.put("success", false);
            mp.put("msg", e.getMessage());
        }
        return mp;
    }

    @RequestMapping("editindex")
    public String editindex(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        List<Map> coursedetails = courseService.getCourseDetail();
        model.addAttribute("courses", coursedetails);
        return "sysuser/manager_edit_course";
    }

    @RequestMapping("editloadinfo")
    public String editloadinfo(HttpServletRequest request, HttpServletResponse response,
                               Model model, Course course)
    {
        String courseid = request.getParameter("courseid");
        course = courseService.getCourseById(Integer.parseInt(courseid));
        model.addAttribute("course",course);
        List<Teacher> teachers = teacherService.getAllTeacher();
        model.addAttribute("teachers",teachers);
        return "sysuser/manager_edit_res_course";
    }

    @RequestMapping("editcourse")
    @ResponseBody
    public Map edit(HttpServletRequest request, HttpServletResponse response, Model model,
                       Course course)
    {
        Map mp = new HashMap();
        String courseid = request.getParameter("courseid");
        String coursename = request.getParameter("coursename");
        String credittemp = request.getParameter("credit");
        int credit  = 0;
        String coursetype = request.getParameter("CourseType");
        String location = request.getParameter("location");
        String duration = request.getParameter("duration");
        String teacherid = request.getParameter("TeacherId");
        try{
            coursename = new String(coursename.getBytes("iso-8859-1"),"utf-8");
            credit = Integer.parseInt(credittemp);
            coursetype = new String(coursetype.getBytes("iso-8859-1"),"utf-8");
            location = new String(location.getBytes("iso-8859-1"),"utf-8");
            duration = new String(duration.getBytes("iso-8859-1"),"utf-8");
        }catch (Exception e){
            mp.put("success",false);
            mp.put("msg",e.getMessage());
        }
        course.setCourseId(Integer.parseInt(courseid));
        course.setCourseName(coursename);
        course.setCourseType(coursetype);
        course.setLocation(location);
        course.setCredit(credit);
        course.setDuration(duration);
        course.setTeacherId(Integer.parseInt(teacherid));
        try{
            int count = courseService.updateCourse(course);
            if(count>0)
            {
                mp.put("success",true);
                mp.put("msg","修改成功");
            }
            else
            {
                mp.put("success",false);
                mp.put("msg","OPS！修改失败了！");
            }
        }catch (Exception e){
            mp.put("success",false);
            mp.put("msg",e.getMessage());
        }
        return mp;
    }

    @RequestMapping("deleteindex")
    public String deleteindex(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        List<Map> coursedetails = courseService.getCourseDetail();
        model.addAttribute("courses", coursedetails);
        return "sysuser/manager_del_course";
    }

    @RequestMapping("deleteByCourseids")
    @ResponseBody
    public Map deleteCourseBat(HttpServletResponse response, HttpServletRequest request,
                               Model model){
        Map mp = new HashMap();
        String[] courseids = request.getParameterValues("courseid");
        try{
            int count = courseService.deleteByCourseIds(courseids);
            if(count>0){
                mp.put("success",true);
                mp.put("msg","删除课程成功");
            }
            else
            {
                mp.put("success",false);
                mp.put("msg","OPS！删除课程失败了！");
            }
        }
        catch (Exception e){
            mp.put("success",false);
            mp.put("msg",e.getMessage());
            e.printStackTrace();
        }
        return mp;
    }

    @RequestMapping("syscheckcourse")
    public String checkcourse(HttpServletRequest request, HttpServletResponse response, Model model)
    {
        List<Map> coursedetails = courseService.getCourseDetail();
        model.addAttribute("courses", coursedetails);
        return "sysuser/manager_check_course";
    }


}
