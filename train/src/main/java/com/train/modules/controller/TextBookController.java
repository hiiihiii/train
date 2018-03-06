package com.train.modules.controller;

import com.train.modules.entity.Course;
import com.train.modules.entity.TextBook;
import com.train.modules.service.CourseService;
import com.train.modules.service.TextBookService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Tanli on 2017/5/8 0008.
 */
@Controller
@RequestMapping(value = "page/teacher/textbook")
public class TextBookController {

    @Resource
    private TextBookService textBookService;
    @Resource
    private CourseService courseService;

    @ModelAttribute
    public Course get(@RequestParam(required = false) String courseid)
    {
        Course course = null;
        if(courseid!=null&&!(courseid.equals("")))
        {
            course = courseService.getCourseById(Integer.parseInt(courseid));
        }
        else
            course = new Course();
        return course;
    }

    @RequestMapping(value = {"index",""})
    public String index(HttpServletRequest request, HttpServletResponse response,
                        Model model, Course course)
    {
        model.addAttribute("course",course);
        return "teacher/teacher_submit_book";
    }

    @RequestMapping(value = "addbook")
    @ResponseBody
    public Map addBook(HttpServletRequest request, HttpServletResponse response,
                       Model model, TextBook textBook)
    {
        Map map = new HashMap();
        String bookname = request.getParameter("bookname");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        String version = request.getParameter("version");
        String publish_date = request.getParameter("publish_date");
        String price = request.getParameter("price");
        String temp = request.getParameter("courseid");
        int courseid = Integer.parseInt(temp);
        textBook.setBookId(courseid);
        textBook.setBookName(bookname);
        textBook.setAuthor(author);
        textBook.setPublisher(publisher);
        textBook.setVersion(version);
        textBook.setDatePub(publish_date);
        textBook.setPrice(Double.parseDouble(price));
        try {
            int count1 = textBookService.insertBook(textBook);
            int count2 = courseService.setBook(courseid, textBook.getBookId());
            if(count1>0&&count2>0)
            {
                map.put("success",true);
                map.put("msg","添加教材成功");

            }
            else
            {
                map.put("success",false);
                map.put("msg","OPS！添加教材失败了！");

            }
        }catch (Exception e){
            map.put("msg",e.getMessage());
        }
        return map;
    }

    @RequestMapping("editform")
    public String editform(HttpServletRequest request, HttpServletResponse response,
                           Model model)
    {
        String courseid = request.getParameter("courseid");
        TextBook textBook = textBookService.getByBookid(Integer.parseInt(courseid));
        model.addAttribute("textbook", textBook);
        return "/teacher/teacher_modify_book";
    }

    @RequestMapping("updatesave")
    @ResponseBody
    public Map updatebook(HttpServletRequest request,HttpServletResponse response,
                          Model model, TextBook textBook)
    {
        Map map = new HashMap();
        String bookname = request.getParameter("bookname");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        String version = request.getParameter("version");
        String publish_date = request.getParameter("publish_date");
        String price = request.getParameter("price");
        String temp = request.getParameter("courseid");
        int courseid = Integer.parseInt(temp);
        textBook.setBookId(courseid);
        textBook.setBookName(bookname);
        textBook.setAuthor(author);
        textBook.setPublisher(publisher);
        textBook.setVersion(version);
        textBook.setDatePub(publish_date);
        textBook.setPrice(Double.parseDouble(price));
        try{
            int count = textBookService.updateBook(textBook);
            if(count>0)
            {
                map.put("success",true);
                map.put("msg","修改成功");
            }
            else
            {
                map.put("success",false);
                map.put("msg","OPS！修改教材失败了！");
            }

        }catch (Exception e){
            map.put("msg",e.getMessage());
        }
        return map;
    }
}
