package com.train.modules.service;

import com.train.modules.dao.CourseDao;
import com.train.modules.entity.Course;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by Tanli on 2017/4/13 0013.
 */
@Service
public class CourseService {

    @Resource
    private CourseDao courseDao;

    /**
     * 增加一门课程
     * @param course
     * @return
     */
    public int insertCourse(Course course)
    {
        return courseDao.insertCourse(course);
    }

    /**
     * 通过课程编号删除一门课程
     * @param id
     * @return
     */
    public int deleteByCourseId(int id)
    {
        return courseDao.deleteByCourseId(id);
    }

    /**
     * 更新课程信息
     * @param course
     * @return
     */
    public int updateCourse(Course course)
    {
        return courseDao.updateCourse(course);
    }

    /**
     * 根据课程编号查询课程信息
     * @param id
     * @return
     */
    public Course getCourseById(int id)
    {
        return courseDao.getCourseById(id);
    }

    /**
     * 获取所有课程信息
     * @return
     */
    public List<Course> getAllCourse()
    {
        return courseDao.getAllCourse();
    }

    /**
     * 为添加岗位需求获取课程信息，即在岗位需求中的课程就不加载
     * @param jobid: 岗位id
     * @return
     */
    public List<Course> forJobNeed(int jobid)
    {
        return courseDao.forJobNeed(jobid);
    }

    /**
     * 根据教师编号获取课程信息
     * @param teaId
     * @return
     */
    public List<Course> getCourseByTeaId(int teaId)
    {
        return courseDao.getCourseByTeaId(teaId);
    }

    /**
     * 获取某个岗位的岗位需求
     * @param jobid
     * @return
     */
    public List<Course> getCourseByJobId(int jobid)
    {
        return courseDao.getCourseByJobId(jobid);
    }

    /**
     * 添加教材
     * @param courseid
     * @param bookid
     * @return
     */
    public int setBook(int courseid, int bookid)
    {
        return courseDao.setBook(courseid, bookid);
    }

    /**
     * 获取全部课程的详细信息，包括教师信息
     * @return
     */
    public List<Map> getCourseDetail()
    {
        return courseDao.getCourseDetail();
    }

    /**
     * 批量删除课程
     * @param courseids
     * @return
     */
    public int deleteByCourseIds(String[] courseids){
        return courseDao.deleteByCourseIds(courseids);
    }
}
