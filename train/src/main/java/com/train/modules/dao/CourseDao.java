package com.train.modules.dao;

import com.train.modules.entity.Course;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Tanli on 2017/4/13 0013.
 */
@Repository
public interface CourseDao {

    /**
     * 增加一门课程
     * @param course
     * @return
     */
    public int insertCourse(Course course);

    /**
     * 通过课程编号删除一门课程
     * @param id
     * @return
     */
    public int deleteByCourseId(int id);

    /**
     * 更新课程信息
     * @param course
     * @return
     */
    public int updateCourse(Course course);

    /**
     * 设置课程的教材信息
     * @param courseId
     * @param bookId
     * @return
     */
    public int setBook(@Param("courseid") int courseId, @Param("bookid") int bookId);

    /**
     * 根据课程编号查询课程信息
     * @param id
     * @return
     */
    public Course getCourseById(int id);

    /**
     * 获取所有课程信息
     * @return
     */
    public List<Course> getAllCourse();

    /**
     * 为添加岗位需求获取课程信息，即在岗位需求中的课程就不加载
     * @param jobid: 岗位id
     * @return
     */
    public List<Course> forJobNeed(int jobid);

    /**
     * 根据教师编号获取课程信息
     * @param teaId
     * @return
     */
    public List<Course> getCourseByTeaId(int teaId);

    /**
     * 获取某个岗位的岗位需求
     * @param jobid
     * @return
     */
    public List<Course> getCourseByJobId(int jobid);

    /**
     * 获取全部课程的详细信息，包括教师信息
     * @return
     */
    public List<Map> getCourseDetail();

    /**
     * 批量删除课程
     * @param courseids
     * @return
     */
    public int deleteByCourseIds(String[] courseids);
}
