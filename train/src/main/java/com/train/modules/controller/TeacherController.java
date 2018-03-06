package com.train.modules.controller;

import com.train.modules.dao.DeptDao;
import com.train.modules.entity.Course;
import com.train.modules.entity.Teacher;
import com.train.modules.service.CourseService;
import com.train.modules.service.EmployeeService;
import com.train.modules.service.TeacherService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Tanli on 2017/4/17 0017.
 */
@Controller
@RequestMapping(value = "page/teacher")
public class TeacherController {

    @Resource
    private TeacherService teacherService;
    @Resource
    private CourseService courseService;
    @Resource
    private EmployeeService employeeService;
    @Resource
    private DeptDao deptDao;

    @ModelAttribute
    public Teacher get(@RequestParam(required = false) String teaId) {
        Teacher teacher = null;
        if (teaId != null && !(teaId.equals(""))) {
            teacher = teacherService.getTeacherById(Integer.parseInt(teaId));
        } else
            teacher = new Teacher();
        return teacher;
    }

    /**
     * 教师查看个人信息
     *
     * @param request
     * @param response
     * @param model
     * @param teacher
     * @return
     */
    @RequestMapping(value = "info")
    public String info(HttpServletRequest request, HttpServletResponse response,
                       Model model, Teacher teacher) {
        model.addAttribute("teaid", teacher.getTeacherId());
        model.addAttribute("psw", teacher.getPsw());
        model.addAttribute("teaname", teacher.getTeaName());
        model.addAttribute("idnum", teacher.getIdNum());
        model.addAttribute("teasex", teacher.getTeaSex());
        model.addAttribute("title", teacher.getTitle());
        model.addAttribute("intro", teacher.getIntro());
        return "teacher/teacher_personal_info";
    }

    /**
     * 教师查看课程
     *
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "course")
    public String course(HttpServletRequest request, HttpServletResponse response,
                         Model model) {
        String teaid = request.getParameter("teaId");
        List<Course> courses = courseService.getCourseByTeaId(Integer.parseInt(teaid));
        model.addAttribute("courses", courses);
        return "teacher/teacher_check_course";
    }

    /**
     * index，提交成绩的时候首先要获取选课名单
     *
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "setscoreindex")
    public String setScore(HttpServletRequest request, HttpServletResponse response,
                           Model model) {
        String teaid = request.getParameter("teaId");
        List<Course> courses = courseService.getCourseByTeaId(Integer.parseInt(teaid));
        model.addAttribute("courses", courses);
        model.addAttribute("teaid", teaid);
        return "teacher/teacher_submit_score";
    }

    /**
     * 用于提交某个具体课程的成绩，在提交成绩之前必须先获取这门课的选课名单
     *
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "submitScore_empList")
    public String submitScore(HttpServletRequest request, HttpServletResponse response,
                              Model model, Teacher teacher) {
        String temp = request.getParameter("teaid");
        int teaid = Integer.parseInt(temp);
        temp = request.getParameter("courseid");
        int courseid = Integer.parseInt(temp);
        List<Map> chooseList = teacherService.chooseList(teaid, courseid);
        model.addAttribute("chooselist", chooseList);
        model.addAttribute("teaid",teaid);
        return "teacher/teacher_submit_modify_score";
    }

    /**
     * 保存修改的信息
     *
     * @param request
     * @param response
     * @param model
     * @param teacher
     * @return
     */
    @RequestMapping(value = "save")
    @ResponseBody
    public Map save(HttpServletRequest request, HttpServletResponse response,
                    Model model, Teacher teacher) {
        Map map = new HashMap();
        String teaid = request.getParameter("teaid");
        teacher.setTeacherId(Integer.parseInt(teaid));
        teacher.setPsw(request.getParameter("psw"));
        teacher.setTeaName(request.getParameter("teaname"));
        teacher.setIdNum(request.getParameter("idnum"));
        teacher.setTeaSex(request.getParameter("TeaSex"));
        teacher.setTitle(request.getParameter("Title"));
        teacher.setIntro(request.getParameter("intro"));
        try {
            int count = teacherService.updateTeacher(teacher);
            if (count > 0) {
                map.put("success", true);
                map.put("msg", "修改成功");
            } else {
                map.put("success", false);
                map.put("msg", "OPS！修改信息失败了！");
            }
        } catch (Exception e) {
            map.put("msg", e.getMessage());
        }
        return map;
    }

