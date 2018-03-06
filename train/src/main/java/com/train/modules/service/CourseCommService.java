package com.train.modules.service;

import com.train.modules.dao.CourseCommDao;
import com.train.modules.entity.CourseComm;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Tanli on 2017/4/20 0020.
 */
@Service
public class CourseCommService {

    @Resource
    private CourseCommDao courseCommDao;

    /**
     * 增加课程评价
     * @param courseComm
     * @return
     */
    public int insertComm(CourseComm courseComm)
    {
        return courseCommDao.insertComm(courseComm);
    }

    /**
     * 根据课程id和员工id删除某一条评价
     * @param courseId
     * @param empId
     * @return
     */
    public int deleteByIds(int courseId, int empId)
    {
        return courseCommDao.deleteByIds(courseId, empId);
    }

    /**
     * 删除某个课程全部的评价
     * @param courseId
     * @return
     */
    public int deleteByCourseId(int courseId)
    {
        return courseCommDao.deleteByCourseId(courseId);
    }

    /**
     * 删除某个员工所有的评价
     * @param empId
     * @return
     */
    public int deleteByEmpId(int empId)
    {
        return courseCommDao.deleteByEmpId(empId);
    }

    /**
     * 更新评论信息
     * @param courseComm
     * @return
     */
    public int updateComm(CourseComm courseComm)
    {
        return courseCommDao.updateComm(courseComm);
    }

    /**
     * 获取某个员工对某个课程的评价
     * @param courseId
     * @param empId
     * @return
     */
    public CourseComm getCommByIds(int courseId, int empId)
    {
        return courseCommDao.getCommByIds(courseId, empId);
    }

    /**
     * 获取某个课程的全部评价
     * @param courseId
     * @return
     */
    public List<CourseComm> getCommByCourseId(int courseId)
    {
        return courseCommDao.getCommByCourseId(courseId);
    }

    /**
     * 获取某个员工的全部评价
     * @param empId
     * @return
     */
    public List<CourseComm> getCommByEmpId(int empId)
    {
        return courseCommDao.getCommByEmpId(empId);
    }
}
