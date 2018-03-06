package com.train.modules.service;

import com.train.modules.dao.EmpNeedsDao;
import com.train.modules.entity.EmpNeeds;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/5/7 0007.
 */
@Service
public class EmpNeedsService {

    @Resource
    private EmpNeedsDao empNeedsDao;

    /**
     * 增加 员工个人需求
     * @param empNeeds
     * @return
     */
    public int insertEmpNeeds(EmpNeeds empNeeds)
    {
        return empNeedsDao.insertEmpNeeds(empNeeds);
    }

    /**
     * 删除某个员工的某个选课
     * @param empid
     * @param courseid
     * @return
     */
    public int deleteByIds(int empid, int courseid)
    {
        return empNeedsDao.deleteByIds(empid, courseid);
    }

    /**
     * 成绩
     * @param empid
     * @param courseid
     * @param score
     * @return
     */
    public int setScore(int empid, int  courseid, double score)
    {
        return empNeedsDao.setScore(empid, courseid, score);
    }

    /**
     * 获取某位员工的全部选课
     * @param empid
     * @return
     */
    public List<EmpNeeds> getByEmpid(int empid)
    {
        return empNeedsDao.getByEmpid(empid);
    }

    /**
     * 获取某位员工某个学期的全部选课
     * @param empid
     * @param term
     * @return
     */
    public List<EmpNeeds> getTermByEmpId(int empid, String term)
    {
        return empNeedsDao.getTermByEmpId(empid, term);
    }

    /**
     * 根据员工id获取员工选课的详细信息
     * @param empid
     * @return
     */
    public List<Map> getEmpNeedsDetail(int empid)
    {
        return empNeedsDao.getEmpNeedsDetail(empid);
    }

    /**
     * 获取选课信息以及课程的评价信息
     * @param empid
     * @return
     */
    public List<Map> checkScore(int empid)
    {
        return empNeedsDao.checkScore(empid);
    }

    /**
     * 批量设置成绩
     * @param scores
     * @return
     */
    public int setScoresBat(@Param("scores") ArrayList<Map> scores)
    {
        return empNeedsDao.setScoresBat(scores);
    }

    /**
     * 获取某个老师某门课的全部成绩信息
     * @param courseid
     * @return
     */
    public List<Map> checkScores(@Param("courseid") int courseid){
        return empNeedsDao.checkScores(courseid);
    }
}
