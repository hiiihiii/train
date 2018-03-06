package com.train.modules.dao;

import com.train.modules.entity.CourseComm;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/4/20 0020.
 */
@Repository
public interface CourseCommDao {

    /**
     * 增加课程评价
     * @param courseComm
     * @return
     */
    public int insertComm(CourseComm courseComm);

    /**
     * 根据课程id和员工id删除某一条评价
     * @param courseId
     * @param empId
     * @return
     */
    public int deleteByIds(int courseId, int empId);

    /**
     * 删除某个课程全部的评价
     * @param courseId
     * @return
     */
    public int deleteByCourseId(int courseId);

    /**
     * 删除某个员工所有的评价
     * @param empId
     * @return
     */
    public int deleteByEmpId(int empId);

    /**
     * 更新评论信息
     * @param courseComm
     * @return
     */
    public int updateComm(CourseComm courseComm);

    /**
     * 获取某个员工对某个课程的评价
     * @param courseId
     * @param empId
     * @return
     */
    public CourseComm getCommByIds(int courseId, int empId);

    /**
     * 获取某个课程的全部评价
     * @param courseId
     * @return
     */
    public List<CourseComm> getCommByCourseId(int courseId);

    /**
     * 获取某个员工的全部评价
     * @param empId
     * @return
     */
    public List<CourseComm> getCommByEmpId(int empId);
}