    /**
     * 获取选课名单
     *
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping(value = "chooseList")
    public String getChooseList(HttpServletRequest request, HttpServletResponse response,
                                Model model) {
        String courseid = request.getParameter("courseid");
        String teaid = request.getParameter("teaid");
        List<Map> details = teacherService.chooseList(Integer.parseInt(teaid), Integer.parseInt(courseid));
        model.addAttribute("chooselist", details);
        model.addAttribute("teaid",teaid);
        return "teacher/teacher_choose_course_staff";
    }

    @RequestMapping("addteacher")
    @ResponseBody
    public Map addteacher(HttpServletRequest request, HttpServletResponse response,
                          Model model, Teacher teacher) {
        Map mp = new HashMap();
        String teaname = request.getParameter("teaname");
        String teasex = request.getParameter("sex");
        String birth_date = request.getParameter("birth_date");
        Date birthdate = new Date();
        String title = request.getParameter("title");
        String teaintro = request.getParameter("teaintro");
        try {
            teaname = new String(teaname.getBytes("ISO-8859-1"), "UTF-8");
            teasex = new String(teasex.getBytes("iso-8859-1"),"utf-8");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            birthdate = sdf.parse(birth_date);
            title = new String(title.getBytes("ISO-8859-1"), "utf-8");
            teaintro = new String(teaintro.getBytes("iso-8859-1"), "utf-8");
        } catch (Exception convert) {
            mp.put("success", false);
            mp.put("msg", convert.getMessage());
        }
        teacher.setTeaName(teaname);
        teacher.setTeaSex(teasex);
        teacher.setBirthDate(birthdate);
        teacher.setIdNum("");
        teacher.setTitle(title);
        teacher.setIntro(teaintro);
        teacher.setPsw("123456");
        try {
            int count = teacherService.insertTeacher(teacher);
            if (count > 0) {
                mp.put("success", true);
                mp.put("msg", "添加教师成功");
            } else {
                mp.put("success", false);
                mp.put("msg", "OPS！添加教师失败了！");
            }
        } catch (Exception e) {
            mp.put("success", false);
            mp.put("msg", e.getMessage());
        }
        return mp;
    }

    @RequestMapping(value = "deleteIndex")
    public String deleteIndex(HttpServletRequest request, HttpServletResponse response,
                              Model model) {
        List<Teacher> teachers = teacherService.getAllTeacher();
        model.addAttribute("teachers", teachers);
        return "sysuser/manager_del_teacher";
    }

    @RequestMapping("deleteTeaBat")
    @ResponseBody
    public Map deleteBat(HttpServletRequest request, HttpServletResponse response,
                         Model model){
        Map mp = new HashMap();
        String teacherids[] = request.getParameterValues("teacherid");
        try {
            int count = teacherService.deleteTeaBat(teacherids);
            if(count>0){
                mp.put("success",true);
                mp.put("mag","删除教师成功");
            }
            else
            {
                mp.put("success",false);
                mp.put("mag","OPS！删除教师失败了！");
            }
        }
        catch (Exception e)
        {
            mp.put("success",false);
            mp.put("mag",e.getMessage());
            e.printStackTrace();
        }
        return mp;
    }

    @RequestMapping("editIndex")
    public String editIndex(HttpServletRequest request, HttpServletResponse response,
                            Model model) {
        List<Teacher> teachers = teacherService.getAllTeacher();
        model.addAttribute("teachers", teachers);
        return "sysuser/manager_edit_teacher";
    }

    @RequestMapping("loaddetail")
    public String loaddetail(HttpServletRequest request, HttpServletResponse response,
                             Model model) {
        String teaid = request.getParameter("teaid");
        Teacher teacher = teacherService.getTeacherById(Integer.parseInt(teaid));
        model.addAttribute("teacher", teacher);
        return "sysuser/manager_edit_res_teacher";
    }

    @ResponseBody
    @RequestMapping("edit")
    public Map edit(HttpServletRequest request, HttpServletResponse response,
                    Model model, Teacher teacher)
    {
        Map mp = new HashMap();
        String teaid = request.getParameter("teaid");
        String teaname = request.getParameter("teaname");
        String sex = request.getParameter("TeaSex");
        String birth_date = request.getParameter("birth_date");
        Date birthdate = new Date();
        String title = request.getParameter("Title");
        String teaintro = request.getParameter("teaintro");
        try {
            teaname = new String(teaname.getBytes("iso-8859-1"),"utf-8");
            sex = new String(sex.getBytes("iso-8859-1"),"utf-8");
            title = new String(title.getBytes("iso-8859-1"),"utf-8");
            teaintro = new String(teaintro.getBytes("iso-8859-1"),"utf-8");
            //日期格式转换
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            birthdate = sdf.parse(birth_date);
        }
        catch (Exception e){
            mp.put("success",false);
            mp.put("msg", e.getMessage());
        }
        teacher.setTeacherId(Integer.parseInt(teaid));
        teacher.setTeaName(teaname);
        teacher.setTeaSex(sex);
        teacher.setTitle(title);
        teacher.setBirthDate(birthdate);
        teacher.setIntro(teaintro);
        try{
            int count = teacherService.updateBySys(teacher);
            if(count>0)
            {
                mp.put("success",true);
                mp.put("msg","修改成功");
            }
            else
            {
                mp.put("success",false);
                mp.put("msg","OPS！修改教师信息失败了！");
            }
        }catch (Exception e)
        {
            mp.put("success",false);
            mp.put("msg",e.getMessage());
        }
        return mp;
    }

  @RequestMapping("checkTeachers")
    public String checkTeachers(HttpServletRequest request, HttpServletResponse response,
                                Model model)
    {
        List<Teacher> teachers = teacherService.getAllTeacher();
        model.addAttribute("teachers",teachers);
        return "sysuser/manager_check_teacher";
    }
}